Statistics Questions to be Done in R
1.	Consider the following data:
x	    115	116	117	118	119	120	121	122	123	124
freq	4	6	9	13	15	19	20	18	15	10

a.	Find the weighted mean using the appropriate r statement.
b.	Find the weighted population variance using the appropriate r statements.
c.	Create 1  vector with all the data repeating each value a number of times equal to its frequency. Use the r mean and var functions for this data to get the same values that you found in a and b. Recall that var gives the sample variance which must be multiplied by (n-1)/n to get the population variance.
d.	Find the median and IQR.

2.	Consider the following data describing the weight in ounces of a box of tomatoes:
7.07,7,7.1,6.97,7,7.03,7.01,7.01, 6.98,7.08
a. Find a 98% confidence interval for the expected weight using the proper formula.
b. Test the hypothesis that the expected weight is less that 7.5 ounces using the proper formula.
c. show that you get the same results for the confidence interval and hypothesis test using the  t.test statement.

3.	Random samples of two brands of whole milk are checked for amount of fat in grams. 25 half-gallon containers of each brand are selected and the fat content in grams is selected, giving the following results:
             Brand 1: 30, 26, 31, 27, 37, 28, 31, 29, 25, 26,33,30, 28, 27, 31, 35, 30,
                     36, 35, 32, 27, 29,33, 27, 30
      Brand 2:  24, 27, 22,31, 30, 25, 22, 26, 29,33, 20, 18,26, 25, 20,22, 24, 
                      17, 21, 18,25, 27, 24, 24, 20)

a.	Test the hypothesis that the brands are the same, using the proper formula. 
b.	Test the hypothesis using t.test and show that the results are the same. 
c.	Use t.test without the assumption that the variances are the same and compare the results.

4.	A die is thrown 120 times leading to the following results:
1	2	3	4	5	6
20	22	17	18	19	20

Is the die fair? Use chisq (Goodness of fit)
5.	An aptitude test was given to 206 Israeli students and 170 English students. 71 of the Israelis and 46 of the English students got high grades. 
a.	Test whether there is a difference in the students  with prop.test, using correct=FALSE.
b.	Do a goodness of fit test with chisq.test and show that you get the same results. 
c.	Test whether Israeli students are better in general with prop.test, using correct=FALSE and alternative = "g".

6.	The text file below contains observations of the breaking strength of bags manufactured with different amounts of pulp.
a.	Are they all the same, or does the percent of pulp make a difference.
b.	If they are shown to be different, which pairs are the same, and which differ?  
Concen.	1	2	3	4	5	6
5%		7	8	15	11	9	10
10%		12	17	13	18	19	15
15%		14	18	19	17	16	18
20%		19	25	22	23	18	20
Helpful functions: 
fit=aov (obs ~ percent)
summary (fit)
TukeyHSD (fit)
library (gplots)
plotmeans(obs ~ percent, xlab="Hardwood Concentration", ylab="Mean Observations", main="Mean Plot\nwith 95% CI")
plot(TukeyHSD(fit))

7.	Paints can be applied to aluminum surfaces by 2 methods: dipping and spraying. We wish to examine 3 kinds of paints for adhesion. The following results were obtained: 
Type	Method 	Adhesion
a	Dipping		4
a	Dipping		4.5
a	Dipping		4.3
a	Spraying		5.4
a	Spraying		4.9
a	Spraying		5.6
b	Dipping		5.6
b	Dipping		4.9
b	Dipping		5.4
b	Spraying		5.8
b	Spraying		6.1
b	Spraying		6.3
c	Dipping		3.8
c	Dipping		3.7
c	Dipping		4
c	Spraying		5.5
c	Spraying		5
c	Spraying		5
a. Which factors are significant?
b. Which factors are not significant?
c. For every combination of Method and type gives the mean.
d. For every combination of Method and type gives the standard deviation.

Helpful functions: 
aov = aov(Adhesion ~ Type*Method)
summary(aov)
table(Method,Type)
aggregate(Adhesion, by=list(Method,Type), FUN=mean)
aggregate(Adhesion, by=list(Method,Type), FUN=sd)

8.	Using the data frame women (automatically accessible in r):
a.	Find the regression coefficients for weight as a function of height
b.	Are the coefficients significant?
c.	Graph the regression line.
Helpful functions: 
fit <- lm(weight ~ height, data=women) # lm is: linear model
summary(fit)
#plotting the regression line
plot(women$height,women$weight,
     main="Women Age 30-39", 
     xlab="Height (in inches)", 
     ylab="Weight (in pounds)") #x-axis is height, y is weight
# add the line of best fit
 abline(fit) # shows best fitting lines
 res = residuals(fit) # shows difference between y-i and y-hat
 # setting up residual graph. Clear the previous graph by pressing the "All clear" button 
x= c(1:15);x    
 z = rep (0,15);z
 plot (x, res, type = "p")
 lines (x, z, type = "l")
 
