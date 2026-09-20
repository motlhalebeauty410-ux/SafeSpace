
# SafeSpace 🧠

## AI-Based Mental Health Screening System for South African Public Healthcare

SafeSpace is an **AI-based mental health screening and referral-support prototype** developed as a final-year **BSc Data Science capstone project** at **Sol Plaatje University**.

The system combines **PHQ-9 screening, journal text analysis, natural language processing (NLP), machine learning investigation, and an interactive R Shiny dashboard** to demonstrate how data science can support early mental-health risk identification and referral in a South African public healthcare setting.

> **Important:** SafeSpace is a screening and referral-support prototype. It is **not a diagnostic system** and does not replace doctors, psychologists, nurses, counsellors, or other qualified healthcare professionals.

---

## 📌 Project Overview

Mental-health services can face challenges such as limited resources, long waiting times, stigma, and difficulties identifying people who may require additional support.

SafeSpace was developed as a prototype to demonstrate how a digital screening system could provide a structured first-level assessment before a person leaves a healthcare facility.

The system combines:

* Patient information
* PHQ-9 depression screening
* Mental-health journal analysis
* NLP-related text processing
* Keyword-based risk identification
* Machine-learning investigation
* Risk classification
* Recommendations and support guidance
* An interactive R Shiny dashboard

The system is designed to support **screening and referral**, rather than making a clinical diagnosis.

---

# 🎯 Project Objectives

The main objectives of SafeSpace are to:

1. Develop an interactive mental-health screening system using **R Shiny**.
2. Use the **PHQ-9 questionnaire** to calculate depression-severity scores.
3. Analyse mental-health journal entries for possible risk indicators.
4. Apply **data science and NLP techniques** to support mental-health screening.
5. Provide understandable results, recommendations, and support resources.
6. Develop a user-friendly dashboard that can support early awareness and referral.

---

# 🔄 How SafeSpace Works

The SafeSpace workflow follows a structured screening process:

```text
Patient Information
        ↓
PHQ-9 Assessment
        ↓
PHQ-9 Score & Severity
        ↓
Mental Health Journal
        ↓
Journal / Risk Analysis
        ↓
AI Analysis
        ↓
Overall Screening Result
        ↓
Recommendations & Support
```

The application contains six main sections:

### 1. Home

The landing page and starting point of the application.

### 2. Patient Information

Captures basic simulated patient information required for the screening workflow.

### 3. PHQ-9 Assessment

The user completes the nine PHQ-9 questions.

Each question is scored from **0 to 3**.

### 4. Mental Health Journal

The user can enter a journal entry that is analysed for possible risk-related indicators.

### 5. AI Analysis

The application analyses the available screening information and journal text.

The current prototype uses **transparent keyword-based journal alerts**, while machine-learning methods were investigated during development.

### 6. Results

Displays:

* PHQ-9 score
* Depression-severity category
* Journal-risk information
* Recommendations
* Referral/support guidance

---

# 🧮 PHQ-9 Screening

SafeSpace implements PHQ-9 scoring using the nine questionnaire responses.

Each question receives a score between **0 and 3**.

The nine responses are added together to produce a total score between **0 and 27**.

### PHQ-9 Severity Categories

| Score | Severity          |
| ----: | ----------------- |
|   0–4 | Minimal           |
|   5–9 | Mild              |
| 10–14 | Moderate          |
| 15–19 | Moderately Severe |
| 20–27 | Severe            |

The system then uses the calculated score to display the corresponding severity category.

### Dataset Distribution

The PHQ-9-related dataset used during the project contained the following severity distribution:

| Severity          | Number of Records |
| ----------------- | ----------------: |
| Minimal           |               885 |
| Mild              |             2,204 |
| Moderate          |             3,405 |
| Moderately Severe |             4,062 |
| Severe            |             5,057 |

---

# 🤖 Machine Learning and NLP

SafeSpace investigated several data-science and machine-learning techniques.

## Random Forest

Random Forest was investigated as a classification approach for structured patient-related features.

It combines multiple decision trees to produce a classification result.

## Naive Bayes

Naive Bayes was investigated for text classification.

The approach can use patterns in words and their occurrence to estimate the most likely classification category.

## TF-IDF

TF-IDF was investigated as a method for representing text according to the importance of words within documents.

## NLP Processing

The project investigated NLP-related processes including:

* Text cleaning
* Tokenisation
* Text preparation
* TF-IDF investigation
* Keyword-based risk identification

## Keyword-Based Journal Analysis

The current SafeSpace prototype uses **transparent keyword-based journal alerts**.

This approach was selected because it makes the reason for an alert easier to understand during a prototype demonstration.

The system checks journal text for predefined risk-related indicators and uses those indicators to support the screening workflow.

---

# 📊 Why Did the Prototype Achieve 100% Accuracy?

The project originally set a target of achieving **at least 80% accuracy**.

During evaluation, the SafeSpace prototype achieved:

* **Accuracy: 100%**
* **Precision: 100%**
* **Recall: 100%**
* **F1-score: 100%**

