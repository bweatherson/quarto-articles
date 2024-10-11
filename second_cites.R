# Find articles that cite articles which cite each of the 360

cite_second <- c()

for (i in 1:nrow(main_bib)){
  initial_article <- main_bib$old[i]
  first_round <- filter(philo_cite, refs == initial_article)$id
  second_round <- filter(philo_cite, refs %in% first_round)$id
  cite_second <- bind_rows(cite_second,
                           tibble(
                             old = rep(initial_article, each=length(second_round)),
                             new = second_round
                           ))
}

cite_second_expanded <- cite_second |>
  left_join(article_years, by = c("new" = "id")) |>
  rename(new_year = year) |>
  left_join(main_bib, by = c("old")) |>
  select(old, old_year, graph_cite, new, new_year)


cite_second_overall <- cite_second_expanded |>
  filter(new_year >= 2003, new_year <= 2022) |>
  group_by(new_year) |>
  tally(name = "all_seconds")

cite_second_summary <- cite_second_expanded |>
  group_by(old_year, graph_cite, new_year) |> 
  filter(new_year >= 2003, new_year <= 2022) |>
  tally(name = "second_cites") |>
  left_join(cite_second_overall, by = "new_year") |>
  mutate(proportion = second_cites/all_seconds)

year_2021_cites <- citation_tibble |>
  ungroup() |>
  filter(new_year == 2021, old %in% main_bib$old) |>
  group_by(old) |>
  tally(name = "cites_2021") |>
  left_join(main_bib, by = "old") |>
  arrange(-cites_2021) |>
  select(cites_2021, graph_cite) |>
  left_join(select(
    cite_second_summary |> ungroup() |> filter(new_year == 2021), graph_cite, second_cites) , by = "graph_cite") |>
  mutate(second_ratio = second_cites / cites_2021)