# the f statistic
9.	On the same data as the previous question:
a.	Perform a polynomial regression where both height and height squared re independent variables.
b.	Are the coefficients significant?
c.	Graph the regression line.
Helpful functions:
fit2 <- lm(weight ~ height + I(height^2), data=women) 
plot(women$height,women$weight,
     main = "Women Age 30-39",
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
summary(fit2)
lines(women$height,fitted(fit2))

10.	Using the internally defined 50x2 matrix state.x77:
a.	Find the regression of the number of murders based on population, illiteracy, income, and frost. 
b.	Which  coefficients are significant?
Helpful functions:
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
summary(fit)

11.	Project: Consider the following data (Shirts.txt in Moodle), which describes the strength of  a shirt  (which makes it harder to tear).  64 specimens were taken and the country of manufacture,  the material, the quality of material, and the amount of a special dye which is supposed to prevent tearing.
   Strength   Origin  	Material 	Quality  	 dye
1      30.2    China   	Flannel      	10  	  	1.14
2      26.1    China   	Flannel      	8 		1.11
3      39.5    China     	Rayon     	13		2.45
4      48.6     Vietnam     Rayon     	17 		2.79
5      34.3    China 	Polyester      	11	 	0.81
6      35.1    Thailand 	Polyester     	12	 	1.68
7      34.7    Thailand     Rayon      	10 		0.23
8      33.6       China 	Polyester      	12 		2.51
9      48.7       Vietnam  Flannel      	22 		1.84
10     47.6      Vietnam 	 Polyester      	21 		2.95
11     35.0      Thailand	 Polyester      	13 		1.02
12     25.4       China  	 Flannel      	19 		0.11
13     38.2       China      Rayon      	15 		1.87
14     36.8       India   	 Flannel      	14 		1.59
15     35.1    	  China 	 Polyester      	13 		0.05
16     35.3      Thailand  Flannel      	14 		1.53
17     33.8      India 	        Polyester      	11 		0.54
18     44.2      Vietnam   Rayon      	17 		0.70
19     56.4     Vietnam    Rayon      	23 		0.19
20     47.7      Vietnam  	Polyester      	19 		0.69
21     44.6      China       	Rayon      	17 		0.24
22     30.2       India     	Rayon      	12 		1.35
23     25.0       China   	Flannel       	7 		2.12
24     34.9       China 	Polyester      	12 		1.29
25     34.7       India 	Polyester      	11 		0.02
26     33.6       India 	Polyester      	11 		2.60
27     32.5       India   	Flannel      	10 		0.78
28     34.1      China    	Polyester      	10 		2.44
29     39.1      India   	Flannel      	15 		1.19
30     26.8      China   	Flannel       	8 		2.26
31     37.9      India 	Polyester      	16 		2.53
32     36.4      India 	Polyester      	16 		1.37
33     37.8      India 	Polyester      	17 		0.11
34     36.6      China 	Polyester      	15 		1.55
35     35.4      Vietnam Polyester      	13 		1.44
36     34.6      India 	Polyester      	14 		1.11
37     33.8   Vietnam   	Flannel      	12 		2.76
38     37.1  Vietnam     	Rayon      	16 		0.12
39     34.0    India 	Polyester      	13 		2.21
40     28.1    India     	Rayon       	6 		0.35
41     27.6 Thailand     	Rayon       	6 		0.76
42     30.1    India    	Rayon       	9 		0.11
43     34.6    China 	Polyester      	11 		2.17
44     35.9    China 	Polyester      	12 		0.62
45     34.7    India 	Polyester      	10 		0.02
46     43.6    China     	Rayon      	19 		0.32
47     35.9    India 	Polyester       	9 		0.33
48     43.5    India  	Flannel      	19 		2.90
49     35.8    China 	Polyester      	16 		1.99
50     32.6    India     	Rayon      	13 		0.33
51     37.3   Thailand     Rayon      	15 		1.38
52     34.6    China 	Polyester      	14 		0.64
53     35.5    India 	Polyester      	15 		2.81
54     46.8    India   	Flannel      	20 		0.85
55     39.1    India       	Polyester       	9 		2.92
56     37.5    India     	Rayon       	8 		2.05
57     36.6    India 	Polyester      	11 		2.03
58     33.6    China     	Rayon     	13 		2.20
59     34.1    China     	Rayon      	15 		1.24
60     48.7    India   	Flannel      	19 		2.55
61     35.7   Thailand    Rayon      	13 		0.28
62     36.8    China 	Polyester      	13 		1.99
63     34.3    China 	Polyester      	12 		0.33
64     36.7    China   	Flannel       	7 		0.41

We wish to write a  program with many options, namely:
a.	Test a linear relationship between Strength of the shirt, and quality of material. Plot the relationship and determine if it is significant.
b.	Test a quadratic relationship between Strength of the shirt, and quality of material. Plot the relationship and determine if it is significant.
c.	Test a linear relationship between Strength of the shirt, and quality of material and amount of die.
d.	We wish to examine country of origin. Display relative frequency as a pie chart, 3D pie chart, and as a bar graph.
e.	Concerning the strength, we wish to determine basic measures, such as:
Mean, sample standard deviation, population standard deviation, median, Inter quartile range, 25, 50, 75, and 90th percentiles, range, and mode.
f.	For the strength variable, prepare a histogram, and determine the midpoint of the class with the greatest frequency.  
g.	For the strength variable, prepare a boxplot and stem and leaf plot. 
h.	For the mean of the strength variable, find a 98% confidence interval.
i.	For the origin, find a 98% confidence interval for the probability that  a randomly chosen shirt was manufacture in India.
j.	Is there a difference in the expected strength of shirts from different countries?  Which pairs are significantly different from each other?
k.	Is there a difference in the expected strength of shirts from different countries and different materials?  
l.	Is there any interaction between different countries and different materials?  
m.	What are the means for each country?
n.	What are the means for each material?
o.	What are the means for each country together with each material?

