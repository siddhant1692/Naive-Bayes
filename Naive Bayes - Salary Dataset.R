

SalaryData_Train <- read.csv('D:\\Data Science\\Excelr\\Assignments\\Assignment\\Naive Bayes\\SalaryData_Train.csv')
SalaryData_Test <- read.csv('D:\\Data Science\\Excelr\\Assignments\\Assignment\\Naive Bayes\\SalaryData_Test.csv')


## Training a model on the data ----
library(e1071)
salary_classifier <- naiveBayes(SalaryData_Train, SalaryData_Train$Salary)


## Step 4: Evaluating model performance ----
salary_test_pred <- predict(salary_classifier, SalaryData_Test)

library(gmodels)
CrossTable(salary_test_pred, SalaryData_Test$Salary,
           prop.chisq = FALSE, prop.t = FALSE, prop.r = FALSE,
           dnn = c('predicted', 'actual'))
## Step 5: Improving model performance ----
salary_classifier2 <- naiveBayes(SalaryData_Train, SalaryData_Train$Salary, laplace = 1)
salary_test_pred2 <- predict(salary_classifier2, SalaryData_Test)
CrossTable(salary_test_pred2, SalaryData_Test$Salary,
           prop.chisq = FALSE, prop.t = FALSE, prop.r = FALSE,
           dnn = c('predicted', 'actual'))
