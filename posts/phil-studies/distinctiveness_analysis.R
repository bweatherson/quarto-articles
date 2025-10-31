library(tidyverse)

# Assuming your data is already loaded as high_frequency_data
# high_frequency_data <- read_csv("high_frequency_words.csv")

# Function to calculate distinctiveness for a given metric
calculate_distinctiveness <- function(data, ps_metric, ps_total, t20_metric, t20_total) {
  data %>%
    mutate(
      # Spatial component: PS vs T20
      ps_rate = {{ps_metric}} / {{ps_total}},
      t20_rate = {{t20_metric}} / {{t20_total}},
      # Add small constant to avoid log(0) issues
      spatial_ratio = log2((ps_rate + 1e-10) / (t20_rate + 1e-10))
    ) %>%
    group_by(word) %>%
    mutate(
      # Temporal component: this decade vs other decades in PS
      decade_rate = {{ps_metric}} / {{ps_total}},
      mean_other_decades = (sum({{ps_metric}}) - {{ps_metric}}) / 
                           (sum({{ps_total}}) - {{ps_total}}),
      temporal_ratio = log2((decade_rate + 1e-10) / (mean_other_decades + 1e-10))
    ) %>%
    ungroup() %>%
    mutate(
      # Combined distinctiveness
      distinctiveness = spatial_ratio + temporal_ratio
    )
}

# Calculate distinctiveness for each metric
count_distinct <- calculate_distinctiveness(
  high_frequency_data,
  ps_metric = count,
  ps_total = ps_words,
  t20_metric = t20_count,
  t20_total = t20_words
) %>%
  select(word, decade, count_spatial = spatial_ratio, 
         count_temporal = temporal_ratio, count_distinct = distinctiveness)

appear_distinct <- calculate_distinctiveness(
  high_frequency_data,
  ps_metric = appear,
  ps_total = ps_articles,
  t20_metric = t20_appear,
  t20_total = t20_articles
) %>%
  select(word, decade, appear_spatial = spatial_ratio, 
         appear_temporal = temporal_ratio, appear_distinct = distinctiveness)

topic_distinct <- calculate_distinctiveness(
  high_frequency_data,
  ps_metric = topic,
  ps_total = ps_articles,
  t20_metric = t20_topic,
  t20_total = t20_articles
) %>%
  select(word, decade, topic_spatial = spatial_ratio, 
         topic_temporal = temporal_ratio, topic_distinct = distinctiveness)

# Merge all three metrics
combined_distinctiveness <- high_frequency_data %>%
  select(word, decade, count, appear, topic) %>%
  left_join(count_distinct, by = c("word", "decade")) %>%
  left_join(appear_distinct, by = c("word", "decade")) %>%
  left_join(topic_distinct, by = c("word", "decade"))

# Since all three are on log scales (additive), we can average them
# But we might want to weight them differently or standardize first
combined_distinctiveness <- combined_distinctiveness %>%
  mutate(
    # Simple average of the three distinctiveness scores
    combined_distinct_mean = (count_distinct + appear_distinct + topic_distinct) / 3,
    
    # Or use a weighted average if one metric is more important
    # combined_distinct_weighted = (count_distinct * 0.5 + appear_distinct * 0.3 + topic_distinct * 0.2),
    
    # Or standardize each metric first (z-scores) then combine
    count_distinct_z = scale(count_distinct)[,1],
    appear_distinct_z = scale(appear_distinct)[,1],
    topic_distinct_z = scale(topic_distinct)[,1],
    combined_distinct_standardized = (count_distinct_z + appear_distinct_z + topic_distinct_z) / 3,
    
    # Separate temporal and spatial components
    # Temporal: how distinctive is this word in this decade vs other decades in PS
    count_temporal_z = scale(count_temporal)[,1],
    appear_temporal_z = scale(appear_temporal)[,1],
    topic_temporal_z = scale(topic_temporal)[,1],
    combined_temporal_standardized = (count_temporal_z + appear_temporal_z + topic_temporal_z) / 3,
    
    # Spatial: how distinctive is this word in PS vs T20 in this decade
    count_spatial_z = scale(count_spatial)[,1],
    appear_spatial_z = scale(appear_spatial)[,1],
    topic_spatial_z = scale(topic_spatial)[,1],
    combined_spatial_standardized = (count_spatial_z + appear_spatial_z + topic_spatial_z) / 3
  )

