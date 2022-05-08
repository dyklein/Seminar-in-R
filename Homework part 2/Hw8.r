# HW 8: Write a program that accepts a number from the console  as input., 
# and does the following, depending on the value of  the number:

library(dplyr)
student.name = c("dan","dan","sam","karl",
                 "Renzo Lee",
                 "Nyle Sparks",
                 "Corrina Kennedy",
                 "Alessio Rosario",
                 "Jevan Sawyer",
                 "Callan Bass",
                 "Samara Walmsley",
                 "Norma Walter",
                 "Kaif Villegas",
                 "Harleen Woodard")
math = c(80,70,60,50,78,50,64,85,95,76,82,74,65,72)
physics = c(80,70,60,50,80,70,60,50,78,50,64,85,95,76)
chemistry = c(80,70,60,50,60,50,80,70,60,50,78,50,64,85)
psychology = c(80,70,60,50,80,70,60,50,95,90,80,70,60,95)
history = c(80,70,60,50,70,60,50,80,70,85,90,78,50,64)
sex = c("male","male","female","male","male","male","female","male","male","male","female","male","male","male" )
disabilities = c("no", "yes", "no","no", "no","no", "no","no", "no","no", "no","no", "no","yes")
origin = c("israel", "england", "us","other","israel","france","belgium","us","switzerland","us","austria","other","israel","us")

#make a data frame
data <- data.frame(student.name,math,physics,chemistry,psychology,history,sex,disabilities,origin)
data


cat("1.	prints students' names and grades in social sciences from highest to lowest
2.	 prints students' names and average grades in social sciences from highest to lowest, on condition that the average is above 80.
3.	 prints male students' names and average grades in social sciences from highest to lowest, on condition that the average is above 80.
4.	Show all information about the best student in sciences.
5.	Show all information about the best female student in sciences.
6.	Show all information about a student, given his first and last name (assumed unique).
7.	Print student list alphabetically, including class rank (overall average), overall average, social science average, science average.
")

cat("Enter an integer or whole number : \n")
var <- as.integer(readline(prompt = ""))
cat("You sumitted : \n"); str(var)



#1.	prints students' names and grades in social sciences from highest to lowest
if (var == 1) {
  keep <- c("psychology", "history")
  data1 = data[keep]
  
  average <- rowMeans(data1)
  dataTemp <- cbind(data,average)
  data1 <- dataTemp
  data1 <- data1[order(-average),]
  data1 <- data1[,c("student.name","psychology","history")]
  print("everything")
  
  data1

#2.	 prints students' names and average grades in social sciences from highest to lowest, on condition that the average is above 80.
} else if (var == 2) {
  keep <- c("psychology", "history")
  data2 = data[keep]
  
  average <- rowMeans(data2)
  data2 <- cbind(data,average)
  data2 <- data2[order(-average),]
  
  data2 <- filter(data2, average > 80)
  data2 <- data2[,c("student.name","average")]
  print("everything")
  data2
#prints male students' names and average grades in social sciences from highest to lowest, on condition that the average is above 80.    
}else if (var == 3) {
  keep <- c("psychology", "history")
  data3 = data[keep]
  average <- rowMeans(data3)
  data3 <- cbind(data,average)
  data3 <- data3[order(-average),]
  data3 <- filter(data3, average > 80)
  data3 <- filter(data3, sex == "male")
  data3 <- data3[,c("student.name","average")]
  print("everything")
  data3
#4.	Show all information about the best student in sciences.    
}else if (var == 4) {
  keep <- c("math" ,"physics", "chemistry")
  data4 = data[keep]
  average <- rowMeans(data4)
  data4 <- cbind(data,average)
  data4 <- data4[order(-average),]
  print("everything")
  data4[1,]
#5.	Show all information about the best female student in sciences.  
}else if (var == 5) {
  keep <- c("math" ,"physics", "chemistry")
  data4 = data[keep]
  average <- rowMeans(data4)
  data4 <- cbind(data,average)
  data4 <- data4[order(-average),]
  data4 <- filter(data4, sex == "female")
  print("everything")
  data4[1,]
  
#6.	Show all information about a student, given his first and last name (assumed unique).  
}else if (var == 6) {
  cat("Enter an student whole name : \n")
  var <- readline(prompt = "")
  cat("You sumitted : \n"); str(var)
  data6 <- filter(data, student.name == var)
  data6
#7.	Print student list alphabetically, including class rank (overall average), overall average, social science average, science average. 
}else if (var == 7) {
  keep <- c("psychology", "history")
  scoData = data[keep]
  socAverage <- rowMeans(scoData)
  keep <- c("math" ,"physics", "chemistry")
  sciData = data[keep]
  sciAverage <- rowMeans(sciData)
  keep <- c("math" ,"physics", "chemistry" ,"psychology","history")
  classes <-data[keep]
  average <- rowMeans(classes)
  data7 <- cbind(data$student.name,sciAverage,socAverage,average)
  data7 <- data7[order(student.name),]
  data7
}else{
    print("wrong input")
  }

