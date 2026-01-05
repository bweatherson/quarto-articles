citations_with_year <- citations |>
  left_join(
    articles |> rename(old = id, old_year = year),
    by = "old"
  ) |>
  left_join(
    articles |> rename(new = id, new_year = year),
    by = "new"
  )

macfarlane_2008_citations <- citations_with_year |>
  filter(old == "WOS:000183846000001", new_year <= 2008) |>
  select(id = new) |>
  left_join(article_stats, by = "id") |>
  select(-year) |>
  left_join(select(philo_bib_through_2024,
                   id,
                   year,
                   title,
                   displayauth),
            by = "id")