# Find top distinctive words per decade using different combination methods
top_words_mean <- combined_distinctiveness %>%
  group_by(decade) %>%
  arrange(desc(combined_distinct_mean)) %>%
  slice_head(n = 20) %>%
  ungroup()

top_words_standardized <- combined_distinctiveness %>%
  group_by(decade) %>%
  arrange(desc(combined_distinct_standardized)) %>%
  slice_head(n = 20) %>%
  ungroup()

# Alternative: require word to be distinctive on ALL three metrics
# (minimum of the three scores)
top_words_conservative <- combined_distinctiveness %>%
  mutate(combined_distinct_min = pmin(count_distinct, appear_distinct, topic_distinct)) %>%
  group_by(decade) %>%
  arrange(desc(combined_distinct_min)) %>%
  slice_head(n = 20) %>%
  ungroup()

# View results
print("Top 20 words per decade (mean of three metrics):")
print(top_words_mean %>% select(decade, word, combined_distinct_mean, count, appear, topic))

print("\nTop 20 words per decade (standardized combination):")
print(top_words_standardized %>% select(decade, word, combined_distinct_standardized, count, appear, topic))

print("\nTop 20 words per decade (conservative - minimum score):")
print(top_words_conservative %>% select(decade, word, combined_distinct_min, count, appear, topic))

# NEW: Analyze temporal and spatial components separately
top_words_temporal <- combined_distinctiveness %>%
  group_by(decade) %>%
  arrange(desc(combined_temporal_standardized)) %>%
  slice_head(n = 20) %>%
  ungroup()

top_words_spatial <- combined_distinctiveness %>%
  group_by(decade) %>%
  arrange(desc(combined_spatial_standardized)) %>%
  slice_head(n = 20) %>%
  ungroup()

print("\nTop 20 words per decade (TEMPORAL distinctiveness - signature of this decade in PS):")
print(top_words_temporal %>% select(decade, word, combined_temporal_standardized, count, appear, topic))

print("\nTop 20 words per decade (SPATIAL distinctiveness - signature of PS vs other journals):")
print(top_words_spatial %>% select(decade, word, combined_spatial_standardized, count, appear, topic))

# Compare temporal vs spatial patterns
print("\nWords with high temporal but low spatial distinctiveness (decade-specific in PS but not distinctive from other journals):")
combined_distinctiveness %>%
  filter(combined_temporal_standardized > 1, combined_spatial_standardized < 0) %>%
  arrange(desc(combined_temporal_standardized)) %>%
  select(decade, word, combined_temporal_standardized, combined_spatial_standardized) %>%
  head(20) %>%
  print()

print("\nWords with high spatial but low temporal distinctiveness (consistently distinctive in PS across decades):")
combined_distinctiveness %>%
  filter(combined_spatial_standardized > 1, combined_temporal_standardized < 0) %>%
  arrange(desc(combined_spatial_standardized)) %>%
  select(decade, word, combined_spatial_standardized, combined_temporal_standardized) %>%
  head(20) %>%
  print()

# Summary statistics to help choose combination method
print("\nCorrelations between metrics:")
combined_distinctiveness %>%
  select(count_distinct, appear_distinct, topic_distinct) %>%
  cor(use = "complete.obs") %>%
  print()

# Optional: Filter by minimum frequency before ranking
# This avoids very rare words with extreme ratios
top_words_filtered <- combined_distinctiveness %>%
  filter(count >= 50, appear >= 10) %>%  # adjust thresholds as needed
  group_by(decade) %>%
  arrange(desc(combined_distinct_standardized)) %>%
  slice_head(n = 20) %>%
  ungroup()

print("\nTop 20 words per decade (filtered for minimum frequency):")
print(top_words_filtered %>% select(decade, word, combined_distinct_standardized, count, appear, topic))
