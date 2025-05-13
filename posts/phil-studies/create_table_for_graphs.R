# Generate counts for the key words
require(tidyverse)
load("~/Documents/lda-cites-unigrams-only/ps_cites.RData")
load("~/Documents/lda-cites-unigrams-only/ps_meta.RData")
load("~/Documents/lda-cites-unigrams-only/ps_join.RData")
load("~/Documents/lda-cites-unigrams-only/common_ps_words.RData")
load("~/Documents/citations-2025/philo_cite_through_2024.RData")
load("~/Documents/citations-2025/philo_bib_through_2024.RData")

ps_uni <- read_csv("/Users/weath/Documents/Phil-Studies-JSTOR/PS-unigrams.csv",
                   show_col_types = FALSE) |>
  mutate(ngram = str_trim(ngram)) |>
  mutate(ngram = str_replace_all(ngram, "[^[:alnum:]]", "")) |>
  mutate(ngram = str_to_lower(ngram)) |>
  filter(str_length(ngram) > 1) |>
  filter(!grepl("\\d", ngram)) |>
  mutate(jstor_id = paste0("PS-", str_sub(id, start = 29))) |>
  select(-id) |>
  right_join(ps_join, by = "jstor_id") 

ps_uni_grouped <- ps_uni |>
  group_by(ngram, jstor_id) |>
  summarise(count = sum(count), .groups = "drop")

load("~/Documents/jstor-dfr-2025/top20_words_by_year.RData")
load("~/Documents/jstor-dfr-2025/top20_wordcount_by_year.RData")
load("~/Documents/jstor-dfr-2025/top20_article_count_by_year.RData")
load("~/Documents/jstor-dfr-2025/top20_word_topic_by_year.RData")
load("~/Documents/jstor-dfr-2025/top20_word_appear_by_year.RData")
load("~/Documents/jstor-dfr-2025/top20_bib.RData")

phil_studies_words <- ps_uni_grouped |>
  rename(word = ngram) |>
  left_join(ps_join, by = "jstor_id") |>
  left_join(
    select(
      philo_bib_through_2024,
      wos_id = id,
      year),
    by = "wos_id"
    ) |>
  filter(word %in% top20_word_topic_by_year$word)

ps_wordcount_by_year <-  ps_uni_grouped |>
  rename(word = ngram) |>
  left_join(ps_join, by = "jstor_id") |>
  left_join(
    select(
      philo_bib_through_2024,
      wos_id = id,
      year),
    by = "wos_id"
  ) |>
  group_by(year) |>
  summarise(all_ps_words = sum(count),
            all_ps_articles = n_distinct(jstor_id))

top20_summary <- top20_words_by_year |>
  rename(t20_count = this_word_this_year) |>
  left_join(top20_word_appear_by_year,
            by = c("word", "year")) |>
  rename(t20_appear = appear) |>
  left_join(top20_word_topic_by_year,
            by = c("word", "year")) |>
  rename(t20_topic = topic) |>
  complete(word, year,
           fill = list(t20_count = 0, t20_appear = 0, t20_topic = 0)) |>
  left_join(top20_article_count_by_year, by = "year") |>
  left_join(top20_wordcount_by_year, by = "year") |>
  mutate(t20_word_rate = t20_count * 1000 / all_words_this_year,
         t20_appear_rate = t20_appear / articles,
         t20_topic_rate = t20_topic / articles) |>
  select(-all_words_this_year, -articles)

phil_studies_by_year <- phil_studies_words |>
  mutate(appear = 1,
         topic = case_when(
           count >= 10 ~ 1,
           TRUE ~ 0)) |>
  ungroup() |>
  group_by(word, year) |>
  summarise(count = sum(count),
         appear = sum(appear),
         topic = sum(topic),
         .groups = "drop") |>
  ungroup() |>
  complete(word, year,
           fill = list(count = 0, appear = 0, topic = 0)) |>
  left_join(ps_wordcount_by_year, by = "year") |>
  mutate(ps_word_rate = count * 1000 / all_ps_words,
         ps_appear_rate = appear / all_ps_articles,
         ps_topic_rate = topic / all_ps_articles) |>
  left_join(top20_summary, by = c("word", "year"))


save(phil_studies_by_year, file = "phil_studies_by_year.RData")
  

# Function to generate the three graphs
generate_word_graphs <- function(word, d) {
  # Filter data for the specified word
  word_data <- phil_studies_by_year %>% filter(word == !!word)
  
  # Calculate averages for dashed lines
  avg_frequency <- sum(word_data$count) / sum(word_data$all_ps_words) * 1000
  avg_percentage_appear <- mean(word_data$appear / word_data$all_ps_articles * 100, na.rm = TRUE)
  avg_percentage_topic <- mean(word_data$topic / word_data$all_ps_articles * 100, na.rm = TRUE)
  
  # Graph 1: Word frequency per 1000 words
  p1 <- ggplot(word_data, aes(x = year, y = (count / all_words) * 1000)) +
    geom_rect(data = tibble(start = d-0.5, end = d+9.5), aes(xmin = start , xmax = end, ymin = -Inf, ymax = Inf),
              inherit.aes=FALSE, alpha = 0.4, fill = rgb(249/300,255/300,255/300)) +
    geom_point() +
    geom_hline(yintercept = avg_frequency, linetype = "dashed", color = "red") +
    labs(title = paste("Word Frequency for:", word),
         x = "Year", y = "Frequency per 1000 Words") +
    theme_minimal()
  
  # Graph 2: Percentage of articles including the word
  p2 <- ggplot(word_data, aes(x = year, y = (uses / articles) * 100)) +
    geom_rect(data = tibble(start = d-0.5, end = d+9.5), aes(xmin = start , xmax = end, ymin = -Inf, ymax = Inf),
              inherit.aes=FALSE, alpha = 0.4, fill = rgb(249/300,255/300,255/300)) +
    geom_point() +
    geom_hline(yintercept = avg_percentage_uses, linetype = "dashed", color = "red") +
    labs(title = paste("Percentage of Articles Including:", word),
         x = "Year", y = "Percentage of Articles") +
    theme_minimal()
  
  # Graph 3: Percentage of articles with 10+ occurrences of the word
  p3 <- ggplot(word_data, aes(x = year, y = (topic / articles) * 100)) +
    geom_rect(data = tibble(start = d-0.5, end = d+9.5), aes(xmin = start , xmax = end, ymin = -Inf, ymax = Inf),
              inherit.aes=FALSE, alpha = 0.4, fill = rgb(249/300,255/300,255/300)) +
    geom_point() +
    geom_hline(yintercept = avg_percentage_topic, linetype = "dashed", color = "red") +
    labs(title = paste("Percentage of Articles with 10+ Uses of:", word),
         x = "Year", y = "Percentage of Articles") +
    theme_minimal()
  
  # Return the plots
  list(frequency_plot = p1, percentage_uses_plot = p2, percentage_topic_plot = p3)
}