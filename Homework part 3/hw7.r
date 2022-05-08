type <- c('a','a','a','a','a','a','b','b','b','b','b','b','c','c','c','c','c','c')
type
method <- c('dipping','dipping','dipping','spraying','spraying','spraying','dipping','dipping','dipping','spraying','spraying','spraying','dipping','dipping','dipping','spraying','spraying','spraying')
method
adhesion <- c(4,4.5,4.3,5.4,4.9,5.6,5.6,4.9,5.4,5.8,6.1,6.3,3.8,3.7,4,5.5,5,5)
adhesion
tab <- data.frame(type,method,adhesion)
tab


#a. Which factors are significant?
aov = aov(tab$adhesion ~ tab$type*tab$method)
summary(aov)
#reject the null
#b. Which factors are not significant?
table(method,type)
#c. For every combination of Method and type gives the mean.
aggregate(adhesion, by=list(method,type), FUN=mean)
#d. For every combination of Method and type gives the standard deviation.
aggregate(adhesion, by=list(method,type), FUN=sd)



