citation_proportion <- function(words, threshold){
  articles_that_use_words <- ps_uni_grouped |>
    filter(ngram %in% words) |>
    group_by(wos_id) |>
    summarise(count = sum(count)) |>
    filter(count >= threshold)
  
  cites_of_articles <- active_cites |>
    filter(old %in% articles_that_use_words$wos_id) |>
    group_by(citing_journal) |>
    tally()
  
  tibble(
    articles = nrow(articles_that_use_words),
    ps_cites = cites_of_articles$n[2],
    nps_cites = cites_of_articles$n[1]
  ) |>
    mutate(proportion = ps_cites / (ps_cites + nps_cites),
           rate = (ps_cites + nps_cites)/articles)
  } 

citation_proportion_single <- function(word, threshold){
  articles_that_use_words <- ps_uni_grouped |>
    filter(ngram == word) |>
    group_by(wos_id) |>
    summarise(count = sum(count)) |>
    filter(count >= threshold)
  
  cites_of_articles <- active_cites |>
    filter(old %in% articles_that_use_words$wos_id) |>
    group_by(citing_journal) |>
    tally()
  
  ps_cites <- cites_of_articles$n[2]
  nps_cites <- cites_of_articles$n[1]

  ps_cites / (ps_cites + nps_cites)
} 

citation_proportion(c("group", "groups"), 10)
citation_proportion(c("frankfurt", "pereboom"), 10)
citation_proportion(c("group", "groups", "interpersonal", "race", "racial", "gender"),10)
citation_proportion(c("praise", "blame", "blameworthy", "friend", "friends", "friendship"),10)
citation_proportion(c("communicative", "testimony", "trust", "disagree", "disagreement", "deference"),10)
citation_proportion(c("communicative", "testimony", "trust"),10)
citation_proportion(c("disagree", "disagreement", "deference"),10)
citation_proportion(c("group", "groups", "interpersonal"),10)
citation_proportion(c("race", "racial", "gender"),10)
citation_proportion(c("praise", "blame", "blameworthy"),10)
citation_proportion(c("friend", "friends", "friendship"),10)
citation_proportion(c("ground", "grounds", "grounding"),10)
citation_proportion(c("slur", "slurs", "slurring"),10)
citation_proportion(c("contextualist", "contextualism"),5)
citation_proportion(c("respond"),5)
citation_proportion(c("pereboom"), 5)
citation_proportion(c("groups"), 5)
citation_proportion(c("grounding"), 5)
citation_proportion(c("disagree"), 5)
citation_proportion(c("frankfurt"), 5)
citation_proportion(c("participants"), 5)



where_ps_is_cites <- active_cites |>
  filter(cited_journal == "PS") |>
  group_by(old, citing_journal) |>
  tally() |>
  pivot_wider(id_cols = old,
              names_from = citing_journal,
              values_from = n) |>
  replace_na(list(PS = 0, NPS = 0)) |>
  mutate(all_cites = PS + NPS,
         rate = PS/all_cites) |>
  arrange(-rate) |>
  left_join(short_bib, by = c("old" = "id"))

where_cites <- words_by_decades |>
  filter(all_uses >= 500) |>
  select(ngram, all_uses) |>
  rowwise() |>
  mutate(rate = citation_proportion_single(ngram, 5)) |>
  ungroup()

missing_in_ps <- active_cites |>
  filter(old_year >= 2005, old_year <= 2015, new_year <= 2019) |>
  ungroup() |>
  group_by(old) |>
  add_count(name = "all") |>
  ungroup() |>
  group_by(old, citing_journal) |>
  add_count(name = "in_kind") |>
  mutate(rate = in_kind/all) |>
  filter(all >= 30, rate < 0.1) |>
  arrange(rate) |>
  left_join(short_bib, by = c("old" = "id"))