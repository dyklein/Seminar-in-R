#HW 10: Create a bar graph describing the distribution of Country of Origin
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


data <- data.frame(student.name,math,physics,chemistry,psychology,history,sex,disabilities,origin)
data

total = length(student.name)
total <- rep(as.integer(1), total)

data <- cbind(data,total)
data1 <- aggregate(data$total, by=list(origin=data$origin), FUN=sum)



# Create the data for the chart
M <- as.vector(data1$origin)
M
H <-  as.vector(data1$x)
H
# Give the chart file a name
png(file = "barchart_country_origin.png")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Country",ylab="Number",col="blue",
        main="Country chart",border="red", las = 2)

# Save the file
dev.off()

