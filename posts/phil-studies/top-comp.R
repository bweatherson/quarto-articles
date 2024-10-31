require(tidyverse)

high_cite_articles <- short_bib |>
  ungroup() |>
  filter(journal %in% comparison_journals,
         year >= 2005) |>
  group_by(journal) |>
  slice_max(cites, n = 1) |>
  arrange(journal)