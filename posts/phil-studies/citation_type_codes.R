require(tidyverse)

citation_by_type <- citation_with_type |>
  ungroup() |>
  group_by(Type) |>
  summarise(cites = round(mean(cites),1))

citation_by_type_decade <- citation_with_type |>
  mutate(Decade = paste0(floor(year/10),"0s")) |>
  group_by(Type, Decade) |>
  summarise(cites = round(mean(cites),1), .groups = "drop") |>
  mutate(cites = as.character(cites)) |>
  pivot_wider(id_cols = Type,
              names_from = Decade,
              values_from = cites) |>
  mutate(across(starts_with('1') | starts_with('2'), ~replace_na(.,"--")))