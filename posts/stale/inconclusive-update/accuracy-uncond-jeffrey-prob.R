require(tidyverse)

# Initial probability weights
a_weight <- floor(runif(1)*5) # Best version: 1
b_weight <- floor(runif(1)*5) # Best version: 1
c_weight <- floor(runif(1)*5) # Best version: 4
t_weight <- a_weight + b_weight + c_weight

# Turn them into probabilities
a_prob <- a_weight / t_weight
b_prob <- b_weight / t_weight
c_prob <- c_weight / t_weight

# Find new ratio of a to a+b
new_a <- (floor(runif(1)*9)+1)/10 # Best version: 0.3

# arbitrarily set c
# c_posterior <- 0.5

# calculate a and b
# a_posterior <- (1-c_posterior) * new_rat
# b_posterior <- (1-c_posterior) * (1-new_rat)

# Calculate Brier inaccuracy

# First Brier if each is true
# brier_a <- (1 - a_posterior)^2 + b_posterior^2 + c_posterior^2
# brier_b <- (1 - b_posterior)^2 + c_posterior^2 + a_posterior^2
# brier_c <- (1 - c_posterior)^2 + a_posterior^2 + b_posterior^2
# 
# # Then overall Brier
# brier_t <- a_prob * brier_a + b_prob * brier_b + c_prob * brier_c
# 
# # Calculate Log inaccuracy
# logacc_a <- -log(a_posterior) - log(1 - b_posterior) - log(1 - c_posterior) 
# logacc_b <- -log(b_posterior) - log(1 - c_posterior) - log(1 - a_posterior) 
# logacc_c <- -log(c_posterior) - log(1 - a_posterior) - log(1 - b_posterior) 
# 
# # Then overall log
# logacc_t <- a_prob * logacc_a + b_prob * logacc_b + c_prob * logacc_c

find_brier <- function(c_posterior){
  a_posterior <- new_a
  b_posterior <- 1 - new_a - c_posterior
  
  # Calculate Brier inaccuracy
  
  # First Brier if each is true
  brier_a <- (1 - a_posterior)^2 + b_posterior^2 + c_posterior^2
  brier_b <- (1 - b_posterior)^2 + c_posterior^2 + a_posterior^2
  brier_c <- (1 - c_posterior)^2 + a_posterior^2 + b_posterior^2
  
  # Then overall Brier
  brier_t <- a_prob * brier_a + b_prob * brier_b + c_prob * brier_c
  brier_t / 3
}

find_logacc <- function(c_posterior){
  # calculate a and b
  a_posterior <- new_a
  b_posterior <- 1 - new_a - c_posterior
  
  # Calculate Log inaccuracy
  logacc_a <- -log(a_posterior) - log(1 - b_posterior) - log(1 - c_posterior) 
  logacc_b <- -log(b_posterior) - log(1 - c_posterior) - log(1 - a_posterior) 
  logacc_c <- -log(c_posterior) - log(1 - a_posterior) - log(1 - b_posterior) 
  
  # Then overall log
  logacc_t <- a_prob * logacc_a + b_prob * logacc_b + c_prob * logacc_c
  logacc_t / 3
}

acc_tibb <- tibble(c = 500:((1-new_a)*1000-50) * 0.001) |>
  mutate(brier = find_brier(c), logacc = find_logacc(c))

ggplot(acc_tibb, aes(c)) +
  geom_line(aes(y = brier, color = "brier"))

ggplot(acc_tibb, aes(c)) +
  geom_line(aes(y = logacc, color = "log"))


brier_min <- acc_tibb  |> slice_min(order_by = brier, n = 1)
logacc_min <- acc_tibb  |> slice_min(order_by = logacc, n = 1)
brier_min$c[1]
logacc_min$c[1]

