## app.R ##
library(shinydashboard)
library(shiny)
library(ggplot2)


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
                box(plotOutput("plotExample", height = 250)),
                
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
                box(plotOutput("plot1")),
                box(
                  title = "Location",
                  selectInput(inputId = "location",
                              label = "Location:",
                              choices = c("Canada" = "Canada",
                                "Newfoundland and Labrador" = "Newfoundland.and.Labrador",
                                "Prince Edward Island" = "Prince.Edward.Island",
                                "Nova Scotia" = "Nova.Scotia",
                                "New Brunswick" = "New.Brunswick",
                                "Quebec" = "Quebec",
                                "Ontario" = "Ontario",
                                "Manitoba" = "Manitoba",
                                "Saskatchewan" = "Saskatchewan",
                                "Alberta" = "Alberta",
                                "British Columbia" = "British.Columbia"
                              ),
                              selected = "Canada",
                  )
                )
              )
              
      ),
      # Graph2 content
      tabItem(tabName = "graph2",
              h2("Graph2 content"),
              fluidRow(
                box(plotOutput("plot2")),
                box(plotOutput("plot3"))
                ),
              box(
                title = "Province",
                selectInput(inputId = "province",
                            label = "Location:",
                            choices = c("Newfoundland and Labrador" = "Newfoundland and Labrador",
                                        "Prince Edward Island" = "Prince Edward.Island",
                                        "Nova Scotia" = "Nova Scotia",
                                        "New Brunswick" = "New Brunswick",
                                        "Quebec" = "Quebec",
                                        "Ontario" = "Ontario",
                                        "Manitoba" = "Manitoba",
                                        "Saskatchewan" = "Saskatchewan",
                                        "Alberta" = "Alberta",
                                        "British Columbia" = "British Columbia"
                            ),
                            selected = "Ontario",
                            multiple = TRUE
                )
              )
      ),
      # Graph3 content
      tabItem(tabName = "graph3",
              h2("Graph3 content"),
              h3("I want to have a slider for covid effect so that the user can put in a perect of what they think
                 covid will do to income and then use that to show a prediction of what it ends up being for 2020")
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
  
  output$plotExample <- renderPlot({
    print(input$slider)
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  output$plot1 <- renderPlot({
    print(input$location)
    #aes_string is used because input$location is passed to it as a string
    ggplot(g1Data, aes_string(x="Year", y=input$location), color="red") + geom_line() 
  })
  
  output$plot2 <- renderPlot({
    g2Data$Month <- factor(g2Data$Month, levels = c("January","February", "March", "April", "May", "June", "July", "August", "September", "October"))
    
    ggplot(data = subset(g2Data, Province %in% strsplit(input$province, "  +")), aes(x = Month, y = Unemployment.Rate,  fill = Province)) +
      geom_bar(stat="identity", position="dodge") +
      expand_limits(y = c(0,18)) + 
      theme(legend.direction = "vertical", legend.justification='left')
  })
  
  output$plot3 <- renderPlot({
    g2.1Data$Month <- factor(g2.1Data$Month, levels = c("January","February", "March", "April", "May", "June", "July", "August", "September", "October"))
    
    #ggplot(data = subset(g2.1Data, Province %in% c("Ontario","Quebec") ), aes(y = Total.Covid.Cases, x = Month, group=1, color=Province)) +
    
    #temp <- g2.1Data[g2.1Data$Province %in% input$province,]
    
    ggplot(data = subset(g2.1Data, Province %in% strsplit(input$province, "  +")), aes(y = Total.Covid.Cases, x = Month, group=Province, color=Province)) +
      geom_line(size = 3, alpha = 0.75) +
      geom_point(size =3, alpha = 0.75) +
      ggtitle("Total Covid Cases Canada")
  })
}

shinyApp(ui, server)