require(slider)

article_count <- active_philo_bib |>
  group_by(year) |>
  tally() |>
  mutate(five_year = slide_int(n, sum, .before = 4))



