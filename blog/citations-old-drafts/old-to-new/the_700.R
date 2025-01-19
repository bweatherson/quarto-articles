the_700 <- c()

for (y in 1974:2008){
  the_20 <- citation_tibble |>
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
    slice(1:20) |>
    select(-score, -the_rank) |>
    mutate(range_year = y) |>
    left_join(philo_bib_fix, by = c("old" = "id")) |>
    select(e_cites, l_cites, auth, year, range_year, art_title, journal, everything()) 
  
  the_700 <- bind_rows(the_700, the_20)
}

the_700 <- the_700 |>
  ungroup() |>
  group_by(old) |>
  mutate(appear = n()) |>
  select(appear, everything()) |>
  arrange(-appear, l_cites, old)

appear_median <- the_700 |>
  ungroup() |>
  group_by(appear) |>
  summarise(l_cites = median(l_cites))

the_700 |> 
    filter(appear == 3) |>
    ungroup() |>
    mutate(l_cites = replace(l_cites, l_cites == 0, 0.5)) |>
    ungroup() |>
    distinct(old, .keep_all = TRUE) |>
    select(year, l_cites) |>
    ggplot(aes(x = year, y = l_cites)) + 
      geom_point() + 
      scale_y_log10() +
      ggrepel::geom_label_repel(data = filter(the_700, appear == 3, (l_cites <= 1 | (year >= 2000 & l_cites <= 10))), aes(label = shortcite))

the_700_graph <- the_700 |>
  filter(appear == 3, year >= 1979) |>
  ungroup() |>
  mutate(l_cites = replace(l_cites, l_cites == 0, 0.5)) |>
  distinct(old, .keep_all = TRUE) |>
  mutate(outlier = case_when(
    l_cites <= 5 ~ TRUE,
    year >= 2000 & l_cites <= 9 ~ TRUE,
    TRUE ~ FALSE))

ggplot(the_700_graph, aes(x = year, y = l_cites))  + 
  geom_point() + 
  scale_y_log10(limits = c(0.5, 250)) 

widely_cited <- citation_tibble |>
  filter(old_year >= 1974, old_year <= 2010) |>
  filter(new_year <= old_year + 9 | new_year >= 2020) |>
  mutate(cite_age = case_when(
    new_year <= old_year + 9 ~ "e_cites",
    new_year >= 2020 ~ "l_cites"
  )) |>
  group_by(old, old_year, cite_age) |>
  summarise(cites = n(), .groups = "drop") |>
  pivot_wider(id_cols = c(old, old_year), names_from = cite_age, values_from = cites) |>
  replace_na(list(e_cites = 0, l_cites = 0)) |>
  left_join(philo_bib_fix, by = c("old" = "id", "old_year" = "year")) |>
  select(e_cites, l_cites, auth, old_year, art_title, journal, everything()) |>
  filter(l_cites >= 16)

widely_cited_years <- widely_cited |>
  filter(l_cites >= 16) |>
  group_by(old_year) |>
  tally()

very_late_bloomers <- widely_cited |>
  anti_join(the_700, by = "old") |>
  filter(old_year <= 2005) |>
  arrange(-l_cites)