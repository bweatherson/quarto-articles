require(tidyverse)

# There are three random variables, each normal with mean 0 and sd 1
# p is that their sum is positive
# a knows the first variable
# b knows the second variable

# x is a and b's common probability that sum > 0
x <- 0.6

# First work out what a has seen given a(p) = x
a_evidence <- qnorm(x, mean = 0, sd = 2^0.5)

# Now work out a's probability that sum > 1
a_probability <- pnorm(1-a_evidence, mean = 0, sd = 2^0.5, lower.tail = FALSE)

# Now work out what b has seen given b(p) = x
b_evidence <- qnorm(x, mean = 0, sd = 1^0.5)

# Now work out b's probability that sum > 1
b_probability <- pnorm(1-b_evidence, mean = 0, sd = 1^0.5, lower.tail = FALSE)

# Work out Jeffrey prob
c_conditional_prior <- pnorm(1, mean = 0, sd = 3^0.5, lower.tail = FALSE) * 2
c_posterior <- x * c_conditional_prior