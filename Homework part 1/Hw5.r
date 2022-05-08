data <- read.csv("hw5.csv")

names = data$student.name
science.courses = c(data$math , data$physics , data$chemistry)
science.weight = c(6,6,3)
social.science = c(data$psychology , data$history)
social.weight = c(5,3)
first = "had an average of"
second = "in his science courses and"
third = "in his social science courses. His overall average was"
fourth = "with a standard deviation of "

k=1
i=0
add.sci = c()
add.sco = c()
add.all = c()
while (i < length(names)) {

  temp1 = c(data$math[k] , 
             data$physics[k], data$chemistry[k])
  temp2 = c(data$psychology[k] , data$history[k])
  all.class = c(temp1,temp2)
  all.weight = c(science.weight,social.weight)
  
  add.sci = append(add.sci, weighted.mean(temp1,science.weight))
  
  add.sco = append(add.sco, weighted.mean(temp2,social.weight))
  
  add.all = append(add.all, weighted.mean(all.class, all.weight))
  k = k +1
  i = i + 1
}

#add new column using tranform

data = transform(data,
                 weighted.sci = add.sci,
                 weighted.sco = add.sco,
                 weighted.all = add.all);data

#add new column using other
data2 <- data
data2["weighted.sci"]<- add.sci
data2["weighted.sco"]<- add.sco
data2["weighted.all"]<- add.all

