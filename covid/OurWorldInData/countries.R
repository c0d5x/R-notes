library(ggplot2)
library(dplyr)
library(plotly)

global_data <- read.csv("owid-covid-data.csv", header=TRUE)
colnames(global_data)

# global_data <- filter(global_data, location %in% 
#                       c('Costa Rica','United States','Bulgaria','Panama','Canada'))

global_data <- filter(global_data, continent=='North America')

global_data <- filter(global_data, date > '2020-11-01')

data <- select(global_data, 
               country=location, 
               date, 
               total_cases, 
               total_deaths, 
               total_cases_per_million,
               total_deaths_per_million)
rm(global_data)
data$date <- as.Date(data$date)
data <- data %>% na.exclude()

p <- ggplot(data, aes(x=date, y=total_deaths_per_million, group=country, color=country)) +
  geom_line()

ggplotly(p)

