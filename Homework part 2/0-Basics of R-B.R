# 0-Basics of R-B

library (dslabs)

head (murders)   # a dataset in library dslabs
head (sort (murders$total))    #sorting totals
# sorting from biggest to smallest 
head (-sort (-murders$total))  #sort the negative values and then changes sign 
ind = order (murders$total);head (ind)
head (murders$state [ind])  # states ordered by number of murders

# sort by total from biggest. show entire lines 
attach(murders)              #eliminates necessity to write dataframe name
newdata <- murders[order (-total),]; newdata

# sort by region and total within region from biggest
newdata <- murders[order (region, -total),]; newdata

detach(murders)


max (murders$total)                  #gives the maximum total murders  in any stateind_max = which.max (murders$total)  # the row number of the maximum in any state
ind_max = which.max (murders$total)   # the row number of the maximum in any state
murders$state [ind_max]               # the state having the maximum murders
murders [ind_max,]                    # show entire line of max state
rnk = rank (murders$total)   # find the rank of each population size within the states
cbind (murders$state, rnk)   # display state name and its rank
cbind (murders$state, rnk, murders$total )  # display state name and its rank and no. murders
#alternate method of displaying rank and state name
murders2 = cbind (murders, rnk);str(murders2) # add rnk to the data frame and display 
# the structure of the new dataframe
is.data.frame (murders2)                      # showing we have a new datafame
murders2 [c("rnk", "state", "total")]                  # displaying rank and state name 

#using logicals to find safe western states

murder_rate <- murders$total / murders$population * 100000  #murders per 100,000
west <- murders$region == "West" # says true or false for each value in the vector region
# a safe state has less than 1 murder per 100,000
safe <- murder_rate <= 1 # says true or false for each value in the vector murder_rate
# ind will be  true if both safe and west
ind <- safe & west; ind
# vectors can be indexed with logicals and only those with true will  appear
murders$state[ind]
cbind (murders$state[ind], murders$total[ind]) #safe states and murders in them 
# Finding the murder rate in a given state. which returns the index of that state 
# to be used as index in the murder rate vector
ind <- which(murders$state == "California")  # gives index of every TRUE Value, only Cal.
murder_rate[ind]   # displays the rate of California, the only TRUE in previous statement
# match returns the indices of those records having  the state names  listed
ind <- match(c("New York", "Florida", "Texas"), murders$state)
ind
murder_rate[ind]
# checking whether values in one vector are in a second vector - True if yes, False if not
c("Boston", "North Dakota", "Washington") %in% murders$state

match(c("New York", "Florida", "Texas"), murders$state) #gives indices of these states                                 # the 3 states listed  in order of the listed states         

# goes through states in the order of their appearance (alphabetical) and gets
# to Florida first and gives its index (10), then New York (33), then Texas #(44)
which(murders$state%in%c("New York", "Florida", "Texas"))
#install.packages("dslabs")
#install.packages("dplyr")
library(dplyr)
library (dslabs)

#murders <- mutate(murders, rate = total / population * 100000) # alt transform
#head (murders)
#filter(murders, rate <= 0.71) 
#new_table <- select(murders, state, region, rate) 
#filter(new_table, rate <= 0.71) 
murders = transform (murders,rate = total/population*100000);head(murders)
filter(murders, rate <= 0.71) 
# new_table <- select(murders, state, region, rate) # alternate way of selecting
new_table <- subset(murders, select = c(state, region, rate))
filter(new_table, rate <= 0.71) 
newer_table = filter(new_table, rate <= 0.71); newer_table 
ind = order (newer_table$rate) # orders those below 0.71 from smallest to largest 
newer_table[ind,]    # below 0.71 from least to most


#some programming basics
a = 2
if (a !=0)      { print (1/a);    a+2}
   # no else. ! means not
                   # ; not needed if on separate lines
a=0 
if (a !=0)  {print(1/a) 
  2*a
} else    { "No reciprocal for 0"}