The important point is that this result reflects the **evaluation setup used for the prototype**.

There are several reasons why the prototype could produce a perfect result on its evaluation data:

### 1. The PHQ-9 calculation is deterministic

The PHQ-9 component does not make a random prediction.

The system adds the nine questionnaire scores and maps the total to a predefined severity category.

Therefore, when the calculation and category boundaries are implemented correctly, the expected category can be reproduced consistently.

### 2. The journal analysis uses transparent rules

The current prototype uses predefined keyword-based risk identification for journal entries.

This means that the system follows explicit rules when identifying risk-related indicators rather than relying entirely on an uncertain prediction.

### 3. The evaluation data matched the implemented classification logic

The reported 100% evaluation result was obtained on the data used to evaluate the prototype.

When the expected classifications correspond closely with the implemented scoring and classification logic, the resulting evaluation metrics can reach 100%.

### 4. The result is prototype-level performance

The 100% result should **not** be interpreted as meaning that SafeSpace will achieve 100% accuracy when used with real patients.

Real-world healthcare data is more complex and may contain:

* Different writing styles
* Missing information
* Ambiguous language
* Cultural and linguistic differences
* False positives
* False negatives
* Data from populations that were not represented in the evaluation data

Therefore, further testing with larger, independent, clinically validated datasets would be required before any real-world clinical deployment.

> **Interpretation:** SafeSpace exceeded its original target of 80% accuracy during the project's prototype evaluation, achieving 100% on the evaluation data. This demonstrates that the implemented prototype performed correctly on that evaluation setup, but it does not establish clinical effectiveness or real-world 100% accuracy.

---

# 📈 Model Evaluation

The main evaluation metrics used in the project were:

### Accuracy

Measures the proportion of classifications that were correct.

### Precision

Measures how many of the classifications identified as a particular category were correct.

### Recall

Measures how effectively the system identified the relevant cases.

### F1-Score

Provides a combined measure based on precision and recall.

### Prototype Evaluation Results

| Metric    | Target | Achieved |
| --------- | -----: | -------: |
| Accuracy  |  ≥ 80% | **100%** |
| Precision |      — | **100%** |
| Recall    |      — | **100%** |
| F1-Score  |      — | **100%** |

The results demonstrate that the prototype exceeded its original accuracy target on the evaluation data.

---

# 🔬 Methodology — CRISP-DM

The project followed the **CRISP-DM** methodology.

## 1. Business Understanding

The project identified the need for accessible first-level mental-health screening and referral support within the South African public healthcare context.

## 2. Data Understanding

The project explored:

* PHQ-9-related depression data
* Mental-health and suicide-risk text data
* Patient-related information

## 3. Data Preparation

Data preparation included:

* Cleaning data
* Preparing structured variables
* Preparing text data
* Tokenisation
* Text preparation
* Class preparation
* Feature preparation

## 4. Modelling

The project investigated:

* PHQ-9 scoring
* Naive Bayes
* Random Forest
* NLP-related techniques
* Keyword-based risk identification

## 5. Evaluation

The system was evaluated using:

* Accuracy
* Precision
* Recall
* F1-score

The prototype achieved 100% on the reported evaluation metrics.

## 6. Deployment

The final prototype was deployed as an interactive **R Shiny application** designed to demonstrate the SafeSpace screening workflow.

---

# 📂 Datasets

The project used multiple types of data during development.

### PHQ-9 / Depression Data

Used to investigate depression severity and implement the PHQ-9 screening component.

### Mental-Health Text Data

Used for investigating text classification and journal-risk analysis.

### Patient Health Records

Patient information used within the project application is **simulated/synthetic**.

> The patient information displayed in SafeSpace does not represent real patients.

---

# ⚠️ Dataset Upload Note

The original **`Suicide_Detection`** dataset was **not uploaded to this GitHub repository because the raw dataset file is too large for GitHub's standard individual-file upload limit**.

A cleaned version of the dataset, **`suicide_clean`**, is included in the repository where applicable.

Therefore, the absence of the original raw `Suicide_Detection` dataset from the repository is intentional and is due to its file size.

---

# 🖥️ R Shiny Application

SafeSpace was developed using **R Shiny** to create an interactive web-based dashboard.

The application demonstrates how a healthcare screening workflow could be presented through an accessible interface.

### Main Application Tabs

| Tab                   | Purpose                                        |
| --------------------- | ---------------------------------------------- |
| Home                  | Application landing page                       |
| Patient Info          | Captures simulated patient information         |
| PHQ-9 Assessment      | Performs the PHQ-9 screening                   |
| Mental Health Journal | Collects journal text                          |
| AI Analysis           | Performs risk-related analysis                 |
| Results               | Displays screening results and recommendations |

---

# 📁 Repository Structure

