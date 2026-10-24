library(dplyr)
library(tidyr)
library(purrr)
library(stringr)
library(tibble)
# (or just library(tidyverse) if it's installed)

options(pillar.sigfig = 4)   # enough digits to separate close probabilities

# Six-team round robin. Team qualities are drawn once per season.
# Ordinary teams: q ~ N(m, d).
# The star team: at the start of the season the star is available with
#   probability p_star. If available, q ~ N(mean_with, d);
#   if not, q ~ N(mean_without, d), using that team's d in both cases.
#   Availability is fixed for the whole season (not game by game).
# Game model (ordered probit): z = q_i - q_j + s * N(0, 1);
#   i wins if z > c, draw if |z| <= c, j wins if z < -c.
# With s = 3 and c = 0.4 * s, equal teams draw ~31% of the time.
# Ties on points are broken at random.

sim_seasons <- function(m, d, star = NULL, n = 2e6, s = 3, c = 0.4 * s,
                        seed = 1) {
  set.seed(seed)
  k <- length(m)
  means <- matrix(rep(m, each = n), n, k, dimnames = list(NULL, names(m)))
  if (!is.null(star)) {
    available <- runif(n) < star$p_star
    means[, star$team] <- if_else(available, star$mean_with, star$mean_without)
  }
  q <- means + matrix(rnorm(n * k, sd = rep(d, each = n)), n, k)
  pts <- matrix(0, n, k)
  for (pr in combn(k, 2, simplify = FALSE)) {
    i <- pr[1]; j <- pr[2]
    z <- q[, i] - q[, j] + s * rnorm(n)
    pts[, i] <- pts[, i] + case_when(z > c ~ 3, z >= -c ~ 1, TRUE ~ 0)
    pts[, j] <- pts[, j] + case_when(z < -c ~ 3, z <= c ~ 1, TRUE ~ 0)
  }
  key <- pts + matrix(runif(n * k, 0, 0.5), n, k)   # random tiebreak
  # place[r, t] = finishing place of team t in season r
  # (1 + number of teams finishing ahead of t; vectorised, much faster than apply)
  place <- matrix(1L, n, k, dimnames = list(NULL, names(m)))
  for (t in 1:k) for (u in setdiff(1:k, t)) {
    place[, t] <- place[, t] + (key[, u] > key[, t])
  }
  place
}

# The panelist's overall mean quality for each team
# (for the star team, the probability-weighted mixture of its two means)
overall_means <- function(m, star = NULL) {
  if (!is.null(star)) {
    m[star$team] <- star$p_star * star$mean_with +
      (1 - star$p_star) * star$mean_without
  }
  m
}

# Probability of each full table, most probable first
table_probs <- function(place) {
  n <- nrow(place)
  teams <- colnames(place)
  # team in each place, one column per place
  by_place <- map(seq_along(teams), \(k) teams[max.col(place == k)])
  tibble(table = do.call(str_c, c(by_place, sep = "-"))) |>
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

# Run everything and print the summaries
report <- function(m, d, star = NULL, n = 2e6, s = 3, seed = 31) {
  place <- sim_seasons(m, d, star = star, n = n, s = s, seed = seed)
  tables <- table_probs(place)
  mu <- overall_means(m, star)
  means_table <- str_c(names(sort(mu, decreasing = TRUE)), collapse = "-")

  cat("Overall means:", str_c(names(mu), "=", round(mu, 3), collapse = "  "), "\n")
  cat("Means table:", means_table, "\n\n")
  print(tables |> slice_head(n = 6))
  print(tables |> filter(table == means_table))
  print(pairwise_probs(place))
  print(place_probs(place))   # P1 column = P(win league)
  tables |>
    slice_head(n = 3) |>
    bind_rows(tables |> filter(table == means_table)) |>
    distinct() |>
    mutate(correct_pairs = map_dbl(table, expected_correct_pairs, place = place)) |>
    print()
  invisible(list(place = place, tables = tables))
}

# ---- The example -------------------------------------------------------
# As before, but A's quality now depends on whether its star is fit.
# With these numbers A's overall mean is 0.75 * 6.2 + 0.25 * 4.2 = 5.7,
# the same as in the earlier example.
m <- c(A = NA, B = 3.2, C = 3.0, D = 2.8, E = 0.75, F = -1.75)
d <- c(A = 0.3, B = 0.3, C = 1.5, D = 0.3, E = 0.3, F = 0.3)

star <- list(team = "A", mean_with = 6.2, mean_without = 4.2, p_star = 0.75)

res <- report(m, d, star = star, n = 2e6, s = 3, seed = 31)

# To switch the star off, set p_star = 1 (always fit) or 0 (always out),
# or call report() with star = NULL and a number in m["A"].
