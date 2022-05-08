shirt <- read.csv("shirt.csv")
shirt

#a.	Test a linear relationship between Strength of the shirt, and quality of material. Plot the relationship and determine if it is significant.
fit <- lm(Strength ~ Quality, data=shirt) 
summary(fit)
print("there is a significant")
#plotting the regression line
plot(shirt$Strength,shirt$Quality,
     main="Strength Vs Quality;", 
     xlab="Strength", 
     ylab="Quality")


#b.	Test a quadratic relationship between Strength of the shirt, and quality of material. Plot the relationship and determine if it is significant.
fit <- lm(Strength ~ Quality + I(Quality^2)+ I(Strength^2), data=shirt) 

summary(fit)
print("there is a significant")
#plotting the regression line
plot(shirt$Strength^2,shirt$Quality^2,
     main="Strength Vs Quality;", 
     xlab="Strength", 
     ylab="Quality")


#c.	Test a linear relationship between Strength of the shirt, and quality of material and amount of die.
fit <- lm(Strength ~ Quality + Dye, data=shirt) 
# lm is: linear model
summary(fit)
print("there is a significant")

#d.We wish to examine country of origin. Display relative frequency as a pie chart, 3D pie chart, and as a bar graph.
China <- shirt[shirt$Origin == "China",]
Vietnam <- shirt[shirt$Origin == "Vietnam",]
Thailand <- shirt[shirt$Origin == "Thailand",]
India <- shirt[shirt$Origin == "India",]

# Pie Chart with Percentages
slices <- c(nrow(China), nrow(Vietnam), nrow(Thailand), nrow(India))
lbls <- c("China", "Vietnam", "Thailand", "India")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")

# 3D Exploded Pie Chart
library(plotrix)
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")

# Simple Bar Plot
# Plot the bar chart
slices <- c(nrow(China)/sum(slices)*100, nrow(Vietnam)/sum(slices)*100, nrow(Thailand)/sum(slices)*100, nrow(India)/sum(slices)*100)
lbls <- c("China", "Vietnam", "Thailand", "India")
lbls
barplot(slices,names.arg=lbls,font.axis=1,xlab="Country",ylab="total",col="blue",
        main="Bar Chart of Countries",border="red", las=2 )

#e.	Concerning the strength, we wish to determine basic measures, such as:
#  Mean, sample standard deviation, population standard deviation, median, Inter quartile range, 25, 50, 75, and 90th percentiles, range, and mode.
cat("The mean of strength is ", mean(shirt$Strength))
cat("The standard deviation of strength is ", sd(shirt$Strength))
total = nrow(shirt)
cat("The population standard deviation of strength is ", sqrt((total-1/total)) * sd(shirt$Strength))
cat("The median of strength is ", median(shirt$Strength))
cat("The IQR of strength is ", IQR(shirt$Strength))
cat("The 25th percentiles of strength is ", quantile(shirt$Strength, .25))
cat("The 50th percentiles of strength is ", quantile(shirt$Strength, .50))
cat("The 90th percentiles of strength is ", quantile(shirt$Strength, .90))
cat("The range of strength is ", range(shirt$Strength))
vector <- unique(shirt$Strength)
ans = vector[which.max(tabulate(match(shirt$Strength, vector)))]
cat("The mode of strength is ", ans)

DistributionTable <- function(hist.data){
  interval.lower <- hist.data$breaks[-length(hist.data$breaks)]
  interval.upper <- hist.data$breaks[-1]
  hist.table <- data.frame(
    Interval = paste(interval.lower, "-", interval.upper),
    Midpoint = hist.data$mids,
    Frequency = hist.data$counts
  )
  return(hist.table)
}
#f.	For the strength variable, prepare a histogram, and determine the midpoint of the class with the greatest frequency.  
hist(shirt$Strength)
shirt.hist <- hist(shirt$Strength, breaks = 7, right = FALSE, plot = FALSE)
shirt.hist
DistributionTable(ramen.hist)

#g.	For the strength variable, prepare a boxplot and stem and leaf plot. 
boxplot(shirt$Strength)
stem(shirt$Strength)

