require(tidyverse)
require(igraph)

load("philo_cocite.RData")
philo_cocite <- philo_cocite |>
  filter(X1 %in% main_bib$old, X2 %in% main_bib$old)

graph_input_short <- philo_cocite |>
  group_by(X1, X2) |>
  tally() |>
  rename(weight = n) |>
  filter(weight >= 3)
  
  
#graph_input_short <- graph_input %>% filter(weight >= 3)

the_graph <- graph_from_data_frame(graph_input_short, directed = FALSE)

the_clusters <- cluster_optimal(the_graph)

the_categories <- membership(the_clusters) %>%
  enframe() %>%
  mutate(old = as.character(name)) %>% 
  select(-name) %>% 
  left_join(main_bib, by = "old") %>%
  arrange(-n, value) 

the_categories$value <- as.numeric(the_categories$value)

category_sum <- the_categories |>
  group_by(value) %>% 
  tally(wt=n, name = "wt") %>%
  arrange(-wt) %>%
  rowid_to_column("cat_num") %>% 
  rename(cat_size = wt)

#good_categories <- c(4:87, 89, 99, 101, 102, 110, 119, 136)
#good_categories <- 1:2000

the_categories <- the_categories %>% 
  left_join(category_sum, by = "value") %>% 
  select(-value) %>% 
  select(old, cat_num, n, author, graph_auth, old_year, art_title, journal, graph_cite) |>
  filter(is.na(cat_num) == FALSE) |>
  arrange(cat_num, -n)

missing_articles <- anti_join(main_bib, the_categories, by = "old")
