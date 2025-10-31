t20_journal_list <- top20_bib |>
  group_by(journal) |>
  tally() |>
  mutate(journal  = paste0(
    "_",
    journal,
    "_"
  ))