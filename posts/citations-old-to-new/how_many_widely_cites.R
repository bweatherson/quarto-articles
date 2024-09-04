available_wide_cite <- citation_tibble |>
  filter(old_year >= 1974, old_year <= 2006, new_year >= 2020) |>
  group_by(old) |>
  tally() |>
  filter(n >= 16) |>
  left_join(philo_bib_fix, by = c("old" = "id")) |>
  select(n, auth, year, art_title, journal, everything()) |>
  ungroup() |>
#  group_by(year) |>
 # tally() |>
  ggplot(aes(x = year)) + geom_bar()