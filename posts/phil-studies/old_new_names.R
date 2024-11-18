phil_names <- c("schroeder",
"schaffer",
"sider",
"hawthorne",
"schellenberg",
"schwitzgebel",
"cappelen",
"siegel",
"enoch",
"huemer",
"sellars",
"chisholm",
"putnam",
"quine",
"davidson",
"wittgenstein",
"aristotle",
"plantinga",
"searle",
"fodor")

phil_names_table <- ps_uni_grouped |>
  filter(ngram %in% phil_names) |>
  mutate(age = case_when(
    year <= 2009 ~ "early",
    TRUE ~ "late"
  )) |>
  group_by(ngram, age) |>
  summarise(count = sum(count), .groups = "drop") |>
  pivot_wider(id_cols = ngram,
              names_from = age,
              values_from = count) |>
  mutate(rate = early/(early+late)) |>
  arrange(-rate) |>
  mutate(Name = str_to_title(ngram), `1980-2009` = early,`2010-2019`= late) |>
  select(Name, `1980-2009`, `2010-2019`)



