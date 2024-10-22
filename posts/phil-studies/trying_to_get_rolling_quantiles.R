require(tidyverse)

# Pairs all articles with their citations

basic_bib <- philo_bib |>
  filter(year >= 1980, year <= 2019) |>
  select(id, displayauth, year, title, journal) |>
  left_join(
    active_cites |>
      rename(id = old) |>
      ungroup() |>
      group_by(id) |>
      tally(name = "cites")
  , by = "id") |>
  replace_na(list(cites = 0))

quartile_year <- basic_bib |>
  group_by(journal, year) |>
  summarise(
    Q1 = quantile(cites, probs = 0.25),
    Q2 = quantile(cites, probs = 0.5),
    Q3 = quantile(cites, probs = 0.75),
    Mean = mean(cites),
    .groups = "drop"
  ) |>
  pivot_longer(cols = starts_with("Q"),
               values_to = "cites")

comparison_quartile <- basic_bib |>
  filter(journal %in% comparison_journals) |>
  filter(journal != "Philosophical Studies") |>
  mutate(journal = "Other top 20") |>
  bind_rows(basic_bib |>
              filter(journal == "Philosophical Studies")) |>
  group_by(journal, year) |>  
  reframe(enframe(quantile(cites, c(0.25, 0.5, 0.75)), "quantile", "cites"))

graph_comparison <- ggplot(
  comparison_quartile,
  aes(x = year, y = cites, colour = journal, group = name)) +
  geom_point()

graph_comparison