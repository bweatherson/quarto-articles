the_top_few <- c()

article_count <- active_philo_bib |>
  group_by(year) |>
  tally() |>
  mutate(five_year = slide_int(n, sum, .before = 4))


for (y in 1967:2010){
  target_articles <- floor(
    filter(
      article_count, year == y + 4
      )$five_year[1] / 130
  )
  target_articles <- 20
  yearly_additions <- citation_tibble |>
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
    slice(1:target_articles) |>
    select(-score, -the_rank) |>
    mutate(range_year = y) |>
    left_join(philo_bib_fix, by = c("old" = "id")) |>
    select(e_cites, l_cites, auth, year, range_year, art_title, journal, everything()) 
  
  the_top_few <- bind_rows(the_top_few, yearly_additions)
}

the_top_few <- the_top_few |>
  ungroup() |>
  group_by(old) |>
  mutate(appear = n()) |>
  select(appear, everything()) |>
  arrange(-appear, l_cites, old)

proportion_recent <- the_top_few |>
  group_by(range_year) |>
  summarise(med_cites = mean(l_cites))

ggplot(proportion_recent, aes(x = range_year, y = med_cites)) + geom_point()