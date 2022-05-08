# 0-Basics of R-A

big.head = 10
big.head

# Numeric variables
x = 10.5            # assign a decimal 
x                   # print x 
class(x)  
k = 1 
k           	      # prints 1
class(k)            # prints "1"numeric"
is.numeric (8.9)    # prints TRUE


#Integer variables
y = as.integer(3) 
y                   # prints 3
class(y)            # prints  class name, i.e. "integer"
is.integer(y)       # is y an integer? Prints TRUE
as.integer(3.14)    # integer cast. . Prints 3

#Logical variables
x = 1; y = 2 	      # sample values. ; allows more than one command on a line 
z = x > y           # is x larger? 
z 		              # prints FALSE 
class(z) 		        # print "logical" 

# Standard logical operations are & (and), | (or), and ! (negation), == (equal). 
u = TRUE; v = FALSE 
u & v 	          	# u AND v,   Prints FALSE

u | v 	        		# u OR v,  Prints TRUE

!u                  # not u,  Prints FALSE

as.integer(TRUE) 		# prints 1
as.integer(FALSE)   # prints 0


#Character variables
s = "Brevity is the soul of wit." 
nchar(s)                                   # prints 27

x = as.character(3.14) 
x 			           # prints "3.14" 
class(x) 		       # prints   "character"


#  parse a string for decimal values  
as.integer("5.27")  # parse string. outputs 5 
 
as.integer("Joe")   # gives error

# merge two character strings into one with the function paste. 

fname = "Joe"; lname ="Smith" 
paste(fname, lname)  # Prints  "Joe Smith" 

# more convenient to create a readable string with the 
# sprintf function (string print) 

x=123.456
sprintf("%3.1f", x)        # 3 to the left and 1 rounded to right. f for numerics
sprintf("%+f", x)          # Print plus sign before number
sprintf("%+3.1f", x)        # 3 to the left and 1 rounded to right
sprintf("%f percent", x)
sprintf("%s has %d dollars", "Sam", 100)  # s for strings, d for integer values
sprintf("%s has %f dollars",  "Sam", x)     
sprintf("%s has %d dollars",  "Sam", as.integer (x))     

paste (sprintf("%f", x),"%")  # Print % sign at the end of number
paste0 (sprintf("%f", x),"%") # no space between items

cat("iteration = ",  x)                 # prints without quotes

iter = 6
cat("iteration = ",  iter + 1)          # prints iteration = 7
cat("iteration = ", iter <- iter + 1)   # prints iteration = 7
cat("iteration = ", iter <- iter + 1)   # prints iteration = 8
cat("iteration = ", iter <- iter + 1)   # prints iteration = 9

substr("Mary has a little lamb.",
        start=3, stop=12)                        # extracting

# Removing a word
first = substr("Mary has a little lamb.",
       start=1, stop=11) 

second = substr("Mary has a little lamb.",
       start=19, stop=23)

paste (first, second)

# Alternate way of removing  a word by using sub[stitute]
sub ("little", "", "Mary has a little lamb.")    # substituting

sub ("little", "big", "Mary has a little lamb.") # substituting

 
# Sample Problem 1. Calculating Salary
Hours_Worked = 35
Pay_Rate = 7.3
Tax_Rate = 0.10
Salary_Gross = Hours_Worked*Pay_Rate
Salary_Net = (1-Tax_Rate)*Hours_Worked*Pay_Rate
Tax = Tax_Rate*Hours_Worked*Pay_Rate
print (Salary_Gross)  # print only print strings
print (paste (Salary_Gross, "is the gross  salary"))
print (paste (Salary_Gross, "is the gross  salary, and ", Salary_Net,
              " is the net salary"))  
cat (Salary_Gross, "is the gross  salary")
cat (Salary_Gross, "is the gross  salary, and ", Salary_Net,
     " is the net salary")

# writing output to a file
sink ("Sample-1.txt")    # writing to a file
#paste (Salary_Gross, "is the gross  salary") #puts output in quotes
cat (Salary_Gross, "is the gross  salary")
sink()                   # back to the console
# alternate method of writing to a file
cat (Salary_Gross, "is the gross  salary, and ", Salary_Net,
     " is the net salary", file = "Sample-2.txt")
