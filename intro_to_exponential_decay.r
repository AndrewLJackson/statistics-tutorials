# Author: Andrew Jackson
# Date created: 24/11/2014
# About: getting to know the exponential
# growth or decay curve.

graphics.off()
rm(list=ls())
#-------------------------------------------------------------------------------
#

# The general equation we need to get used to is the 
# exponential decay curve
# y = a * exp(rx)
# where a and r are coefficients (numbers)
# and x is a continuous, usually positive variable,
# and in decay terms typically refers to time.

# lets pick a range for x and some values for a and b
# and see what this function looks like

a <- 2
r <- 0.5
x <- seq(0, 10, length=200)

# now we can calculate y
y <- a * exp(r * x)

dev.new()
plot(x, y, type = "l", bty = "L", las = 1, 
	 main = c("a = 2, r = +0.5"))

# oops! our line is not decaying... in fact its growing
# ... exponentially no doubt! 
# But thats ok, thats because r is positive.
# The other thing to note is that the line starts
# at y = 2 when x = 0. This is because, when 
# x is zero, exp(r * x) = exp(r * 0) = exp(0)
# and any number, even e, to the power of 0 is 1.
# so y = a * exp(r * 0) = a * 1 = a
# This means that a, in this equation is always the 
# value of y when x = 0, and in decay terms is the 
# amount of y at the start of time (if x is time).

#-------------------------------------------------------------------------------
#
# lets make r negative this time
a <- 2
r <- -0.5 # same as above but now its negative
x <- seq(0, 10, length=200)

# now we can calculate y again
y <- a * exp(r * x)

dev.new()
plot(x, y, type = "l", bty = "L", las = 1, 
	 main = c("a = 2, r = -0.5"), col = "red")

# now, our curve again starts at y = 2 for the same
# reason as above, but the curve now declines
# asymptotically towards 0 as x increases. This 
# is known as exponential decay.

#-------------------------------------------------------------------------------
#
# so what about changing r, the rate of decay?
# Bigger values of r, mean either faster
# exponential growth, or faster decay.

# we know that all a will do is move the curve up and down,
# so let's look at changing r only.

dev.new()
plot(x, y, bty = "L", las = 1, type = "n", main = "varying r")

# and lets use a loop to add some lines
# ct is a counter that increases each time the loop goes around.
# We will use it to plot the lines in a different colour each time.
# We will start it at 2, because we already have a black line
# plotted for r = 2, and the next colour in the sequence is red.
r.all <- c(-10, -1, -0.1, -0.01)
for (i in 1:length(r.all) ) {
  
  r <- r.all[i]
  
  y <- a * exp(r * x)
  
  lines(x, y, col = i)
  
}

# add a legend
legend("right", legend = r.all, col=1:length(r.all), lty = 1,
	   pch = NA, bty = "n")


# A pretty clear pattern. The bigger more negative the rate
# the faster the curve decays. The same is true if we let 
# r be positive... bigger, more positive values will increase
# faster.

#-------------------------------------------------------------------------------
# How to interpret these numbers
# a is the value of y when x is zero.
# r is the rate of decay, and what this means is that a one unit increase in x
# results in a proportional change in y of exp(r)..
# why?...
# Lets look at the case of y as a function of (x) compared with 
# y as a function of (x+1) which lets call y.star
# y.star = a * exp(r * (x + 1))
#        = a * exp((r * x) + r)
#        = a * exp(r + x) * exp(r)
# but...
#          a * exp(r + x) = y
# so
# y.star = y * exp(r)
# hence a one unit increase in (x) to (x+1) changes y by 
# a multiplying it by exp(r), which means y changes proportionally.
# If say r = -0.5, then a one unit increase in x, no matter where on the line
# in x we currently  are, will lead to y changing by exp(-0.5) = 0.6065307
# which is approximately 0.61. This means that y(x+1) = y(x) * 0.61.
# That is, it is now 0.61 the value it was, and so it has reduced by 39%
# of its previous value.