# example 2
#install.packages("dslabs")
library (dslabs)
murders  # or data (murders) to specify data set
murder_rate <- murders$total / murders$population*100000
ind <- which.min(murder_rate)
ind
if(murder_rate[ind] < 0.5){  #0.25 gives message
  
  print(murders$state[ind])
  
} else   print("No state has murder rate that low")

# ifelse statement

a <- 0

ifelse(a > 0, 1/a, NA)

# works on each member of a vector
a <- c(0, 1, 2, -4, 5)

result <- ifelse(a > 0, 1/a, NA); result


for (i in 1:5)
{ print (i)}


m <- 25

s_n <- vector(length = m) # create an empty vector

for(n in 1:m)
  
{ s_n[n] <- n}; s_n
d = c(1:25);d
class (d)
class (s_n)

# creating functions
# Create a function to print squares of numbers in sequence.

new.function <- function(a) 
 { for(i in 1:a)  # squares numbers from 1 to a, which is the input variable. 
                  # No value is returned to the program. 
                  # The function itself creates output.
   { b <- i^2
   print (b)}}
  
new.function (6)

f = function (x, y, z=1)   
 { result = x + 2*y + 3*z
  result}
  # alternatively return (result) makes it very explicit}

f(2,3, 4) # automatically x =2, y = 3 and z =4 
f(2,3)    # automatically x =2, y = 3 and z assumes default of 1
f(z=4, y=2, 3)  # automatically z =4, y = 2 and 3 must be for x

f = function (x, y)   # returning more than one value 
{ result = x + 2*y 
  sq = result^2
  lst = list (result, sq)
  lst}
# return (lst)}
f(4,5)   
f(2,3)[1]
f(2, 3)[2]


#graphs

install.packages("plotrix")
getwd()                       #gets the working directory
y= c(20, 10, 15, 7, 11,22)
plot (y)                      #  x axis is the position in the vector
plot (y, type = "l")          #  instead of points, lines
pdf ("grfout.pdf")            #  output to pdf file
grfout = plot (y, type = "b") #  points and lines
dev.off()                     #  returns output to console
plot (y, type = "b")

# providing x and y vectors
x = c(5, 7, 9); y= c(30, 20, 40) # if x and y provided, y values plotted against x
z=c(7, 8, 15)
plot (x, y, type = "o",  col="green", ylim = c(0, 40)) # overplotted points and lines
# ylim gives the limits of y so the low values of the second line can be accommodated
lines (x, z, type = "o", col="red", pch = 22, lty = 2) # plotting a second line 
# on the same graph. pch =22 is square points, lty = 2 is a dashed line
# A second method for producing the same graph
plot (y~x, type = "o")                                 # overplotted points and lines. 
                                                       # alternate method

# If the x values are  not in order, they will be sorted and
# y will be rearranged in the sorted order of x
x = c(7, 5, 9); y= c(20, 30, 40)
plot (y~x, type = "p")  # if x and y provided, y values plotted against x. x arranged in order

library (dslabs)   # the murders data frame is provided with R
# data ("murders")
murders

# Basic Graph
x=murders$population/10^6
y=murders$total
plot (x,y)
#Alternate 1 - slight improvement of axis labels
with (murders,plot (population/10^6, total))

#Alternate 2 - giving title and allowing any axis label 
plot (x,y, ann=FALSE ,xaxt = "n")  
axis (1, at=c(0, 10, 20, 30),lab=c("Small","Medium", "Large", "Very Large"))
title (main="Murders/Million", col.main="red", font.main = 4, 
       xlab = "Population in Millions", ylab = "Murders Annually", col.lab = "green")


#Alternate 3 - giving title and allowing any axis label 
plot (x,y,ann=FALSE , axes = FALSE)
title (main="Murders/Million", col.main="red", font.main = 4, 
       xlab = "Population in Millions", ylab = "Murders Annually", col.lab = "green")
axis (1, at=c(0, 10, 20, 30),lab=c("Small","Medium", "Large", "Very Large"))
axis (2, at=c(0, 200, 600, 1000),lab=c("Lo","Av", "High", "Very High"))

