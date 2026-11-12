-- math-macros.lua
--
-- Typst output has no LaTeX preamble, so commands a paper defines with
-- \newcommand in its pdf include-in-header are unknown to Pandoc, and math
-- using them comes out as literal TeX. This filter lets a paper define such
-- commands for the Typst version in its YAML:
--
--   format:
--     bwpaper-typst:
--       math-macros:
--         nmodels: '\nvDash'
--         tick: '\checkmark'
--
-- Every \name in math is replaced by its definition before Pandoc converts
-- the math, so a definition must be TeX that Pandoc already understands.
-- Macros take no arguments; a definition may use other macros in the list.
--
-- It also turns raw LaTeX math environments (align*, gather, equation, ...),
-- which Typst output would otherwise silently drop, into display math,
-- and stops recent Typst versions warning about deprecated symbol names.

if FORMAT:match('latex') or FORMAT:match('beamer') then
  return {}
end

local macros = {}

-- Metadata strings may arrive parsed as Markdown, with the TeX split into
-- Str and RawInline pieces, so put the source text back together by hand.
local function meta_text(value)
  if type(value) == 'string' or type(value) == 'boolean' or type(value) == 'number' then
    return tostring(value)
  end
  local out = {}
  local function add(el)
    local t = el.t
    if t == 'Str' or t == 'RawInline' or t == 'Code' or t == 'Math' then
      table.insert(out, el.text)
    elseif t == 'Space' or t == 'SoftBreak' then
      table.insert(out, ' ')
    elseif t == 'Plain' or t == 'Para' then
      for _, x in ipairs(el.content) do add(x) end
    end
  end
  for _, el in ipairs(value) do add(el) end
  return table.concat(out)
end

local function expand(tex)
  -- Repeat so a definition can use another macro from the list.
  for _ = 1, 10 do
    local changed = false
    for name, def in pairs(macros) do
      local new, n = tex:gsub('\\' .. name .. '%f[^%a]', (def:gsub('%%', '%%%%')))
      if n > 0 then
        tex = new
        changed = true
      end
    end
    if not changed then break end
  end
  return tex
end

local math_envs = {
  'align', 'align*', 'gather', 'gather*', 'equation', 'equation*',
  'multline', 'multline*', 'eqnarray', 'eqnarray*',
}

local function is_math_env(text)
  local env = text:match('^%s*\\begin{([%a%*]+)}')
  if not env then return false end
  for _, e in ipairs(math_envs) do
    if env == e then return true end
  end
  return false
end

-- Pandoc writes \models and \vDash as `tack.r.double`, a name recent Typst
-- versions deprecate, with a warning for every use. For Typst output, write
-- such math out here and swap in the characters themselves, which every
-- Typst version accepts. Math without these names is left for Pandoc.
local typst_renames = {
  { 'tack%.r%.double%.not', '⊭' },
  { 'tack%.r%.double', '⊨' },
}

local function finish(el)
  el.text = expand(el.text)
  if not FORMAT:match('typst') then return el end
  local out = pandoc.write(pandoc.Pandoc({ pandoc.Plain({ el }) }), 'typst',
    { wrap_text = 'none' })
  local changed = false
  for _, r in ipairs(typst_renames) do
    local n
    out, n = out:gsub(r[1], r[2])
    if n > 0 then changed = true end
  end
  if not changed then return el end
  return pandoc.RawInline('typst', (out:gsub('%s+$', '')))
end

return {
  {
    Meta = function(meta)
      local defs = meta['math-macros']
      if defs then
        for name, value in pairs(defs) do
          macros[name] = meta_text(value)
        end
      end
    end,
  },
  {
    Math = finish,
    -- Pandoc reads a bare \begin{align*} ... \end{align*} as raw TeX,
    -- sometimes as a block and sometimes as an inline inside a paragraph.
    RawBlock = function(el)
      if (el.format == 'latex' or el.format == 'tex') and is_math_env(el.text) then
        return pandoc.Para({ finish(pandoc.Math('DisplayMath', el.text)) })
      end
    end,
    RawInline = function(el)
      if (el.format == 'latex' or el.format == 'tex') and is_math_env(el.text) then
        return finish(pandoc.Math('DisplayMath', el.text))
      end
    end,
  },
}
