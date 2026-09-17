####################################################
# SafeSpace
# 03_Create_Patient_Data.R
# Create Simulated Patient Health Records
####################################################

# Load package
library(tidyverse)

# Make the results reproducible
set.seed(123)

####################################################
# Create Patient Health Record Dataset
####################################################

patient_data <- data.frame(
  
  Patient_ID = 1:1000,
  
  Age = sample(18:80, 1000, replace = TRUE),
  
  Gender = sample(
    c("Male", "Female"),
    1000,
    replace = TRUE
  ),
  
  Previous_Diagnosis = sample(
    c("None", "Depression", "Anxiety", "Bipolar"),
    1000,
    replace = TRUE
  ),
  
  Previous_Suicide_Attempt = sample(
    c("Yes", "No"),
    1000,
    replace = TRUE
  ),
  
  Medication = sample(
    c("Yes", "No"),
    1000,
    replace = TRUE
  ),
  
  Hospital_Admissions = sample(
    0:5,
    1000,
    replace = TRUE
  ),
  
  Chronic_Illness = sample(
    c("Yes", "No"),
    1000,
    replace = TRUE
  ),
  
  Family_History = sample(
    c("Yes", "No"),
    1000,
    replace = TRUE
  )
)

####################################################
# View the Dataset
####################################################

head(patient_data)

str(patient_data)

summary(patient_data)

####################################################
# Save Dataset
####################################################

write.csv(
  patient_data,
  "data/Patient_Health_Records.csv",
  row.names = FALSE
)

####################################################
# Confirmation Message
####################################################

cat("=====================================\n")
cat("Patient Health Records Created!\n")
cat("=====================================\n")

cat("Rows :", nrow(patient_data), "\n")
cat("Columns :", ncol(patient_data), "\n\n")

cat("Dataset saved to:\n")
cat("data/Patient_Health_Records.csv\n")
