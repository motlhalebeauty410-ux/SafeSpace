#############################################################
# SafeSpace
# 04_Random_Forest_Model.R
# Random Forest Depression Severity Prediction
#############################################################

#############################################################
# Load Packages
#############################################################

library(tidyverse)
library(caret)
library(randomForest)

#############################################################
# Load Clean Dataset
#############################################################

phq_data <- read.csv(
  "data/phq_clean.csv"
)

#############################################################
# Convert Severity to Factor
#############################################################

phq_data$Severity <- factor(
  phq_data$Severity,
  levels = c(
    "Minimal",
    "Mild",
    "Moderate",
    "Moderately Severe",
    "Severe"
  )
)

#############################################################
# Split Dataset
#############################################################

set.seed(123)

train_index <- createDataPartition(
  phq_data$Severity,
  p = 0.80,
  list = FALSE
)

train_data <- phq_data[train_index, ]

test_data <- phq_data[-train_index, ]

#############################################################
# Check Split
#############################################################

cat("Training Records:", nrow(train_data), "\n")
cat("Testing Records:", nrow(test_data), "\n")

#############################################################
# Train Random Forest
#############################################################

rf_model <- randomForest(
  Severity ~ phq1 + phq2 + phq3 +
    phq4 + phq5 + phq6 +
    phq7 + phq8 + phq9,
  data = train_data,
  ntree = 500,
  importance = TRUE
)

#############################################################
# Display Model
#############################################################

print(rf_model)

#############################################################
# Predictions
#############################################################

rf_predictions <- predict(
  rf_model,
  newdata = test_data
)

head(rf_predictions)

#############################################################
# Confusion Matrix
#############################################################

confusionMatrix(
  rf_predictions,
  test_data$Severity
)

#############################################################
# Variable Importance
#############################################################

varImpPlot(
  rf_model,
  main = "Random Forest Variable Importance"
)

#############################################################
# Save Model
#############################################################

if (!dir.exists("models")) {
  dir.create("models")
}

saveRDS(
  rf_model,
  "models/random_forest_model.rds"
)


#############################################################
# Verify Model
#############################################################

list.files("models")

#############################################################
# END
#############################################################
