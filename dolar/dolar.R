library(ggplot2)
library(scales)

# load historical data
dolar <- read.csv("crc-usd.csv", header=TRUE)

# parse dates
dolar$Date <- as.Date(dolar$Date, "%d %b %Y")

summary(dolar)

# select from > 2019
dolar2019 <- dolar[dolar$Date > '2019-01-01',]
dolar2020 <- dolar[dolar$Date > '2020-01-01',]

# draw tendency with 2 methods
ggplot(dolar2019, aes(Date, Sell, group=1)) +
  ggtitle("From 2019") +
  geom_step() +
  geom_smooth(method = 'loess') +
  geom_smooth(method = 'gam')

# adding breaks
ggplot(dolar2020, aes(Date, Sell, group=1)) +
  ggtitle("2020: Sell Price") +
  geom_step() +
  geom_smooth(method = 'loess') +
  geom_smooth(method = 'gam') +
  scale_x_date(breaks = "1 month", minor_breaks = "1 week", labels=date_format("%b"))

buyColor <- "#69b3a2"
sellColor <- rgb(0.2, 0.6, 0.9, 1)

ggplot(dolar2020, aes(x=Date)) +
  ggtitle("Buy / Sell") +
  geom_step( aes(y=Buy), size=1, color=buyColor) +
  geom_step( aes(y=Sell), size=1, color=sellColor) +
  scale_x_date(breaks = "1 month", minor_breaks = "1 week", labels=date_format("%b"))
