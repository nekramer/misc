# A script demonstrating how to create all possible combinations of conditions
# and order them in a specific way

library(dplyr)

a <- c("AM7180", "AM7181")
b <- c("CTL", "FNF")
c <- c("ref", "alt")

combos <- expand.grid(a, b, c) %>%
    arrange(factor(Var1, levels = a),
            factor(Var2, levels = b),
            factor(Var3, levels = c))
