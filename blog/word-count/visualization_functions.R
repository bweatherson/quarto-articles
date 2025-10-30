library(tidyverse)

# Visualization functions to help understand the data
# Run after the main distinctiveness_analysis.R script

# 1. Compare the three metrics for a specific decade
compare_metrics_plot <- function(data, target_decade = "1980s", n_words = 15) {
  data %>%
    filter(decade == target_decade) %>%
    arrange(desc(combined_distinct_standardized)) %>%
    slice_head(n = n_words) %>%
    select(word, count_distinct, appear_distinct, topic_distinct) %>%
    pivot_longer(cols = -word, names_to = "metric", values_to = "distinctiveness") %>%
    mutate(word = fct_reorder(word, distinctiveness, .fun = mean)) %>%
    ggplot(aes(x = word, y = distinctiveness, fill = metric)) +
    geom_col(position = "dodge") +
    coord_flip() +
    labs(title = paste("Distinctiveness by Metric:", target_decade),
         x = "Word", y = "Distinctiveness Score") +
    theme_minimal()
}

# 2. Show how a specific word's distinctiveness changes over decades
word_trajectory_plot <- function(data, target_word = "knowledge") {
  data %>%
    filter(word == target_word) %>%
    select(decade, count_distinct, appear_distinct, topic_distinct) %>%
    pivot_longer(cols = -decade, names_to = "metric", values_to = "distinctiveness") %>%
    ggplot(aes(x = decade, y = distinctiveness, color = metric, group = metric)) +
    geom_line(size = 1) +
    geom_point(size = 3) +
    labs(title = paste("Distinctiveness Trajectory:", target_word),
         x = "Decade", y = "Distinctiveness Score") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# 3. Heatmap of top distinctive words by decade
distinctiveness_heatmap <- function(data, n_per_decade = 10, metric = "combined_distinct_standardized") {
  top_by_decade <- data %>%
    group_by(decade) %>%
    arrange(desc(.data[[metric]])) %>%
    slice_head(n = n_per_decade) %>%
    ungroup()
  
  top_by_decade %>%
    ggplot(aes(x = decade, y = fct_reorder(word, .data[[metric]]), fill = .data[[metric]])) +
    geom_tile() +
    scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
    labs(title = "Top Distinctive Words by Decade",
         x = "Decade", y = "Word", fill = "Distinctiveness") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          axis.text.y = element_text(size = 8))
}

# 4. Scatter plot comparing different combination methods
combination_comparison_plot <- function(data, decade_filter = NULL) {
  plot_data <- data
  if (!is.null(decade_filter)) {
    plot_data <- plot_data %>% filter(decade == decade_filter)
  }
  
  plot_data %>%
    ggplot(aes(x = combined_distinct_mean, y = combined_distinct_standardized, label = word)) +
    geom_point(alpha = 0.5) +
    geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
    labs(title = "Comparison of Combination Methods",
         subtitle = ifelse(!is.null(decade_filter), decade_filter, "All decades"),
         x = "Mean Combination", y = "Standardized Combination") +
    theme_minimal()
}

# 5. Create a summary table showing top words by decade
create_summary_table <- function(data, n_words = 10) {
  data %>%
    group_by(decade) %>%
    arrange(desc(combined_distinct_standardized)) %>%
    slice_head(n = n_words) %>%
    select(decade, word, combined_distinct_standardized, count, appear, topic) %>%
    ungroup()
}

# Example usage (uncomment to run):
# compare_metrics_plot(combined_distinctiveness, "1990s", 15)
# word_trajectory_plot(combined_distinctiveness, "knowledge")
# distinctiveness_heatmap(combined_distinctiveness, 10)
# combination_comparison_plot(combined_distinctiveness, "2000s")
# summary_table <- create_summary_table(combined_distinctiveness, 15)
# print(summary_table)

# 6. Export results to CSV for further analysis
export_results <- function(data, filename = "distinctive_words_by_decade.csv") {
  data %>%
    group_by(decade) %>%
    arrange(desc(combined_distinct_standardized)) %>%
    slice_head(n = 30) %>%
    ungroup() %>%
    select(decade, word, combined_distinct_standardized, 
           count_distinct, appear_distinct, topic_distinct,
           count, appear, topic) %>%
    write_csv(filename)
  message(paste("Results exported to", filename))
}

# Diagnostic: Check for outliers or problematic words
check_outliers <- function(data) {
  data %>%
    summarise(
      count_distinct_outliers = sum(abs(count_distinct) > 10, na.rm = TRUE),
      appear_distinct_outliers = sum(abs(appear_distinct) > 10, na.rm = TRUE),
      topic_distinct_outliers = sum(abs(topic_distinct) > 10, na.rm = TRUE)
    ) %>%
    print()
  
  # Show extreme cases
  print("Most extreme count_distinct:")
  data %>% arrange(desc(abs(count_distinct))) %>% head(10) %>% 
    select(word, decade, count_distinct, count) %>% print()
}

# Example: export_results(combined_distinctiveness, "ps_distinctive_words.csv")