#h.	For the mean of the strength variable, find a 98% confidence interval.
result = t.test(shirt$Strength, conf.level=0.98)
cat("98% confidence interval is ", result$conf.int, "for mean of strength")

#i.	For the origin, find a 98% confidence interval for the probability that  a randomly chosen shirt was manufacture in India.
result = prop.test(nrow(India),total,conf.level=0.98)
cat("98% confidence interval for the probability that  a randomly chosen shirt was manufacture in India ", result$conf.int)

#j.	Is there a difference in the expected strength of shirts from different countries?  
#Which pairs are significantly different from each other?
fit = aov(Strength~Origin,data=shirt)
cat("there are differences") 
summary(fit)
TukeyHSD (fit)
cat("pairs are significantly different from each other are 
    Vietnam-Thailand, Vietnam-India, Vietnam-China")


#k.	Is there a difference in the expected strength of shirts from different countries and different materials?  
fit = aov(Strength~Origin*Material,data=shirt)
cat("there are differences") 
summary(fit)

#l.	Is there any interaction between different countries and different materials?  
mat = shirt$Material
temp = shirt
temp[temp=="China"]<-1
temp[temp=="Thailand"]<-2
temp[temp=="India"]<-3
temp[temp=="Vietnam"]<-4
org = temp$Origin
fit <- lm(org ~ mat, data=shirt) # lm is: linear model
summary(fit)
cat("yes there is a interaction")

China <- shirt[shirt$Origin == "China",]
cat("the mean for china is ",mean(China$Strength))
Vietnam <- shirt[shirt$Origin == "Vietnam",]
cat("the mean for vietnam is ",mean(Vietnam$Strength))
Thailand <- shirt[shirt$Origin == "Thailand",]
cat("the mean for thailand is ",mean(Thailand$Strength))
India <- shirt[shirt$Origin == "India",]
cat("the mean for india is ",mean(India$Strength))

#n.	What are the means for each material?
Flannel <- shirt[shirt$Material == "Flannel",]
cat("the mean for flannel is ",mean(Flannel$Strength))
Rayon <- shirt[shirt$Material == "Rayon",]
cat("the mean for rayon is ",mean(Rayon$Strength))
Polyester <- shirt[shirt$Material == "Polyester",]
cat("the mean for polyester is ",mean(Polyester$Strength))

#o.	What are the means for each country together with each material?
Flannel <- China[China$Material == "Flannel",]
cat("the mean for china flannel is ",mean(Flannel$Strength))
Rayon <- China[China$Material == "Rayon",]
cat("the mean for china rayon is ",mean(Rayon$Strength))
Polyester <- China[China$Material == "Polyester",]
cat("the mean for china polyester is ",mean(Polyester$Strength))

Flannel <- Vietnam[Vietnam$Material == "Flannel",]
cat("the mean for Vietnam flannel is ",mean(Flannel$Strength))
Rayon <- Vietnam[Vietnam$Material == "Rayon",]
cat("the mean for Vietnam rayon is ",mean(Rayon$Strength))
Polyester <- Vietnam[Vietnam$Material == "Polyester",]
cat("the mean for Vietnam polyester is ",mean(Polyester$Strength))

Flannel <- Thailand[Thailand$Material == "Flannel",]
cat("the mean for Thailand flannel is ",mean(Flannel$Strength))
Rayon <- Thailand[Thailand$Material == "Rayon",]
cat("the mean for Thailand rayon is ",mean(Rayon$Strength))
Polyester <- Thailand[Thailand$Material == "Polyester",]
cat("the mean for Thailand polyester is ",mean(Polyester$Strength))

Flannel <- India[India$Material == "Flannel",]
cat("the mean for India flannel is ",mean(Flannel$Strength))
Rayon <- India[India$Material == "Rayon",]
cat("the mean for India rayon is ",mean(Rayon$Strength))
Polyester <- India[India$Material == "Polyester",]
cat("the mean for India polyester is ",mean(Polyester$Strength))

