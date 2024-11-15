word_graphs_shaded(
  c(
    "priori",
    "intuitions",
    "knows"),
  3,
  2000
)

word_graphs_shaded(
  c(
    "scepticism",
    "derose",
    "skepticism"),
  3,
  2000
)

topics_by_decade <- topic_rate_by_year |>
  pivot_longer(cols = 2:6,
               names_to = "topic",
               values_to = "rate") |>
  mutate(decade = paste0(floor(year/10),
                         "0s")) |>
  group_by(topic, decade) |>
  summarise(rate = mean(rate), .groups = "drop") |>
  pivot_wider(id_cols = topic,
              names_from = decade,
              values_from = rate)

word_graphs_shaded(
  c("pryor",
    "dogmatism"),
  2,
  2000)

decade_cites_full <- all_cites |>
  filter(citing_journal == "PS") |>
  group_by(old, decade) |>
  tally(name = "dec_cites") |>
  left_join(
    article_count_by_year |>
      mutate(decade = paste0(floor(year/10),
                             "0s")) |>
      group_by(decade) |>
      summarise(articles = sum(Articles)),
    by = "decade") |>
  mutate(rate = dec_cites/articles) |>
  arrange(-rate) |>
  left_join(philo_bib, by = c("old" = "id"))

word_usage_by_year <- ps_uni_grouped |>
  group_by(year, ngram) |>
  summarise(#docs = n_distinct(wos_id), 
    words = sum(count),
    .groups = "drop") |>
  left_join(word_count_by_year, by = "year") |>
  mutate(proportion = words/wordcount)

ps_uni_grouped <- ps_uni_grouped |>
  left_join(citation_count, by = c("wos_id" = "old"))

word_graphs_shaded(c("testimony", "trust", "disagreement", "blame", "deference", "consent"), 3, 2010)
word_graphs_shaded(c("normative", "reasons", "grounding"), 3, 2010)