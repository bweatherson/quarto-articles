some_articles <- the_920 |>
  filter(year >= 1974, appear >= 3, l_cites < 10) |>
  distinct(old, .keep_all = TRUE)

citation_tibble |>
  filter(old %in% some_articles$old) |>
  group_by(new_year) |>
  tally(name = "citations") |>
  left_join(citation_tibble |>
              group_by(new_year) |>
              filter(new_year >= 1965, new_year <= 2022) |>
              tally(name = "all_cites")) |>
  mutate(cite_rate = citations/all_cites) |>
  ggplot(aes(x = new_year, y = cite_rate)) + 
    geom_point() +
    scale_y_continuous(labels = scales::percent)

citation_tibble |>
  filter(old_year >= 1988, old_year <= 1992) |>
  group_by(new_year) |>
  tally(name = "citations") |>
  left_join(citation_tibble |>
              group_by(new_year) |>
              filter(new_year >= 1965, new_year <= 2022) |>
              tally(name = "all_cites")) |>
  mutate(cite_rate = citations/all_cites) |>
  ggplot(aes(x = new_year, y = cite_rate)) + 
  geom_point() +
  scale_y_continuous(labels = scales::percent)

citation_tibble |>
  filter(old_year >= 1996, old_year <= 2003, old %in% the_920) |>
  group_by(new_year) |>
  tally(name = "citations") |>
  left_join(citation_tibble |>
              group_by(new_year) |>
              filter(new_year >= 1965, new_year <= 2022) |>
              tally(name = "all_cites")) |>
  mutate(cite_rate = citations/all_cites) |>
  ggplot(aes(x = new_year, y = cite_rate)) + 
  geom_point() +
  scale_y_continuous(labels = scales::percent)

popular_articles <- the_920 |>
  filter(year >= 1980, year <= 1996, l_cites >= 25) |>
  distinct(old, .keep_all = TRUE)

citation_tibble |>
  filter(old_year >= 1980, old_year <= 1996, old %in% popular_articles$old) |>
  group_by(new_year) |>
  tally(name = "citations") |>
  left_join(citation_tibble |>
              group_by(new_year) |>
              filter(new_year >= 1965, new_year <= 2022) |>
              tally(name = "all_cites")) |>
  mutate(cite_rate = citations/all_cites) |>
  ggplot(aes(x = new_year, y = cite_rate)) + 
  geom_point() +
  scale_y_continuous(labels = scales::percent)

citation_tibble |>
  filter(old_year >= 2004, old_year <= 2010, old %in% the_920$old) |>
  group_by(new_year) |>
  tally(name = "citations") |>
  left_join(citation_tibble |>
              group_by(new_year) |>
              filter(new_year >= 1965, new_year <= 2022) |>
              tally(name = "all_cites")) |>
  mutate(cite_rate = citations/all_cites) |>
  ggplot(aes(x = new_year, y = cite_rate)) + 
  geom_point() +
  scale_y_continuous(labels = scales::percent)