library(MASS)
head(painters)

# Qualitative data - nominal variables
school	=	painters$School;school
class (school)
school.freq	=	table(school)
school.freq
cbind(school.freq)
school.freq.max	=	max(school.freq)
school.freq.max
L	=	school.freq	==	school.freq.max
x	=	school.freq[L]
x
x	=	which(school.freq	==	school.freq.max)
x
school.relfreq	= school.freq	/	nrow(painters) # relative frequency table
school.relfreq
round (school.relfreq,digits = 2)
barplot(school.freq)
colors	=	c("red",	"yellow",	"green",	"violet",	"orange", "blue",	"pink",	"cyan")
barplot(school.freq,	col=colors)	
pie(school.freq, col=colors)
c_school	=	school	==	"C"   #Logical vector
c_school; nrow (painters)
c_painters	=	painters[c_school,	];c_painters
mean(c_painters$Composition)
# calculates composition means for each school. 
# Same as aggregate, but just 1 variable
tapply(painters$Composition, painters$School,	mean)
#alternative method giving mean of all columns per school
aggregate (painters [,colnames(painters) != "School"],	by=list (painters$School), FUN=mean) 
comp	=	painters$Composition;comp
school	=	painters$School;school
comp.school.max	= tapply(comp,	school,	max)   # finds max for each school
comp.school.max
#alternate method
aggregate (painters [,colnames(painters) != "School"],	by=list (painters$School), FUN=max)
comp.max.all	=	max(comp); comp.max.all        # overall maximum
x	=	which(comp.school.max	==	comp.max.all)    # finding the schools 
x                                              # whose max = overall max
names(x)
colour	=	painters$Colour                      # painters with color score above 14
x	=	which(colour	>=	14)
length(x)/nrow(painters)                       # % of painters with color score > 14

# Quantitative  data   - Interval variables
head (faithful)        # holds duration of each eruption and time between eruptions
duration	=	faithful$eruptions
range(duration)                          # max eruption length - min eruption length
breaks	=	seq(1.5,	5.5,	by=0.5)        # breaks every 0.5 starting from 1.5 to 5.5
                                         # which covers the minimum and maximum

#cut defines which class each observation falls in. right = FALSE means 
#that the interval is not closed on the right
# In other words 3.5 will fall not in 3-3.5 but in 3.5-4.
duration
duration.cut = cut(duration, breaks, right=FALSE);duration.cut
duration.freq = table(duration.cut)   # how many appearances there are of each interval.
duration.freq
cbind(duration.freq)
# instead of  cut and table, we can use hist. It produces the same infor as both.
# Additionally, it allows you to leave out breaks, and then it figures out 
# the breaks by itself. In this case  it guesses the same breaks we chose.
# plot = false means we don't want a plot.
h = hist(duration, breaks=breaks, right=FALSE, plot=FALSE);h
h = hist(duration, right=FALSE, plot=FALSE);h
h = hist(duration, right=FALSE, plot=TRUE, col=rainbow (8));h
duration.freq = h$counts
h = hist(duration, right=FALSE)
hist(duration, right=FALSE, col=colors, main="Old Faithful Eruptions", xlab="Duration minutes")
duration.relfreq = duration.freq / nrow(faithful)   #calculating relative frequency after we calculated the frequency.
duration.percentage = round(duration.relfreq, 4)*100
duration.percentage
cbind(duration.freq, duration.percentage)
duration.cumfreq = cumsum(duration.freq)             # finding the cumulative sum of the table values

