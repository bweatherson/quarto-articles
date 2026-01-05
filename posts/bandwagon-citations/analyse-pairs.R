# Analyze citing articles for paper pairs
# For each paper in a pair, get:
# 1. Articles that cited it in 2007
# 2. How many citations those 2007 citing articles received

library(tidyverse)

# Function to get citing articles and their performance for a given paper
get_citing_article_stats <- function(paper_id, target_year, citations, citation_counts) {
  
  # Get articles that cited this paper in target_year
  citing_articles <- citations |>
    filter(old == paper_id) |>
    left_join(articles |> select(id, year), by = c("new" = "id")) |>
    filter(year == target_year) |>
    select(citing_id = new)
  
  # Get citation counts for these citing articles
  citing_stats <- citing_articles |>
    left_join(citation_counts, by = c("citing_id" = "id")) |>
    left_join(philo_bib_through_2024 |> select(id, year, title, displayauth, journal), 
              by = c("citing_id" = "id")) |>
    rename(
      citing_article_id = citing_id,
      citing_article_year = year,
      citing_article_title = title,
      citing_article_author = displayauth,
      citing_article_journal = journal,
      citing_article_citations = n_citations
    ) |>
    replace_na(list(citing_article_citations = 0)) |>
    arrange(desc(citing_article_citations))
  
  return(citing_stats)
}

# For each pair, create tibbles of citing articles
analyze_pair <- function(pair_row, citations, citation_counts, articles) {
  
  id_A <- pair_row$id_A
  id_B <- pair_row$id_B
  target_year <- pair_row$year_A  # Using year from the data, could also use the_target_year
  
  # Get citing articles for paper A
  citing_A <- get_citing_article_stats(id_A, target_year = 2007, citations, citation_counts)
  
  # Get citing articles for paper B  
  citing_B <- get_citing_article_stats(id_B, target_year = 2007, citations, citation_counts)
  
  # Calculate summary statistics
  summary_A <- citing_A |>
    summarise(
      n_citing_articles = n(),
      mean_cites = mean(citing_article_citations, na.rm = TRUE),
      median_cites = median(citing_article_citations, na.rm = TRUE),
      total_cites = sum(citing_article_citations, na.rm = TRUE),
      max_cites = max(citing_article_citations, na.rm = TRUE)
    )
  
  summary_B <- citing_B |>
    summarise(
      n_citing_articles = n(),
      mean_cites = mean(citing_article_citations, na.rm = TRUE),
      median_cites = median(citing_article_citations, na.rm = TRUE),
      total_cites = sum(citing_article_citations, na.rm = TRUE),
      max_cites = max(citing_article_citations, na.rm = TRUE)
    )
  
  list(
    paper_A_id = id_A,
    paper_B_id = id_B,
    paper_A_title = pair_row$title_A,
    paper_B_title = pair_row$title_B,
    citing_A = citing_A,
    citing_B = citing_B,
    summary_A = summary_A,
    summary_B = summary_B
  )
}

# Analyze all pairs
# Note: Make sure 'matching_pairs', 'citations', 'citation_counts', and 'articles' 
# are available in your environment before running this

if (exists("matching_pairs") && nrow(matching_pairs) > 0) {
  
  # Analyze first pair as example
  pair_1 <- matching_pairs |> slice(1)
  pair_1_analysis <- analyze_pair(pair_1, citations, citation_counts, articles)
  
  cat("\n=== PAIR 1 ANALYSIS ===\n")
  cat("Paper A:", pair_1_analysis$paper_A_id, "-", pair_1_analysis$paper_A_title, "\n")
  cat("Paper B:", pair_1_analysis$paper_B_id, "-", pair_1_analysis$paper_B_title, "\n\n")
  
  cat("Paper A - Citing Articles Summary:\n")
  print(pair_1_analysis$summary_A)
  cat("\nPaper B - Citing Articles Summary:\n")
  print(pair_1_analysis$summary_B)
  
  cat("\n--- Paper A: Articles that cited it in 2007 ---\n")
  print(pair_1_analysis$citing_A, n = 20)
  
  cat("\n--- Paper B: Articles that cited it in 2007 ---\n")
  print(pair_1_analysis$citing_B, n = 20)
  
  # You can also analyze all pairs at once
  all_pair_analyses <- matching_pairs |>
    rowwise() |>
    mutate(
      analysis = list(analyze_pair(cur_data(), citations, citation_counts, articles))
    )
  
  # Create a summary comparison table
  comparison_summary <- matching_pairs |>
    rowwise() |>
    mutate(
      citing_A_stats = list(get_citing_article_stats(id_A, 2007, citations, citation_counts)),
      citing_B_stats = list(get_citing_article_stats(id_B, 2007, citations, citation_counts))
    ) |>
    mutate(
      n_citers_A = nrow(citing_A_stats),
      mean_cites_A = mean(citing_A_stats$citing_article_citations, na.rm = TRUE),
      median_cites_A = median(citing_A_stats$citing_article_citations, na.rm = TRUE),
      n_citers_B = nrow(citing_B_stats),
      mean_cites_B = mean(citing_B_stats$citing_article_citations, na.rm = TRUE),
      median_cites_B = median(citing_B_stats$citing_article_citations, na.rm = TRUE)
    ) |>
    ungroup() |>
    select(
      id_A, title_A, 
      id_B, title_B,
      cites_in_year,
      n_citers_A, mean_cites_A, median_cites_A,
      n_citers_B, mean_cites_B, median_cites_B
    )
  
  cat("\n=== COMPARISON SUMMARY FOR ALL PAIRS ===\n")
  print(comparison_summary, n = Inf)
  
} else {
  cat("No matching pairs found. Run find-pairs.R first.\n")
}