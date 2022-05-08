#a.	Perform a polynomial regression where both height and height squared re independent variables.
fit2 <- lm(weight ~ height + I(height^2), data=women) 

#b.	Are the coefficients significant?
plot(women$height,women$weight,
     main = "Women Age 30-39",
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
summary(fit2)
#yes
#c.	Graph the regression line.
lines(women$height,fitted(fit2))
