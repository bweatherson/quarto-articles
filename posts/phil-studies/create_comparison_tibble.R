# Calculate overall rates for Philosophical Studies across all 40 years
overall_rates <- phil_studies_by_year %>%
  group_by(word) %>%
  summarize(
    overall_count_rate = sum(count) / sum(all_ps_words),
    overall_appear_rate = sum(appear) / sum(all_ps_articles),
    overall_topic_rate = sum(topic) / sum(all_ps_articles)
  )

# Create the comparison tibble
comparison_tibble <- phil_studies_by_year %>%
  # Calculate current year rates for PS
  mutate(
    ps_count_rate = count / all_ps_words,
    ps_appear_rate = appear / all_ps_articles,
    ps_topic_rate = topic / all_ps_articles,
    # Control group rates (already in the data)
    control_count_rate = t20_word_rate,
    control_appear_rate = t20_appear_rate,
    control_topic_rate = t20_topic_rate
  ) %>%
  # Join with overall rates
  left_join(overall_rates, by = "word") %>%
  # Create comparison columns
  mutate(
    # Time comparisons (current year vs overall)
    time_count = case_when(
      ps_count_rate > overall_count_rate ~ 1L,
      ps_count_rate < overall_count_rate ~ -1L,
      TRUE ~ 0L
    ),
    time_appear = case_when(
      ps_appear_rate > overall_appear_rate ~ 1L,
      ps_appear_rate < overall_appear_rate ~ -1L,
      TRUE ~ 0L
    ),
    time_topic = case_when(
      ps_topic_rate > overall_topic_rate ~ 1L,
      ps_topic_rate < overall_topic_rate ~ -1L,
      TRUE ~ 0L
    ),
    # Space comparisons (PS vs control in same year)
    space_count = case_when(
      ps_count_rate > control_count_rate ~ 1L,
      ps_count_rate < control_count_rate ~ -1L,
      TRUE ~ 0L
    ),
    space_appear = case_when(
      ps_appear_rate > control_appear_rate ~ 1L,
      ps_appear_rate < control_appear_rate ~ -1L,
      TRUE ~ 0L
    ),
    space_topic = case_when(
      ps_topic_rate > control_topic_rate ~ 1L,
      ps_topic_rate < control_topic_rate ~ -1L,
      TRUE ~ 0L
    )
  ) %>%
  # Select only the desired columns
  select(word, year, count, time_count, time_appear, time_topic, 
         space_count, space_appear, space_topic) %>%
  mutate(all_time = time_count + time_appear + time_topic,
         all_space = space_count + space_appear + space_topic) %>%
  mutate(decade = paste0(
    floor(year/10),
    "0s"
  )) %>%
  group_by(word, decade) %>%
  summarise(count = sum(count),
            time = sum(all_time),
            space = sum(all_space),
          .groups = "drop") %>%
  mutate(sum = time + space,
         prod = time * space,
         diff = space - time)

intuitions_cites <- phil_studies_words %>%
  filter(word == "intuitions") %>%
  filter(count >= 30) %>%
  select(count, wos_id, year, displayauth, title) %>%
  left_join(citation_by_document,
            by = c("wos_id" = "old"))


