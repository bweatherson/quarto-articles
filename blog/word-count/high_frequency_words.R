require(tidyverse)

# Generate Words for Testing

high_frequency_data <- phil_studies_by_year |>
  filter(word %in% common_ps_words$ngram) |>
  mutate(count = as.integer(count),
         appear = as.integer(appear),
         topic = as.integer(topic),
         all_ps_words = as.integer(all_ps_words),
         all_ps_articles = as.integer(all_ps_articles),
) |>
  mutate(decade = paste0(
    floor(year/10),
    "0s"
  )) |>
  group_by(word, decade) |>
  summarise(count = sum(count),
            appear = sum(appear),
            topic = sum(topic),
            ps_articles = sum(all_ps_articles),
            ps_words = sum(all_ps_words),
            t20_count = sum(t20_count),
            t20_appear = sum(t20_appear),
            t20_topic = sum(t20_topic),
            t20_articles = sum(t20_articles),
            t20_words = sum(t20_words),
          .groups = "drop")

write.csv(high_frequency_data, file = "high_frequency_words.csv")

