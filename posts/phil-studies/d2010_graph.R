library(tidyverse)
library(ggrepel)  # You'll need to install this: install.packages("ggrepel")

# Your existing code to create d2010_cites
d2010_cites <- all_cites %>%
  filter(decade == "2010s") %>%
  group_by(old, citing_journal) %>%
  tally() %>%
  pivot_wider(
    names_from = citing_journal,
    values_from = n
  ) %>%
  replace_na(list(PS = 0, NPS = 0)) %>%
  filter(PS + NPS >= 50) %>%
  left_join(
    select(
      short_bib, 
      old = id,
      year,
      displayauth,
      title
    ), by = "old"
  ) %>%
  mutate(year = as.integer(year))

# Function to create concise author labels
create_label <- function(displayauth, year) {
  # Split by "and" or commas
  authors <- str_split(displayauth, " and |, ")[[1]]
  
  if (length(authors) == 1) {
    # Single author: extract last name
    last_name <- word(authors[1], -1)
    return(paste0(last_name, " (", year, ")"))
  } else if (length(authors) == 2) {
    # Two authors: Last1 & Last2
    last1 <- word(authors[1], -1)
    last2 <- word(authors[2], -1)
    return(paste0(last1, " & ", last2, " (", year, ")"))
  } else {
    # Three or more: First et al.
    last1 <- word(authors[1], -1)
    return(paste0(last1, " et al. (", year, ")"))
  }
}

# Add labels and identify which points to label
d2010_cites <- d2010_cites %>%
  mutate(
    label = map2_chr(displayauth, year, create_label),
    # Criteria for labeling:
    # - PS >= 30 (high PS citations)
    # - NPS >= 200 (high NPS citations)  
    # - NPS >= 100 & PS <= 3 (interesting bottom outliers)
    should_label = PS >= 30 | NPS >= 200 | (NPS >= 110 & PS/NPS <= 0.04)
  )

# Create the plot
d2010_cites %>%
  ggplot(aes(x = NPS, y = PS)) +
  # Unlabeled points - more transparent
  geom_point(
    data = filter(d2010_cites, !should_label),
    alpha = 0.5, 
    color = "gray60"
  ) +
  # Labeled points - more prominent
  geom_point(
    data = filter(d2010_cites, should_label),
    alpha = 0.8, 
    size = 2
  ) +
  # Labels with strong repulsion
  geom_text_repel(
    data = filter(d2010_cites, should_label),
    aes(label = label),
    size = 3,
    max.overlaps = 20,
    box.padding = 0.5,
    point.padding = 0.5,
    force = 2,
    force_pull = 0.5,
    bg.color = "white",
    bg.r = 0.15,
    segment.size = 0.3,
    min.segment.length = 0,
    seed = 42                # For reproducibility
  ) +
  labs(
    x = "Citations outside Philosophical Studies",
    y = "Philosophical Studies citations"
  )

# Optional: See which points are being labeled
d2010_cites %>%
  filter(should_label) %>%
  select(label, NPS, PS) %>%
  arrange(desc(NPS))

# Generate nocite string for Quarto YAML
nocite_output <- d2010_cites %>%
  filter(should_label) %>%
  arrange(year, displayauth) %>%
  pull(old) %>%
  str_replace("WOS:", "WOS") %>%  # Remove colon after WOS
  paste0("@", .) %>%
  paste(collapse = ", ")

# Print formatted for YAML
cat("Copy this into your Quarto YAML header:\n")
cat("==========================================\n\n")
cat("nocite: |\n  ", nocite_output, "\n\n")

# Print summary info
cat("==========================================\n")
cat("Number of citations to add:", sum(d2010_cites$should_label), "\n\n")

# Print the list of papers for reference
cat("Papers to be added to bibliography:\n")
cat("==========================================\n")
d2010_cites %>%
  filter(should_label) %>%
  arrange(year) %>%
  select(label, year, displayauth, title) %>%
  print(n = Inf)