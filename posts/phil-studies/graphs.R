require(tidyverse)
require(slider)

load("~/Documents/citations-2025/philo_bib.RData")

comp_journal_count <- 20
comp_tag <- paste0(
  "Other top ",
  comp_journal_count,
  " journals"
)

first_year <- philo_bib |>
  group_by(journal) |>
  summarise(first_year = min(year)) |>
  left_join(journal_citation_rate, by = c("journal" = "Journal")) |>
  filter(first_year <= 1980) |>
  arrange(-`Citation Rate`)

comparison_journals <- first_year$journal[1:comp_journal_count]

ps_comp_rate <- active_cites |>
  ungroup() |>
  group_by(old_year, cited_journal) |>
  filter(old_journal %in% comparison_journals) |>
  tally(name = "citations") |>
  ungroup() |>
  rename(year = old_year) |>
  left_join(
    philo_bib |>
      filter(year >= 1980, year <= 2019,
             journal %in% comparison_journals) |>
      mutate(cited_journal = case_when(
        journal == "Philosophical Studies" ~ "PS",
        TRUE ~ "NPS")) |>
      group_by(year, cited_journal) |>
      tally(name = "articles"),
    by = c("cited_journal", "year")) |>
  mutate(rate = citations/articles) |>
  ungroup() |>
  group_by(cited_journal) |>
  arrange(year) |>
  mutate(slide_arts = slide_dbl(articles, sum, .before = 4),
         slide_cites = slide_dbl(citations, sum, .before = 4),
         slide_rate = slide_cites/slide_arts) 
    

ps_comp_rate_wide <- ps_comp_rate |>
  pivot_wider(
    id_cols = year,
    names_from = cited_journal,
    values_from = slide_rate) |>
  mutate(comp = round(PS/NPS, 3))

ggplot(ps_comp_rate_wide,
       aes(x = year, y = comp)) +
  geom_point() + 
  labs(x = "Publication Year",
       y = "Ratio",
       subtitle = "Ratio of citation rate in Philosophical Studies to citation rate in other top 20 journals; five year rolling average.") +
  theme(plot.subtitle = element_text(family = "Scala Sans Pro", size = 16))

ggplot(ps_comp_rate |>
         left_join(
           tribble(
             ~cited_journal, ~Journal,
             "PS", "Philosophical Studies",
             "NPS", comp_tag,
           ),
           by = "cited_journal"), 
       aes(x = year, y = rate, color = Journal)) +
       geom_point() +
       labs(x = "Publication Year",
            y = "Citations per article",
            color = element_blank())
  