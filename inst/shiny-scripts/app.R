# Script for Shiny app

library("shiny")

# Define UI

ui <- fluidPage(

  # App title ----
  titlePanel("Score and Visualize your Genetic Profile"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Select a file ----
      fileInput("dataset", "Dataset",
                multiple = FALSE,
                accept = ".xlsx"),

      tags$p("Upload a .xlsx file corresponding to the set of genetic profiles
             you would like to visualize and analyze."),

      # Horizontal line ----
      tags$hr(),

      # Input: Select a file ----
      fileInput("data", "Individual Data",
                multiple = FALSE,
                accept = ".xlsx"),

      tags$p("Upload a .xlsx file containing a single genetic profile for analysis."),

      # Horizontal line ----
      tags$hr(),

      # Input: Gene to be analyzed ----
      selectInput("gene", "Gene:",
                  c("ACE" = 'ACE', "ACTN3" = 'ACTN3')),
    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Tabset w/ variant 1 plot, variant 2 plot, and two variants
      # overlapped ----
      tabsetPanel(type = "tabs",
                  tabPanel("Score Scatter Plot", plotOutput("plot1")),
                  tabPanel("Genotype Scatter Plot", plotOutput("plot2")),
                  tabPanel("Score Histogram", plotOutput("plot3")),
                  tabPanel("User Score", verbatimTextOutput("score")),
                  tabPanel("Gene Overview", tableOutput("table1")),
                  tabPanel("Speed Power Analysis", tableOutput("table2"))
      )
    )
  )
)


# TODO: Change the server logic
# Define server logic
# Define server logic
server <- function(input, output) {

  output$plot1 <- renderPlot({
    req(input$dataset)
    data <- readxl::read_excel(input$dataset$datapath)
    scatterPlot(data)
  })

  output$plot2 <- renderPlot({
    req(input$dataset)
    req(input$gene)
    g <- input$gene
    data <- readxl::read_excel(input$dataset$datapath)
    genotypeScatter(data,g)
  })

  output$plot3 <- renderPlot({
    req(input$dataset)
    data <- readxl::read_excel(input$dataset$datapath)
    scoreHistogram(data)
  })

  output$score <- renderText({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    print(userScore(ind))
  })

}


# Create Shiny app
shiny::shinyApp(ui, server)

# [END]
