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

# P(each other team finishes second | `winner` finishes first)
second_given_winner <- function(place, winner = "A") {
  won <- place[, winner] == 1
  others <- setdiff(colnames(place), winner)
  tibble(team = others,
         prob = map_dbl(others, \(tm) mean(place[won, tm] == 2)),
         seasons = sum(won)) |>
    mutate(se = sqrt(prob * (1 - prob) / seasons)) |>
    arrange(desc(prob))
}

# Expected number of the 15 pairs a guessed table gets right
expected_correct_pairs <- function(guess, place) {
  teams <- str_split_1(guess, "-")
  combn(teams, 2, simplify = FALSE) |>
    map_dbl(\(pr) mean(place[, pr[1]] < place[, pr[2]])) |>
    sum()
}

# ---- The example -------------------------------------------------------
# The next two lines were original version; found a simpler one
# m <- c(A = 4, B = 1.22, C = 1.15, D = 1.0, E = 0.9, F = 0.8)
# d <- c(A = 2, B = 4, C = 2, D = 2, E = 2, F = 2)
m <- c(A = 4, B = 2.5, C = 1.1, D = 1.0)
d <- c(A = 1, B = 4, C = 2, D = 3)

place <- sim_seasons(m, d, n = 2e5, s = 3, seed = 31)

tables <- table_probs(place)
means_table <- str_c(names(sort(m, decreasing = TRUE)), collapse = "-")

# ---- Outputs (saved as values, so they open in the data viewer) --------
top_tables       <- tables |> slice_head(n = 6)
means_table_prob <- tables |> filter(table == means_table)
pairwise         <- pairwise_probs(place)
places           <- place_probs(place)          # P1 column = P(win league)
second_given_A   <- second_given_winner(place, "A")

correct_pairs <- tables |>
  slice_head(n = 24) |>
  bind_rows(means_table_prob) |>
  distinct() |>
  mutate(correct_pairs = map_dbl(table, expected_correct_pairs, place = place)) |>
  arrange(desc(correct_pairs))

# View(second_given_A), View(pairwise), etc.
