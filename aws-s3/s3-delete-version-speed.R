library(tidyverse)


# speeds.csv:
# -------------------
# seconds,speed
# 40,21.3
# 43,28.1
# ....


speeds <- read.csv("speeds.csv", header = T)

speeds$index <- rownames(speeds)
speeds$index <- as.numeric(speeds$index)

hist(xlab="objects per sec",speeds$speed, breaks=50)

hist(xlab="performance in secs", speeds$seconds, breaks=50)



ggplot(speeds, aes(x=index,y=speed)) +
  labs(title="objects/versions deleted") +
  xlab("runs") + 
  ylab("objects per sec") +
  stat_smooth(method = "loess",color="blue",level = 0.9) +
  geom_smooth(method = "lm",color="red", se=FALSE ) +
  geom_point()

