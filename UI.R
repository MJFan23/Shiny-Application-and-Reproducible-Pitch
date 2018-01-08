library(shiny)

##Load Data
data <- read.csv("https://github.com/MJFan23/Shiny-Application-and-Reproducible-Pitch/blob/master/EmployeeData.csv")


ui <- fluidPage(
  ## Staging UI
  shinyServer(
    pageWithSidebar(
      headerPanel("Data Inputs"),
      sidebarPanel(
        selectInput("Distribution","Please Select Distribution Type",
                    choices=c("Normal","Exponential")),
        ##selectInput("Occupation", "Occuption:",  
        ## choices=colnames(data)), 
        sliderInput("sampleSize", "Please Select Number of Employees:",
                    min=620000, max=35000000, value=65000, step=50000),
        conditionalPanel(condition="input.Distribution == 'Normal'",
                         textInput("mean", "Please Select the Number of Firms:", 10000),
                         textInput("sd","Please Select Standard Deviation:", 3)),
        conditionalPanel(condition="input.Distribution == 'Exponential'",
                         textInput("lambda","Please Select Exponential Lambda:", 1))
      ),
      mainPanel(
        plotOutput("myPlot")
      )
    )
  )
)
