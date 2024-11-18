word_graphs_shaded(c("social"), 1, 2010)
word_graphs_shaded(c("grounding", "normative", "reasons"), 3, 2010)
word_graphs_shaded(c("experiment", "data", "participants"), 3, 2010)
word_graphs_shaded(c("robust", "challenge"), 2, 2010)
word_graphs_shaded(c("account", "view", "theory", "analysis"), 2, 2010)
word_graphs_shaded(c("analysis", "concept", "logic", "distinction"), 2, 2010)
word_graphs(c("argue", "account", "explain", "response", "view"), 2)


grounding_papers <- ps_uni_grouped |>
  filter(ngram == "grounding", count >= 5)

grounding_gamma <- short_bib_with_gamma |>
  filter(id %in% grounding_papers$wos_id)

big_words <- words_by_decades |>
  filter(all_uses >= 2000, all_uses < 100000) |>
  mutate(new_use = d2010s/all_uses)

citation_by_year <- all_cites |>
  filter(new_journal == "Philosophical Studies") |>
  filter(new_year >= 1980, new_year <= 2019) |>
  group_by(new_year) |>
  tally(name = "citation_count") |>
  rename(year = new_year) |>
  left_join(article_count_by_year, by = "year") |>
  mutate(citation_rate = citation_count/Articles)

ggplot(citation_by_year,
       aes(x = year, y = citation_rate)) +
  geom_point(size = 0.5) +
  labs(x = element_blank(),
       y = "Mean number of journal articles cited") +
  scale_x_continuous(breaks = c(1990, 2000, 2010))