sink()
# Problem: Want it to work for different values. 
# Solution: Read in values from Notepad
getwd()                 # shows the present working directory
#Notepad
Sal=read.table ("Salary.txt", header = TRUE); Sal
#Excel
#Sal=read.table ("Salary.csv", header = TRUE, sep=","); Sal
Hours_Worked = Sal$Hours_Worked; Hours_Worked
Pay_Rate = Sal$Pay_Rate;Pay_Rate
Tax_Rate = Sal$Tax_Rate
Salary_Gross = Hours_Worked*Pay_Rate
Salary_Net = (1-Tax_Rate)*Hours_Worked*Pay_Rate
Tax = Tax_Rate*Hours_Worked*Pay_Rate; Tax
cat (Salary_Gross, "is the gross  salary, and ", Salary_Net,
     " is the net salary", "for ", Sal$First_Name,Sal$Last_Name, "\n")
#Read.table guesses the variable types
class (Hours_Worked)
class (Pay_Rate)
class (Tax_Rate)

#Alternate more succinct
with (Sal,{
  Salary_Gross = Hours_Worked*Pay_Rate
  Salary_Net = (1-Tax_Rate)*Hours_Worked*Pay_Rate
  Tax = Tax_Rate*Hours_Worked*Pay_Rate
  cat (Salary_Gross, "is the gross  salary, and ", Salary_Net,
       " is the net salary", "for ", First_Name,Last_Name)
})

# Reading input from the console

First_Name = readline(prompt = "Enter First Name: ");
Last_Name = readline(prompt = "Enter Last Name: ");

var = readline(prompt = "Enter Hours: ");
# convert the inputted value to a decimal
Hours_Worked = as.numeric(var);
var = readline(prompt = "Enter Hourly Pay: ");
# convert the inputted value to a decimal
Pay_Rate = as.numeric (var);
var = readline(prompt = "Tax Rate: ");
# convert the inputted value to a decimal
Tax_Rate = as.numeric (var);
Salary_Gross = Hours_Worked*Pay_Rate
Salary_Net = (1-Tax_Rate)*Hours_Worked*Pay_Rate
Tax = Tax_Rate*Hours_Worked*Pay_Rate
cat (Salary_Gross, "is the gross  salary, and ", Salary_Net,
     " is the net salary", "for ", First_Name,Last_Name)

#Vectors 
vec1 = c(2, 3, 5); vec1                             
vec2 =  c(TRUE, FALSE, TRUE, FALSE, FALSE) ; vec2
vec3 = c("aa", "bb", "cc", "dd") ; vec3 
vec4 = c(10:15); vec4             # defines vector with members 10,11,12,13,14,15
length(vec3)                    #finds length of vector v3 
c(vec1, vec3)                   #concatenates vec3 to vec1
 
#vector arithmetic

a = c(1, 3, 5, 7);  b = c(1, 2, 4, 8) #defining vectors
5 * a          #  Output:  [1] 5 15 25 35 
sqrt (a)       #  Output:  [1] 1.000000 1.732051 2.236068 2.645751
a + b 			   #  Output:  [1] 2 5 9 15 
a - b          #  Output:  [1] 0 1 1 -1 
a * b          #  Output:  [1] 1 6 20 56 
a / b          #  Output: [1] 1.000 1.500 1.250 0.875 

u = c(10, 20, 30) 
v = c(1, 2, 3, 4, 5, 6, 7, 8, 9) 
u + v          # recycling. Output:  [1] 11 22 33 14 25 36 17 28 39 

w = c(10, 20, 30, 40) 
w + v          # recycling with warning. [1] 11 22 33 44 15 26 37 48 19   

