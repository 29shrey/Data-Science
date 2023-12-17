library(randomForest)
library(caTools)
# user ID
user_id <- 1:1000
# age (assumed values between 20 and 70)
age <- sample(20:70, 1000, replace = TRUE)
# gender (assuming two genders: Male and Female)
gender <- sample(c("Male", "Female"), 1000, replace = TRUE)
# balance (assumed values between 15000 and 250000)
balance <- sample(15000:250000, 1000, replace = TRUE)
loans <- sample(c("TRUE", "False"), 1000, replace = TRUE)

# Create the banking dataset
banking_dataset <- data.frame(
  userID = user_id,
  age = age,
  gender = gender,
  balance = balance,
  loans = loans
)

banking_dataset$gender <- as.factor(banking_dataset$gender)
banking_dataset$loans <- as.factor(banking_dataset$loans)

# Print the healthcare dataset
print(banking_dataset)

# Save the healthcare dataset to a CSV file
csv_file_path <- "banking_dataset.csv"
write.csv(banking_dataset, file = csv_file_path, row.names = TRUE)

# Print a message indicating where the file was saved
cat("Banking dataset saved to:", csv_file_path, "\n")

split<-sample.split(banking_dataset,SplitRatio=0.7)

train<- subset(banking_dataset,split==TRUE)
test<-subset(banking_dataset,split==FALSE)

input<-train[,2:4]
target<-train[,5]

model<-randomForest(input,target,data = train,class.f=TRUE)

pred <- predict(model,test)
pred

cm<-table(pred,test$loans)
cm

plot(model)
varImpPlot(model)
importance(model)
summary(model)
