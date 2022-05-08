#HW 12: Create a histogram , cumulative frequency graph, and relative cumulative frequency graph for overall average. 
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


keep <- c("math" ,"physics", "chemistry" ,"psychology","history")
df = data[keep]
df
average <- rowMeans(df)
data <- cbind(data,average)


# Create data for the graph.
x <- as.vector(data$avera)

# Give the chart file a name.
png(file = "histogram.png")

# Create the histogram.
hist(x,xlab = "avergae",col = "yellow",border = "blue")

# Save the file.
dev.off()

x <- as.vector(data$average)
#Your code
factorx <- factor(cut(x, breaks=nclass.Sturges(x)))
#Tabulate and turn into data.frame
xout <- as.data.frame(table(factorx))
xout
#Add cumFreq and proportions
xout <- transform(xout, cumFreq = cumsum(Freq), relative = prop.table(Freq))
xout                  

# Create the data for the chart.
v <- x <- as.vector(xout$cumFreq)

# Give the chart file a name.
png(file = "cumulative_frequency .jpg")

# Plot the bar chart. 
plot(v,type = "o",xlab = "range")

# Save the file.
dev.off()

# Create the data for the chart.
v <- cumsum(as.vector(xout$relative))
v
# Give the chart file a name.
png(file = "relative_cumulative_frequency .jpg")

# Plot the bar chart. 
plot(v,type = "o",xlab = "range",)

# Save the file.
dev.off()


