require(tidyverse)

t5000_words <- phil_studies_by_year |>
  group_by(word) |>
  summarise(count = sum(count) |> as.integer()) |>
  arrange(-count) |>
  slice_max(count, n = 3500)