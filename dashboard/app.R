## app.R ##
library(shinydashboard)
library(shiny)
library(ggplot2)


ui <- dashboardPage(
  dashboardHeader(title = "Affordable Housing and COVID-19"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("angry")),
      menuItem("Graph 1", tabName = "graph1", icon = icon("angry")),
      menuItem("Graph 2", tabName = "graph2", icon = icon("angry")),
      menuItem("Graph 3", tabName = "graph3", icon = icon("angry")),
      menuItem("Graph 4", tabName = "graph4", icon = icon("angry")),
      menuItem("Methods", tabName = "methods", icon = icon("angry"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "home",
              h2("Social Justice Issue"),
              h4("Investigating COVID-19 impacts on low income group’s access to affordable housing in Canada between January 2010 to October 2020."),
              br(),
              h2("Questions Answered"),
              h4("How has COVID-19 changed the amount of Canadians who meet the requirements for affordable housing in Canada?"),
              h4("How has COVID-19 affected evictions and job loss in Canada for 2020?"),
              h4("How has the low income communities in Canada been affected by the COVID-19 pandemic in terms of cost of living and income?"),
              h4("How has the creation of affordable housing in Ontario been affected by COVID-19? Has there been more, less or the same amount created?"),
              br(),
              h2("Literature Review"),
              h4("stufff...things...")
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
              ),
              h3("This graph...."),
              h5("LINK TO METHOD"),
              br(),
              h3("Data Sets"),
              h5("Government of Canada, S. (2018, August 23). Core housing need, 2016 Census. Retrieved November 27, 2020, from https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/chn-biml/index-eng.cfm"),
              h5("CMHC. (2018, March 31). Canada Mortgage and Housing Corporation (Rep.). Retrieved November 27, 2020, from CMHC website:https://www.cmhc-schl.gc.ca/en/data-and-research/data-tables/households-core-housing-need-canada-province-territory-cmas")
              
      ),
      # Graph2 content
      tabItem(tabName = "graph2",
              h2("Graph2 content"),
              fluidRow(
                box(plotOutput("plot2")),
                box(plotOutput("plot3"))
                ),
              fluidRow(box(
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
              )),
              h3("This graph...."),
              h5("LINK TO METHOD"),
              br(),
              h3("Data Sets"),
              h5("Statistics Canada. Table 14-10-0287-03 Labour force characteristics by province, monthly, seasonally adjusted"),
              h5("CMHC. (2020, March 25). COVID-19: Eviction Bans and Suspensions to Support Renters. Retrieved November 27, 2020, from https://www.cmhc-schl.gc.ca/en/rental-housing/covid-19-eviction-bans-and-suspensions-to-support-renters"),
              h5("Canada, P. (2020, November 26). Government of Canada. Retrieved November 27, 2020, from https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection.html?topic=tilelink"),
              h5("Dunham, J. (2020, April 01). Rent relief: What each province is doing to help residential tenants during the pandemic. Retrieved November 27, 2020, from https://www.ctvnews.ca/health/coronavirus/rent-relief-what-each-province-is-doing-to-help-residential-tenants-during-the-pandemic-1.4877615"),
              h5("Government of Manitoba. (2020). COVID-19 NOVEL CORONAVIRUS. Retrieved November 27, 2020, from https://www.gov.mb.ca/cca/rtb/covid19/ll_qa.pdf"),
              h5("Tattrie, J. (2020, March 31). N.S. landlords worried about confusion surrounding rent payments amid COVID-19 | CBC News. Retrieved November 27, 2020, from https://www.cbc.ca/news/canada/nova-scotia/nova-scotia-rent-businesses-covid-19-1.5515160"),
              h5("Luft, A. (2020, March 18). COVID-19: Quebec housing board suspends eviction hearings. Retrieved November 27, 2020, from https://montreal.ctvnews.ca/covid-19-quebec-housing-board-suspends-eviction-hearings-1.4858201"),
              h5("Office of Housing and Construction Standards. (2020, November 26). COVID-19 and Tenancies. Retrieved November 27, 2020, from https://www2.gov.bc.ca/gov/content/housing-tenancy/residential-tenancies/covid-19"),
              h5("Jfeng. (2020, November 19). COVID-19: Information for Alberta Landlords and Tenants. Retrieved November 27, 2020, from https://www.landlordandtenant.org/covid-19-alberta-landlords-and-tenants/"),
              h5("Toolkit, W. (2020, April 02). Province announces moratorium on evictions. Retrieved November 27, 2020, from https://www.princeedwardisland.ca/en/news/province-announces-moratorium-evictions"),
              h5("Arthur White-Crummey, R. (2020, March 26). Saskatchewan suspending most evictions in light of COVID-19. Retrieved November 27, 2020, from https://leaderpost.com/news/saskatchewan/saskatchewan-suspending-most-evictions-in-light-of-covid-19"),
              h5("Government of New Brunswick, C. (2017, April 24). REVISED / State of emergency declared in response to COVID-19. Retrieved November 27, 2020, from https://www2.gnb.ca/content/gnb/en/news/news_release.2020.03.0139.html"),
      ),
      # Graph3 content
      tabItem(tabName = "graph3",
              h2("Graph3 content"),
              h3("I want to have a slider for covid effect so that the user can put in a perect of what they think
                 covid will do to income and then use that to show a prediction of what it ends up being for 2020"),
              br(),
              h3("This graph...."),
              h5("LINK TO METHOD"),
              br(),
              h3("Data Sets"),
              h5("Statistics Canada. Table 11-10-0222-01 Household spending, Canada, regions and provinces"),
              h5("Statistics Canada. Table 11-10-0012-01 Distribution of total income by census family type and age of older partner, parent or individual")
      ),
      # Graph4 content
      tabItem(tabName = "graph4",
              h2("Graph4 content"),
              br(),
              h3("This graph...."),
              h5("LINK TO METHOD"),
              br(),
              h3("Data Sets"),
              h5("Government of Ontario. (2019, November 15). Ontario (Rep.). Retrieved November 27, 2020, from Government of Ontario website: https://www.ontario.ca/page/2018-2019-investment-affordable-housing-annual-public-reports")
      ),
      # Graph4 content
      tabItem(tabName = "methods",
              h2("Methods"),
              h3("Linear Regression"),
              h4("Linear Regression is a statistical method that allows us to study the relationship between 2 quantitative variables. It assumes there is a relationship between the variables we are studying, and the data is normally distributed."),
              h4("Citation: "),
              h4("Method Demo: "),
              br(),
              h3("Multiple Linear Regression"),
              h4("Multiple Linear Regression attempts to model the relationship between 2 or more explanatory variables and the response variable using a linear equation. It assumes there is a linear relationship between the variables we are studying, and the data is normally distributed."),
              h4("Citation: "),
              h4("Method Demo: ")
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