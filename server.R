library(shiny)

##Load Data
data <- read.csv("https://github.com/MJFan23/Shiny-Application-and-Reproducible-Pitch/blob/master/EmployeeData.csv")

summary(data)
# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$myPlot <- renderPlot({
    distType <- input$Distribution
    size <- input$sampleSize
    
    if(distType == "Normal"){
      randomVec <- rnorm(size, mean = as.numeric(input$mean), 
                         sd = as.numeric(input$sd))
    }
    else {
      randomVec <- rexp (size, rate = 1/ as.numeric(input$lambda))
    }
    hist(randomVec,freq = F, main="Distribution of Employees in US",
         xlab = "Number of Firms", ylab = "Density of Firms"
         ,col = "blue")
  }) 
}