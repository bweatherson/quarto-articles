median_cites_unqualified <- tribble(~year, ~median)

for (y in 1974:2008){
  temp <- citation_tibble |>
    filter(old_year >= y, old_year <= y + 4, new_year >= 2020) |>
    group_by(old) |>
    tally() |>
    arrange(-n) |>
    slice(1:20)
  median_cites_unqualified <- median_cites_unqualified |>
    add_row(year = y, median = median(temp$n))
}

ggplot(median_cites_unqualified, aes(x = year, y = median)) + geom_point()