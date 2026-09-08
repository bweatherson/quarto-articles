-- _wordcount-final.lua
-- Counts the paper as it will read once accepted:
-- .del regions excluded, .add content included, markup ignored.
-- Run from this folder:
--   quarto pandoc aadab-R3.qmd --lua-filter _wordcount-final.lua -t plain -o /dev/null
local words = 0

local function is_del(el)
  for _, c in ipairs(el.classes) do
    if c == "del" then return true end
  end
  return false
end

local strip = {
  Span = function(el) if is_del(el) then return {} end end,
  Div  = function(el) if is_del(el) then return {} end end,
}

local count = {
  Str  = function(el) if el.text:match("%w") then words = words + 1 end end,
  Math = function() words = words + 1 end,
}

function Pandoc(doc)
  doc = doc:walk(strip)
  doc:walk(count)
  io.stderr:write("Final-text word count (deletions excluded, incl. footnotes): " .. words .. "\n")
  return doc
end
