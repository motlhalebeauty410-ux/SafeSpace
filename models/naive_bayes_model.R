#############################################################
# SafeSpace
# 05_Naive_Bayes_Model.R
# Suicide Risk Prediction
#############################################################

#############################################################
# Load Packages
#############################################################

library(tm)
library(caret)
library(e1071)

#############################################################
# Load Clean Dataset
#############################################################

suicide_data <- read.csv(
  "data/suicide_clean.csv",
  stringsAsFactors = FALSE
)

#############################################################
# Create Text Corpus
#############################################################

corpus <- VCorpus(
  VectorSource(
    suicide_data$text
  )
)

#############################################################
# Text Cleaning
#############################################################

corpus <- tm_map(
  corpus,
  content_transformer(tolower)
)

corpus <- tm_map(
  corpus,
  removePunctuation
)

corpus <- tm_map(
  corpus,
  removeNumbers
)

corpus <- tm_map(
  corpus,
  removeWords,
  stopwords("english")
)

corpus <- tm_map(
  corpus,
  stripWhitespace
)

corpus <- tm_map(
  corpus,
  stemDocument
)

#############################################################
# Document Term Matrix
#############################################################

dtm <- DocumentTermMatrix(corpus)

#############################################################
# Remove Sparse Terms
#############################################################

dtm <- removeSparseTerms(
  dtm,
  0.995
)

#############################################################
# Convert to Matrix
#############################################################

dtm_matrix <- as.matrix(dtm)

#############################################################
# Convert Class
#############################################################

suicide_data$class <- factor(
  suicide_data$class
)

#############################################################
# Split Dataset
#############################################################

set.seed(123)

train_index <- createDataPartition(
  suicide_data$class,
  p = 0.80,
  list = FALSE
)

train_x <- dtm_matrix[
  train_index,
]

test_x <- dtm_matrix[
  -train_index,
]

train_y <- suicide_data$class[
  train_index
]

test_y <- suicide_data$class[
  -train_index
]

#############################################################
# Check Split
#############################################################

cat(
  "Training:",
  length(train_y),
  "\n"
)

cat(
  "Testing:",
  length(test_y),
  "\n"
)

#############################################################
# Train Model
#############################################################

nb_model <- naiveBayes(
  x = train_x,
  y = train_y
)

#############################################################
# Display Model
#############################################################

print(nb_model)

#############################################################
# Predictions
#############################################################

nb_predictions <- predict(
  nb_model,
  test_x
)

#############################################################
# Convert Factors
#############################################################

test_y <- factor(
  test_y,
  levels = levels(train_y)
)

nb_predictions <- factor(
  nb_predictions,
  levels = levels(train_y)
)

#############################################################
# Confusion Matrix
#############################################################

confusionMatrix(
  nb_predictions,
  test_y
)

#############################################################
# Save Model
#############################################################

if(!dir.exists("models")){
  dir.create("models")
}

saveRDS(
  nb_model,
  "models/naive_bayes_model.rds"
)

#############################################################
# Verify
#############################################################

list.files("models")

#############################################################
# END
#############################################################