cbind(duration.cumfreq)
cumfreq0 = c(0, cumsum(duration.freq))               # adding the inital cumulative sum of 0
#plotting  a cumulative sum graph
plot(breaks, cumfreq0, main="Old Faithful Eruptions", xlab="Duration minutes", ylab="Cumulative eruptions", type = "o")
duration.cumrelfreq = duration.cumfreq/nrow(faithful) 
cumrelfreq0 = c(0, duration.cumrelfreq)
plot(breaks, cumrelfreq0,main="Old Faithful Eruptions", xlab="Duration minutes", ylab="Cumulative eruption proportion",type = "o" )
# Building a smooth curve using ecdf function (Builds CDF) 
Fn = ecdf(duration)
plot(Fn, main="Old Faithful Eruptions", xlab="Duration minutes", ylab="Cumulative eruption proportion")
# stem and leaf plot. We choose one or more leading digits of the observations, 
# and place on their right the next digit  of each observation.
sort(duration)
# here on the left we have 1.6, 1.8, etc. On the right of 1.6 is 070355555588 representing
# 1.600 1.667 1.700 1.733 1.750 1.750 1.750 1.750 1.750 1.750 1.783 1.783
stem(duration)
duration
#scatter plot for regression
waiting = faithful$waiting
head(cbind(duration, waiting))
plot(duration, waiting,xlab="Eruption duration", ylab="Time waited")
#the regression line
reg = lm(waiting ~ duration)
summary (reg)
abline(lm(waiting ~ duration))
reg [1]    # gives the coefficients
reg [2]    # the residuals of each point from the line

#measures of central tendency
mean(duration)

# finding the weighted mean
z= c(30,40); wt = c(1,4)
wm = weighted.mean (z, wt);wm   # weighted mean

#using the weighted mean to find the mean when only given a histogram
#step 1 is to find the midpoints of the classes. 
h$mids
h$counts

hist_mean = weighted.mean (h$mids, h$counts);hist_mean
mean (duration)

# how to calculate the midpoints by oneself without using h$mids (not really necessary)
n = length (breaks)
mid = vector()
for (i in 1:n-1)
{mid [i] = (breaks [i]+ breaks [i+1])/2}
mid; breaks



