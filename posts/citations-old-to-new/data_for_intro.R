how_many_recent_cites <- philo_cite_with_jp |>
  as_tibble() |>
  rename(new = id, old = refs) |>
  left_join(article_years, by = c("old" = "id")) |>
  rename(old_year = year)  |>
  left_join(article_years, by = c("new" = "id")) |>
  rename(new_year = year) |> # The next lines are new - restricting attention to 1966-end_year
  filter(new_year <= end_year, new_year >= start_year, old_year >= start_year, old_year <= end_year) |>
  filter(new_year >= 2020) |>
  ungroup() |>
  group_by(old) |>
  tally() |>
  left_join(active_philo_bib, by = c("old" = "id")) |>
  arrange(-n)

top_20_recent <- how_many_recent_cites |>
  select(`Late Cites` = n, Article = tbl_cite) |>
  slice(1:20)

top_20_last_quartile <- how_many_recent_cites |>
  filter(year >= 1976, year <= 1997) |>
  select(`Late Cites` = n, Article = tbl_cite) |>
  slice(1:20)

top_20_last_five <- how_many_recent_cites |>
  filter(year >= 2015) |>
  select(`Late Cites` = n, Article = tbl_cite) |>
  slice(1:20)

most_cited_years_recently <- philo_cite_with_jp |>
  as_tibble() |>
  rename(new = id, old = refs) |>
  left_join(article_years, by = c("old" = "id")) |>
  rename(old_year = year)  |>
  left_join(article_years, by = c("new" = "id")) |>
  rename(new_year = year) |> # The next lines are new - restricting attention to 1966-end_year
  filter(new_year <= end_year, new_year >= start_year, old_year >= start_year, old_year <= end_year) |>
  filter(new_year >= 2020) |>
  group_by(old_year) |>
  tally(name = "cites") |>
  left_join(article_count, by = c("old_year" = "year")) |>
  select(year = old_year, cites, articles = n) |>
  mutate(rate = cites / articles)

ggplot(most_cited_years_recently, aes(x = year, y = rate)) + geom_point()

recent_cite_frequency <- how_many_recent_cites |>
  group_by(n) |>
  tally(name = "art_num") |>
  arrange(-n) |>
  mutate(at_least = cumsum(art_num)) |>
  arrange(n) |>
  slice(1:10, 2:5*10)
  