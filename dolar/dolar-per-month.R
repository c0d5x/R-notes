library(ggplot2)

# load historical data
dolartotal <- read.csv("crc-usd.csv", header=TRUE)

# parse dates
dolartotal$Date <- as.Date(dolartotal$Date, "%d %b %Y")
dolar <- dolartotal[dolartotal$Date > '2009-01-01',]

# add year col
dolar$Year <- substring(dolar$Date, 0, 4)
dolar$Year <- as.factor(dolar$Year)

dolar$MonDay <- substring(dolar$Date, 6, 10)
dolar$MonDay <- as.factor(dolar$MonDay)

xlabels <- c("01-01", "01-15", "02-01", "02-15", "03-01", "03-15", 
             "04-01", "04-15", "05-01", "05-15", "06-01", "06-15",
             "07-01", "07-15", "08-01", "08-15", "09-01", "09-15",
             "10-01", "10-15", "11-01", "11-15", "12-01", "12-15", "12-25")

ggplot(data=dolar, 
       aes(x=MonDay, y=Sell, group=Year, color=Year)) +
  geom_line() +
  scale_x_discrete("Mes / Dia", breaks=xlabels)