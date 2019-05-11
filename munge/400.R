library(tidyverse)

file_ds_small <- "data/ds_small.rds"

ds_small <- read_rds(file_ds_small)

# jpeg("reports/final_output.jpeg")
jpeg("final_output.jpeg")

ds_small %>% 
  ggplot(aes(x = wt, y = mpg, color = am)) + 
  geom_jitter() + 
  geom_smooth()

dev.off()

#' Note that jpeg("reports/final_output.jpeg") would also have moved the jpeg 
#' to the reports folder, but I opted to use "mv final_output.jpeg reports" in 
#' the make file for clarity