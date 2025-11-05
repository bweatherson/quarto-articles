short_distinctiveness <- combined_distinctiveness |>
  select(word, decade, count, all = combined_distinct_standardized, 
  time = combined_temporal_standardized, 
  space = combined_spatial_standardized) |>
  mutate(prod = time * space) |>
  mutate(abssum = abs(time) + abs(space))

early_late_words <- phil_studies_by_year %>%
  select(word, year, count, words = all_ps_words, t20_count, t20_words) %>%
  mutate(era = case_when(year < 2010 ~ "early",  TRUE ~ "late")) %>%
  ungroup() %>%
  group_by(era, word) %>%
  summarise(count = sum(count),
            words = sum(words),
            t20_count = sum(t20_count),
            t20_words = sum(t20_words)) %>%
  ungroup() %>%
  mutate(ps = count*1000/words,
         t20 = t20_count*1000/t20_words) %>%
  select(-count, -words, -t20_count, -t20_words) %>%
  pivot_wider(names_from = era,
              values_from = c(ps, t20),
              names_glue = "{.value}_{era}")
    
trust_papers <- c(
"WOS:A1986AYY3900001",
"WOS:000170434600004",
"WOS:A1996VL52500002",
"WOS:A1994NA94600005",
"WOS:A1991GR87800001")

trust_cites <- all_cites %>%
  filter(old %in% trust_papers) %>%
  filter(decade == "2010s") %>%
  ungroup() %>%
  group_by(citing_journal) %>%
  tally()

d2010_cites <- all_cites %>%
  filter(decade == "2010s") %>%
  group_by(old, citing_journal) %>%
  tally() %>%
  pivot_wider(
    names_from = citing_journal,
    values_from = n
  ) %>%
  replace_na(list(PS = 0, NPS = 0)) %>%
  filter(PS + NPS >= 50) %>%
  left_join(
    select(
      short_bib, 
      old = id,
      year,
      displayauth,
      title
    ), by = "old"
  ) %>%
  mutate(year = as.integer(year))

d2010_cites %>%
  ggplot(aes(x = NPS, y = PS)) +
  geom_point() +
  labs(x = "Citations outside Philosophical Studies",
       y = "Philosophical Studies citations")

write.csv(d2010_cites, file = "d2010_cites.csv")
