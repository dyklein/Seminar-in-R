data <- read.csv("hw2.csv")

science.courses = c(data$math , data$physics , data$chemistry)
science.weight = c(6,6,3)
social.science = c(data$psychology , data$history)
social.weight = c(5,3)
first = "had an average of"
second = "in his science courses and"
third = "in his social science courses. His overall average was"
all.class = c(science.courses,social.science)
all.weight = c(science.weight,social.weight)
paste(data$ï..student.name, first , weighted.mean(science.courses,science.weight), second, weighted.mean(social.science,social.weight), third 
      , (weighted.mean(all.class,all.weight)))







