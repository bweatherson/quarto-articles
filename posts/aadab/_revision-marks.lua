-- _revision-marks.lua
-- Revision markup for the Analysis R3 submission:
--   additions in bold, substantial deletions struck through.
--
-- Usage in the .qmd:
--   inline:  [newly added words]{.add}   [deleted words]{.del}
--   blocks:  ::: {.add}                  ::: {.del}
--            One or more new paragraphs. One or more old paragraphs.
--            :::                          :::
--
-- PDF:  .add -> {\bfseries\boldmath ...}, .del -> \sout{...} (ulem).
-- HTML: .add -> <strong>, .del -> <del>.
--
-- Known LaTeX limitations: \sout cannot cross a paragraph break (the
-- block form strikes each paragraph separately, which is fine), and it
-- can choke on display math or footnotes inside a deletion -- keep
-- those outside the .del span.

local IS_LATEX = FORMAT:match("latex") ~= nil or FORMAT:match("pdf") ~= nil

local function has_class(el, c)
  for _, k in ipairs(el.classes) do
    if k == c then return true end
  end
  return false
end

local function mark_inlines(content, cls)
  if IS_LATEX then
    local out = {}
    if cls == "add" then
      table.insert(out, pandoc.RawInline("latex", "{\\bfseries\\boldmath{}"))
    else
      table.insert(out, pandoc.RawInline("latex", "\\sout{"))
    end
    for _, x in ipairs(content) do table.insert(out, x) end
    table.insert(out, pandoc.RawInline("latex", "}"))
    return out
  end
  if cls == "add" then
    return { pandoc.Strong(content) }
  end
  return { pandoc.Strikeout(content) }
end

function Span(el)
  if has_class(el, "add") then return mark_inlines(el.content, "add") end
  if has_class(el, "del") then return mark_inlines(el.content, "del") end
end

function Div(el)
  local cls = nil
  if has_class(el, "add") then cls = "add"
  elseif has_class(el, "del") then cls = "del"
  else return nil end

  if IS_LATEX and cls == "add" then
    -- \bfseries survives paragraph breaks, so one group covers the lot
    local out = { pandoc.RawBlock("latex", "\\begingroup\\bfseries\\boldmath") }
    for _, b in ipairs(el.content) do table.insert(out, b) end
    table.insert(out, pandoc.RawBlock("latex", "\\endgroup"))
    return out
  end

  -- otherwise mark paragraph by paragraph
  local out = {}
  for _, b in ipairs(el.content) do
    if b.t == "Para" then
      table.insert(out, pandoc.Para(mark_inlines(b.content, cls)))
    elseif b.t == "Plain" then
      table.insert(out, pandoc.Plain(mark_inlines(b.content, cls)))
    else
      table.insert(out, b)
    end
  end
  return out
end
