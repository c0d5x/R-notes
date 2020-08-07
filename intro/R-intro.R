# numbers
index <- 1

# help
?vector
??ggplot2

# vectors
c(1, 7:9)
c(10:20)
letters[1:26]
evens <- 2 * 1:20

# set names on an array
ar1 <- c(1:10)
ar1
names(ar1)
names(ar1) <- letters[1:10]
ar1
ar1["c"]
as.vector(ar1)
as.matrix(ar1)
as.table(ar1)
as.character(ar1)
as.integer(as.character(ar1))

# call a file
# source("commands.R")

# redirect output
sink("output.txt")

# redirect back to console
sink()

# seeing mem objects
objects()
ls()

# free/remove objects from mem
obj1 <- c(1:100)
rm(obj1)

# sequences
seq1 <- seq(-5, 5, by=0.2)
seq2 <- seq(length=10, from=-5, by=.2)

# bools
# TRUE, FALSE
ll <- c(1:10)
ll > 5
t <- ll > 5

# missing values NA
z <- c(1:3, NA)
# z = 4 elements, 1 is NA
z1 <- is.na(z)
# list of bools
z2 <- z[!is.na(z)]
# list of non NA
z[is.na(z)] <- 0
# replace NA values with 0
ll <- seq(-5, 5)
ll <- abs(ll)
# replace with absolute values

# paste
labs <- paste("X", 1:10, sep="-")
labs
labs <- paste(c("X","Y"), 1:10, sep="")
labs
labs <- paste(letters[1:5], 1:10, sep="")
labs

# indexing
a1 <- letters[1:10]
a1[1:3]
a1[rep(c(1:3), times=4)]

# factors
# A factor is a vector object used to specify a discrete classification
# (grouping) of the components of other vectors of the same length. R
# provides both ordered and unordered factors. While the
# “real” application of factors is with model formulae
 state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa",
"qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
"sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
"sa", "act", "nsw", "vic", "vic", "act")
statef <- factor(state)
levels(statef)

# tapply
# apply a function to an indexed array
data <- 1:10
labels <- rep(letters[1:5], times=2)
# labels decide how data is grouped, and then applied to the formula
tapply(data, labels, mean)
labels <- rep(letters[1:2], times=5)
tapply(data, labels, mean)

# dim
z <- c(1:24)
dim(z) <- c(2,3,4)
z
x <- array(1:20, dim=c(4,5)) # Generate a 4 by 5 array
x

# Read data from files

## with row labels:
#    Price   Floor   Area   Rooms Age Cent.heat
# 01 52.00   111.0   830    5     6.2     no
# 02 54.75   128.0   710    5     7.5     no
# 03 57.50   101.0   1000   5     4.2     no
# 04 57.50   131.0   690    6     8.8     no
# 05 59.75   93.0    900    5     1.9     yes
data <- read.table("data-row-label.txt")
data["Area"]
data$Area
mean(data$Floor)

# using header
data <- read.table("data-without-row-label.txt", header=TRUE)
summary(data)
hist(data$Age)

# CSV
data <- read.csv("data-csv.csv")

# graphs

# Creating a Graph
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")

## load example data
attach(faithful)
eruptions # is an array of time of eruptions

# histograms
hist(eruptions)
hist(eruptions, seq(1.3, 6, 0.2))  # more bins
hist(eruptions, breaks=32) # more bins by N
hist(eruptions, breaks=32, col="green") # more bins by N
rug(eruptions)  # add row representation of data

# Create histogram with normal curve
x <- mtcars$mpg
h<-hist(x, breaks=30, col="red", xlab="Miles Per Gallon",
   main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
rug(x)


# Density
d <- density(mtcars$mpg) # returns the density data
plot(d) # plots the results


# Dotchart
dotchart(mtcars$mpg,labels=row.names(mtcars),
         main="Gas milage per car",
         xlab="miles per galon")

# dotchart with order and color
x <- mtcars[order(mtcars$mpg),] # sort by mpg
x$cyl <- factor(x$cyl) # it must be a factor
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,labels=row.names(x),groups= x$cyl,
   main="Gas Milage for Car Models\ngrouped by cylinder",
   xlab="Miles Per Gallon", gcolor="black", color=x$color)


# simple bar plot
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution",
   xlab="Number of Gears")

# Simple Horizontal Bar Plot with Added Labels
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution", horiz=TRUE,
  names.arg=c("3 Gears", "4 Gears", "5 Gears"))

# Simple Pie Chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
   main="Pie Chart of Countries")

# 3D Exploded Pie Chart
library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie3D(slices,labels=lbls,explode=0.1,
   main="Pie Chart of Countries ")

# Boxplot of MPG by Car Cylinders
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
   xlab="Number of Cylinders", ylab="Miles Per Gallon")

# violin plot
library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8 cyl"),
   col="gold")
title("Violin Plots of Miles Per Gallon")
