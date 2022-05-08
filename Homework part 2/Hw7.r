# HW 7: We would like to filter out students who are not from the US or England. 
# We would like a list of those students' names and overall average arranged from 
# the highest to the lowest. The list should only contain their names, overall
# averages, and country of origin. 

student.name = c("dan","bob","sam","karl",
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
psychology = c(80,70,60,50,80,70,60,50,60,50,80,70,60,95)
history = c(80,70,60,50,70,60,50,80,70,60,50,78,50,64)
sex = c("male","male","female","male","male","male","female","male","male","male","female","male","male","male" )
disabilities = c("no", "yes", "no","no", "no","no", "no","no", "no","no", "no","no", "no","yes")
origin = c("israel", "england", "us","other","israel","france","belgium","us","switzerland","us","austria","other","israel","us")

#add all the data into a data frame
data <- data.frame(student.name,math,physics,chemistry,psychology,history,sex,disabilities,origin)
data

#select students from the us and england
selectedUS <- data[data[,"origin"]=="us",]
selectedEngland <- data[data[,"origin"]=="england",]
selected <- rbind(selectedUS,selectedEngland)
print("These are the students from US and England")
selected

#get the average of the classes
keep <- c("math" ,"physics", "chemistry" ,"psychology","history")
classes = data[keep]
average <- rowMeans(classes)
data <- cbind(data,average)
data2 <- data[,c("student.name","average","origin")]

#print average in order
pritn("here are the average in order")
data2 <- data2[order(-average),]
data2
