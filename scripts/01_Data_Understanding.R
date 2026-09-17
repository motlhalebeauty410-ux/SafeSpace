#############################################################
# SafeSpace
# 01_Data_Understanding.R
# AI-Based Mental Health Screening System
#############################################################

#============================================================
# Load Required Packages
#============================================================

library(tidyverse)

#============================================================
# Load PHQ-9 Dataset
#============================================================

phq_data <- read.csv(
  "data/Dataset_14-day_AA_depression_symptoms_mood_and_PHQ-9.csv",
  stringsAsFactors = FALSE
)

#============================================================
# Load Suicide Detection Dataset
#============================================================

suicide_data <- read.csv(
  "data/Suicide_Detection.csv",
  stringsAsFactors = FALSE,
  fileEncoding = "UTF-8"
)

#============================================================
# Display First Records
#============================================================

head(phq_data)

head(suicide_data)

#============================================================
# Dataset Structure
#============================================================

str(phq_data)

str(suicide_data)

#============================================================
# Dataset Summary
#============================================================

summary(phq_data)

summary(suicide_data)

#============================================================
# Column Names
#============================================================

names(phq_data)

names(suicide_data)

#============================================================
# Dataset Dimensions
#============================================================

dim(phq_data)

dim(suicide_data)

#============================================================
# Missing Values
#============================================================

colSums(is.na(phq_data))

colSums(is.na(suicide_data))

#============================================================
# Class Distribution
#============================================================

table(suicide_data$class)

#============================================================
# PHQ Question Distribution
#============================================================

summary(phq_data[, c(
  "phq1",
  "phq2",
  "phq3",
  "phq4",
  "phq5",
  "phq6",
  "phq7",
  "phq8",
  "phq9"
)])

#============================================================
# Visualisations
#============================================================

# Suicide Class Distribution
ggplot(suicide_data,
       aes(class,
           fill = class)) +
  geom_bar() +
  theme_minimal() +
  labs(
    title = "Suicide Detection Dataset",
    x = "Class",
    y = "Count"
  )

# PHQ-9 Item 1
ggplot(phq_data,
       aes(phq1)) +
  geom_bar(fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "PHQ-1 Distribution",
    x = "Score",
    y = "Frequency"
  )

#############################################################
# End of Script
#############################################################