# kabacoff 49-53  More graphs
# Input data for drug example
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type="b")   #type b indicates both lines and points to be plotted
opar <- par(no.readonly=TRUE) # make a copy of current settings
par(lty=2, pch=17)            # change line type to dotted and symbol to triangle
plot(dose, drugA, type="b")   # generate a plot
par(opar)                     # restore the original settings 
# pch = 15 is solid square, lty=3 is dots
plot(dose, drugA, type="b", lty=3, lwd=3, pch=15, cex=2, col = "red") # cex - amount magnified



# Bar plots - basic
cars=c(1, 3, 6, 4, 9)
barplot(cars)

barplot (cars, main = "Cars", xlab = "Days",ylab = "Total", names.arg = c("Mon", "Tue", "Wed", "Thurs", "Fri"),
         border = "blue", col="red")

barplot (cars, main = "Cars", xlab = "Days",ylab = "Total",
         names.arg = c("Mon", "Tue", "Wed", "Thurs", "Fri"),
         border = "blue", density = c(10, 20, 30, 40, 50), col="red",
         horiz=TRUE)

# Grouped Bar Plots 
trucks = c(2,5, 4, 5, 12)
mat = cbind(cars,trucks) #making a matrix from the cars and trucks vectors
mat
barplot(mat, main = "Autos", ylab = "Total", beside = TRUE, col = rainbow(5))
legend ("topleft", c("Mon", "Tue", "Wed", "Thurs", "Fri"), fill = rainbow(5), cex = 0.6)

# Stacked Bar Plots 
barplot(mat, main = "Autos", ylab = "Total", col = rainbow(5))
legend ("topleft", c("Mon", "Tue", "Wed", "Thurs", "Fri"), fill = rainbow(5), cex = 0.6)

# for murder dataframe - finding the number of states in each region and then making it into a  bar graph
region_frequencies = table (murders$region)
region_frequencies
barplot (region_frequencies)        # shows number of states in each region

# graphing the number of murders and the populations for  each region

murd= murders [-c(1, 2)]    # remove unnecessary columns (state, abbreviation)
murd
# remove columns not to be summed ("region"), 
# but include it as the grouping item in a list even if only 1 grouping item
aggdata = aggregate (murd [,colnames (murd) !="region" ], by = list (murd$region), FUN = sum) #, na.rm = TRUE)
aggdata

#2 step procedure to make bar graph
#as.vector (aggdata[,2])
#barplot (aggdata[,2])

# more steps but clearer method to make bar graph
ag1=aggdata[,1]
ag2=aggdata[,2]
as.vector (ag2)
ag2=ag2/1000000
ag2

#population of regions bar graph 
barplot (ag2,main = "Population", xlab = "Region", ylab = "Total in Millions", names.arg= ag1, col = rainbow(4))

#murders per region bar graph
ag3=aggdata[,3]
as.vector (ag3)
barplot (ag3,main = "Murders", xlab = "Region", ylab = "Total", names.arg= ag1, col = rainbow (4))


#general information about dataframe murders
sum (murders$population)                                  #shows total population in all regions
sum (murders$total)                                       #shows total number of murders 
rate = sum (murders$total) / sum (murders$population)     # overall murder rate
rate
sprintf("%1.10f", rate)
length (murders)                                          # of columns in  murders
ncol (murders)                                            # of columns in  murders
nrow (murders)                                            # of rows in  murders
#creating another grouping variable with 51 numbers of 1-5
vec = rep (1:5,  times = 10); vec
vec = c(vec, 1); vec
murd = cbind (murd,vec);murd                              # adding the second grouping variable

# aggregating with 2 variables. Eliminate them from murd and put  them in the list.
aggdata = aggregate (murd [,colnames (murd) != c("region", "vec")], by = list (murd$region, murd$vec), FUN = sum) #, na.rm = TRUE)
aggdata

filter (murd, region == "Northeast" & vec == "1")   # to show that we indeed found the proper aggregation.

# pie charts
pie (cars)   # the representation of each value of cars is in proportion to
# the total number 
obs = length (cars) #number of observed values
mygrays <- gray(0:obs/obs) # specifies gray colors as fraction between 0 and 1
mycolors <- rainbow(obs) # rainbow produces vector of contiguous colors

