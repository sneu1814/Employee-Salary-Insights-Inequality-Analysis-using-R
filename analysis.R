# Load libraries
library(dplyr)
library(ggplot2)

# Create sample dataset
df <- data.frame(
  name = c("A","B","C","D","E"),
  age = c(25,30,28,35,40),
  department = c("HR","IT","IT","Finance","HR"),
  salary = c(40000,60000,55000,70000,65000),
  experience = c(2,5,4,8,7)
)

# Data exploration
head(df)
summary(df)

# Handle missing values
df$salary[is.na(df$salary)] <- mean(df$salary, na.rm = TRUE)

# Correlation
cor(df$experience, df$salary)

# Average salary by department
avg_salary <- df %>%
  group_by(department) %>%
  summarise(avg_salary = mean(salary))

# Visualization
ggplot(avg_salary, aes(x = department, y = avg_salary)) +
  geom_bar(stat = "identity")

ggplot(df, aes(x = experience, y = salary)) +
  geom_point()
