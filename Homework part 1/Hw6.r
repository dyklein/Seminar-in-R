student.name = c("dan","bob","sam","karl")
math = c(80,70,60,50)
physics = c(80,70,60,50)
chemistry = c(80,70,60,50)
psychology = c(80,70,60,50)
history = c(80,70,60,50)
sex = c("male","male","female","male" )
disabilities = c("no", "yes", "no","no")
origin = c("israel", "fake", "us","other")

sex <- factor(sex,levels=c("male","female"))
disabilities  <- factor(disabilities,levels=c("yes","no"))
origin  <- factor(origin,levels=c("israel","us","france","switzerland","austria","belgium","other"))

data <- data.frame(student.name,math,physics,chemistry,psychology,history,sex,disabilities,origin)
data
 
rownames(data) <- student.name
data

data <- subset(data, select = -student.name)
data

data["dan",]

