x <- "WOS:A1972YY85700002"

y <- filter(the_4600, old == x)$year[1]



######

rel_1990 <- the_920 |>
  filter(range_year == 1990) |>
  arrange(-l_cites) |>
  ungroup() |>
  select('Citations since 2020' = l_cites, Article = tbl_cite)