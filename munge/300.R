library(tidyverse)

file_ds_mt <- "data/ds_mt.rds"
file_ds_small <- "data/ds_small.rds"

ds_mt <- read_rds(file_ds_mt)

ds_small <- 
  ds_mt %>% 
  mutate(
    am3 = str_c(am, "3"),
    vs3 = str_c(vs, "3")
  ) %>% 
  select(wt, mpg, am)

write_rds(ds_small, file_ds_small)