# vector indices
s = c("aa", "bb", "cc", "dd", "ee") 
s[3]            #  Output:  [1] "cc" 
s[-3]           #  Stripping a member temporarily. Output:  [1] "aa" "bb" "dd" "ee" 
s[10] 	        # out of range. Output: [1] NA 
s = c("aa", "bb", "cc", "dd", "ee") 
s[c(2, 3)]      # slicing a vector   Output:  [1] "bb" "cc" 
s[c(2, 3, 3)]   #  Output:  [1] "bb" "cc" "cc" 
s[c(2, 1, 3)]   #  Output: [1] "bb" "aa" "cc" 
s[2:4]          #  Output:  [1] "bb" "cc" "dd"
L = c(FALSE, TRUE, FALSE, TRUE)     #logical index vector
s[L]                                #  Output:  [1] "bb" "dd"                                                                 
s[c(FALSE, TRUE, FALSE, TRUE)]      #in 1 line:   Output: [1] "bb" "dd" 
s; s=s[-3]; s   # Stripping a member permanently
# Naming vector members
v = c("Mary", "Jones") 
names(v) = c("First", "Last"); v    #. assigning names to the members
#  Output:           First            Last 
#                    "Mary"          "Jones" 
v["First"]                          #  Output: [1] "Mary"
v[c("Last", "First")]               # Output:  Last        First 
                                    #         "Jones"      "Mary
#alternative way of naming components
codes = c(italy = 380, canada = 124) # naming components.  
                                     # names only appear when components printed
codes [1]
sum (codes)
codes["canada"]
codes

#adding an element
append (v, "Cohen")
append (names (v), "Married")
v2 = append (v, "Cohen"); v2
names (v2) = append (names(v), "Married")
v2
v3 = append (v,"Sue", 1);v3         #appending after position 1
names (v3) = append (names(v), "Middle",1); v3

rep  (3, 5); rep ("HI", 3); rep ((1:7),2)   #replicating
# generating a vector with 5 3's
y = rep (3,5); y


#vector functions
n=10
#generates a vector of 1 until n
x= seq (1, n); x
class (x)
y=c(1:10);y      # alternate method
class (y)

sum (x)               # sums components of vector - here 55
mean (x)              # finds average of values in vector x = here 5.5
var  (x)              #sample variance - here 9.1666
(n-1)/n * var (x)     # population variance of values in x 
sd (x)                #sample standard deviation
sqrt((n-1)/n) * sd(x) #population standard deviation

crossprod (x)         # the dot product of x with itself. 
                    # sum of each component squared

# finding the weighted mean
z= c(30,40); wt = c(1,4)
wm = weighted.mean (z, wt);wm   # weighted mean

#Matrices

m = matrix (1:20, 4, 5); m       # columns contain 1-4, 5-8, etc.
A = matrix(c(2, 1, 4, 5, 3, 7), nrow=2); A
B = matrix( c(2, 1, 4, 5, 3, 7), nrow=2,  byrow=TRUE); B
A[2,3]; A[2, ]; A[ ,3] 
C= A[2, ];C
crossprod (C)
A[,3, drop=FALSE] 
A[,c(1,3)]               #extracting 2 columns together

#3.2 Matrix Transformations
B = matrix(c(2, 4, 3, 1, 5, 7),  nrow=3) ; B
t(B)    #transpose
C = matrix( c(7, 4, 2),  nrow=3) ; C   
cbind(B, C)                # combining matrices
D = matrix( c(6, 2),   ncol=2) ; D      # D has 2 columns. Output:
rbind(B, D)      # combining rows
A = matrix(1:6, nrow=3); A                # Output
B = matrix(5:10, nrow=3); B               # Output
A + B
A - B                                                 
C = matrix(1:12, nrow=3);  C              #Output
D = matrix(-4:15, nrow=4); D              #Output
C %*% D                                   #Matrix Multiplication Output 

#Finding weighted population variance
z= c(30,40); wt = c(1,4)
wm = weighted.mean (z, wt);wm   # weighted mean
z_sq = z^2;z_sq                 # sum of squares of observations
t(wt)%*%z_sq/sum (wt) - wm^2    # row of weights times observations squared
                                # - the weighted mean squared.

#Lists

n = c(2, 3, 5) 
s = c("aa", "bb", "cc", "dd") 
b = c(TRUE, FALSE, TRUE, FALSE) 
x = list(n, s, b, 3);x
y = x [2]; y  #list slicing. Accesses the entire second element of the list. 
x[c(2, 4)]    # with index vector

# Member of a member
y=x[[2]][1]   # accessing a member of a member of a list
y
y = x [2]; y  # list with 1 member


