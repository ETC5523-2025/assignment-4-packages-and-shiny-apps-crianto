library(readxl)
library(dplyr)
library(janitor)
library(usethis)

Top1000 <- read_excel("data-raw/Top1000.xls", col_names = TRUE)

Top1000 <- janitor::clean_names(Top1000)

colnames(Top1000) <- c(
  "name", "rank", "count", "prop100k", "cum_prop100k",
  "pct_white", "pct_black", "pct_api", "pct_aian",
  "pct_two_or_more", "pct_hispanic"
)

Top1000 <- Top1000 %>%
  mutate(across(-name, ~ suppressWarnings(as.numeric(.)))) %>%
  filter(!is.na(rank))

usethis::use_data(Top1000, overwrite = TRUE)
