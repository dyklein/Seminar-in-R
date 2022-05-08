die = c(1,2,3,4,5,6)
throws = c(20,22,17,18,19,20)
#Is the die fair? Use chisq (Goodness of fit)
chisq.test(throws, p=c(1,1,1,1,1,1)/6)
#accept the null hypothesis 
cat("The die is fair")
