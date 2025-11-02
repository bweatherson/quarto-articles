short_distinctiveness <- combined_distinctiveness |>
  select(word, decade, count, all = combined_distinct_standardized, 
  time = combined_temporal_standardized, 
  space = combined_spatial_standardized) |>
  mutate(prod = time * space) |>
  mutate(abssum = abs(time) + abs(space))


