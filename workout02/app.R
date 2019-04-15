library(shiny)
library('ggplot2')

# Define UI for application
ui <- fluidPage(
   
   # Application title
   titlePanel("Time Value of Money"),
   
   # Create a new Row in the UI for slider input and select input
   fluidRow(
      column(4,
             sliderInput("init",
                         "Initial Amount",
                         min = 0,
                         max = 100000,
                         value = 1000,
                         step = 500,
                         post = '$')
            ),
      column(4,
             sliderInput("rrate",
                         "Return Rate (in %)",
                         min = 0,
                         max = 20,
                         value = 5,
                         step = 0.1
                         )
            ),
      column(4,
             sliderInput("year",
                         "Years",
                         min = 0,
                         max = 50,
                         value = 20,
                         step = 1)
             ),
      column(4,
             sliderInput("acon",
                         "Annual Contribution",
                         min = 0,
                         max = 50000,
                         value = 2000,
                         step = 500,
                         post = "$"
                         )
             ),
      column(4,
             sliderInput("grate",
                         "Growth Rate (in %)",
                         min = 0,
                         max = 20,
                         value = 2,
                         step = 0.1
                         )
             ),
      column(4,
             selectInput("facet",
                         "Facet?",
                         choices = c("No","Yes"),
                         selected = "No"))
   ),
      
      # Show a plot of three models of investing and a dataframe  for balance
      mainPanel(
        # Show a plot of three models of investing
        h4("Timelines"),
        plotOutput("distPlot"),
         
        # Show a dataframe for balance
        h4("Balances"),
        tableOutput("balance")
         
      )
   )


# Define server logic required to this app
server <- function(input, output) {
   balance <- reactive({
     
     #define future value function
     future_value <- function(amount, rate, years){
       value = amount*(1+rate)^years
       return(value)
     }
     
     #define annuity function
     annuity <- function(contrib, rate, years){
       value = contrib*(((1+rate)^years-1)/rate)
       return(value)
     }
     
     #define future value of growing annuity function
     growing_annuity <- function(contrib, rate, growth, years){
       value <- contrib*(((1+rate)^years-(1+growth)^years))/(rate-growth)
       return(value)
     }
     
     #form datafram balance
     no_contrib <- rep(0,input$year)
     fixed_contrib <- rep(0,input$year)
     growing_contrib <- rep(0,input$year)
     for (i in 1:(input$year+1)){
       no_contrib[i] = future_value(input$init,input$rrate/100,i-1)
       fixed_contrib[i] = future_value(input$init,input$rrate/100,i-1) + annuity(input$acon,input$rrate/100,i-1)
       growing_contrib[i] = future_value(input$init,input$rrate/100,i-1) + growing_annuity(input$acon,input$rrate/100,input$grate/100,i-1)
     }
     b <- seq(0,input$year)
     a <- b+1
     balance <- data.frame(a,b,no_contrib,fixed_contrib,growing_contrib)
     names(balance) <- c('','year','no_contrib','fixed_contrib','growing_contrib')
     return(balance)
   })

   
   output$balance <- renderTable({
     balance()
   })
   
   output$distPlot <- renderPlot({
     if (input$facet == 'No'){
       ggplot(data = balance())+
         geom_line(aes(x = year, y = no_contrib,col='no_cotrib')) +
         geom_line(aes(x = year, y = fixed_contrib,col = 'fixed_contrib')) +
         geom_line(aes(x = year, y = growing_contrib, col = 'growing_cotrib')) +
         geom_point(aes(x = year, y = no_contrib,col='no_cotrib')) +
         geom_point(aes(x = year, y = fixed_contrib,col = 'fixed_contrib')) +
         geom_point(aes(x = year, y = growing_contrib, col = 'growing_cotrib')) +
         labs(title = 'Three models of investing', x = 'year' , y ='value')+
         scale_colour_hue("variable")
     }else{
       bal = balance()
       year = rep(seq(0:input$year),3)
       variable = rep(c('no_contrib','fixed_contrib','growing_contrib'), each = (input$year+1))
       value = c(bal[,3],bal[,4],bal[,5])
       dat = data.frame(year = year,
                        variable = variable,
                        value = value)
       dat$variable = factor(dat$variable, levels = c('no_contrib','fixed_contrib','growing_contrib'))
       ggplot(data=dat, aes(x = year, y = value, col = variable))+
         geom_line()+
         geom_point()+
         geom_ribbon(aes(ymin = 0, ymax = value,fill = variable), alpha = 0.4)+
         facet_grid(~variable)+
         theme_bw()+
         labs(title = 'Three models of investing')
         
     }
       
     })
}

# Run the application 
shinyApp(ui = ui, server = server)


