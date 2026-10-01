suppressMessages({library(dplyr); library(tidyr); library(purrr); library(ggplot2)})

mu <- 0.3      # prior that the drug works (state G)
t  <- 0.5      # regulator approves iff posterior >= t

## ---- Design: the sender's optimal experiment (Kamenica & Gentzkow) ----
q_star   <- mu * (1 - t) / ((1 - mu) * t)          # P(pass | drug does not work)
approve  <- mu + (1 - mu) * q_star                  # P(approval)
accuracy <- mu + (1 - mu) * (1 - q_star)            # P(correct decision)
cat(sprintf("Design: q* = %.4f, approval = %.3f, accuracy = %.3f, no-info accuracy = %.3f\n",
            q_star, approve, accuracy, max(mu, 1 - mu)))

## ---- Selection: N binary studies; sender reports only the positives ----
sens <- 0.8; fpr <- 0.3; N <- 4
post_full  <- function(k) { lg <- mu * dbinom(k, N, sens); lb <- (1 - mu) * dbinom(k, N, fpr); lg / (lg + lb) }
post_naive <- function(k) { lg <- mu * sens^k;             lb <- (1 - mu) * fpr^k;             lg / (lg + lb) }

selection <- expand_grid(state = c("G", "B"), k = 0:N) |>
  mutate(p_state = if_else(state == "G", mu, 1 - mu),
         p_k     = dbinom(k, N, if_else(state == "G", sens, fpr)),
         pr      = p_state * p_k,
         naive   = post_naive(k) >= t,
         soph    = post_full(k)  >= t) |>
  pivot_longer(c(naive, soph), names_to = "receiver", values_to = "approve") |>
  group_by(receiver) |>
  summarise(approval = sum(pr * approve),
            accuracy = sum(pr * if_else(state == "G", approve, !approve)),
            .groups = "drop")
print(selection)

## ---- The 2 x 2 ----
tab <- bind_rows(
  selection |> mutate(channel = "Selection"),
  tibble(receiver = c("naive", "soph"), approval = approve, accuracy = accuracy, channel = "Design")
) |> mutate(receiver = if_else(receiver == "naive", "Cursed receiver", "Sophisticated receiver")) |>
  select(channel, receiver, approval, accuracy)
print(tab)

## ---- Receiver commitment to a threshold ----
sweep <- tibble(t = seq(0.5, 0.99, by = 0.01)) |>
  mutate(approval = mu / t, accuracy = 1 - mu * (1 - t) / t)
print(sweep |> filter(t %in% c(0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99)))

## sanity: recompute accuracy at each t by brute force from the sender's best response
brute <- sweep |> mutate(q = mu * (1 - t) / ((1 - mu) * t),
                         acc2 = mu + (1 - mu) * (1 - q),
                         app2 = mu + (1 - mu) * q)
stopifnot(all(abs(brute$acc2 - brute$accuracy) < 1e-12), all(abs(brute$app2 - brute$approval) < 1e-12))
cat("threshold formulas verified\n")

## ---- check the K-G optimum by brute force over binary experiments ----
## experiment: P(pass|G)=a, P(pass|B)=b; receiver approves on 'pass' iff posterior>=t, on 'fail' iff posterior>=t
grid <- expand_grid(a = seq(0, 1, by = 0.01), b = seq(0, 1, by = 0.01)) |>
  mutate(post_pass = if_else(mu*a + (1-mu)*b > 0, mu*a / (mu*a + (1-mu)*b), 0),
         post_fail = if_else(mu*(1-a) + (1-mu)*(1-b) > 0, mu*(1-a) / (mu*(1-a) + (1-mu)*(1-b)), 0),
         app = (mu*a + (1-mu)*b) * (post_pass >= t - 1e-9) + (mu*(1-a) + (1-mu)*(1-b)) * (post_fail >= t - 1e-9))
best <- grid |> slice_max(app, n = 3)
print(best)
stopifnot(abs(max(grid$app) - approve) < 0.01)
cat("K-G optimum verified by grid search\n")
