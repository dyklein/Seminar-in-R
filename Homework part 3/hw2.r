tomatoes = c(7.07,7,7.1,6.97,7,7.03,7.01,7.01, 6.98,7.08)
tomatoes



#a Find a 98% confidence interval for the expected weight using the proper formula
t.test(tomatoes, conf.level = 0.98)
#b  Test the hypothesis that the expected weight is less that 7.5 ounces using the proper formula.
t.val = (mean(tomatoes) - 7.5)/(sd(tomatoes)/sqrt(length(tomatoes)))
p.val = pt(t.val,df = length(tomatoes)-1);p.val
p.val
#reject the null hypothesis 
#c show that you get the same results for the confidence interval and hypothesis test using the  t.test statement.

test = t.test(tomatoes, mu=7.5,  conf.level=0.98, alternative = "less")
test$p.value
#reject the null hypothesis 

