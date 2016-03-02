#Server for shiny app

#Setup and installation
library(plotly)
library(shiny)
library(dplyr)

data(iris)

shinyServer(function(input, output) {
  output$bar <- renderPlotly({ 
    df <- iris %>% group_by(Species) %>% summarize(SepalLength = round(mean(Sepal.Length), 1),
                                                   SepalWidth = round(mean(Sepal.Width), 1),
                                                   PetalLength = round(mean(Petal.Length), 1),
                                                   PetalWidth = round(mean(Petal.Width), 1))
    var <- paste0(input$part, input$dim)
    plot_ly(df, 
                   x = Species, 
                   y = eval(parse(text = var)), 
                   type = "bar"
                   ) %>% 
      layout(yaxis = list(title = paste(input$part, ' ', input$dim)))
  })
})