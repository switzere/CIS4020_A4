## app.R ##
library(shinydashboard)
library(shiny)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("angry")),
      menuItem("Graph 1", tabName = "graph1", icon = icon("angry")),
      menuItem("Graph 2", tabName = "graph2", icon = icon("angry")),
      menuItem("Graph 3", tabName = "graph3", icon = icon("angry")),
      menuItem("Graph 4", tabName = "graph4", icon = icon("angry"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "home",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Graph1 content
      tabItem(tabName = "graph1",
              h2("Graph1 content"),
              fluidRow(
                box(plotOutput("plot2"))
              )
      ),
      # Graph2 content
      tabItem(tabName = "graph2",
              h2("Graph2 content")
      ),
      # Graph3 content
      tabItem(tabName = "graph3",
              h2("Graph3 content")
      ),
      # Graph4 content
      tabItem(tabName = "graph4",
              h2("Graph4 content")
      )
    )
  )
)






server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  output$plot2 <- renderPlot({
    plot(g1Data)  
  })
}

shinyApp(ui, server)