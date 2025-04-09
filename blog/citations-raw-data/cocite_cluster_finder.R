record_for_year <- recent_high_cites |>
  filter(year >= 1965) |>
  group_by(year) |>
  slice_max(order_by = citations, n = 100, with_ties = TRUE) |>
  arrange(-year, -citations) |>
  select(id, year, citations)

the_71 <- record_for_year |>
  filter(year >= 2014, year <= 2020) |>
  rowid_to_column() |>
  ungroup() 

co_cite <- active_philo_cite |>
  filter(refs %in% the_71$id) |>
  rename(refs1 = refs) |>
  left_join(active_philo_cite |>
              ungroup() |>
              filter(refs %in% the_71$id) |>
              rename(refs2 = refs),
            by = "id",
            multiple = "all",
            relationship = "many-to-many") |>
  filter(refs1 != refs2) |>
  group_by(refs1, refs2) |>
  tally(name = "cocites") |>
  left_join(
    select(
      the_71,
      id1 = rowid,
      refs1 = id,
      cites1 = citations,
    ),
    by = "refs1"
  ) |>
  left_join(
    select(
      the_71,
      refs2 = id,
      id2 = rowid,
      cites2 = citations,
    ),
    by = "refs2"
  ) |>
  filter(id1 < id2) |>
  left_join(
    select(
      active_philo_bib,
      refs1 = id,
      auth1 = displayauth,
      title1 = title),
    by = "refs1"
    ) |>
  left_join(
    select(
      active_philo_bib,
      refs2 = id,
      auth2 = displayauth,
      title2 = title),
    by = "refs2"
  ) |>
  arrange(-cocites)

next_cluster <- 1
cluster_tibble <- tibble(
  id = the_71$id,
  cluster = 0
)

for (n in 1:nrow(co_cite)){
  temp_tibble <- tribble(
    ~id, ~rowid,
    co_cite$refs1[n], co_cite$id1[n],
    co_cite$refs2[n], co_cite$id2[n]
  ) |>
    left_join(cluster_tibble, by = "id")
  
  if (sum(temp_tibble$cluster) == 0){
    cluster_tibble$cluster[co_cite$id1[n]] <- next_cluster
    cluster_tibble$cluster[co_cite$id2[n]] <- next_cluster
    next_cluster <- next_cluster + 1
  } else
    if (temp_tibble$cluster[1] > 0 & temp_tibble$cluster[2] == 0){
      cluster_tibble$cluster[co_cite$id2[n]] <- cluster_tibble$cluster[co_cite$id1[n]]
    } else
      if (temp_tibble$cluster[1] == 0 & temp_tibble$cluster[2] > 0){
        cluster_tibble$cluster[co_cite$id1[n]] <- cluster_tibble$cluster[co_cite$id2[n]]
      } 
}

cluster_tibble <- cluster_tibble |>
  arrange(cluster) |>
  left_join(
    select(
      active_philo_bib,
      id,
      displayauth,
      year,
      title
    ), by = "id"
  ) |>
  left_join(
    select(
      the_71,
      id,
      citations
    ), by = "id"
  ) |>
  arrange(cluster, -citations)