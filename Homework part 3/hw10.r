#a.	Find the regression of the number of murders based on population, illiteracy, income, and frost. 
states <- state.x77
states
states <- as.data.frame.matrix(states) 
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
fit
#b.	Which  coefficients are significant?
summary(fit)
#population,illiteracy