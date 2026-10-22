library(dplyr)
library(tidyr)
library(purrr)
library(stringr)
library(tibble)
# (or just library(tidyverse) if it's installed)

options(pillar.sigfig = 4)   # enough digits to separate close probabilities

# Six-team round robin. Team qualities q ~ N(m, d), drawn once per season.
# Game model (ordered probit): z = q_i - q_j + s * N(0, 1);
#   i wins if z > c, draw if |z| <= c, j wins if z < -c.
# With s = 3 and c = 0.4 * s, equal teams draw ~31% of the time.
# Ties on points are broken at random.

sim_seasons <- function(m, d, n = 2e5, s = 3, c = 0.4 * s, seed = 1) {
  set.seed(seed)
  k <- length(m)
  q <- matrix(rnorm(n * k, mean = rep(m, each = n), sd = rep(d, each = n)), n, k)
  pts <- matrix(0, n, k)
  for (pr in combn(k, 2, simplify = FALSE)) {
    i <- pr[1]; j <- pr[2]
    z <- q[, i] - q[, j] + s * rnorm(n)
    pts[, i] <- pts[, i] + case_when(z > c ~ 3, z >= -c ~ 1, TRUE ~ 0)
    pts[, j] <- pts[, j] + case_when(z < -c ~ 3, z <= c ~ 1, TRUE ~ 0)
  }
  key <- pts + matrix(runif(n * k, 0, 0.5), n, k)   # random tiebreak
  # place[r, t] = finishing place of team t in season r
  place <- t(apply(-key, 1, rank, ties.method = "first"))
  colnames(place) <- names(m)
  place
}

# Probability of each full table, most probable first
table_probs <- function(place) {
  n <- nrow(place)
  teams <- colnames(place)
  ord <- t(apply(place, 1, order))                 # teams in finishing order
  tibble(table = do.call(str_c, c(asplit(matrix(teams[ord], n), 2), sep = "-"))) |>
    count(table, name = "hits") |>
    mutate(prob = hits / n,
           se = sqrt(prob * (1 - prob) / n),
           rank = min_rank(desc(prob))) |>
    arrange(rank)
}

# P(row team finishes above column team)
pairwise_probs <- function(place) {
  teams <- colnames(place)
  expand_grid(above = teams, below = teams) |>
    filter(above != below) |>
    mutate(prob = map2_dbl(above, below, \(a, b) mean(place[, a] < place[, b]))) |>
    pivot_wider(names_from = below, values_from = prob) |>
    select(above, any_of(teams))
}

# Distribution over finishing places for each team, plus expected place
place_probs <- function(place) {
  k <- ncol(place)
  map(colnames(place), \(tm) {
    p <- tabulate(place[, tm], nbins = k) / nrow(place)
    tibble(team = tm, place = 1:k, prob = p)
  }) |>
    list_rbind() |>
    group_by(team) |>
    mutate(expected_place = sum(place * prob)) |>
    ungroup() |>
    pivot_wider(names_from = place, values_from = prob, names_prefix = "P")
}

# Expected number of the 15 pairs a guessed table gets right
expected_correct_pairs <- function(guess, place) {
  teams <- str_split_1(guess, "-")
  combn(teams, 2, simplify = FALSE) |>
    map_dbl(\(pr) mean(place[, pr[1]] < place[, pr[2]])) |>
    sum()
}

# ---- The example -------------------------------------------------------
# A clearly best, F clearly worst. C is squeezed between B and D,
# and E is 1.5 of C's standard deviations below C's mean.
m <- c(A = 5.7, B = 3.2, C = 3.0, D = 2.8, E = 0.75, F = -1.75)
m <- c(A = 4.5, B = 3.2, C = 3.0, D = 2.8)
d <- c(A = 0.3, B = 0.3, C = 1.5, D = 0.3, E = 0.3, F = 0.3)
d <- c(A = 0.3, B = 0.3, C = 1.5, D = 0.3)

place <- sim_seasons(m, d, n = 2e5, s = 3, seed = 31)

tables <- table_probs(place)
means_table <- str_c(names(sort(m, decreasing = TRUE)), collapse = "-")

print(tables |> slice_head(n = 6))
print(tables |> filter(table == means_table))
print(pairwise_probs(place), digits = 3)
print(place_probs(place), digits = 3)   # P1 column = P(win league)

tables |>
  slice_head(n = 24) |>
  bind_rows(tables |> filter(table == means_table)) |>
  distinct() |>
  mutate(correct_pairs = map_dbl(table, expected_correct_pairs, place = place)) |>
  arrange(desc(correct_pairs)) |>
  print()