y=c (y[[1]][1], y[[1]][2]); y 
y [1]
y = as.vector (x[[2]])
y [3]

#named members
v = list( bob=c(2, 3, 5), john=c("aa", "bb")); v

v["bob"] 

v[c("john", "bob")]

# Member Access 

v[["bob"]]       # gives content of member without name of member

v$bob            # alternative for accessing contents of list member

#Search Path Attachment 

attach(v) 
bob 
detach(v)

# Using lists to assign row and column names
A = matrix(c(2, 1, 4, 5, 3, 7), nrow=2); A
dimnames (A) = list(c("row1", "row2"), c("col1", "col2", "col3")) 
A 


#dataframes
f = data.frame (n, s, b);f

# reading in a table
Sal=read.table ("Salary-2.txt", header = TRUE); Sal

#adding 3 columns to the data frames in the data set
Sal = transform (Sal,
                 Salary_Gross = Hours_Worked * Pay_Rate,
                 Salary_Net = (1-Tax_Rate) * Hours_Worked * Pay_Rate,
                 Tax = Tax_Rate*Hours_Worked*Pay_Rate);Sal

# Showing the new structure of the data set
str (Sal)
Sal$First_Name         #accessing first column
Sal [,1]               #accessing first column
Sal [[1]]              #accessing first column
Sal [1,]               #accessing first row
Sal$First_Name [2]     #accessing first column, second row
Sal [2,1]              #accessing first column, second row
Sal ["2", "First_Name"]#accessing first column, second row
rownames (Sal) = c(123, 456)
Sal ["123",]           #accessing by row name


#Built-in data frames

str (mtcars)          #structure of  the data  frame
head (mtcars)         # start of the data frame
mtcars                # contents of the data frame
mtcars[1, 2] 
mtcars["Mazda RX4", "cyl"] 
nrow(mtcars)	        # number of rows 
ncol(mtcars) 		      # number of columns 

# retrieving columns - column vectors
mtcars [[9]]           #shows contents of column 9
mtcars [,"am"]
mtcars$am

# retrieving columns - column slices
mtcars [1]              #shows contents of column 9 with rownames. column slice
mtcars ["mpg"]          #shows contents of column 9 with rownames

sink ("cars.txt", append = TRUE, split=TRUE)    # appends to cars file and split 
                                                # sends it both to the file and screen
mtcars[c("mpg", "hp")]
sink()

# retrieving row slices

mtcars[24,]              #shows contents of row 24
mtcars[c(3, 24),]        #shows contents of rows 3 and 24
mtcars ["Camaro Z28",]   # displaying a specific row
mtcars[c("Datsun 710", "Camaro Z28"),] #shows contents of 2 rows

#  Logical Indexing 

L = mtcars$am == 0; L 
mtcars[L,]                # cars with automatic transmission i.e. at = 0
mtcars[L,]$mpg            # gas mileage for automatic transmission

#Factor variables. Variables that can only take upon themselves specific values
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
sex = c(1,2,1,3)
diabetes <- c("Type1", "Type2", "Type1", "Type3")
status <- c("Poor", "Improved", "Excellent", "Poor")

# sex is made into a factor allowing only 1 and 2 printed as Male and Female in that order
sex = factor(sex, levels = c(1,2), label = c("Male", "Female"))
diabetes <- factor(diabetes, levels = c("Type1", "Type2"))   # made into a factor variable. 
# each category will be recorded
status <- factor(status, levels = c("Poor", "Excellent"), order=TRUE)  # order parameter 
# determines the order in which output will appear. Poor = 1, Excellent = 2
patientdata <- data.frame(patientID, age, diabetes, status, sex);patientdata
str(patientdata)   
summary(patientdata) 

#easy way to delete columns
# df = subset (patientdata,select = -age);df        #deleting 1 column
df = subset (patientdata,select = -c(age, sex));df  #deleting 2 columns
df2 = patientdata [-2]; df2
df3 = patientdata [-c(2,5)]; df3
df4 = patientdata [-c(2:3)]; df4

#choosing specific columns
df5 = subset (patientdata,select = c(age, sex));df5  
