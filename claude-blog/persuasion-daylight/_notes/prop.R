suppressMessages(library(dplyr))
# general binary-state, binary-action receiver: u(approve,G)=a1, u(approve,B)=a0, u(reject,G)=r1, u(reject,B)=r0
# receiver approves iff posterior*a1+(1-posterior)*a0 >= posterior*r1+(1-posterior)*r0
set.seed(1)
check <- function(mu, a1, a0, r1, r0) {
  v <- function(pi) pmax(pi*a1+(1-pi)*a0, pi*r1+(1-pi)*r0)
  tB <- (r0 - a0) / ((a1 - r1) + (r0 - a0))   # Bayesian threshold
  if (!(mu < tB && tB < 1 && tB > 0)) return(NULL)
  # sender-optimal: p=1, posterior after pass = tB, P(pass)=mu/tB
  eu_design <- (mu/tB) * v(tB) + (1 - mu/tB) * v(0)
  eu_noinfo <- v(mu)
  # commitment to t > tB
  t <- (tB + 1)/2
  eu_commit <- (mu/t) * v(t) + (1 - mu/t) * v(0)
  c(tB = tB, design = eu_design, noinfo = eu_noinfo, commit = eu_commit, full = mu*max(a1,r1)+(1-mu)*max(a0,r0))
}
res <- replicate(2000, {
  a1 <- runif(1, 0, 5); a0 <- -runif(1, 0, 5); r1 <- runif(1, -3, 1); r0 <- runif(1, 0, 3); mu <- runif(1)
  check(mu, a1, a0, r1, r0)
}, simplify = FALSE)
res <- do.call(rbind, Filter(Negate(is.null), res)) |> as_tibble()
cat("cases:", nrow(res), "\n")
cat("max |design - noinfo|:", max(abs(res$design - res$noinfo)), "\n")
cat("commit > noinfo in all cases:", all(res$commit > res$noinfo + 1e-12), "\n")
cat("commit <= full info in all cases:", all(res$commit <= res$full + 1e-12), "\n")
