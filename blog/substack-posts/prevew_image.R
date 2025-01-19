# Preview Image


# Load necessary libraries
require(tidyverse)
require(wesanderson)

# Set seed for reproducibility
set.seed(22031848)


# Assuming your tibble is named 'data'
data <- tibble(
  x = runif(2000),
  y = runif(2000),
  color = sample(colors(), 2000, replace = TRUE),
  size = runif(2000, 1, 10)^2,
  alpha = runif(2000, 0.7, 0.95),
  shape = sample(15:18, 2000, replace = TRUE)
)


data$color <- sample(wes_palette("FrenchDispatch")[2:5], 2000, replace = TRUE)

ggplot(data, aes(x = x, y = y)) +
  geom_point(aes(color = color, fill = color, size = size, shape = 21)) +
  scale_color_identity() +
  scale_fill_identity() +
  scale_shape_binned() +
  theme_void() +
  theme(legend.position = "none") +
  theme(panel.background = element_rect(fill = wes_palette("FrenchDispatch")[5]))

ggsave("blog/substack-posts/modal-era.jpg")