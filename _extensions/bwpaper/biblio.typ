// Bibliography partial for the bwpaper Typst format.
// Uses the site's chicago-with-note.csl via a project-root path ("/..."),
// because some Quarto versions mangle "../../" paths when writing them into
// Typst (they come out as "\../../...", which Typst rejects).
$if(citations)$
#set bibliography(style: "/chicago-with-note.csl")
$if(bibliography)$
$if(suppress-bibliography)$
#show bibliography: none
$endif$
#bibliography(($for(bibliography)$"$bibliography$"$sep$,$endfor$))
$endif$
$endif$
