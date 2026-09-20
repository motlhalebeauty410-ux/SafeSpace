# SafeSpace 🧠

## AI-Based Mental Health Screening System for South African Public Healthcare

**SafeSpace** is an AI-based mental health screening prototype developed as a final-year BSc Data Science capstone project at **Sol Plaatje University**.

The system demonstrates how data science, machine learning, natural language processing (NLP), PHQ-9 screening and an interactive **R Shiny** dashboard can be combined to support early mental-health risk identification and referral in South African public healthcare settings.

> **Important:** SafeSpace is a screening and referral-support prototype. It is **not a diagnostic system** and does not replace doctors, psychologists, nurses, counsellors or other qualified healthcare professionals.

---

## 📌 Project Overview

Mental-health support in South Africa faces challenges including limited resources, long waiting periods, stigma and gaps between initial healthcare contact and access to appropriate mental-health services.

SafeSpace focuses on the point where a patient may be referred for further mental-health support. The prototype demonstrates how structured screening information, patient health-history information and optional written journal information can be analysed to provide an understandable risk indication and appropriate support guidance.

The project combines three main information sources:

1. **PHQ-9 questionnaire responses**
2. **Simulated patient health-record information**
3. **Optional journal/free-text information**

The project report describes these three data sources and their role in the SafeSpace system.

---

## 🎯 Project Objectives

The main objectives of SafeSpace are to:

* Develop an interactive mental-health screening system using **R Shiny**.
* Implement **PHQ-9 scoring** and depression-severity classification.
* Analyse optional journal text using **NLP techniques**.
* Investigate machine-learning approaches for mental-health risk classification.
* Combine structured and unstructured information into a screening workflow.
* Provide understandable results, recommendations and support resources.
* Demonstrate how a digital screening tool could support referral decisions in a public healthcare environment.

---

## 🧠 How SafeSpace Works

The SafeSpace workflow can be summarised as:

```text
Patient Information
        ↓
PHQ-9 Assessment
        ↓
PHQ-9 Score & Severity
        ↓
Journal / Free-Text Analysis
        ↓
Patient Health Information
        ↓
AI / Risk Analysis
        ↓
Risk Classification
        ↓
Recommendations & Support
```

The system is designed to bring different types of information together instead of relying only on a questionnaire score.

---

## 📊 PHQ-9 Screening

SafeSpace uses the **Patient Health Questionnaire-9 (PHQ-9)** as its structured screening component.

Each of the nine questions is scored from **0 to 3**, producing a total score from **0 to 27**.

The project uses the following severity ranges:

| PHQ-9 Score | Depression Severity |
| ----------: | ------------------- |
|         0–4 | Minimal             |
|         5–9 | Mild                |
|       10–14 | Moderate            |
|       15–19 | Moderately Severe   |
|       20–27 | Severe              |

For the SafeSpace prototype, these severity levels are additionally grouped into broader risk categories:

| PHQ-9 Score | SafeSpace Risk Category |
| ----------: | ----------------------- |
|         0–9 | Low Risk                |
|       10–19 | Medium Risk             |
|       20–27 | High Risk               |

These classifications are described in the project report.

---

## 🤖 Machine Learning & NLP

### Random Forest

Random Forest is used for structured classification involving:

* Individual PHQ-9 responses
* Simulated patient health information
* Previous mental-health information
* Other structured patient features

The model uses multiple decision trees and combines their predictions to produce a classification. The project report describes a training/testing split in which **80% of the data was used for training and 20% for testing**, with evaluation including accuracy, precision, recall, F1-score and Cohen's Kappa.

### Naive Bayes + TF-IDF

For the journal/free-text component, SafeSpace investigates:

* Text cleaning
* Lowercasing
* Punctuation removal
* Stop-word removal
* Stemming
* TF-IDF feature representation
* Naive Bayes text classification

The text classifier is designed to identify whether written content contains patterns associated with the project's risk categories.

### Hybrid Risk Analysis

SafeSpace combines information from the structured analysis and text analysis.

The project design uses the higher concern when the two components differ, so that a higher-risk indication is not overlooked simply because another component produces a lower classification.

---

## 🔄 Methodology — CRISP-DM

The project follows the **Cross-Industry Standard Process for Data Mining (CRISP-DM)** methodology.

The main phases are:

1. **Business Understanding** – identify the mental-health referral problem.
2. **Data Understanding** – investigate the available datasets.
3. **Data Preparation** – clean and prepare structured and text data.
4. **Modelling** – investigate Random Forest and Naive Bayes approaches.
5. **Evaluation** – evaluate model performance using classification metrics.
6. **Deployment** – integrate the workflow into an R Shiny prototype.

CRISP-DM was selected to provide a structured process from the original healthcare problem through to the working prototype.

---

## 📁 Datasets

SafeSpace uses several types of data.

### 1. PHQ-9 Dataset

Structured PHQ-9 questionnaire data is used for depression-severity and risk classification.

### 2. Patient Health Records

The project uses **simulated patient health-record information** rather than real patient records.

The simulated information includes features such as:

* Previous mental-health history
* Previous hospitalisation information
* Chronic health conditions
* Medication information
* Other relevant patient-history indicators

