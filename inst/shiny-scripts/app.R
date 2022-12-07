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
                  c("ACE" = 'ACE', "ACTN3" = 'ACTN3', "ADRA2A" = "ADRA2A",
                    "ADRB2" = "ADRB2", "AMPD1" = "AMPD1", "APOE" = "APOE",
                    "ATP1A2 (exon 1)" = "ATP1A2 (exon 1)", "ATP1A2 (exon 21-22)" =
                    "ATP1A2 (exon 21-22)", "BDKRB2" = "BDKRB2", "CKM" = "CKM",
                    "EPAS1 (hCV1639984)" = "EPAS1 (hCV1639984)", "EPAS1 (hCV2148918)" =
                      "EPAS1 (hCV2148918)", "HFE" = "HFE", "HIF1A" = "HIF1A",
                    "HLA-A" = "HLA-A", "MT-ND5 (12406)" = "MT-ND5 (12406)",
                    "MT-ND5 (13365)" = "MT-ND5 (13365)", "MT-ND5 (13470)" =
                      "MT-ND5 (13470)", "MT-TT" = "MT-TT", "PPARA" = "PPARA",
                    "PPARGC1A" = "PPARGC1A", "UCP2" = "UCP2", "VEGFA" = "VEGFA")),

      tags$p("Select the gene you would like to visualize."),
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
                  tabPanel("Optimal Genes", tableOutput("table1")),
                  tabPanel("Neutral Genes", tableOutput("table2")),
                  tabPanel("Unfavourable Genes", tableOutput("table3")),
                  tabPanel("Speed Power Overview", tableOutput("table4")),
                  tabPanel("Speed Power Analysis", verbatimTextOutput("speed"))
      )
    )
  )
)

server <- function(input, output) {

  output$plot1 <- renderPlot({
    req(input$dataset)
    data <- readxl::read_excel(input$dataset$datapath)
    scatterPlot(data)
  })

  output$plot2 <- renderPlot({
    req(input$dataset)
    req(input$gene)

    dataset <- readxl::read_excel(input$dataset$datapath)
    g = dataset[[input$gene]]
    genotypeScatter(dataset,g)
  })

  output$plot3 <- renderPlot({
    req(input$dataset)
    data <- readxl::read_excel(input$dataset$datapath)
    scoreHistogram(data)
  })

  output$score <- renderText({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    s <- userScore(ind)
    paste("Your genetic score is:", s)
  })


  output$table1 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(geneOverview(ind))
    optimal
  })

  output$table2 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(geneOverview(ind))
    neutral
  })

  output$table3 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(geneOverview(ind))
    unfavourable
  })

  output$speed <- renderText({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    s <- powerSpeed(ind)
    paste("You have ", s,
          "genes that associate with power and speed.")
  })

  output$table4 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(powerSpeed(ind))
    powerspeed
  })

}


# Create Shiny app
shiny::shinyApp(ui, server)

# [END]
