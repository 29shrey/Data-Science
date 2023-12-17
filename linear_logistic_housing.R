housing <- data.frame(
  rooms = c(10, 15, 19, 22, 26, 27, 29, 33, 35, 40), 
  rent = c(60, 65, 70, 72, 75, 78, 80, 90, 93, 100),    
  loan = c(0, 1, 1, 1, 0, 0, 1, 1, 0, 0)
)
print(housing)
library(ggplot2)

# Perform linear regression on the created weather dataset
lm_model <- lm(rent ~ rooms, data = housing)

# Summary of linear regression model
summary(lm_model)

# Plotting the linear regression line
ggplot(housing, aes(x = rooms, y = rent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Linear Regression: Humidity vs Temperature")

# Add a binary variable 'high_humidity' indicating high humidity (>65%) or not
housing$high_rent <- ifelse(housing$rent > 75, 1, 0)

# Logistic regression model
logit_model <- glm(high_rent ~ rooms + loan, 
                   data = housing, family = binomial)

# Summary of logistic regression model
summary(logit_model)

# Plotting logistic regression isn't straightforward as linear regression due to classification nature.
# However, you can visualize the relationship between variables.

# For instance, you can visualize the relationship between Temperature and probability of high humidity.
ggplot(housing, aes(x = rooms, y = high_rent)) +
  geom_point() +
  stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +
  labs(title = "Logistic Regression: Probability of High Humidity vs Temperature")

