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
             you would like to visualize and analyze. A table with 25 columns,
             consisting of 23 Gene Variant Scores (0-2) , 1 Genetic Score (0-100)
             1 Fitness Score (1-6). The number of rows for each entry is not specified.
             See Data URL tab for example dataset."),

      # Horizontal line ----
      tags$hr(),

      # Input: Select a file ----
      fileInput("data", "Individual Data",
                multiple = FALSE,
                accept = ".xlsx"),

      tags$p("Upload a .xlsx file containing a single genetic profile for analysis.
             A table with 2 columns: Gene and Variant and 23 Rows, each
             corresponding to one of the 23 gene associations. See Data URL tab
             for two example data files."),

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

      # Output: Tabset for each plotting function, analysis function and URL
      # for downloadable data----
      tabsetPanel(type = "tabs",
                  tabPanel("Score Scatter Plot", plotOutput("plot1")),
                  tabPanel("Genotype Scatter Plot", plotOutput("plot2")),
                  tabPanel("Score Histogram", plotOutput("plot3")),
                  tabPanel("Gene Score", verbatimTextOutput("score")),
                  tabPanel("Optimal Genes", tableOutput("table1")),
                  tabPanel("Neutral Genes", tableOutput("table2")),
                  tabPanel("Unfavourable Genes", tableOutput("table3")),
                  tabPanel("Speed Power Overview", tableOutput("table4")),
                  tabPanel("Speed Power Analysis", verbatimTextOutput("speed")),
                  tabPanel("Data URL", verbatimTextOutput("data"))
      )
    )
  )
)

server <- function(input, output) {
# Output for Score Scatter Plot
  output$plot1 <- renderPlot({
    req(input$dataset)
    data <- readxl::read_excel(input$dataset$datapath)
    scatterPlot(data)
  })
# Output for Genotype Scatter Plot
  output$plot2 <- renderPlot({
    req(input$dataset)
    req(input$gene)

    dataset <- readxl::read_excel(input$dataset$datapath)
    g = dataset[[input$gene]]
    genotypeScatter(dataset,g)
  })
# Output for Score Histogram
  output$plot3 <- renderPlot({
    req(input$dataset)
    data <- readxl::read_excel(input$dataset$datapath)
    scoreHistogram(data)
  })
# Output for Gene Score
  output$score <- renderText({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    s <- userScore(ind)
    paste("Your genetic score is:", s)
  })

# Output for Optimal Genes
  output$table1 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(geneOverview(ind))
    optimal
  })
# Output for Neutral Genes
  output$table2 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(geneOverview(ind))
    neutral
  })
# Output for Unfavourable Genes
  output$table3 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(geneOverview(ind))
    unfavourable
  })
# Output for Speed Power Analysis
  output$speed <- renderText({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    s <- powerSpeed(ind)
    paste("Identified as match:", s)
  })
# Output for Speed Power Overview
  output$table4 <- renderTable({
    req(input$data)
    ind <- readxl::read_excel(input$data$datapath)
    paste(powerSpeed(ind))
    powerspeed
  })

# Output for Data URL
  output$data <- renderText({
    paste("Dataset: https://github.com/hjovi1/PerfOMICS/blob/8128e2fec8f0d07d7f1b7cf0fc0ed38c1a0c3f06/inst/extdata/fake_dataset.xlsx,
          Individual: https://github.com/hjovi1/PerfOMICS/blob/8128e2fec8f0d07d7f1b7cf0fc0ed38c1a0c3f06/inst/extdata/Ind1.xlsx,
          Individual :https://github.com/hjovi1/PerfOMICS/blob/8128e2fec8f0d07d7f1b7cf0fc0ed38c1a0c3f06/inst/extdata/Ind2.xlsx")
  })

}

# Create Shiny app
shiny::shinyApp(ui, server)

# [END]
