## app.R ##
library(shinydashboard)
library(shiny)
library(ggplot2)


ui <- dashboardPage(
  dashboardHeader(title = "Affordable Housing and COVID-19"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Core Housing Need", tabName = "graph1", icon = icon("chart-line")),
      menuItem("Unemployment Rate", tabName = "graph2", icon = icon("chart-bar")),
      menuItem("Income vs. Expenses", tabName = "graph3", icon = icon("chart-line")),
      menuItem("Affordable Housing Created", tabName = "graph4", icon = icon("chart-area")),
      menuItem("Methods", tabName = "methods", icon = icon("book-open"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "home",
              h2(tags$b("Social Justice Issue")),
              fluidRow(box(width = 12, h3("Investigating COVID-19 impacts on low income group’s access to affordable housing in Canada between January 2010 to October 2020."))),
              br(),
              h2(tags$b("Questions Answered")),
              fluidRow(box(width = 12, h3(actionLink("switchGraph1", "How has COVID-19 changed the amount of Canadians who meet the requirements for affordable housing in Canada?")),
              h3(actionLink("switchGraph2", "How has COVID-19 affected job loss in Canada for 2020?")),
              h3(actionLink("switchGraph3", "How has the low income communities in Canada been affected by the COVID-19 pandemic in terms of cost of living and income?")),
              h3(actionLink("switchGraph4", "How has the creation of affordable housing in Ontario been affected by COVID-19? Has there been more, less or the same amount created?")))),
              br(),
              h2(tags$b("Literature Review")),
              fluidRow(box(width = 12, h3("Affordable housing in Canada has become more and more of a pressing issue. With Covid-19 having a drastic effect on the Canadian economy our group looked at how this has effected affordable housing.  A study in 2014 found that “Nearly 1 in 5 households experience extreme housing affordability problems.” [Gaetz, S., Gulliver, T. & Richter, T. (2014)] This demonstrates how large a problem affordable housing is becoming. “From 2005 to 2018, the average residential price in the Toronto region increased about 150%” [Zhang, B. (2019)]. However even with this large increase the average wage did not increase thus leading to more people in need of affordable housing. Nowadays, Canada spends around 1% of its budget on social housing [Hulchanski, J. D. (2005)]. With the rise in rent and housing prices it is paramount that the government spends more money on social housing to try and fight the affordable housing crisis.")))
      ),
      
      # Graph1 content
      tabItem(tabName = "graph1",
              h2("How has COVID-19 changed the amount of Canadians who meet the requirements for affordable housing in Canada?"),
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
              box(width = 12, h3("This graph demonstrates the core housing need rate according to each province. The data does not go until 2020 as the data is currently not available. The goal of this graph is to see if there is a relationship between COVID-19 and core housing need. This will be displayed in the graph when the data becomes available. The current trends in the data show us that each province is trending completely differently. Due to this looking at Canada as a whole will not be effective in anwsering the question; instead each province must be looked at individually.")),
              br(),
              h3("Data Sets"),
              fluidRow(box(width = 12, h5("Government of Canada, S. (2018, August 23). Core housing need, 2016 Census. Retrieved November 27, 2020, from https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/chn-biml/index-eng.cfm"),
              h5("CMHC. (2018, March 31). Canada Mortgage and Housing Corporation (Rep.). Retrieved November 27, 2020, from CMHC website:https://www.cmhc-schl.gc.ca/en/data-and-research/data-tables/households-core-housing-need-canada-province-territory-cmas")))
              
      ),
      # Graph2 content
      tabItem(tabName = "graph2",
              h2("How has COVID-19 affected job loss in Canada for 2020?"),
              fluidRow(
                box(plotOutput("plot2")),
                box(plotOutput("plot3"))
                ),
              fluidRow(box(
                title = "Province",
                selectInput(inputId = "province",
                            label = "Location:",
                            choices = c("Newfoundland and Labrador" = "Newfoundland and Labrador",
                                        "Prince Edward Island" = "Prince Edward Island",
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
              box(width = 12, h3("This graph "),
              h5(actionLink("switchMethods2", "Click to learn more about multiple linear regression"))),
              br(),
              h3("Data Sets"),
              fluidRow(box(width = 12, h5("Statistics Canada. Table 14-10-0287-03 Labour force characteristics by province, monthly, seasonally adjusted"),
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
              h5("Government of New Brunswick, C. (2017, April 24). REVISED / State of emergency declared in response to COVID-19. Retrieved November 27, 2020, from https://www2.gnb.ca/content/gnb/en/news/news_release.2020.03.0139.html"))),
      ),
      # Graph3 content
      tabItem(tabName = "graph3",
              h2("How has the low income communities in Canada been affected by the COVID-19 pandemic in terms of cost of living and income?"),
              fluidRow(
                box(
                  plotOutput("plot4"),
                  width = 8,
                ),
                box(
                  title = "Controls",
                  sliderInput(inputId = "percentSliderICF", "COVID-19 Affect on Two Parent Families(%):", 1, 200, 100),
                  sliderInput(inputId = "percentSliderILP", "COVID-19 Affect on Lone Parent Families(%):", 1, 200, 100),
                  sliderInput(inputId = "percentSliderINOT", "COVID-19 Affect on People not in Census Group(%):", 1, 200, 100),
                  width = 4
                )
              ),
              
              br(),
              box(width = 12, h3("This graph...."),
              h5(actionLink("switchMethods3", "Click to learn more about linear regression"))),
              br(),
              h3("Data Sets"),
              box(width = 12, h5("Statistics Canada. Table 11-10-0222-01 Household spending, Canada, regions and provinces"),
              h5("Statistics Canada. Table 11-10-0012-01 Distribution of total income by census family type and age of older partner, parent or individual"))
              
      ),
      # Graph4 content
      tabItem(tabName = "graph4",
              h2("How has the creation of affordable housing in Ontario been affected by COVID-19? Has there been more, less or the same amount created?"),
              br(),
              box(width = 12, h3("This graph...."),
              h5(actionLink("switchMethods4", "Click to learn more about linear regression"))),
              br(),
              h3("Data Sets"),
              box(width = 12, h5("Government of Ontario. (2019, November 15). Ontario (Rep.). Retrieved November 27, 2020, from Government of Ontario website: https://www.ontario.ca/page/2018-2019-investment-affordable-housing-annual-public-reports"))
      ),
      # Methods
      tabItem(tabName = "methods",
              h2(tags$b("Methods")),
              h3(tags$b("Linear Regression")),
              box(width = 12, 
                  h4("Linear Regression is a statistical method that allows us to study the relationship between 2 quantitative variables. It assumes there is a relationship between the variables we are studying, and the data is normally distributed."),
                  h4(withMathJax(paste0("\\(y = \\beta_0 + \\beta_1 x + \\epsilon \\)" ))),
                  h4("example:"),
                  h4("how to interpret"),
                  h4("Citation: Yale.edu, Stats. (n.d.). Multiple Linear Regression. Retrieved November 25, 2020, from http://www.stat.yale.edu/Courses/1997-98/101/linreg.htm")
              ),
              br(),
              h3(tags$b("Multiple Linear Regression")),
              box(width = 12, 
                  h4("Multiple Linear Regression attempts to model the relationship between 2 or more explanatory variables and the response variable using a linear equation. It assumes there is a linear relationship between the variables we are studying, and the data is normally distributed."),
                  h4(withMathJax(paste0("\\(y = \\beta_0 + \\beta_1 x + \\beta_2 x_2 + \\epsilon \\)" )),
                  h4("example:"),
                  h4("how to interpret"),
                  h4("Citation: Yale.edu, Stats. (n.d.). Multiple Linear Regression. Retrieved November 25, 2020, from http://www.stat.yale.edu/Courses/1997-98/101/linmult.htm"))
              )
      )
    )
  )
)






server <- function(input, output, session) {
  set.seed(122)
  histdata <- rnorm(500)
  
  
  observeEvent(input$switchGraph1, {
    newtab <- switch(input$tabs, "home" = "graph1")
    updateTabItems(session, "tabs", newtab)
  })
  
  observeEvent(input$switchGraph2, {
    newtab <- switch(input$tabs, "home" = "graph2")
    updateTabItems(session, "tabs", newtab)
  })
  
  observeEvent(input$switchGraph3, {
    newtab <- switch(input$tabs, "home" = "graph3")
    updateTabItems(session, "tabs", newtab)
  })
  
  observeEvent(input$switchGraph4, {
    newtab <- switch(input$tabs, "home" = "graph4")
    updateTabItems(session, "tabs", newtab)
  })
  
  observeEvent(c(input$switchMethods1,input$switchMethods2, input$switchMethods3, input$switchMethods4), {
    newtab <- switch(input$tabs, "graph1" = "methods", "graph2" = "methods", "graph3" = "methods", "graph4" = "methods")
    updateTabItems(session, "tabs", newtab)
  })
  
  
  
  output$plot1 <- renderPlot({
    #aes_string is used because input$location is passed to it as a string
    ggplot(g1Data, aes_string(x="Year", y=input$location), color="red") + 
      geom_line() + 
      ylab("Core Housing Need Rate (%)") + 
      ggtitle(paste(input$location, "Core Housing Need Rate From 1991 to 2016", sep=" ")) +
      theme(plot.title = element_text(face = "bold", size = 18))
  })
  
  output$plot2 <- renderPlot({
    g2Data$Month <- factor(g2Data$Month, levels = c("January","February", "March", "April", "May", "June", "July", "August", "September", "October"))
    
    ggplot(data = subset(g2Data, Province %in% strsplit(input$province, "  +")), aes(x = Month, y = Unemployment.Rate,  fill = Province)) +
      geom_bar(stat="identity", position="dodge") +
      expand_limits(y = c(0,18)) + 
      theme(legend.direction = "vertical", legend.justification='left') + 
      ggtitle("Unemployment Rate by Province") +
      theme(plot.title = element_text(face = "bold", size = 18))
  })
  
  output$plot3 <- renderPlot({
    g2.1Data$Month <- factor(g2.1Data$Month, levels = c("January","February", "March", "April", "May", "June", "July", "August", "September", "October"))
    
    #ggplot(data = subset(g2.1Data, Province %in% c("Ontario","Quebec") ), aes(y = Total.Covid.Cases, x = Month, group=1, color=Province)) +
    
    #temp <- g2.1Data[g2.1Data$Province %in% input$province,]
    
    ggplot(data = subset(g2.1Data, Province %in% strsplit(input$province, "  +")), aes(y = Percentage.of.Pop.with.Covid.by.100, x = Month, group=Province, color=Province)) +
      geom_line(size = 3, alpha = 0.75) +
      geom_point(size =3, alpha = 0.75) +
      ggtitle("Percentage(%) of Covid Cases by Province per Month") +
      ylab("Percentage(%) of COVID-19 Cases") + 
      theme(plot.title = element_text(face = "bold", size = 18))
  })
  
  output$plot4 <- renderPlot({
    
    ICF <- subset(g3Data, Type %in% "Income Couple Families")
    ILP <- subset(g3Data, Type %in% "Income Lone Parents")
    INOT <- subset(g3Data, Type %in% "Income Not in Census Group")
    EXP <- subset(g3Data, Type %in% "Total Expenditure")
    
    
    lmICF <- lm(ICF$Expenditure ~ ICF$Year)
    lmILP <- lm(ILP$Expenditure ~ ILP$Year)
    lmINOT <- lm(INOT$Expenditure ~ INOT$Year)
    lmEXP <- lm(EXP$Expenditure ~ EXP$Year)
    

    #y    =   m   x    +   b
    ICF17 <- (lmICF$coefficients["ICF$Year"] * 2017 + lmICF$coefficients["(Intercept)"])
    ICF18 <- (lmICF$coefficients["ICF$Year"] * 2018 + lmICF$coefficients["(Intercept)"])
    ICF19 <- (lmICF$coefficients["ICF$Year"] * 2019 + lmICF$coefficients["(Intercept)"])
    ICF20 <- (lmICF$coefficients["ICF$Year"] * 2020 + lmICF$coefficients["(Intercept)"])
    ICF20 <- ICF20 * input$percentSliderICF/100
    
    ILP17 <- (lmILP$coefficients["ILP$Year"] * 2017 + lmILP$coefficients["(Intercept)"])
    ILP18 <- (lmILP$coefficients["ILP$Year"] * 2018 + lmILP$coefficients["(Intercept)"])
    ILP19 <- (lmILP$coefficients["ILP$Year"] * 2019 + lmILP$coefficients["(Intercept)"])
    ILP20 <- (lmILP$coefficients["ILP$Year"] * 2020 + lmILP$coefficients["(Intercept)"])
    ILP20 <- ILP20 * input$percentSliderILP/100
    
    INOT17 <- (lmINOT$coefficients["INOT$Year"] * 2017 + lmINOT$coefficients["(Intercept)"])
    INOT18 <- (lmINOT$coefficients["INOT$Year"] * 2018 + lmINOT$coefficients["(Intercept)"])
    INOT19 <- (lmINOT$coefficients["INOT$Year"] * 2019 + lmINOT$coefficients["(Intercept)"])
    INOT20 <- (lmINOT$coefficients["INOT$Year"] * 2020 + lmINOT$coefficients["(Intercept)"])
    INOT20 <- INOT20 * input$percentSliderINOT/100
    
    EXP17 <- (lmEXP$coefficients["EXP$Year"] * 2017 + lmEXP$coefficients["(Intercept)"])
    EXP18 <- (lmEXP$coefficients["EXP$Year"] * 2018 + lmEXP$coefficients["(Intercept)"])
    EXP19 <- (lmEXP$coefficients["EXP$Year"] * 2019 + lmEXP$coefficients["(Intercept)"])
    EXP20 <- (lmEXP$coefficients["EXP$Year"] * 2020 + lmEXP$coefficients["(Intercept)"])
    

    #print(str(summary(lmICF$coefficients["(Intercept"])))
    #print(names(summary(lmICF)))
    
    #ICF18 <- 
    #ICF19 <-
    
    
    ggplot(g3Data, aes(x=Year, y=Expenditure, color=Type)) +
      geom_point(alpha=0.5, size=2) +
      geom_smooth(method='lm', formula = y~x) +
      #scale_y_continuous(labels = comma) +
      ggtitle("Income for Households Across Canada and Average Household Expenditures") + 
      ylab("Amount ($)") +
      scale_x_continuous(breaks=c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020)) +
      expand_limits(y = 0) +
      labs(color = "Legend") +
      theme(plot.title = element_text(face = "bold", size = 18)) +
      geom_point(alpha=0.75, size=3, aes(x = 2017, y = ICF17, color = "Income Couple Families", group = "ICF")) +
      geom_point(alpha=0.75, size=3, aes(x = 2018, y = ICF18, color = "Income Couple Families", group = "ICF")) +
      geom_point(alpha=0.75, size=3, aes(x = 2019, y = ICF19, color = "Income Couple Families", group = "ICF")) +
      geom_point(alpha=0.75, size=3, aes(x = 2020, y = ICF20, color = "Income Couple Families", group = "ICF")) +
      geom_segment(aes(x = 2017, y = ICF17, xend = 2018, yend = ICF18, color = "Income Couple Families")) +
      geom_segment(aes(x = 2018, y = ICF18, xend = 2019, yend = ICF19, color = "Income Couple Families")) +
      geom_segment(aes(x = 2019, y = ICF19, xend = 2020, yend = ICF20, color = "Income Couple Families")) +
      
      geom_point(alpha=0.75, size=3, aes(x = 2017, y = ILP17, color = "Income Lone Parents")) +
      geom_point(alpha=0.75, size=3, aes(x = 2018, y = ILP18, color = "Income Lone Parents")) +
      geom_point(alpha=0.75, size=3, aes(x = 2019, y = ILP19, color = "Income Lone Parents")) +
      geom_point(alpha=0.75, size=3, aes(x = 2020, y = ILP20, color = "Income Lone Parents")) +
      geom_segment(aes(x = 2017, y = ILP17, xend = 2018, yend = ILP18, color = "Income Lone Parents")) +
      geom_segment(aes(x = 2018, y = ILP18, xend = 2019, yend = ILP19, color = "Income Lone Parents")) +
      geom_segment(aes(x = 2019, y = ILP19, xend = 2020, yend = ILP20, color = "Income Lone Parents")) +
      
      geom_point(alpha=0.75, size=3, aes(x = 2017, y = INOT17, color = "Income Not in Census Group")) +
      geom_point(alpha=0.75, size=3, aes(x = 2018, y = INOT18, color = "Income Not in Census Group")) +
      geom_point(alpha=0.75, size=3, aes(x = 2019, y = INOT19, color = "Income Not in Census Group")) +
      geom_point(alpha=0.75, size=3, aes(x = 2020, y = INOT20, color = "Income Not in Census Group")) +
      geom_segment(aes(x = 2017, y = INOT17, xend = 2018, yend = INOT18, color = "Income Not in Census Group")) +
      geom_segment(aes(x = 2018, y = INOT18, xend = 2019, yend = INOT19, color = "Income Not in Census Group")) +
      geom_segment(aes(x = 2019, y = INOT19, xend = 2020, yend = INOT20, color = "Income Not in Census Group")) +
      
      geom_point(alpha=0.75, size=3, aes(x = 2017, y = EXP17, color = "Total Expenditure")) +
      geom_point(alpha=0.75, size=3, aes(x = 2018, y = EXP18, color = "Total Expenditure")) +
      geom_point(alpha=0.75, size=3, aes(x = 2019, y = EXP19, color = "Total Expenditure")) +
      geom_point(alpha=0.75, size=3, aes(x = 2020, y = EXP20, color = "Total Expenditure")) +
      geom_segment(aes(x = 2017, y = EXP17, xend = 2018, yend = EXP18, color = "Total Expenditure")) +
      geom_segment(aes(x = 2018, y = EXP18, xend = 2019, yend = EXP19, color = "Total Expenditure")) +
      geom_segment(aes(x = 2019, y = EXP19, xend = 2020, yend = EXP20, color = "Total Expenditure"))
      
  })
}

shinyApp(ui, server)