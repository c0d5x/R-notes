library(coronavirus)
library(dplyr)
library(tidyr)


update_dataset()

summary_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)



