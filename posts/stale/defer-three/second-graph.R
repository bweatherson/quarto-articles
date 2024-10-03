require(tidyverse)

heads <- function(a, b){
  h = (dnorm(
    2^0.5 * qnorm(a)
  ) * 
    dnorm(
      qnorm(b) -
        2^0.5 * qnorm(a)
    )
  ) /
    (
      (dnorm(
        2^0.5 * qnorm(a)
      ) * 
        dnorm(
          qnorm(b) -
            2^0.5 * qnorm(a)
        )
      ) +
        (dnorm(
          2^0.5 * qnorm(b)
        ) * 
          dnorm(
            qnorm(a) -
              2^0.5 * qnorm(b)
          )
        )    
    )
  h
}

headsplot <- function(x){heads(0.75,x)}

# a <- 0.07
# b <- 0.75
# 
# # Assume H
# xh <- 2^0.5 * qnorm(a)
# yh <- qnorm(b) - 2^0.5 * qnorm(a)
# hp <- dnorm(xh) * dnorm(yh)
# 
# # Assume not H
# xnh <- 2^0.5 * qnorm(b)
# ynh <- qnorm(a) - 2^0.5 * qnorm(b)
# nhp <- dnorm(xnh) * dnorm(ynh)
# 
# h <- hp / (hp + nhp)
# p <- (1-h)*a + h*b

ggplot() +
  theme_minimal() +
  xlim(0.001,0.999) +
  geom_function(fun = headsplot) +
  #  geom_function(fun = identity, color = "grey80") +
  labs(
    x = "B(*p*)",
    y = "Posterior probability of Heads"
  ) +
  theme(axis.title.y = ggtext::element_markdown(),
        axis.title.x = ggtext::element_markdown())