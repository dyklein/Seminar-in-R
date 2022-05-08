x = c(115,116,117,118,119,120,121,122,123,124)
freq = c(4,6,9,13,15,19,20,18,15,10)
data <- data.frame(x,freq)

total <-sum(freq)
wt <- freq/total
xm <- weighted.mean(x,wt)
#a.	Find the weighted mean using the appropriate r statement.
cat("the weighted mean is" ,xm)
#b.	Find the weighted population variance using the appropriate r statements.
cat("the weighted population variance " ,sum(wt * (x - xm)^2))

#c
vec = rep(x,times = freq)
cat("the mean is " , mean(vec))
cat("the variance is " , var(vec))
#d.	Find the median and IQR.
cat("the median is " , median(vec))
cat("the IQR is " , IQR(vec))


