require(tidyverse)
load("phil_studies_by_year.RData")

word <- "race"
d <- 2010

word_data <- phil_studies_by_year %>% filter(word == !!str_to_lower(word))

avg_frequency <- sum(word_data$count) / sum(word_data$all_ps_words) * 1000
avg_percentage_appear <- mean(word_data$appear / word_data$all_ps_articles * 100, na.rm = TRUE)
avg_percentage_topic <- mean(word_data$topic / word_data$all_ps_articles * 100, na.rm = TRUE)

gg <- ggplot(word_data, aes(x = year, y = ps_word_rate)) +
#  geom_rect(data = tibble(start = d-0.5, end = d+9.5), 
#            aes(xmin = start , xmax = end, ymin = -Inf, ymax = Inf),
#            inherit.aes=FALSE, alpha = 0.4, fill = rgb(249/300,255/300,255/300)) +
  geom_point(aes(x = year, y = t20_word_rate), 
             color = "grey50",
             alpha = 0.5,
             shape = 15) +
  geom_point(color = point_col, size = 2) +
  geom_hline(yintercept = avg_frequency, linetype = "dashed", color = "black") +
  labs(title = paste("Word Frequency for:", word),
       x = "Year", y = "Frequency per 1000 Words") +
  ylim(0, NA) +
  scale_x_continuous(breaks = c(1980,1990,2000,2010))

if (!is.na(d)){
  gg <- gg +
    geom_rect(data = tibble(start = d-0.5, end = d+9.5), 
              aes(xmin = start , xmax = end, ymin = -Inf, ymax = Inf),
              inherit.aes=FALSE, alpha = 0.05, fill = "black")
}

gg