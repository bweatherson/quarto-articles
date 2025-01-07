# Load necessary libraries
require(tidyverse)
require(wesanderson)

# Set seed for reproducibility
set.seed(22031848)


# Assuming your tibble is named 'data'
data <- tibble(
  x = runif(1000),
  y = runif(1000),
  color = sample(colors(), 1000, replace = TRUE),
  size = runif(1000, 1, 10)^2,
  alpha = runif(1000, 0.5, 1),
  shape = sample(15:18, 1000, replace = TRUE)
)


data$color <- sample(wes_palette("AsteroidCity3"), 1000, replace = TRUE)

ggplot(data, aes(x = x, y = y)) +
  geom_point(aes(color = color, fill = color, size = size, alpha = alpha, shape = shape)) +
  scale_color_identity() +
  scale_fill_identity() +
  scale_shape_binned() +
  theme_void() +
  theme(legend.position = "none") +
  theme(panel.background = element_rect(fill = wes_palette("Royal1")[3]))