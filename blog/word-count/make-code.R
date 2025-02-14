words_to_graph <- read_csv(file = "/Users/weath/Documents/quarto-articles/blog/word-count/word-list.csv")



words_to_graph <- words_to_graph |>
  mutate(year = 0)

for (n in 1:nrow(words_to_graph)){
  temp <- all_words %>%
    filter(word == words_to_graph$word[n]) %>%
    inner_join(big_join, by = "jstor_id") %>%
    left_join(
      select(
        philo_bib,
        id,
        year
      ), by = "id"
    ) 
  words_to_graph$year[n] <- weighted.mean(temp$year,temp$count)
}

words_to_graph <- words_to_graph |>
  arrange(type,year)

new_code <- c()

for (n in 1:nrow(words_to_graph)){
  new_code <- paste0(
    new_code,
    "\n\n```{r}",
    "\n#| label: fig-",
    words_to_graph$word[n],
    "\n#| fig-cap: \"Frequency data for '",
    words_to_graph$title[n],
    "'\"",
    "\n#| fig-height: 4",
    "\n\nfreq_graph(\"",
    words_to_graph$word[n],
    "\", \"",
    words_to_graph$title[n],
    "\")",
    "\n```"
    
  )
}

writeLines(new_code, "new_code.txt")