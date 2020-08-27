# ggplot intro

# general form
# ggplot(data = <DATA>) + <GEOM_FUNC>(mapping = aes(<MAPPING>))

library(tidyverse)

# mpg
# ?mpg

# with only data specified
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy))

# with mapping inherited
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point()

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_smooth(mapping = aes(group =drv))

ggplot(data=mpg, mapping=aes(x=displ, y=hwy, color=drv)) +
  geom_point()

ggplot(data=mpg, mapping=aes(x=displ, y=hwy, color=drv)) +
  geom_point() +
  geom_smooth()

ggplot(data=mpg, mapping=aes(x=displ, y=hwy, color=drv)) +
  geom_point() +
  geom_smooth(mapping = aes(linetype=drv))

# smooth line for specific data
ggplot(data=mpg, mapping=aes(x=displ, y=hwy, color=drv)) +
  geom_point() +
  geom_smooth(data=filter(mpg, drv=="4")) +
  geom_smooth(data=filter(mpg, drv=="f"), se=FALSE)


# shape and class
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(shape=class, color=class))

# size and class
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(size=cyl,color=class))

# x, y, alpha, colour, fill, group, shape, size, stroke
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(size=displ))

# color as factor or bool
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=factor(displ)))  # color=displ<5


# ---------------------------------------------

# facets
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point() +
  facet_wrap(~class, nrow=2)

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=class)) +
  facet_wrap(~class)

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=class)) +
  facet_wrap(~trans)

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=class)) +
  facet_grid(drv ~ cyl)

ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=class)) +
  facet_grid(. ~ cyl)

