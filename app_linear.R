

 library(shiny)
 library(tidyverse)

 #setwd("D:/CodeProjects/optionstrader/app_iris/")
 graph_data <- data.frame(x=seq(from=1,to=10)) %>% 
   mutate(y=2*x+1+rnorm(n=10,mean=0,sd=10*x/10))
 
   
   ui= fluidPage(
     fluidRow(
       #titlePanel(title = "Options Trading Model"),
       br(),
       column(6,
              tableOutput("table")),
       column(6,
              plotOutput("graph")
              )
     )
   )
   
   server=function(input,output,session){
     
     # render table
    output$table <- renderTable({
      graph_data
    }
    )
    
    #render plot
    output$graph <- renderPlot({
      ggplot(data=graph_data)+
        aes(x=x,y=y)+
        geom_point()
      
    })
     
   }
   
   # Return a Shiny app object
   shinyApp(ui = ui, server = server)
 
 