N <- 100
# the probabilities
pvac <- 0.35        # P(V)
pflu_vac <- 0.03    # P(F|V)
pflu_no_vac <- 0.12 # P(F|V^c)
# simulate vaccinated population with TRUE / FALSE otherwise
s_vac <- sample(
  x = c(T, F), size = N, replace = TRUE,
  # we can pass the probabilities manually
  prob = c(pvac, 1 - pvac)) 
# simulate flu infection based on vaccination
s_flu <- numeric(N)
for(i in 1:N) {
  # conditioned on vaccine
  if(s_vac[i]) 
    s_flu[i] <- sample(
      c(1,0), 1, prob = c(pflu_vac, 1 - pflu_vac))
  else
    s_flu[i] <- sample(
      c(1,0), 1, prob = c(pflu_no_vac, 1 - pflu_no_vac))
}
print(sum(s_flu)/N)