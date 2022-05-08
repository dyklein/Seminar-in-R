student.name = "jack stein"
science.courses = c(60, 50, 40)
social.science = c(30,20)

first = "had an average of"
second = "in his science courses and"
third = "in his social science courses. His overall average was"
paste(student.name, first , mean(science.courses), second, mean(social.science), third , (sum(science.courses) + sum(social.science))/ (length(science.courses)+length(social.science)) )







