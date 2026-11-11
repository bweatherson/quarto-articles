-- With link-citations on, Pandoc links each citation to its entry in the
-- reference list. A citation whose key isn't in the .bib has no entry, so the
-- link points at a label that doesn't exist, and Typst stops with an error
-- instead of just warning. This filter runs before Pandoc formats the
-- citations: it replaces any citation to a missing key with the key in bold
-- followed by "?", as Pandoc itself would print it, and warns.
-- (Citations with several keys keep the keys that exist.)

local crossref_prefixes = {}
for _, p in ipairs({"fig","tbl","sec","eq","lst","thm","lem","cor","prp","cnj",
                    "def","exm","exr","rem","sol","apx","nte","tip","wrn","imp","cau"}) do
  crossref_prefixes[p] = true
end

return {
  {
    Pandoc = function(doc)
      local known = {}
      for _, ref in ipairs(pandoc.utils.references(doc)) do
        known[ref.id] = true
      end
      return doc:walk({
        Cite = function(cite)
          local keep, missing = pandoc.List(), pandoc.List()
          for _, c in ipairs(cite.citations) do
            -- leave Quarto cross-references (@tbl-..., @fig-..., @sec-...) alone
            local prefix = c.id:match("^(%l+)%-")
            if known[c.id] or (prefix and crossref_prefixes[prefix]) then
              keep:insert(c)
            else
              missing:insert(c.id)
            end
          end
          if #missing == 0 then return nil end
          for _, id in ipairs(missing) do
            quarto.log.warning("Citation not in bibliography: " .. id)
          end
          local out = pandoc.List()
          if #keep > 0 then
            cite.citations = keep
            out:insert(cite)
            out:insert(pandoc.Str("; "))
          end
          for i, id in ipairs(missing) do
            if i > 1 then out:insert(pandoc.Str("; ")) end
            out:insert(pandoc.Strong(pandoc.Str(id .. "?")))
          end
          return out
        end
      })
    end
  }
}
