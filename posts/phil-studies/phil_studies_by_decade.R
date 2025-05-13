all_ps_words_all_year <- sum(phil_studies_by_year$count)
all_ps_articles_all_year <- sum(
  filter(phil_studies_by_year, word == "aaron")$all_ps_articles
)

phil_studies_by_decade <- phil_studies_by_year |>
  group_by(word) |>
  mutate(all_count = sum(count)) |>
  filter(all_count >= 1000) |>
  mutate(avg_frequency = all_count/all_ps_words_all_year) |>
  mutate(avg_appear = sum(appear) / all_ps_articles_all_year ) |>
  mutate(avg_topic = sum(topic) /all_ps_articles_all_year ) |>
  mutate(above = (ps_word_rate > avg_frequency) + 
                  (ps_appear_rate > avg_appear) +
                  (ps_topic_rate > avg_topic)) |>
  ungroup() |>
  mutate(decade = paste0(
    str_sub(year, 1, 3),
    "0s"
  )) |>
  group_by(word, decade) |>
  mutate(score = sum(above)) |>
  ungroup() |>
  arrange(-score) |>
  select(word, decade, all_count, score, everything()) |>
  filter(year %% 10 == 0)

  
  
  avg_frequency <- sum(word_data$count) / sum(word_data$all_ps_words) * 1000
  avg_percentage_appear <- mean(
    word_data$appear / word_data$all_ps_articles * 100, 
    na.rm =   TRUE)
  avg_percentage_topic <- mean(
    word_data$topic / word_data$all_ps_articles * 100, 
    na.rm =   TRUE)