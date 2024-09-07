late_bloomers <- citation_tibble |>
  ungroup() |>
  select(-range_year) |>
  filter(old_year >= 1980, old_year <= 1999) |>
  filter(new_year <= old_year + 9 | new_year >= 2020) |>
  mutate(cite_age = case_when(
    new_year <= old_year + 9 ~ "e_cites",
    new_year >= 2020 ~ "l_cites"
  )) |>
  group_by(old, old_year, cite_age) |>
  summarise(cites = n(), .groups = "drop") |>
  pivot_wider(id_cols = c(old), names_from = cite_age, values_from = cites) |>
  replace_na(list(e_cites = 0, l_cites = 0)) |>
  arrange(e_cites, -l_cites) |>
  filter(l_cites >= 16) |>
  left_join(philo_bib_fix, by = c("old" = "id")) |>
  select(e_cites, l_cites, auth, year, art_title, journal, everything()) |>
  filter(e_cites <= 10) |>
  arrange(-l_cites)