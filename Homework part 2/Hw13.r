#HW 13: Create a boxplot for overall average. 
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
math = c(80,70,60,50,78,50,64,85,95,76,82,74,95,72)
physics = c(80,70,60,50,80,70,60,50,78,50,64,85,95,76)
chemistry = c(80,70,60,50,60,50,80,70,60,50,78,50,85,85)
psychology = c(80,70,60,50,80,70,60,50,60,50,80,70,97,95)
history = c(80,70,60,50,70,60,50,80,70,60,50,78,100,64)
sex = c("male","male","female","male","male","male","female","male","male","male","female","male","male","male" )
disabilities = c("no", "yes", "no","no", "no","no", "no","no", "no","no", "no","no", "no","yes")
origin = c("israel", "england", "us","other","israel","france","belgium","us","switzerland","us","austria","other","israel","us")


data <- data.frame(student.name,math,physics,chemistry,psychology,history,sex,disabilities,origin)
data


keep <- c("math" ,"physics", "chemistry" ,"psychology","history")
df = data[keep]
df
average <- rowMeans(df)
data <- cbind(data,average)
data
stem(data$average)

write.csv(data,"Hw13.csv", row.names = FALSE)

# Give the chart file a name.
png(file = "boxplot.png")

v <- data$average
# Plot the chart.
boxplot(data$average, col = "green",xlab = "average", ylab = "scores")

# Save the file.
dev.off()