#labeling with sections being different colors 
pie (cars, main = "Cars", col=mycolors, labels =c("Mon", "Tue", "Wed", "Thurs", "Fri") )

#labeling with sections being different shades of gray
pie (cars, main = "Cars", col=mygrays, labels =c("Mon", "Tue", "Wed", "Thurs", "Fri") )

# 3 dimensional with sections separated out
library (plotrix)
pie3D (cars, main = "Cars", col=mygrays, labels =c("Mon", "Tue", "Wed", "Thurs", "Fri"),
       explode=0.1) # explode removes sections from circle

# calculate percentage for each day rounded to one decimal place, to be used 
# as the section labels, and create legend to explain section  colors
car_labels = round (cars/sum(cars)*100,1)  #rounded to 1 decimal
car_labels
#car_labels = paste (car_labels, "%", sep="") #sep="" ensures no space after car_labels
car_labels = paste0 (car_labels) #same as previous - more efficient
pie (cars, main = "Cars", col=mycolors, labels =car_labels )
legend ("topright", c("Mon", "Tue", "Wed", "Thurs", "Fri"), fill = rainbow(5), cex = 0.6) 


# regression line

#pdf("mygraph.pdf")
plot (mtcars$wt, mtcars$mpg)
abline(lm(mtcars$mpg~mtcars$wt))

#alternative method of plotting, using attach
#attach (mtcars)
#plot (wt, mpg)
#abline(lm(mpg~wt))
#title("Regression of MPG on Weight")
#detach (mtcars)

getwd()
#dev.off()

#Histogram showing frequency of a variable divided into bins

x=with (murders, total/population*100000)
hist (x)
cars;trucks
suvs = (c(4,4,6,6,16))
# sum of all vehicles
vehicles = cars + trucks + suvs; vehicles
maxnum = max (vehicles); maxnum
hist (vehicles, col= "lightblue")

# More histograms
# From Listing 6.6 - Histograms
mtcars$mpg
# simple histogram                                                        1
hist(mtcars$mpg)

# colored histogram with specified number of bins        
hist(mtcars$mpg, 
     breaks=12,           # fixing the number of classes
     col="red", 
     xlab="Miles Per Gallon", 
     main="Colored Histogram with 12 Bins")

length(mtcars$mpg)

# colored histogram with rug plot, frame, and specified number of bins 
hist(mtcars$mpg, 
     freq=FALSE, 
     breaks=12, 
     col=rainbow(12), 
     xlab="Miles Per Gallon", 
     main="Histogram, rug plot, density curve")  
#rug(jitter(mtcars$mpg), amount = 0.01)
rug(mtcars$mpg)    #represents the actual data values
lines(density(mtcars$mpg), col="blue", lwd=2)
box()  #encloses the histogram in a box

#plot a continuous curve for the mpg values
plot(density(mtcars$mpg), col="blue", lwd=2, type ="l")

# histogram with superimposed normal curve (Thanks to Peter Dalgaard)  
x <- mtcars$mpg 
h<-hist(x, 
        breaks=12, 
        col="red", 
        xlab="Miles Per Gallon", 
        main="Histogram with normal curve and box") 
rug(mtcars$mpg) 
xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)
box()

# Boxplots

rate = with (murders, total/population*100000)
boxplot (rate, data = murders, main = "Murders/100,000", col = "yellow" )

boxplot (rate~region, data = murders, col = rainbow(4))


# choosing colors
#install.packages("RColorBrewer")  # for first time
library(RColorBrewer)
n <- 7
mycolors <- brewer.pal(n, "Set1") #returns vector of 7 colors from Set1 palette
mycolors
# rep (1,7) gives a vector with 7 0nes to connect with the 7 colors
barplot(rep(1,n), col=mycolors)
n <- 20
mycolors <- rainbow(n) # rainbow produces vector of contiguous colors
pie(rep(1, n), col=mycolors)
pie(rep(1, n), labels=mycolors, col=mycolors)
mygrays <- gray(0:n/n) # specifies gray colors as fraction between 0 and 1
pie(rep(1, n), labels=mygrays, col=mygrays)



