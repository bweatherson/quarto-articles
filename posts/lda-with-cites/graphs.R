catnames <- tribble(
  ~topic, ~subject,
  4, "Ethics",
  5, "Language",
  3, "Epistemology",
  1, "Mind",
  2, "Metaphysics",
)

total_articles <- all_gamma |>
  left_join(ps_meta, by = c("document" = "jstor_id")) |>
  group_by(year) |>
  summarise(all_art = sum(gamma))

year_gamma <- all_gamma |>
  left_join(ps_meta, by = c("document" = "jstor_id")) |>
  ungroup() |>
  group_by(year, subject) |>
  summarise(Articles = sum(gamma), .groups = "drop") |>
  left_join(total_articles, by = "year") |>
  mutate(Share = Articles/all_art)





ggplot(year_gamma,
       aes(
         x = year,
         y = Share,
         group_by = subject,
         color = subject
       )) +
  geom_point(size = 1.5) +
  geom_smooth(se = FALSE, linewidth = 0.2, alpha = 0.5) +
  theme_minimal() +
  labs(x = element_blank(),
       color = element_blank())

ggsave(filename = "ps_subjects.png")
