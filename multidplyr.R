#!/usr/bin/env Rscript
library(multidplyr)
library(dplyr, warn.conflicts = FALSE)
library(parallel)

args = commandArgs(trailingOnly = TRUE)

# Read in file
data <- readr(args[1])

# Initialize new cluster with a number of cores
cluster <- new_cluster(parallel::detectCores())

# Will need dplyr within cluster, so load it directly with `cluster_library`
cluster_library(cluster, "dplyr")

# An example 
summary <- group_by(V1) %>%
    partition(cluster) %>% # call cluster with partition after grouping data to parallelize
    summarize(num_groups = n()) %>%
    collect() # call `collect` to bring data back to interactive process
