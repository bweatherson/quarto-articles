# Find pairs of papers with diverging citation trajectories
# Paper A: was in temporal HC group (top 0.3% cumulative as of year before), not now HC (< 100 citations)
# Paper B: was not in temporal HC group, but is now HC (≥ 100 citations)
# Both had same number of citations IN target_year (at least 5)

target_year <- 2007
the_target_year <- target_year

# Calculate citations received IN target_year (not through target_year)
citations_in_year <- citations |>
  left_join(articles |> select(id, year), by = c("new" = "id")) |>
  filter(year == target_year) |>  # Only citations IN this year
  count(old, name = "cites_in_year") |>
  rename(id = old)

# For each year, calculate the top 0.3% threshold based on CUMULATIVE citations
# For articles published before that year
# yearly_thresholds <- tibble(year = min(articles$year):max(articles$year)) |>
#   rowwise() |>
#   mutate(
#     threshold = {
#       # Get cumulative citations for articles published before this year
#       cites <- citations |>
#         left_join(articles |> select(id, pub_year = year), by = c("old" = "id")) |>
#         filter(pub_year < year) |>
#         left_join(articles |> select(id, cite_year = year), by = c("new" = "id")) |>
#         filter(cite_year < year) |>
#         count(old, name = "cumulative_cites")
#       
#       if (nrow(cites) > 0) {
#         quantile(cites$cumulative_cites, 0.998, na.rm = TRUE)
#       } else {
#         0
#       }
#     }
#   ) |>
#   ungroup()

cites_by_target_year <- citations |>
  left_join(
    articles |> rename(new = id),
    by = "new"
  ) |>
  filter(year < target_year) |>
  rename(id = old) |>
  group_by(id) |>
  count(name = "cites_before_target")

# Determine if each article was highly cited (top 0.2%) as of the year before target_year
hc_as_of_year <- temporal_results_03$temporal_hc_list |> 
  filter(target_year == the_target_year) |>
  rename(id = highly_cited_id) |>
  mutate(was_temporal_hc = TRUE) |>
  left_join(cites_by_target_year, by = "id")

all_a_candidates <- hc_as_of_year |>
  filter(!id %in% results_100$highly_cited_ids)

# Create comparison dataset
comparison_data <- article_stats |>
  left_join(citations_in_year, by = "id") |>
  left_join(hc_as_of_year |> select(id, was_temporal_hc, cites_before_target), by = "id") |>
  replace_na(list(cites_in_year = 0, was_temporal_hc = FALSE, cites_before_target = 0)) |>
  filter(year < target_year, cites_in_year >= 4) |>  # Filter for at least 5 cites IN target year
  mutate(
    is_now_hc = is_highly_cited
  )

# Find Paper A: was temporally HC (top 0.2%), not now HC
paper_a_candidates <- comparison_data |>
  filter(was_temporal_hc == TRUE, is_now_hc == FALSE)

# Find Paper B: was not temporally HC (top 0.2%), is now HC
paper_b_candidates <- comparison_data |>
  filter(was_temporal_hc == FALSE, is_now_hc == TRUE)

# Find matching pairs (same citations IN target_year)
matching_pairs <- paper_a_candidates |>
  inner_join(paper_b_candidates, 
             by = "cites_in_year",
             suffix = c("_A", "_B")) |>
  left_join(philo_bib_through_2024 |> select(id, title, displayauth, journal), 
            by = c("id_A" = "id")) |>
  rename(title_A = title, author_A = displayauth, journal_A = journal) |>
  left_join(philo_bib_through_2024 |> select(id, title, displayauth, journal), 
            by = c("id_B" = "id")) |>
  rename(title_B = title, author_B = displayauth, journal_B = journal) |>
  arrange(desc(cites_in_year), desc(n_citations_B))

threshold_value <- hc_as_of_year$threshold[1]

cat(sprintf("Target year: %d\n", target_year))
cat(sprintf("Top 0.3%% cumulative threshold as of %d: %.1f citations\n", 
            target_year - 1, threshold_value))
cat(sprintf("Paper A candidates (was temporal HC top 0.3%%, not now HC, ≥5 cites in %d): %d\n", 
            target_year, nrow(paper_a_candidates)))
cat(sprintf("Paper B candidates (was not temporal HC top 0.3%%, now HC, ≥5 cites in %d): %d\n", 
            target_year, nrow(paper_b_candidates)))
cat(sprintf("Matching pairs: %d\n\n", nrow(matching_pairs)))

if (nrow(matching_pairs) > 0) {
  # Show the pairs
  matching_pairs |>
    select(
      id_A, title_A, year_A, journal_A,
      id_B, title_B, year_B, journal_B,
      cites_in_year,
      cites_through_2004_A = cites_before_target_A,
      cites_through_2004_B = cites_before_target_B,
      current_cites_A = n_citations_A,
      current_cites_B = n_citations_B
    ) |>
    print(n = Inf)
  
  # Also make a nice table
  matching_pairs |>
    select(
      id_A, title_A, year_A,
      id_B, title_B, year_B,
      cites_in_year,
      current_cites_A = n_citations_A,
      current_cites_B = n_citations_B
    ) |>
    head(20) |>
    kable()
} else {
  cat("No matching pairs found. Try a different year.\n")
}

