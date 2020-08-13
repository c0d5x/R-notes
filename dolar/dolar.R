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
  ggtitle("Desde 2019") +
  geom_step() +
  labs(y="Venta") +
  geom_smooth(method = 'loess') +
  geom_smooth(method = 'gam')
ggsave(file="dolar-2019.pdf", width=12, height=6, dpi=300)

# adding breaks
ggplot(dolar2020, aes(Date, Sell, group=1)) +
  ggtitle("2020: Venta") +
  labs(y="Venta") +
  geom_step() +
  geom_smooth(method = 'loess') +
  geom_smooth(method = 'gam') +
  scale_x_date(breaks = "1 month", minor_breaks = "1 week", labels=date_format("%b"))
ggsave(file="dolar-2020.pdf", width=12, height=6, dpi=300)

buyColor <- "#69b3a2"
sellColor <- rgb(0.2, 0.6, 0.9, 1)

ggplot(dolar2020, aes(x=Date)) +
  ggtitle("2020: Compra y Venta") +
  geom_step( aes(y=Buy), size=1, color=buyColor) +
  geom_step( aes(y=Sell), size=1, color=sellColor) +
  labs(y="Compra vs Venta") +
  scale_x_date(breaks = "1 month", minor_breaks = "1 week", labels=date_format("%b"))
ggsave(file="dolar-2020-compraventa.pdf", width=12, height=6, dpi=300)

lastMonth <- dolar[dolar$Date > Sys.Date()-30,]
ggplot(lastMonth, aes(x=Date)) +
  ggtitle("Last Month") +
  geom_step( aes(y=Sell), size=1) +
  labs(y="Venta") +
  scale_x_date(breaks = "1 day", labels=date_format("%d"))
ggsave(file="dolar-last-month.pdf", width=12, height=6, dpi=300)
