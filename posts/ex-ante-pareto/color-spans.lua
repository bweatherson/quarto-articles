function Span(span)
  if span.classes:includes('text-red') then
    if FORMAT:match('latex') then
      return pandoc.RawInline('latex', '\\textcolor{red}{' .. pandoc.utils.stringify(span.content) .. '}')
    end
  elseif span.classes:includes('text-blue') then
    if FORMAT:match('latex') then
      return pandoc.RawInline('latex', '\\textcolor{blue}{' .. pandoc.utils.stringify(span.content) .. '}')
    end
  elseif span.classes:includes('text-green') then
    if FORMAT:match('latex') then
      return pandoc.RawInline('latex', '\\textcolor{green}{' .. pandoc.utils.stringify(span.content) .. '}')
    end
  elseif span.classes:includes('text-brown') then
    if FORMAT:match('latex') then
      return pandoc.RawInline('latex', '\\textcolor{brown}{' .. pandoc.utils.stringify(span.content) .. '}')
    end
  end
  return span
end