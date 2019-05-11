library(tidyverse)
library(magrittr)

# Note that R scripts use the project directory, not the script directory, 
# as their default working directory

ds_mt <- read_rds("raw/ds_mt.rds")
file_ds_mt <- "data/ds_mt.rds"

ds_mt %<>% 
  mutate(
    am = factor(am, labels = c("auto", "manual")),
    vs = factor(vs, labels = c("v", "s")),
    temp = "temp"
    )

write_rds(ds_mt, file_ds_mt)