# a function to find the mode
#Create the function.
getmode <- function(v) {
  uniqv <- unique(v);  # creates a vector containing the unique values in  vector v, in order of their appearance in v
  match (v, uniqv)    # creates a vector showing which member of uniqv each member of v corresponds to. 
  tabulate(match(v, uniqv))   # creates a table showing how many members of v corresponded to each member of uniqv
  # same as table but gives only the table values and not the values of uniqv
   mode_col= which.max (tabulate(match(v, uniqv)))  # gives the column in the table which contains the maximum value
   uniqv [mode_col]
  # the previous 4 steps can all be done in only 1 step
  #uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Create the vector with numbers.
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
# Calculate the mode using the user function.
result <- getmode(v)
print(result)

# Create the vector with characters.
charv <- c("o","it","the","it","it")
charv
# Calculate the mode using the user function.
result <- getmode(charv)
print(result)
dur = round(duration,1); dur
getmode (dur)                    # gives the mode after rounding to 1 digit

getmode (duration.cut)           # gives the mode of the histogram

# median

median (duration)
length (duration)
sort (duration)

quantile(duration)                        # gives every 25 percentile
quantile(duration,	c(.32,	.57,	.98))   # gives the indicated percentiles
  

# measures of dispersion
max(duration)	-	min(duration)      #range
IQR(duration)                      # inter-quartile range. 75 percentile - 25 percentile
# boxplot - line above  is maximum
# line below is minimum
# top of box  - 75th percentile
# bottom of box  - 25th percentile
# line in box - median 50th percentile

boxplot(duration,	horizontal=TRUE)
boxplot(duration) 
var(duration)                     # sample variance for estimation
sd (duration)                     # sample standard deviation for estimation
n=272
(n-1)/n * var (duration)                 # population variance of values in duration 
sqrt((n-1)/n) * sd(duration)             # population standard deviation

#Finding weighted population variance
z= c(30,40); wt = c(1,4)
wm = weighted.mean (z, wt);wm   # weighted mean
z_sq = z^2;z_sq                 # sum of squares of observations
t(wt)%*%z_sq/sum (wt) - wm^2    # row of weights times observations squared
                                # - the weighted mean squared. weighted population variance
(t(wt)%*%z_sq - sum (wt)* wm^2)/(sum (wt)-1)  #  # row of weights times observations squared
# - n* the weighted mean squared, divided by (n-1). weighted sample variance

#Variance from histogram data
var (duration)                                                             # the variance based on actual data
z_sq = h$mids^2
hist_var=t(h$counts)%*%z_sq/sum (h$counts) - hist_mean^2;hist_var          # the variance based on histogram data

# calculating percentiles based on the histogram
cum=duration.cumfreq;cum
n = length (duration)
percen = 100; percen = percen/100; percen
x= percen*n ;x
i = length (cum[cum<x])    #finds number of  members <x, i.e. the  
y= (x-cum[i])*(breaks [i+1] - breaks [i]) /h$counts [i+1];y
percnt= y+breaks [i+1]; percnt
quantile(duration)
breaks

library(MASS)
head(survey)
help(survey)
height.survey	=	survey$Height
length(height.survey)
#NA.rm = TRUE  means Not Available (missing) should be removed
mean(height.survey,	na.rm=TRUE)
# na.omit causes removal of all na values
height.response	= na.omit(survey$Height)
length(height.response)

#confidence interval where sigma is known
n	=	length(height.response)
sigma	=	9.48
sem	=	sigma/sqrt(n);	sem	  #sem is standarderror of the mean sigma/sqrt(n)

# we want 95% confidence interval where sigma is known
# qnorm(.975) is  value of z such that 97.5% of the area is to the left of it.
E	=	qnorm(.975)*sem;	# from x-bar to end of interval in each direction
xbar	=	mean(height.response)
xbar	+	c(-E,	E)             #lower and higher confidence boundaries

# we want 95% confidence interval where sigma is unknown
s	=	sd(height.response)
SE	=	s/sqrt(n);	SE
E	=	qt(.975,	df=n-1)*SE;	E  # qt gives the t value associated with a specific percentile of the t distribution  
xbar	+	c(-E,	E)

# see https://www.dataanalytics.org.uk/basic-statistical-tests-using-r/
t.test(height.response)    # built in stat package. Only for 95% CI

# Finding sample size to have error margin of 1.2 cm at 95% conf. level.
zstar	=	qnorm(.975)
sigma	=	9.48
E	=	1.2
zstar^2	*	sigma^2/	E^2

# we want 95% confidence interval for proportion
#estimating p, i,e, finding p_hat
gender.response	= na.omit(survey$Sex)
survey

n	=	length(gender.response)
k	=	sum(gender.response	==	"Female")
pbar	=	k/n;	pbar
SE	=	sqrt(pbar*(1-pbar)/n);	SE
E	=	qnorm(.975)*SE;	E
pbar	+	c(-E,	E)

#
prop.test(k,	n)        # built in stat package. Only for 95% CI

# Finding sample size to have error margin of 0.05 cm at 95% conf. level.
zstar	=	qnorm(.975)
p	=	0.5
E	=	0.05
zstar^2	*	p	*	(1-p)	/	E^2

# we want 90% confidence interval for sigma^2
x= c(8, 11, 13, 10, 11, 7, 9)
n= length (x);m
s_sq= var(x)
Lower	= (n-1)*s_sq/	qchisq(.95,	df=n-1)
Higher	= (n-1)*s_sq/	qchisq(.05,	df=n-1)
Lower; Higher

# Hypothesis Testing
# H0: mu=10000  H1: mu<10000

xbar	=	9900					   	#	sample	mean
mu0	=	10000						    #	hypothesis
sigma	=	120					    	#	population	sd
n	=	30										#	sample	size
z	=	(xbar-mu0)/(sigma/sqrt(n)); z
alpha	=	.05; qnorm (alpha)# the z value with 5% of the area below it.
cat ("We accept the null hypothesis:", z > qnorm (alpha))	

#alternatively, compute the p-value of the test statistic:
pval	=	pnorm(z); pval	  # less that 1%

# Hypothesis Testing
# H0: mu=2  H1: mu>2   known variance

xbar	=	2.1						    	#	sample	mean
mu0	  =	2										#	hypothesis
sigma	=	0.25			      		#	population	sd
n	=	35											#	sample	size
z	=	(xbar-mu0)/(sigma/sqrt(n)); z
alpha	=	.05
z.alpha	=	qnorm (alpha, lower.tail=FALSE); z.alpha    #writing tail = FALSE gives z value of right tail
cat ("We accept the null hypothesis: ", z < z.alpha)	

#alternatively, compute the p-value of the test statistic:
pval	=	pnorm(z); pval	  # less that 1%
pval	=	pnorm(z,	lower.tail=FALSE); pval #	upper	tail	p-value

# testing a 2-sided hypothesis
xbar	=	14.6				           	  	#	sample	mean
mu0	=	15.4					          	  	#	hypothesis
sigma	=	2.5				          	    	#	population	sd
n	=	35							         			  #	sample	size
z	=	(xbar-mu0)/(sigma/sqrt(n)); z	  #	test	statistic
alpha	=	.05
z.half_alpha	=	qnorm(alpha/2)
c(z.half_alpha,	-z.half_alpha)
cat ("We accept the null hypothesis: ", abs(z) < z.half_alpha)	

#alternative:
# It is twice the tail size if z is negative (pnorm (z)) and twice the upper tale
# size if z is positive pnorm(z,	lower.tail=FALSE)
pval	=	2	*	ifelse(z	<	0, pnorm(z), pnorm(z,	lower.tail=FALSE));pval

# Hypothesis Testing
# H0: mu=2  H1: mu<2   unknown variance		
xbar	=	9900					              	#	sample	mean
mu0	=	10000					                	#	hypothesis
s	=	125								            		#	sample	sd
n	=	30								      	      	#	sample	size
t.val	=	(xbar-mu0)/(s/sqrt(n)); t.val	#	test	statistic
alpha	=	.05
t.alpha	=	qt(1-alpha,	df=n-1)
-t.alpha							            		#	critical	value
cat ("We accept the null hypothesis: ", t.val > -t.alpha)	
#Alternative method. compute the lower tail p-value
pval	=	pt(t.val,	df=n-1);pval

# Hypothesis Testing
# H0: mu=2  H1: mu>2   unknown variance	
xbar = 2.1                              # sample mean
mu0 = 2                                 # hypothesis
s = 0.3                                 # sample sd
n = 35                                  # sample size
t.val = (xbar-mu0)/(s/sqrt(n)); t.val   # test statistic
# critical value at .05 significance level.
alpha = .05
t.alpha = qt(1-alpha, df=n-1)
t.alpha                                 # critical value
#Alternative method. compute the upper tail p-value
pval = pt(t.val, df=n-1, lower.tail=FALSE);pval # upper tail

# testing a 2-sided hypothesis with unknown variance  
xbar = 14.6                           # sample mean
mu0 = 15.4                            # hypothesis
s = 2.5                               # sample sd
n = 35                                # sample size
t.val = (xbar-mu0)/(s/sqrt(n)); t.val # test statistic

# computing  the critical values at .05 significance level.
alpha = .05
ta = qt(1-alpha/2, df=n-1)
c(-ta, ta)                            # do not reject because t-value is within the limits
#alternative method, shows p-value of more than 5%
pval = 2 * ifelse(t.val < 0, pt(t.val, df=n-1),pt(t.val, df=n-1, lower=FALSE)); pval

# Lower Tail Test of Population Proportion

pbar = 85/148                                 # sample prop
p0 = .6                                       # null hypothesis
n = 148                                       # sample size
z = (pbar-p0)/sqrt(p0*(1-p0)/n);z             # test statistic
alpha = .05                                   # computing the critical value at .05 significance level
qnorm (alpha)                                 # critical value. not less, do not reject.

# alternative solution - finding p-value
pval = pnorm(z); pval                         # lower tail

# Upper Tail Test of Population Proportion
pbar = 30/214                                     # sample prop
p0 = .12                                          # hypothesis
n = 214                                           # sample size
z = (pbar-p0)/sqrt(p0*(1-p0)/n);z                 # test statistic
alpha = .05
z.alpha = qnorm(alpha,lower.tail=FALSE ); z.alpha # critical value

# Alternative Solution using p-value
pval = pnorm(z, lower.tail=FALSE);pval

# Two-Tailed Test of Population Proportion
pbar = 12/20                                      # sample prop
p0 = .5                                           # hypothesis
n = 20                                            # sample size
z = (pbar-p0)/sqrt(p0*(1-p0)/n);z                 # test statistic
alpha = .05
z.alpha = qnorm(alpha,lower.tail=FALSE ); z.alpha # critical value
c(-z.alpha, z.alpha)

# Alternative Solution 1 using p-value
pval = 2 * pnorm(z, lower.tail=FALSE); pval

# Alternative Solution 2
# The Yates continuity correction is disabled for pedagogical reasons.
prop.test(12, 20, p=0.5,correct=FALSE)

# Type II Errors - Lower Tail Test of Population Mean with Known Variance
n = 30                                            # sample size
sigma = 120                                       # population sd
sem = sigma/sqrt(n); sem                          # standard error of the mean
alpha = .05                                       # significance level
mu0 = 10000                                       # hypothesis
q = qnorm(alpha, mean=mu0, sd=sem);q              # don't reject if z>9964

mu = 9950                                         # population mean under H1
pnorm(q, mean=mu, sd=sem, lower.tail=FALSE)       # type II error. prob > 9964
                                                  # given mu=9950
# Type II Errors - Upper Tail Test of Population Mean with Known Variance
n = 35                                            # sample size
sigma = 0.25                                      # population sd
sem = sigma/sqrt(n); sem                          # standard error of the mean

# upper bound of sample means for which the null hypothesis is accepted
alpha = .05                                       # significance level
mu0 = 2                                           # hypothesis
q = qnorm(alpha, mean=mu0, sd=sem, lower.tail=FALSE);q  # 2.069
mu = 2.09                                         # alternate population mean
pnorm(q, mean=mu, sd=sem)                         # prob below 2.069

# Two-Tailed Test of Population Mean with Known Variance

n = 35 # sample size
sigma = 2.5                                              # population sd
sem = sigma/sqrt(n); sem                                 # standard error of the mean

# compute the lower and upper bounds of sample means for which the null
# hypothesis ?? = 15.4 would not be rejected.
alpha = .05                                               # significance level
mu0 = 15.4                                                # hypothetical mean
I = c(alpha/2, 1-alpha/2)
q = qnorm(I, mean=mu0, sd=sem); q

# Assume actual population mean is 15.1. Compute the lower tail probabilities.
mu = 15.1                                                 # population mean uner alternative hypothesis
p = pnorm(q, mean=mu, sd=sem); p
# The probability of type II error is the probability between the two end
points.
diff(p)                                                    # p[2]-p[1]

# Lower Tail Test of Population Mean with Unknown Variance

n = 30                                                     # sample size
s = 125                                                    # sample sd
SE = s/sqrt(n); SE                                         # standard error of the mean
# compute lower bound of sample means for which null hypothesis not rejected.
alpha = .05                                                # significance level
mu0 = 10000                                                # hypothesis
q = mu0 + qt(alpha, df=n-1)*SE; q                          # 9961.2
mu = 9950                                                  # population mean
pt((q - mu)/SE, df=n-1,lower.tail=FALSE)                   # type II error

# Upper Tail Test of Population Mean with Unknown Variance
n = 35                                                     # sample size
s = 0.3                                                    # sample sd
SE = s/sqrt(n); SE

# compute upper bound of sample means for which mu = 2 not rejected.
alpha = .05                                               # significance level
mu0 = 2                                                   # hypothesis
q = mu0 + qt(alpha, df=n-1, lower.tail=FALSE)*SE; q
mu = 2.09                                                 # alternate population mean
pt((q - mu)/SE, df=n-1)

# Two-Tailed	Test	of	Population	Mean	with Unknown	Variance
n	=	35					                          		#	sample	size
s	=	2.5					                             	#	sample	sd	
SE	=	s/sqrt(n);	SE
# rejection regions
alpha	=	.05	                                 	#	significance	level
mu0	=	15.4                              			#	null hypothesis
I	=	c(alpha/2,	1-alpha/2)
q	=	mu0	+	qt(I,	df=n-1)*SE;	q
mu	=	15.1			                            	#	alternate hypothesis population	mean
# probability of being below the upper bound and below the lower bound, alt. hyp.
p	=	pt((q	-	mu)/SE,	df=n-1);	p
diff(p)					                             	#	acceptance region = p[2]-p[1]

# Population 	Mean 	Between 	Two	Matched	Samples

library(MASS)
head(immer)
t.test(immer$Y1,	immer$Y2,	paired=TRUE)

# Finding the confidence interval without using t.test, 
# so we can find it for any confidence level.
X	=	immer$Y1	-	immer$Y2
n	=	length(X)
alpha	=	.05
t.alpha	=	qt(1-alpha/2,	df=n-1)
t.alpha
E	=	t.alpha	*	sqrt(var(X)/n)
mean(X)	+	c(-E,	E)

# Population	Mean	Between	Two	Independent Samples

# am == 0 means automatic transmission
L	=	mtcars$am	==	0
mpg.auto	=	mtcars[L,]$mpg                   # miles per gallon for automatic
mpg.auto
# am ==1 means manual transmission
mpg.manual	=	mtcars[!L,]$mpg                 # miles per gallon for manual
mpg.manual
t.test(mpg.auto,	mpg.manual)
t.test(mpg	~	am,	data=mtcars)               # alterantive method of getting same results

#	interval 	estimate	of 	the	difference	in 	population 	means	

#finding the degrees of freedom
n1	=	length(mpg.auto)
n2	=	length(mpg.manual)
q1	=	var(mpg.auto)/n1
q2	=	var(mpg.manual)/n2
u	=	q1+q2
v1	=	q1*q1/(n1-1)
v2	=	q2*q2/(n2-1)
df	=	u*u/(v1+v2);	df
# Finding	the	standard	error	E	for	the	95%	(1-alpha) confidence	interval .
alpha	=	.05
t.alpha	=	qt(1-alpha/2,	df=df)
E	=	t.alpha	*	sqrt(q1+q2);	E

# Adding	the	standard	error	to	the	point 	estimate	of 	difference
# in 	population means:
xbar1	=	mean(mpg.auto)
xbar2	=	mean(mpg.manual)
xbar1	-	xbar2	+	c(-E,	E)

# Comparison of Two Population Proportions
library(MASS)
head(quine)
table(quine$Eth,	quine$Sex)  # the table we're dealing with - not necessary for calculations
prop.test(table(quine$Eth,	quine$Sex), correct=FALSE)

# Finding the confidence interval manually
n1	=	38+31;	n1
p1	=	38/n1;	p1
n2	=	42+35;	n2
p2	=	42/n2;	p2
q1	=	p1*(1-p1)/n1
q2	=	p2*(1-p2)/n2
alpha	=	0.05
z.alpha	=	qnorm(1-alpha/2)
E	=	z.alpha*sqrt(q1+q2)
p1	-	p2	+	c(-E,	E)

# goodness of fit
library(MASS)
levels(survey$Smoke)
smoke.freq	=	table(survey$Smoke); smoke.freq
smoke.prob	=	c(.045,	.795,	.085,	.075)
chisq.test(smoke.freq, p=smoke.prob)

# Doing it manually
f	=	table(survey$Smoke)
e	=	smoke.prob*length(survey$Smoke);e
d	=	f-e
chi	=	sum(d*d/e);	chi
df	=	length(f)-1
pchisq(chi,	df=df,	lower=FALSE)

#contingency tables
library(MASS)
tbl	=	table(survey$Smoke,	survey$Exer); tbl
chisq.test(tbl)
# Problem is the columns have too few items. Solution: combine:
ctbl	=	cbind(tbl[,"Freq"], tbl[,"None"]	+	tbl[,"Some"]); ctbl
chisq.test(ctbl)

# finding result manually

f	=	table(survey$Smoke,	survey$Exer);	f    # the contingency table
rowsum	=	rowSums(f);	rowsum               # finding row sums
rowsum	=	apply(f,	1,	sum);	rowsum       # alternative to rowsums
colsum	=	colSums(f);	colsum               # column sums
colsum	=	apply(f,	2,	sum);	colsum       # alternative to columnsums
p	=	rowsum	%*%	t(colsum)                  # multiplying all rowsums by columnsums
e	=	p	/	nrow(survey);	e                    # expected amount in each cell
d	=	f-e                                    # Observed - expected in each cell 
chi	=	sum(d*d/e);	chi
df	=	(nrow(f)-1)*(ncol(f)-1);	df
pchisq(chi,	df=df,	lower=FALSE)
