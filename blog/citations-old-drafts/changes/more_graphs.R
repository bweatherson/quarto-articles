some_articles <- the_920 |>
  filter(year >= 1974, appear >= 3, l_cites < 10) |>
  distinct(old, .keep_all = TRUE)

base_citation_rate <- citation_tibble |>
  group_by(new_year) |>
  tally(name = "all_cites") |>
  rename(year = new_year) |>
  left_join(
    active_philo_bib |>
      group_by(year) |>
      tally(name = "articles") |>
      mutate(cumul_articles = cumsum(articles)),
    by = "year"
  ) |>
  mutate(base_rate = all_cites / cumul_articles)

graph_of_group_citation <- function(ids){
  ggplot(
    citation_tibble |>
      filter(old %in% ids) |>
      group_by(new_year) |>
      tally(name = "cites") |>
      rename(year = new_year) |>
      left_join(base_citation_rate, by = "year") |>
      mutate(the_rate = cites / (base_rate * length(ids))),
    aes(x = year, y = the_rate)
  ) +
    geom_point()
}

graph_of_group_citation(
  filter(
    the_920, year >= 1974, appear >= 3, l_cites < 10
  )$old
)

graph_of_group_citation(
  filter(
    the_920, year >= 1996, year <= 2004
  )$old
)

graph_of_group_citation(
  filter(
    the_920, year >= 1980, year <= 1995
  )$old
)

weak_finishers <- function(start_year){
  temp <- the_920 |>
    filter(year >= start_year, year <= start_year + 4, appear >= 2) |>
    slice_min(order_by = l_cites, n = 20)
  temp$old
}

graph_of_group_citation(
  weak_finishers(
    1980
  )
)

graph_of_group_citation(
  filter(
    the_920, year >= 1980, year <= 1995, appear >= 3, l_cites < 10
  )$old
)

graph_of_group_citation(
  filter(
    active_philo_bib, year == 1985
  )$id
)