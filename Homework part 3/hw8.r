#a.	Find the regression coefficients for weight as a function of height
fit <- lm(weight ~ height, data=women) # lm is: linear model
fit$coefficients

#b.	Are the coefficients significant?
summary(fit)
#yes

#c Graph the regression line.
#plotting the regression line
plot(women$height,women$weight,
     main="Women Age 30-39", 
     xlab="Height (in inches)", 
     ylab="Weight (in pounds)") #x-axis is height, y is weight
# add the line of best fit
abline(fit) # shows best fitting lines
res = residuals(fit) # shows difference between y-i and y-hat
# setting up residual graph. Clear the previous graph by pressing the "All clear" button 
x= c(1:15);x    
z = rep (0,15);z
plot (x, res, type = "p")
lines (x, z, type = "l")

