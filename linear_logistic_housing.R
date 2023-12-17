housing <- data.frame(
  rooms = c(10, 15, 19, 22, 26, 27, 29, 33, 35, 40), 
  rent = c(60, 65, 70, 72, 75, 78, 80, 90, 93, 100),    
  loan = c(0, 1, 1, 1, 0, 0, 1, 1, 0, 0)
)
print(housing)
library(ggplot2)

lm_model <- lm(rent ~ rooms, data = housing)

summary(lm_model)

ggplot(housing, aes(x = rooms, y = rent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Linear Regression: rent vs rooms")

housing$high_rent <- ifelse(housing$rent > 75, 1, 0)

logit_model <- glm(high_rent ~ rooms + loan, 
                   data = housing, family = binomial)

summary(logit_model)

ggplot(housing, aes(x = rooms, y = high_rent)) +
  geom_point() +
  stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +
  labs(title = "Logistic Regression: Probability of High rent vs rooms")
