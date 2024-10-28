current_articles <- short_bib |>
  filter(journal %in% comparison_journals,
         journal != "Philosophical Studies") |>
  mutate(cited_journal = "other") |>
  bind_rows(short_bib |>
              filter(journal == "Philosophical Studies") |>
              mutate(cited_journal = "ps")) |>
  group_by(cited_journal, year) |>
  filter(year >= 1980, year <= 2019)

journal_list <- (current_articles |>
                   group_by(cited_journal) |>
                   tally())$cited_journal

third_quartile <- tribble(
  ~cited_journal, ~year, ~q3
)

for (the_cited_journal in journal_list){
  for (the_year in 1980:2019){
    temp <- current_articles |>
      filter(cited_journal == the_cited_journal,
             year <= the_year + 2,
             year >= the_year - 2)
    third_quartile <- third_quartile |>
      add_row(
        cited_journal = the_cited_journal,
        year = the_year,
        q3 = quantile(temp$cites, prob = 0.75)
      )
  }
}

citation_with_all_type <- ps_papers |>
  select(id, year, displayauth, title, volume, issue) |>
  left_join(issue_list |> 
              rename(volume = Volume, issue = Issue) |>
              mutate(volume = as.character(volume)), 
            by = c("volume", "issue")) |>
  select(-Count) |>
  left_join(citation_count, by = c("id" = "old")) |>
  replace_na(list(
    Type = "Normal",
    cites = 0))

for (the_year in 1980:2019){
  temp <- citation_with_all_type |>
    filter(Type == "Normal",
           year <= the_year + 2,
           year >= the_year - 2)
  third_quartile <- third_quartile |>
    add_row(
      cited_journal = "psnorm",
      year = the_year,
      q3 = quantile(temp$cites, prob = 0.75)
    )
}

for (the_year in 1980:2019){
  temp <- citation_with_all_type |>
    filter(Type == "Normal" | Type == "Topic",
           year <= the_year + 2,
           year >= the_year - 2)
  third_quartile <- third_quartile |>
    add_row(
      cited_journal = "psnoconf",
      year = the_year,
      q3 = quantile(temp$cites, prob = 0.75)
    )
}

third_quartile_wide <- third_quartile |>
  pivot_wider(
    id_cols = year,
    names_from = cited_journal,
    values_from = q3) |>
  mutate(psrat = ps/other,
         normrat = psnorm/other,
         xconfrat = psnoconf/other)

third_quartile_ratio <- third_quartile_wide |>
  select(1, 6:8) |>
  pivot_longer(
    cols = ends_with("rat"),
    names_to = "type",
    values_to = "ratio")
  
ggplot(third_quartile_ratio,
       aes(x = year, y = ratio)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~type)