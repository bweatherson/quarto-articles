grand_citations <- active_philo_cite %>%
  # Self-join to find chains: a <- b <- c
  inner_join(active_philo_cite, 
             by = c("refs" = "id"), 
             suffix = c("_b", "_c"),
             relationship = "many-to-many") %>%
  # Now we have: id (which is 'a'), refs (which is 'b'), and refs_c (which is 'c')
  # Count triples for each article 'a'
  count(id, name = "grand_citations") %>%
  arrange(desc(grand_citations)) %>%
  