brand1 = c(30, 26, 31, 27, 37, 28, 31, 29, 25, 26,33,30, 28, 27, 31, 35, 30,
           36, 35, 32, 27, 29,33, 27, 30
)
brand2=c(24, 27, 22,31, 30, 25, 22, 26, 29,33, 20, 18,26, 25, 20,22, 24, 
         17, 21, 18,25, 27, 24, 24, 20
)

#a.	Test the hypothesis that the brands are the same, using the proper formula. 
test_mu = mean(brand1)
test_val = (mean(brand2) - test_mu)/(sd(brand2)/sqrt(length(brand2)))
p_val = 2*ifelse(test_val<0, pt(test_val,df = length(brand2)-1),pt(test_val,df = length(brand2)-1, lower=FALSE))
p_val
#reject the null hypothesis 

#b.	Test the hypothesis using t.test and show that the results are the same. 
t.test(brand2,mu=test_mu, var.equal = TRUE)
#reject the null hypothesis 
#C c.	Use t.test without the assumption that the variances are the same and compare the results.
t.test(brand2,mu=test_mu,var.equal = FALSE)
#reject the null hypothesis 