```text
SafeSpace/
│
├── app.R
├── README.md
│
├── data/
│   ├── Dataset_14-day_AA_depression_sympto...
│   ├── Patient_Health_Records
│   ├── phq_clean
│   └── suicide_clean
│
├── models/
│   └── model files
│
├── scripts/
│   └── data preparation and modelling scripts
│
└── screenshots/
    ├── 01_home-dashboard.png
    ├── 02_patient-info.png
    ├── 03_phq9-assessment.png
    ├── 04_journal.png
    ├── 05_medical-history.png
    ├── 06_ai-analysis.png
    └── 07_results.png
```

---

# 📸 Application Screenshots

The repository includes screenshots showing the main stages of the SafeSpace application.

### Home Dashboard

The starting page of the SafeSpace application.

### Patient Information

Shows the patient-information section using simulated information.

### PHQ-9 Assessment

Shows the nine-question PHQ-9 screening interface.

### Mental Health Journal

Shows the journal-entry section used for text analysis.

### Medical History

Shows additional patient-information fields used in the prototype workflow.

### AI Analysis

Shows the analysis of the available screening information.

### Results

Displays the screening score, severity and recommended next steps.

---

# 💡 Actionable Insights

The SafeSpace prototype demonstrates several ways data-driven screening could support early awareness:

* Higher PHQ-9 scores may indicate the need for further professional assessment.
* Journal-risk indicators can be used to trigger additional attention and referral guidance.
* Moderate-risk indicators can encourage early support and monitoring.
* Structured screening results can support conversations between users and healthcare professionals.
* The dashboard can provide a consistent first-level screening workflow.
* Screening results should support **referral and professional assessment rather than diagnosis**.

---

# ⚠️ Limitations

SafeSpace is an academic prototype and has several limitations.

### 1. Not a diagnostic system

The application does not diagnose mental-health conditions.

### 2. Synthetic patient information

Patient information displayed in the application is simulated and does not represent real patients.

### 3. Evaluation limitations

The reported 100% evaluation performance is based on the evaluation data and methodology used during the project.

It should not be interpreted as evidence that the system will achieve 100% accuracy with real-world patients.

### 4. Keyword-based journal analysis

The current prototype uses transparent keyword-based journal alerts. Human language can be complex, so keywords alone cannot capture every possible meaning or context.

### 5. No clinical deployment

The application is an academic prototype and has not been presented as a replacement for professional healthcare assessment.

### 6. Dataset limitations

The original large `Suicide_Detection` dataset could not be uploaded to GitHub because of its file size.

---

# 🚀 Future Improvements

Future versions of SafeSpace could investigate:

* Larger and more diverse datasets
* Independent external validation
* More advanced NLP models
* Multilingual South African language support
* Improved contextual text analysis
* More extensive model comparison
* Integration with healthcare information systems
* Clinical validation with appropriate ethical approval
* Improved referral workflows
* Continuous monitoring and model evaluation

---

# 🛠️ Technologies Used

### Programming & Development

* **R**
* **RStudio**
* **R Shiny**

### Data Science

* Data cleaning
* Exploratory data analysis
* Feature engineering
* Classification
* Model evaluation

### Machine Learning

* Random Forest
* Naive Bayes

### NLP

* Text cleaning
* Tokenisation
* TF-IDF investigation
* Keyword-based text analysis

### Visualisation

* `ggplot2`
* R Shiny interface components

### Other R Packages

The project uses packages appropriate to the implementation, including packages from the R data-science and Shiny ecosystem.

---

# 🎓 Academic Project

**Student:** Busisiwe Motlhale
**Student Number:** 202226162
**Programme:** BSc Data Science
**Institution:** Sol Plaatje University
**Supervisor / Lecturer:** Mrs Modiba
**Year:** 2026

---

# 🔐 Ethics and Privacy

SafeSpace was developed as an academic prototype.

The application is designed to demonstrate the use of data science for mental-health screening and referral support.

No real patient information should be entered into the public GitHub repository or demonstration application.

Sensitive healthcare information should always be handled according to applicable ethical, privacy and data-protection requirements.

---

# ⚠️ Disclaimer

SafeSpace is an **academic screening and referral-support prototype**.

It is not intended to:

* Diagnose mental-health conditions
* Replace healthcare professionals
* Provide emergency medical treatment
* Make final clinical decisions

Any real-world implementation would require appropriate **clinical validation, ethical approval, privacy safeguards, professional oversight, and independent testing**.

---

# 🌟 Project Summary

SafeSpace demonstrates how **data science, R Shiny, PHQ-9 screening, NLP, machine-learning investigation and transparent risk analysis** can be combined into an interactive mental-health screening prototype.

The project originally targeted **at least 80% accuracy** and achieved **100% accuracy, precision, recall and F1-score on the reported evaluation data**.

The result demonstrates successful prototype performance within the project's evaluation setup while recognising that further validation would be required before applying such a system to real-world healthcare.

---

# 🔗 Repository

**SafeSpace GitHub Repository:**

https://github.com/motlhalebeauty410-ux/SafeSpace

---

## Built with R & R Shiny 💗

**SafeSpace — Supporting early awareness, screening and referral through data science.**
