the_700_third_graph <- the_700 |>
  filter(appear <= 2, year >= 1975) |>
  ungroup() |>
  mutate(l_cites = replace(l_cites, l_cites == 0, 0.5)) |>
  distinct(old, .keep_all = TRUE) |>
  mutate(outlier = case_when(
    l_cites <= 5 ~ TRUE,
    year >= 2000 & l_cites <= 9 ~ TRUE,
    TRUE ~ FALSE))

ggplot(the_700_third_graph, aes(x = year, y = l_cites))  + 
  geom_jitter() + 
  scale_y_log10(limits = c(0.5, 250)) +
  labs(x = element_blank(),
       y = element_blank())

the_1750 <- c()

for (y in 1974:2008){
  the_50 <- citation_tibble |>
    ungroup() |>
    select(-range_year) |>
    filter(old_year >= y, old_year <= y + 4) |>
    filter(new_year <= y + 9 | new_year >= 2020) |>
    mutate(cite_age = case_when(
      new_year <= y + 9 ~ "e_cites",
      new_year >= 2020 ~ "l_cites"
    )) |>
    group_by(old, old_year, cite_age) |>
    summarise(cites = n(), .groups = "drop") |>
    pivot_wider(id_cols = c(old), names_from = cite_age, values_from = cites) |>
    replace_na(list(e_cites = 0, l_cites = 0)) |>
    mutate(score = e_cites + l_cites/1000) |>
    mutate(the_rank = rank(-score)) |>
    arrange(the_rank) |>
    slice(1:50) |>
    select(-score, -the_rank) |>
    mutate(range_year = y) |>
    left_join(active_philo_bib, by = c("old" = "id")) |>
    select(e_cites, l_cites, auth, year, range_year, art_title, journal, everything()) 
  
  the_1750 <- bind_rows(the_1750, the_50)
}

the_1750 <- the_1750 |>
  ungroup() |>
  group_by(old) |>
  mutate(appear = n()) |>
  select(appear, everything()) |>
  arrange(-appear, l_cites, old)

the_1750_graph <- the_1750 |>
  filter(appear <= 5, year >= 1975) |>
  ungroup() |>
  mutate(l_cites = replace(l_cites, l_cites == 0, 0.5)) |>
  distinct(old, .keep_all = TRUE) |>
  mutate(outlier = case_when(
    l_cites <= 5 ~ TRUE,
    year >= 2000 & l_cites <= 9 ~ TRUE,
    TRUE ~ FALSE))

ggplot(the_1750_graph, aes(x = year, y = l_cites))  + 
  geom_jitter() + 
  scale_y_log10(limits = c(0.5, 250)) +
  labs(x = element_blank(),
       y = element_blank())