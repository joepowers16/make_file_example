library(tidyverse)

file_ds_mt <- "data/ds_mt.rds"

ds_mt <- read_rds(file_ds_mt)

ds_mt <- 
  ds_mt %>% 
  mutate(
    am22 = str_c(am, "22"),
    vs22 = str_c(vs, "2")
  )

write_rds(ds_mt, file_ds_mt)