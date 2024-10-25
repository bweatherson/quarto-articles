require(tidyverse)
require(readxl)

issues <- read_excel("/Users/weath/University of Michigan Dropbox/Brian Weatherson/PS_Special.xlsx")

issues <- issues |>
  select(volume = Volume, issue = Issue, everything()) |>
  mutate(volume = as.character(volume)) |>
  right_join(philo_bib |>
              filter(journal == "Philosophical Studies") |>
              filter(year >= 1980, year <= 2019) |>
              group_by(volume, issue) |>
              slice(1) |>
              select(volume, issue, year),
            by = c("volume", "issue"),
            select(volume, issue, year)) |>
  replace_na(list(Type = "Normal", Count = 1)) |>
  arrange(volume, issue)

special_per_year <- issues |>
  filter(Type != "Normal") |>
  group_by(year) |>
  summarise(special_count = sum(Count))

issues_per_year <- issues |>
  group_by(year) |>
  summarise(special_count = sum(Count))