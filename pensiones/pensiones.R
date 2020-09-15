library(tidyverse)
library(plotly)


pensiones <- read.csv("~/Downloads/pensiones-voluntarias-colones.csv",header = T)

pensiones$bac <-as.numeric(gsub(",", ".",pensiones$bac))
pensiones$Bn.vital <-as.numeric(gsub(",", ".",pensiones$Bn.vital))
pensiones$popular <-as.numeric(gsub(",", ".",pensiones$popular))
pensiones$bcr <-as.numeric(gsub(",", ".",pensiones$bcr))
pensiones$MesID <- seq.int(nrow(pensiones))
pensiones$MES <- as.character(pensiones$MES)


p <- ggplot(pensiones) +
  ggtitle("Rendimientos desde Sep 2016") +
  labs(x="Mes") +
  geom_step(aes(x=MesID,y=Bn.vital), colour="blue") +
  geom_step(aes(x=MesID,y=popular), colour="green") +
  geom_step(aes(x=MesID,y=bcr), colour="red") +
  geom_step(aes(x=MesID,y=bac), colour="brown")

p

pdf <- ggplotly(p)
pdf
# ggsave(file="pensiones.pdf", width=12, height=6, dpi=300)
