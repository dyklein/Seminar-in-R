obs <- c(7,8,15,11,9,10,12,17,13,18,19,15,14,18,19,17,16,18,19,25,22,23,18,20)
obs
tab <- matrix(obs, ncol=6, byrow=TRUE)
tab
colnames(tab) <- c('1', '2', '3', '4', '5', '6')
rownames(tab) <- c('5%', '10%', '15%', '20%')
tab

r = c(t(as.matrix(tab))) # response
r

f = c('1', '2', '3', '4', '5', '6')
k = 4
n = 6

percent = gl(k, n, n*k, factor(f))
percent

#a.	Are they all the same, or does the percent of pulp make a difference.
av = aov(r~percent)
summary(av)
#reject the null hypothesis 

#b.	If they are shown to be different, which pairs are the same, and which differ?  
TukeyHSD(av)
#reject the null hypothesis
library (gplots)
plotmeans(obs ~ percent, xlab="Hardwood Concentration", ylab="Mean Observations", main="Mean Plot\nwith 95% CI")
plot(TukeyHSD(av))

#2-4 and 1-2 are the same everything else is different 

