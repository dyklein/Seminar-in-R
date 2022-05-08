data <- read.csv('hw2.csv')
write.csv(data, file = 'test.csv')
science.courses = c(data$math , data$physics , data$chemistry)
social.science = c(data$psychology , data$history)
names = c(data$student.name)
first = "had an average of"
second = "in his science courses and"
third = "in his social science courses. His overall average was"
k=0
for (i in names) {
   cat(paste(names[(1 + k)], first , mean(science.courses[(1 + k)] , 
                                                       science.courses[(3 + k)], science.courses[(5 + k)] ), 
                            second, mean(social.science[1 + k] , social.science[3 + k]), third, 
                            (science.courses[1 + k] + science.courses[3 + k] + science.courses[5 + k] + 
                                                social.science[1 + k] + social.science[3 + k] )/ 5 , "\n" ))
    k = k +1
}
# Taking input from the user
new.name = readline(prompt = "Enter Name: ");   # all input in lower part of scree
new.math = readline(prompt = "Enter math: ")
new.math = as.numeric(new.math)
new.physics = readline(prompt = "Enter physics: ")
new.physics = as.numeric(new.physics)
new.chemistry = readline(prompt = "Enter chemistry: ")
new.chemistry = as.numeric(new.chemistry)
new.psychology = readline(prompt = "Enter psychology : ")
new.psychology = as.numeric(new.psychology)
new.history = readline(prompt = "Enter history: ")
new.history = as.numeric(new.history)

 newdata <- data.frame(
    ï..student.name = new.name,
    math = new.math,
    physics = new.physics,
    chemistry = new.chemistry,
    psychology = new.psychology,
    history = new.history
    
 )
 data <- rbind(data, newdata)
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 