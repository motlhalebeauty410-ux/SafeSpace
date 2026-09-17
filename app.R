
############################################################
# SafeSpace
# AI-Based Mental Health Screening System
# app.R
############################################################

#############################
# Libraries
#############################

library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(plotly)
library(DT)
library(randomForest)
library(e1071)
library(tm)
library(wordcloud)
library(RColorBrewer)

#############################
# Load Models
#############################

# Random Forest temporarily disabled
# rf_model <- readRDS("models/random_forest_model.rds")

nb_model <- readRDS("models/naive_bayes_model.rds")

#############################
# USER INTERFACE
#############################

ui <- dashboardPage(
  
  skin="red",
  
  ####################################################
  # HEADER
  ####################################################
  
  dashboardHeader(
    
    title=tags$span(
      
      style="font-size:22px;font-weight:bold;",
      
      "💖 SafeSpace"
      
    )
    
  ),
  
  ####################################################
  # SIDEBAR
  ####################################################
  
  dashboardSidebar(
    
    width=260,
    
    sidebarMenu(
      
      id="tabs",
      
      menuItem("Home",
               tabName="home",
               icon=icon("home")),
      
      menuItem("Patient Information",
               tabName="patient",
               icon=icon("user")),
      
      menuItem("PHQ-9 Assessment",
               tabName="phq",
               icon=icon("clipboard-list")),
      
      menuItem("Mental Health Journal",
               tabName="journal",
               icon=icon("book")),
      
      menuItem("Medical History",
               tabName="history",
               icon=icon("notes-medical")),
      
      menuItem("AI Analysis",
               tabName="analysis",
               icon=icon("robot")),
      
      menuItem("Results",
               tabName="results",
               icon=icon("chart-line"))
      
    )
    
  ),
  
  ####################################################
  # BODY
  ####################################################
  
  dashboardBody(
    
    tags$head(
      
      tags$style(HTML("

.content-wrapper{
background:#FFF5F8;
}

.right-side{
background:#FFF5F8;
}

.skin-red .main-header .logo{
background:#C2185B;
color:white;
font-weight:bold;
font-size:24px;
}

.skin-red .main-header .navbar{
background:#C2185B;
}

.skin-red .main-sidebar{
background:#880E4F;
}

.skin-red .sidebar-menu>li>a{
color:white;
font-size:15px;
}

.skin-red .sidebar-menu>li.active>a{
background:#C2185B;
color:white;
border-left:5px solid white;
}

.skin-red .sidebar-menu>li:hover>a{
background:#AD1457;
color:white;
}

.box{
background:white;
border-radius:18px;
box-shadow:0px 6px 18px rgba(0,0,0,.15);
border:none;
}

.box-header{
font-weight:bold;
font-size:18px;
color:#2E2E2E;
}

.btn-danger{
background:#C2185B;
border:none;
border-radius:10px;
font-size:16px;
font-weight:bold;
}

.btn-danger:hover{
background:#AD1457;
}

h1,h2,h3,h4{
color:#2E2E2E;
font-weight:bold;
}

.small-box{
border-radius:18px;
box-shadow:0px 4px 15px rgba(0,0,0,.15);
}

.value-box{
border-radius:18px;
}

"))
      
    ),
    
    tabItems(
      
      ####################################################
      # HOME
      ####################################################
      
      tabItem(
        
        tabName="home",
        
        fluidRow(
          
          box(
            
            width=12,
            
            status="danger",
            
            solidHeader=TRUE,
            
            style="background:#FCE4EC;",
            
            tags$div(
              
              align="center",
              
              br(),
              
              h1("💖 SafeSpace"),
              
              h3("AI-Based Mental Health Screening System"),
              
              br(),
              
              h4("Your Mental Health Matters"),
              
              br(),
              
              p(style="font-size:18px;",
                "This application screens depression severity and suicide risk using Artificial Intelligence."),
              
              br(),
              
              actionButton(
                
                "start",
                
                "Start Assessment",
                
                class="btn btn-danger btn-lg"
                
              ),
              
              br(),
              br()
              
            )
            
          )
          
        )
        
      ),
      
      ####################################################
      # PATIENT INFORMATION
      ####################################################
      
      tabItem(
        
        tabName="patient",
        
        fluidRow(
          
          box(
            
            width=12,
            
            status="danger",
            
            solidHeader=TRUE,
            
            title="Patient Information",
            
            textInput(
              
              "name",
              
              "Full Name"
              
            ),
            
            numericInput(
              
              "age",
              
              "Age",
              
              18,
              
              min=10,
              
              max=100
              
            ),
            
            selectInput(
              
              "gender",
              
              "Gender",
              
              c(
                
                "Female",
                
                "Male",
                
                "Other"
                
              )
              
            ),
            
            textInput(
              
              "occupation",
              
              "Occupation"
              
            ),
            
            dateInput(
              
              "assessment_date",
              
              "Assessment Date"
              
            )
            
          )
          
        )
        
      ),
      
  
      ####################################################
      # PHQ-9 ASSESSMENT
      ####################################################
      
      tabItem(
        
        tabName = "phq",
        
        fluidRow(
          
          box(
            
            width = 12,
            
            status = "danger",
            
            solidHeader = TRUE,
            
            title = "PHQ-9 Depression Assessment",
            
            style = "background:#FFF0F5;",
            
            h4("Over the last two weeks, how often have you been bothered by the following problems?"),
            
            radioButtons(
              "phq1",
              "1. Little interest or pleasure in doing things",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq2",
              "2. Feeling down, depressed or hopeless",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq3",
              "3. Trouble falling or staying asleep",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq4",
              "4. Feeling tired or having little energy",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq5",
              "5. Poor appetite or overeating",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq6",
              "6. Feeling bad about yourself",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq7",
              "7. Trouble concentrating",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq8",
              "8. Moving slowly or being restless",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            radioButtons(
              "phq9",
              "9. Thoughts that you would be better off dead or hurting yourself",
              c(
                "Not at all" = 0,
                "Several days" = 1,
                "More than half the days" = 2,
                "Nearly every day" = 3
              )
            ),
            
            br(),
            
            actionButton(
              "calculate",
              "Calculate PHQ Score",
              class = "btn btn-danger btn-lg"
            ),
            
            br(),
            br(),
            
            htmlOutput("phqResult")
            
          )
          
        )
        
      ),
      
      ####################################################
      # JOURNAL ANALYSIS
      ####################################################
      
      
      tabItem(
        
        tabName="journal",
        
        fluidRow(
          
          box(
            
            width=12,
            
            status="danger",
            
            solidHeader=TRUE,
            
            title="Mental Health Journal",
            
            style="background:#FFF0F5;",
            
            h4("Describe how you have been feeling recently"),
            
            textAreaInput(
              "journal",
              NULL,
              rows=12,
              width="100%"
            ),
            
            br(),
            
            actionButton(
              "analyseJournal",
              "Analyse Journal",
              class="btn btn-danger btn-lg"
            ),
            
            br(),
            br(),
            
            htmlOutput("journalResult")
            
          )
          
        )
        
      ),
      
      
      
      ####################################################
      # MEDICAL HISTORY
      ####################################################
      
      tabItem(
        
        tabName="history",
        
        fluidRow(
          
          box(
            
            width=12,
            
            status="danger",
            
            solidHeader=TRUE,
            
            title="Medical History",
            
            checkboxInput("previousDiagnosis",
                          "Previous Mental Health Diagnosis",FALSE),
            
            checkboxInput("previousCounselling",
                          "Previous Counselling",FALSE),
            
            checkboxInput("currentMedication",
                          "Currently Taking Medication",FALSE),
            
            checkboxInput("familyHistory",
                          "Family History of Mental Illness",FALSE),
            
            checkboxInput("previousAttempt",
                          "Previous Suicide Attempt",FALSE),
            
            checkboxInput("substanceUse",
                          "Alcohol / Drug Abuse",FALSE),
            
            textAreaInput(
              
              "medicalNotes",
              
              "Additional Notes",
              
              rows=5
              
            )
            
          )
          
        )
        
      ),
      
      ####################################################
      # AI ANALYSIS
      ####################################################
      
      tabItem(
        
        tabName="analysis",
        
        fluidRow(
          
          box(
            
            width=12,
            
            status="danger",
            
            solidHeader=TRUE,
            
            title="Artificial Intelligence Analysis",
            
            style="background:#FFF0F5;",
            
            h3("AI Prediction Summary"),
            
            actionButton(
              
              "runAI",
              
              "Run AI Analysis",
              
              class="btn btn-danger btn-lg"
              
            ),
            
            br(),
            br(),
            
            htmlOutput("aiPrediction")
            
          )
          
        )
        
      ),
      
      ####################################################
      # RESULTS
      ####################################################
      
      tabItem(
        
        tabName="results",
        
        fluidRow(
          
          valueBoxOutput("scoreBox",4),
          
          valueBoxOutput("severityBox",4),
          
          valueBoxOutput("riskBox",4)
          
        ),
        
        
        fluidRow(
          
          box(
            
            width = 12,
            
            title = "PHQ-9 Response Chart",
            
            status = "danger",
            
            solidHeader = TRUE,
            
            plotlyOutput("phqChart", height = "350px")
            
          )
          
        ),
        
        fluidRow(
          
          box(
            
            width=6,
            
            title="AI Prediction",
            
            status="danger",
            
            solidHeader=TRUE,
            
            htmlOutput("aiPrediction")
            
          ),
          
          box(
            
            width=6,
            
            title="Journal Analysis",
            
            status="warning",
            
            solidHeader=TRUE,
            
            htmlOutput("journalResult")
            
          )
          
        ),
        
        fluidRow(
          
          box(
            
            width=12,
            
            title="Clinical Recommendation",
            
            status="success",
            
            solidHeader=TRUE,
            
            htmlOutput("recommendation")
            
          )
          
        ),
        
        fluidRow(
          
          box(
            
            width=12,
            
            title="Patient Summary",
            
            status="primary",
            
            solidHeader=TRUE,
            
            htmlOutput("patientSummary"),
            
            br(),
            
            downloadButton(
              
              "downloadReport",
              
              "Download Assessment Report",
              
              class = "btn btn-danger"
          )
          
        )
        
      )
      
    ) 
      ############################################################
      # CLOSE UI
      ############################################################
      
    )   # tabItems
    
  )     # dashboardBody
  
)         # dashboardPage


############################################################
# SERVER
############################################################

server <- function(input, output, session){
  
  ####################################################
  # Start Assessment Button
  ####################################################
  
  observeEvent(input$start,{
    
    updateTabItems(
      session=session,
      inputId="tabs",
      selected="patient"
    )
    
  })
  
  
  ####################################################
  # AI ANALYSIS
  ####################################################
  
  observeEvent(input$runAI,{
    
    req(phq_score())
    
    score <- phq_score()
    
    prediction <- severity()
    
    risk <- if(score >= 20){
      
      "High"
      
    }else if(score >= 10){
      
      "Moderate"
      
    }else{
      
      "Low"
      
    }
    
    recommendation <- if(score >= 20){
      
      "Immediate referral to a psychiatrist is recommended."
      
    }else if(score >= 10){
      
      "Counselling and follow-up assessment are recommended."
      
    }else{
      
      "No immediate intervention required. Continue monitoring."
      
    }
    
    output$aiPrediction <- renderUI({
      
      HTML(
        
        paste0(
          
          "<div style='background:#FCE4EC;
               padding:20px;
               border-radius:15px;
               border-left:8px solid #C2185B;'>",
          
          "<h2 style='color:#C2185B;'>AI Prediction Summary</h2>",
          
          "<b>PHQ Score:</b> ", score,
          
          "<br><br>",
          
          "<b>Depression Severity:</b> ", prediction,
          
          "<br><br>",
          
          "<b>Suicide Risk:</b> ", risk,
          
          "<br><br>",
          
          "<b>Clinical Recommendation:</b><br>",
          
          recommendation,
          
          "</div>"
          
        )
        
      )
      
    })
    
  })
  
  ####################################################
  # PHQ-9 SCORE
  ####################################################
  
  phq_score <- eventReactive(input$calculate,{
    
    sum(
      
      as.numeric(input$phq1),
      as.numeric(input$phq2),
      as.numeric(input$phq3),
      as.numeric(input$phq4),
      as.numeric(input$phq5),
      as.numeric(input$phq6),
      as.numeric(input$phq7),
      as.numeric(input$phq8),
      as.numeric(input$phq9)
      
    )
    
  })
  
  ####################################################
  # DEPRESSION SEVERITY
  ####################################################
  
  severity <- reactive({
    
    req(phq_score())
    
    score <- phq_score()
    
    if(score<=4){
      
      "Minimal"
      
    }else if(score<=9){
      
      "Mild"
      
    }else if(score<=14){
      
      "Moderate"
      
    }else if(score<=19){
      
      "Moderately Severe"
      
    }else{
      
      "Severe"
      
    }
    
  })
  
  ####################################################
  # PHQ RESULT
  ####################################################
  
  output$phqResult <- renderUI({
    
    req(phq_score())
    
    HTML(
      
      paste0(
        
        "<div style='background:#FCE4EC;
                  padding:20px;
                  border-radius:15px;
                  border-left:8px solid #C2185B;'>",
        
        "<h2>PHQ-9 Score: ", phq_score(), "</h2>",
        
        "<h3>Depression Severity: ", severity(), "</h3>",
        
        "<br>",
        
        "<span style='color:green;
                   font-size:18px;
                   font-weight:bold;'>

      ✔ Assessment completed successfully.

      </span>

      <br><br>

      You may now proceed to the <b>AI Analysis</b> or <b>Results</b> page.

      </div>"
        
      )
      
    )
    
  })
  
  ####################################################
  # SCORE BOX
  ####################################################
  
  output$scoreBox <- renderValueBox({
    
    req(phq_score())
    
    valueBox(
      
      value=phq_score(),
      
      subtitle="PHQ Score",
      
      icon=icon("calculator"),
      
      color="fuchsia"
      
    )
    
  })
  
  ####################################################
  # SEVERITY BOX
  ####################################################
  
  output$severityBox <- renderValueBox({
    
    req(severity())
    
    valueBox(
      
      value=severity(),
      
      subtitle="Depression Severity",
      
      icon=icon("brain"),
      
      color="purple"
      
    )
    
  })
  
  ####################################################
  # SUICIDE RISK
  ####################################################
  output$riskBox <- renderValueBox({
    
    req(phq_score())
    
    score <- phq_score()
    
    risk <- if(score >= 20){
      
      "High"
      
    } else if(score >= 10){
      
      "Moderate"
      
    } else{
      
      "Low"
      
    }
    
    colour <- if(score >= 20){
      
      "red"
      
    } else if(score >= 10){
      
      "yellow"
      
    } else{
      
      "green"
      
    }
    
    valueBox(
      
      value = risk,
      
      subtitle = "Suicide Risk",
      
    icon = icon("heartbeat"),

    color = colour

  )

})
  
  ####################################################
  # RECOMMENDATION
  ####################################################
  
  output$recommendation <- renderUI({
    
    req(phq_score())
    
    if(phq_score()>=20){
      
      HTML("<h3 style='color:red;'>Immediate referral to a psychiatrist is recommended.</h3>")
      
    }else if(phq_score()>=10){
      
      HTML("<h3 style='color:orange;'>Counselling and follow-up are recommended.</h3>")
      
    }else{
      
      HTML("<h3 style='color:green;'>No immediate intervention required. Continue monitoring.</h3>")
      
    }
    
  })
  
  ####################################################
  # PATIENT SUMMARY
  ####################################################
  
  output$patientSummary <- renderUI({
    
    req(phq_score())
    
    HTML(
      
      paste0(
        
        "<h4>Patient Information</h4>",
        
        "<b>Name:</b> ", input$name,
        
        "<br><br>",
        
        "<b>Age:</b> ", input$age,
        
        "<br><br>",
        
        "<b>Gender:</b> ", input$gender,
        
        "<br><br>",
        
        "<b>Occupation:</b> ", input$occupation,
        
        "<br><br>",
        
        "<b>Assessment Date:</b> ", input$assessment_date,
        
        "<hr>",
        
        "<b>PHQ Score:</b> ", phq_score(),
        
        "<br><br>",
        
        "<b>Depression Severity:</b> ", severity()
        
      )
      
    )
    
  })
  

  
  ####################################################
  # JOURNAL ANALYSIS
  ####################################################
  journalResultText <- reactiveVal("")
  
  observeEvent(input$analyseJournal,{
    
    req(input$journal)
    
    text <- tolower(trimws(input$journal))
    
    if(nchar(text)==0){
      
      journalResultText("Please enter some text first.")
      
      return()
      
    }
    
    if(grepl("suicide|kill myself|killing myself|ending my life|end my life|want to die|better off dead|hurt myself|self harm|hopeless|worthless",
             text,
             ignore.case=TRUE)){
      
      journalResultText("⚠ High suicide risk language detected.")
      
    }else if(grepl("sad|depressed|cry|crying|stress|stressed|anxiety|anxious|alone|lonely|tired|exhausted|overwhelmed",
                   text,
                   ignore.case=TRUE)){
      
      journalResultText("Moderate emotional distress detected.")
      
    }else{
      
      journalResultText("No major warning signs detected.")
      
    }
    
  })
  
  output$journalResult <- renderUI({
    
    req(journalResultText())
    
    if(grepl("High suicide risk",journalResultText())){
      
      HTML(paste0(
        "<div style='padding:15px;background:#ffebee;border-left:6px solid red;'>",
        "<h3 style='color:red;'>",
        journalResultText(),
        "</h3></div>"
      ))
      
    }else if(grepl("Moderate emotional",journalResultText())){
      
      HTML(paste0(
        "<div style='padding:15px;background:#fff3e0;border-left:6px solid orange;'>",
        "<h3 style='color:orange;'>",
        journalResultText(),
        "</h3></div>"
      ))
      
    }else{
      
      HTML(paste0(
        "<div style='padding:15px;background:#e8f5e9;border-left:6px solid green;'>",
        "<h3 style='color:green;'>",
        journalResultText(),
        "</h3></div>"
      ))
      
    }
    
  })
  
  
  
############################################################
# OPTIONAL PHQ-9 CHART
############################################################

output$phqChart <- renderPlotly({
  
  req(phq_score())
  
  scores <- c(
    as.numeric(input$phq1),
    as.numeric(input$phq2),
    as.numeric(input$phq3),
    as.numeric(input$phq4),
    as.numeric(input$phq5),
    as.numeric(input$phq6),
    as.numeric(input$phq7),
    as.numeric(input$phq8),
    as.numeric(input$phq9)
  )
  
  plot_ly(
    
    x = paste("Q",1:9),
    
    y = scores,
    
    type = "bar",
    
    marker = list(color="#EC407A")
    
  ) %>%
    
    layout(
      
      title="PHQ-9 Responses",
      
      xaxis=list(title="Questions"),
      
      yaxis=list(title="Score")
      
    )
  
})

############################################################
# DOWNLOAD REPORT
############################################################

output$downloadReport <- downloadHandler(
  
  filename=function(){
    
    paste0("SafeSpace_Report_",Sys.Date(),".html")
    
  },
  
  content=function(file){
    
    html <- paste0(
      
      "<html><body>",
      
      "<h1>SafeSpace Mental Health Report</h1>",
      
      "<hr>",
      
      "<h2>Patient Information</h2>",
      
      "<p><b>Name:</b> ",input$name,"</p>",
      
      "<p><b>Age:</b> ",input$age,"</p>",
      
      "<p><b>Gender:</b> ",input$gender,"</p>",
      
      "<p><b>Occupation:</b> ",input$occupation,"</p>",
      
      "<hr>",
      
      "<h2>Assessment</h2>",
      
      "<p><b>PHQ Score:</b> ",phq_score(),"</p>",
      
      "<p><b>Depression Severity:</b> ",severity(),"</p>",
      
      "<hr>",
      
      "<h2>Generated by SafeSpace</h2>",
      
      "</body></html>"
      
    )
    
    writeLines(html,file)
    
  }
  
)
}

############################################################
# RUN APP
############################################################

shinyApp(
  
  ui,
  
  server
  
)