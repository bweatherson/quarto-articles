require(tidyverse)

issue_list <- read_csv("~/Documents/quarto-articles/posts/phil-studies/PS_Special.csv",
                       show_col_types = FALSE)

issue_count_by_year_type <- ps_papers |>
  mutate(issue = case_when(
    is.na(issue) ~ "S",
    TRUE ~ issue
  )) |>
  group_by(volume, issue) |>
  slice(1) |>
  left_join(issue_list |> 
              rename(volume = Volume, issue = Issue) |>
              mutate(volume = as.character(volume)), by = c("volume", "issue")) |>
  replace_na(list(Type = "Normal", Count = 1)) |>
  ungroup() |>
  arrange(year, volume, issue) |>
  group_by(year, Type) |>
  summarise(count = sum(Count), .groups = "drop")

issue_count_by_year <- issue_count_by_year_type |>
  group_by(year) |>
  summarise(count = sum(count), .groups = "drop")

issue_count_by_year_normal  <- issue_count_by_year_type |>
  filter(Type == "Normal") |>
  group_by(year) |>
  summarise(count = sum(count), .groups = "drop")

issue_count_by_year_abnormal  <- issue_count_by_year_type |>
  filter(Type != "Normal") |>
  group_by(year) |>
  summarise(count = sum(count), .groups = "drop")

issue_count_by_type <- issue_count_by_year_type |>
  group_by(Type) |>
  summarise(count = sum(count), .groups = "drop")

issue_type_by_decade <- issue_count_by_year_type |>
  mutate(Type = case_when(
    Type == "Normal" ~ "Normal",
    TRUE ~ "Special"),
         Decade = paste0(floor(year/10),"0s")) |>
  group_by(Decade, Type) |>
  summarise(count = sum(count), .groups = "drop") |>
  pivot_wider(id_cols = Decade,
              names_from = Type,
              values_from = count)

issue_type_by_decade_expanded <- issue_count_by_year_type |>
  mutate(Type = case_when(
    Type == "Conference" ~ "Topic",
    TRUE ~ Type),
    Decade = paste0(floor(year/10),"0s")) |>
  group_by(Decade, Type) |>
  summarise(count = sum(count), .groups = "drop") |>
  pivot_wider(id_cols = Decade,
              names_from = Type,
              values_from = count) %>%
  replace(is.na(.), 0)

citation_with_type <- ps_papers |>
  select(id, year, displayauth, title, volume, issue) |>
  left_join(issue_list |> 
              rename(volume = Volume, issue = Issue) |>
              mutate(volume = as.character(volume)) |>
              mutate(Type = case_when(
                Type == "Conference" ~ "Topic",
                TRUE ~ Type)
                     ), 
            by = c("volume", "issue")) |>
  select(-Count) |>
  left_join(citation_count, by = c("id" = "old")) |>
  replace_na(list(
    Type = "Normal",
    cites = 0))

citation_by_type <- citation_with_type |>
  ungroup() |>
  group_by(Type) |>
  summarise(cites = round(mean(cites),1))

citation_by_type_decade <- citation_with_type |>
  mutate(Decade = paste0(floor(year/10),"0s")) |>
  group_by(Type, Decade) |>
  summarise(cites = round(mean(cites),1), .groups = "drop")
    
