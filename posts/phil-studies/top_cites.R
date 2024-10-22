require(tidyverse)

citation_count <- active_cites |>
  group_by(old) |>
  tally(name = "cites")

short_bib <- philo_bib |>
  select(id, year, displayauth, title, journal) |>
  left_join(citation_count, by = c("id" = "old"))

ps_top_cites <- short_bib |>
  filter(journal == "Philosophical Studies") |>
  filter(year >= 2003, year <= 2007) |>
  slice_max(order_by = cites, n = 50)

ps_top_cites_all_years <- short_bib |>
  filter(journal == "Philosophical Studies") |>
  slice_max(order_by = cites, n = 50)

p <- c(0.9, 0.8, 0.7, 0.5)
p_names <- map_chr(p, ~paste0("d.", .x*100, "%"))
p_funs <- map(p, ~partial(quantile, probs = .x, na.rm = TRUE)) |>
  set_names(nm = p_names)
citation_deciles <- short_bib |>
  filter(journal == "Philosophical Studies") |>
  filter(year >= 1980, year <= 2019) |>
  group_by(year) |>
  summarize_at(vars(cites), p_funs) %>%
  pivot_longer(cols = starts_with("d."), names_to = "decile", names_prefix = "d.", values_to = "cites")

ggplot(citation_deciles, aes(x = year, y = cites, color = decile)) + 
  geom_point(size = 1.5, alpha = 1.5) +
  geom_smooth(se = F, method = "loess", formula = 'y ~ x', linewidth = 0.1)

temp_ajp <- short_bib |>
  filter(journal == "Australasian Journal Of Philosophy",
         year >= 1980,
         year <= 1984) |>
  arrange(-cites)

view(temp_ajp)

short_bib |>
  filter(year >= 1980, year <= 2019) |>
  filter(journal %in% comparison_journals) |>
  group_by(journal) |>
  tally()