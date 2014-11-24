# Author: Andrew Jackson
# Date created: 24/11/2014
# About: how to interpret general linear models of the form
# log(y) ~ x
# N.B. You will need to follow and understand 
# intro_to_exponential_decay.R before this script.


rm(list = ls())
graphics.off()
set.seed(1) # used to make sure we get the same random numbers each time.

#-------------------------------------------------------------------------------
# The log(y) ~ x, relationship is intimately related to the exponential 
# growth and decay function.
# If we take the exponential function of both sides we can get rid of
# the log and get y back to the units we actually understand.
# When we model log(y) ~ x, is the same as fitting a model
# log(y) = b0 + (b1 * x) where we estimate b0 and b1.
# And take the exponential of both sides.
# exp(log(y)) = exp(b0 + (b1 * x))
# and now we have to remember that addition in the 
# exponential function, which is the same as e^x,
# is the same as multiplying...
# i.e. 2^(2+2) = (2^2) * (2^2)
#         y   = exp(b0) * exp(b1 * x)
# and now you should recognise this as an exponential
# growth or decay function in x, where
# exp(b0) = a, and b1 = r in the equation
# y = a * exp(r * x)

#-------------------------------------------------------------------------------
# Lets simulate some data according to our model

# 100 random numbers between 0 and 10
n <- 50
x <- runif(n, 0, 10)

# our exponential curve parameters
a = 2
r = -0.55

# standard deviation of the random noise
s <- 0.2

log.y <- log(a) + (r * x) + rnorm(n, 0, s)

y <- exp(log.y)


dev.new()
plot(x, y, pch = "x", bty = "L", las = 1, cex = 0.7)

#-------------------------------------------------------------------------------
# Fit our log(y) ~ x model

m1 <- glm(log(y) ~ x)
summary(m1)

# now we need to be careful. Although the ceofficient of x in our model
# is directly comparable to r in the exponential decay curve, the same is not
# true for the intercept and a.
# The coefficient of x in the model out summary(m1) is -0.548644 and is close
# enough to r = -0.55 which we specified above.
# The intercept in our fitted model is 0.705690, but we have to exponentiate
# this to compare it directly with a.
a.estimated <- exp(0.705690)
print(a.estimated)

# which is 2.025244 which is very close to the a = 2 we specified.

#-------------------------------------------------------------------------------
# What remains is how to interpret these numbers.
# As per intro_to_exponential_decay.R, it means that an incrase in x of 1 unit
# will change y by a factor of exp(-0.55) = 0.58, so y drops to 58% of its 
# previously value, or in other words has dropped by 42%.







