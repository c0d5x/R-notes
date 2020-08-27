library(ggplot2)
library(scales)
library(plotly)

buyColor = 'red'
sellColor = 'blue'

# load historical data
dolar <- read.csv("crc-usd.csv", header=TRUE)

# parse dates
dolar$Date <- as.Date(dolar$Date, "%d %b %Y")

# filter
dolar2019 <- dolar[dolar$Date > '2019-01-01',]

d2019 <- ggplot(dolar2019, aes(x=Date)) +
  ggtitle("Buy / Sell") +
  geom_step( aes(y=Buy), size=1, color=buyColor) +
  geom_step( aes(y=Sell), size=1, color=sellColor) +
  scale_x_date(breaks = "1 month", minor_breaks = "1 week", labels=date_format("%b"))

ggplotly(d2019)
