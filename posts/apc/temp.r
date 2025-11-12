all_cites_weighted <- citation_tibble %>%
    mutate(old_year = as.integer(old_year),
           new_year = as.integer(new_year)) %>%
  left_join(
    select(
      active_philo_bib,
      old = id,
      displayauth,
      title
    ), by = "old"
  ) %>%
  left_join(
    typical_citation_rate_per_year %>%
      mutate(new_year = as.integer(new_year),
         value = 1/mean_cites) %>%
      select(new_year, value),
    by = "new_year") %>%
  filter(!is.na(value)) %>%
  group_by(old, old_year, new_year, displayauth, title) %>%
  summarise(weighted_cites = sum(value),
            .groups = "drop") %>%
  arrange(desc(weighted_cites)) %>%
  complete(nesting(old, old_year, displayauth, title), new_year,
      fill = list(weighted_cites = 0)) %>%
  filter(new_year > old_year)

late_c20_weighted <- all_cites_weighted %>%
  filter(old_year >= 1985,
         old_year <= 1994) %>%
  mutate(millenium = paste0("M",floor(new_year/1000))) %>%
  group_by(old, old_year, displayauth, title, millenium) %>%
  summarise(weight = mean(weighted_cites),
            .groups = "drop") %>%
  pivot_wider(names_from = millenium,
  values_from = weight) %>%
  mutate(fall = M1 - M2) %>%
  arrange(desc(fall))

mean((year_by_year_with_effect |>
  filter(age <= 7) |>
  filter(old_year >= 1980, old_year <= 1993) |>
  group_by(old_year) |>
  summarise(mean_surplus = mean(surplus)))$mean_surplus)