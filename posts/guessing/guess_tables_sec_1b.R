# guess_tables_sec_1b.R -- the high-variance EFGH group at the end of section 1.
# Same model and functions as the lessprob.qmd chunks. Set n lower for quick
# experiments; the paper uses 2e6. Results are saved as values for View().

library(dplyr)
library(tidyr)
library(purrr)
library(stringr)
library(tibble)

# Round robin. Team qualities q ~ N(m, d), drawn once per season.
# Game model (ordered probit): z = q_i - q_j + s * N(0, 1);
#   i wins if z > c, draw if |z| <= c, j wins if z < -c.
# Ties on points are broken at random.
sim_seasons <- function(m, d, n = 2e6, s = 3, c = 0.4 * s, seed = 1) {
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
  place <- t(apply(-key, 1, rank, ties.method = "first"))
  colnames(place) <- names(m)
  place
}

# Probability of each full table, most probable first
table_probs <- function(place) {
  n <- nrow(place)
  teams <- colnames(place)
  ord <- t(apply(place, 1, order))
  tibble(table = do.call(str_c, c(asplit(matrix(teams[ord], n), 2), sep = ""))) |>
    count(table, name = "hits") |>
    mutate(prob = hits / n, rank = min_rank(desc(prob))) |>
    arrange(rank)
}

# Expected number of pairs a guessed table gets in the right order
expected_correct_pairs <- function(guess, place) {
  teams <- str_split_1(guess, "")
  combn(teams, 2, simplify = FALSE) |>
    map_dbl(\(pr) mean(place[, pr[1]] < place[, pr[2]])) |>
    sum()
}

# Expected number of teams a guessed table puts in the right place
expected_correct_places <- function(guess, place) {
  teams <- str_split_1(guess, "")
  imap_dbl(teams, \(tm, i) mean(place[, tm] == i)) |>
    sum()
}

# The second group: E and H are well known, F and G are very uncertain
m_hv <- c(E = 1.4, F = 1.3, G = 1.2, H = 1.1)
d_hv <- c(E = 0.2, F = 2,   G = 2,   H = 0.2)

place_hv <- sim_seasons(m_hv, d_hv, n = 2e5, s = 3, seed = 31)

# All 24 possible orders, so an order that never came up still gets a row
perms <- function(x) {
  if (length(x) <= 1) return(list(x))
  unlist(lapply(seq_along(x), \(i) lapply(perms(x[-i]), \(p) c(x[i], p))),
         recursive = FALSE)
}
all_orders_hv <- map_chr(perms(names(m_hv)), str_c, collapse = "")

# Who finished first and second in each simulated season
first_hv  <- names(m_hv)[max.col(place_hv == 1)]
second_hv <- names(m_hv)[max.col(place_hv == 2)]

# Probability that a guessed order gets the top two right,
# either in either order (ordered = FALSE) or in the right order (TRUE)
top_two_prob <- function(guess, ordered) {
  t <- str_split_1(guess, "")
  exact <- first_hv == t[1] & second_hv == t[2]
  if (ordered) mean(exact) else mean(exact | (first_hv == t[2] & second_hv == t[1]))
}

# Five statistics for every order, and each order's rank on each of them
options_hv <- tibble(table = all_orders_hv) |>
  left_join(table_probs(place_hv) |> select(table, prob), by = "table") |>
  mutate(prob           = coalesce(prob, 0),
         correct_pairs  = map_dbl(table, expected_correct_pairs,  place = place_hv),
         correct_places = map_dbl(table, expected_correct_places, place = place_hv),
         top_two_set    = map_dbl(table, top_two_prob, ordered = FALSE),
         top_two_order  = map_dbl(table, top_two_prob, ordered = TRUE)) |>
  mutate(across(c(prob, correct_pairs, correct_places, top_two_set, top_two_order),
                \(x) min_rank(desc(x)), .names = "rank_{.col}")) |>
  arrange(rank_prob)

# Keep only the small summary, so the cache stays small

# ---- Outputs (open with View()) ---------------------------------------------
quality_hv <- tibble(team = names(m_hv), mean = m_hv, sd = d_hv)

# Orders in the top three on at least one statistic (ties included)
top_orders_hv <- options_hv |>
  filter(if_any(starts_with("rank_"), \(r) r <= 3))

# View(options_hv)     # all 24 orders, five statistics and their ranks
# View(top_orders_hv)  # the rows that go in the paper's table
