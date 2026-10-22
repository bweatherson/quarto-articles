library(tidyverse)

# Six-team round robin. Team qualities q ~ N(m, d), drawn once per season.
# Game model (ordered probit): z = q_i - q_j + N(0, 1);
#   i wins if z > c, draw if |z| <= c, j wins if z < -c.
# c = 0.4 gives ~31% draws between equal teams.
# Ties on points are broken at random.

sim_tables <- function(m, d, n = 1e6, c = 0.4, seed = 1) {
  set.seed(seed)
  k <- length(m)
  teams <- names(m)
  q <- matrix(rnorm(n * k, mean = rep(m, each = n), sd = rep(d, each = n)), n, k)
  pts <- matrix(0, n, k)
  for (pr in combn(k, 2, simplify = FALSE)) {
    i <- pr[1]; j <- pr[2]
    z <- q[, i] - q[, j] + rnorm(n)
    pts[, i] <- pts[, i] + case_when(z > c ~ 3, z >= -c ~ 1, TRUE ~ 0)
    pts[, j] <- pts[, j] + case_when(z < -c ~ 3, z <= c ~ 1, TRUE ~ 0)
  }
  key <- pts + matrix(runif(n * k, 0, 0.5), n, k)   # random tiebreak
  ord <- t(apply(-key, 1, order))                   # row = season, col = place
  places <- matrix(teams[ord], n, k)
  tibble(table = do.call(str_c, c(asplit(places, 2), sep = "-"))) |>
    count(table, name = "hits") |>
    mutate(prob = hits / n, se = sqrt(prob * (1 - prob) / n)) |>
    arrange(desc(prob))
}

# The example: C is sandwiched (by mean) between two reliable teams,
# but has much higher variance.
m <- c(A = 3, B = 2.8, C = 2.9, D = 1, E = 0, F = -1)
d <- c(A = 0.3, B = 0.3, C = 1.0, D = 0.3, E = 0.3, F = 0.3)

res <- sim_tables(m, d, n = 2e6)

means_table <- str_c(names(sort(m, decreasing = TRUE)), collapse = "-")

res |> slice_head(n = 6)
res |> mutate(rank = row_number()) |> filter(table == means_table)