Real patient electronic health records were not used because obtaining and using such information would require appropriate privacy protection, ethical approval and healthcare-sector permissions.

### 3. Suicide and Depression NLP Dataset

A large text dataset was used for the NLP component and contains labelled text used for text-classification investigation. The project report notes that the dataset is primarily English-language content, which is an important limitation when considering South African multilingual contexts.

### ⚠️ Dataset Upload Note

The original **Suicide_Detection** dataset could **not be uploaded to this GitHub repository because the raw file is too large for GitHub's standard individual-file upload limit**.

A cleaned version, **`suicide_clean`**, is included in the repository and was used as part of the project work.

Therefore, the absence of the original raw dataset from the repository is intentional and is due to its file size.

---

## 🖥️ R Shiny Application

The SafeSpace application was developed using **R and Shiny**.

The repository contains the main Shiny application together with supporting project folders for data, models, scripts and screenshots.

The application demonstrates the following workflow:

* Patient information
* PHQ-9 assessment
* Mental-health journal
* AI/risk analysis
* Results and recommendations

The project was designed to demonstrate how these components could work together in a public-health screening scenario.

---

## 🗂️ Repository Structure

```text
SafeSpace/
│
├── app.R
├── README.md
│
├── data/
│   ├── PHQ-9 dataset
│   ├── Patient health records
│   ├── phq_clean
│   └── suicide_clean
│
├── models/
│   └── Model files
│
├── scripts/
│   └── Data preparation and modelling scripts
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

## 🧪 Model Evaluation

The project evaluates classification performance using standard machine-learning metrics, including:

* **Accuracy** – proportion of predictions that were correct.
* **Precision** – proportion of predicted positive/classified cases that were correct.
* **Recall** – proportion of relevant cases identified by the model.
* **F1-score** – combined measure of precision and recall.
* **Cohen's Kappa** – agreement between predicted and reference classifications.

The project report specifies an initial target of at least **80% predictive accuracy** and describes evaluation across the defined risk categories.

The reported prototype evaluation produced very high performance results. These results should be interpreted within the context of the project's evaluation data and should **not** be interpreted as evidence of clinical accuracy on real patients.

---

## 📸 Screenshots

The `screenshots` folder contains screenshots of the SafeSpace application, including the dashboard, patient information, PHQ-9 assessment, journal, medical history, AI analysis and results sections.

These screenshots demonstrate the user interface and overall workflow of the prototype.

---

## ⚠️ Limitations

SafeSpace is a student capstone prototype and has several important limitations.

### No real patient records

The project does not use real South African patient electronic health records. Patient health-record information used in the prototype is simulated.

### English-language NLP data

The NLP dataset is primarily English-language content and may not represent how mental-health concerns are expressed across South Africa's indigenous languages and cultures.

### No clinical diagnosis

SafeSpace is a screening and referral-support prototype. It does not provide a formal clinical diagnosis or replace qualified healthcare professionals.

### No clinical deployment

The prototype has not been clinically validated or approved for use in functioning healthcare facilities. The project report identifies clinical validation, government approval, live deployment and EHR integration as outside the scope of the current capstone project.

### No EHR integration

The current project does not connect to South African healthcare information systems or live electronic health-record systems.

---

## 🔮 Future Improvements

Future development could include:

* Training and evaluating the system using appropriately approved South African patient data.
* Developing multilingual NLP datasets covering South African languages.
* Improving the NLP model using larger and more representative datasets.
* Conducting independent external validation.
* Performing formal clinical evaluation.
* Working with healthcare professionals and relevant stakeholders.
* Investigating secure integration with healthcare information systems.
* Developing appropriate privacy, ethical and governance procedures.
* Evaluating the system in realistic healthcare environments.

The project report particularly identifies South African multilingual data and real-world patient data as important areas for future development.

---

## 🛠️ Technologies Used

* **R**
* **RStudio**
* **Shiny**
* **Random Forest**
* **Naive Bayes**
* **TF-IDF**
* **Natural Language Processing (NLP)**
* **tidyverse**
* **caret**
* **randomForest**
* **e1071**
* **tm**
* **SnowballC**
* **ggplot2**

The project report identifies these R tools and packages as part of the development environment.

---

## 🎓 Academic Project

**Project:** SafeSpace: AI-Based Mental Health Screening System for South African Public Healthcare

**Student:** Busisiwe Motlhale
**Student Number:** 202226162
**Programme:** BSc Data Science
**Institution:** Sol Plaatje University
**Supervisor/Lecturer:** Mrs Modiba
**Year:** 2026

---

## 📌 Disclaimer

SafeSpace is an academic prototype developed for a BSc Data Science capstone project.

It is intended to demonstrate the application of data science, machine learning, NLP and R Shiny to mental-health screening and referral support.

**SafeSpace is not a medical diagnostic tool, is not clinically validated, and should not be used to make independent healthcare decisions. Any real-world implementation would require appropriate clinical validation, ethical approval, privacy safeguards, professional oversight and relevant healthcare-sector approval.**

---

## 👩🏽‍💻 Repository

**GitHub:** https://github.com/motlhalebeauty410-ux/SafeSpace

