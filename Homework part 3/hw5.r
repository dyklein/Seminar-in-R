res <- prop.test(x = c(71, 46), n = c(206, 107))
# Printing the results
res 

#a.	Test whether there is a difference in the students  with prop.test, using correct=FALSE.
res <- prop.test(x = c(71, 46), n = c(206, 107),correct = FALSE)
#accept the null hypothesis 
# Printing the results
res
#b.	Do a goodness of fit test with chisq.test and show that you get the same results. 
df <- data.frame(total=rep(c(206,107)),good=rep(c(71,46)))
df
tab <- table(df$total,df$good)
chisq <- chisq.test(tab,correct = FALSE)
#accept the null hypothesis 
# Printing the results
chisq
#c.	Test whether Israeli students are better in general with prop.test, using correct=FALSE and alternative = "g".
res <- prop.test(x = c(71, 46), n = c(206, 107),correct = FALSE,alternative = "g")
#accept the null hypothesis 
# Printing the results
res

