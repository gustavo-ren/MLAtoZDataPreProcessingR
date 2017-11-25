#Import library
library(readr)

#Reading the dataset
dataset <-read.csv("C:\\Users\\Gustavo\\Documents\\Big data e Cloud\\Machine_Learning_AZ_Template_Folder\\Machine Learning A-Z Template Folder\\Part 1 - Data Preprocessing\\Data_Preprocessing\\Data.csv")

#Replacing missing values on column Age
dataset$Age <- ifelse(is.na(dataset$Age),
                      ave(dataset$Age, FUN = function(x)mean(x, na.rm = TRUE)),
                      dataset$Age)

#Replacing missing values on column Salary
dataset$Salary <- ifelse(is.na(dataset$Salary),
                      ave(dataset$Salary, FUN = function(x)mean(x, na.rm = TRUE)),
                      dataset$Salary)

                          #Column to be used
dataset$Country <- factor(dataset$Country,
                          levels = c("France", "Spain", "Germany"),#Vector with the values of the column
                          labels = c(1, 2, 3))#Labels that will replace it
dataset$Purchased <- factor(dataset$Purchased,
                            levels = c("No", "Yes"),
                            labels = c(0, 1))

library(caTools)
set.seed(12)#Used to get the same results everytime

#In R there is no need to split both dependent and independent variables
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)


#Scaling the training set
training_set[, 2:3] <- scale(training_set[, 2:3])
View(training_set)

#Scaling the test set
test_set[, 2:3] <- scale(test_set[, 2:3])
View(test_set)
