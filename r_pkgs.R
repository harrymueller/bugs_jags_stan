print("Installing R packages...")

#repo="https://cran.curtin.edu.au/"

install.packages("pillar")
install.packages("ellipsis")
install.packages("lifecycle")

install.packages("BRugs", dependencies = TRUE)
install.packages("rjags", dependencies = TRUE)
install.packages("rstan", dependencies = TRUE)
install.packages(c("shinystan", "bayesplot"), dependencies = TRUE)

print("Installed R packages")
