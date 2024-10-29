require(tidyverse)

decade_comparison <- c()

for (dec in 198:201){
  the_decade <- paste0(dec,"0s")
  decade_cites <- all_cites |>
    filter(decade == the_decade) |>
    group_by(old) |>
    tally(name = "dec_cites") |>
    slice_max(order_by = dec_cites, n = 20, with_ties = FALSE)
  ps_cites <- all_cites |>
    filter(decade == the_decade,
           new_journal == "Philosophical Studies",
           old %in% decade_cites$old) |>
    group_by(old) |>
    tally(name = "ps_cites")
  decade_cites <- decade_cites |>
    left_join(ps_cites,
              by = "old") |>
    replace_na(list(ps_cites = 0)) |>
    mutate(ratio = ps_cites/dec_cites,
           decade = the_decade) |>
    left_join(short_bib,
              by = c("old" = "id")) |>
    select(-cites) |>
    rowid_to_column(var = "Rank") |>
    mutate(Citation = paste0("@", str_replace(old, ":", ""))) |>
    select(Rank, Citation, `PS Citations` = ps_cites, `All Citations` = dec_cites, Ratio = ratio, everything())
  decade_comparison <- decade_comparison |>
    bind_rows(decade_cites) |>
    arrange(decade, -Ratio, `All Citations`)
}

single_decade_kable <- function(x){
  temp <- decade_comparison |>
    filter(decade == paste0(x,"0s")) |>
    mutate(Percent = scales::label_percent()(Ratio)) |>
    select(Rank, Citation, `PS Citations`, `All Citations`, Percent)
  temp |>
    slice(1:5) |>
    add_row(Citation = "...") |>
    bind_rows(temp |>
                slice(18:20))
  }

