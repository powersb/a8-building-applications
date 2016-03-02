#UI for shiny app

#Setup and installation
library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  # Main title panel
  titlePanel("Iris Data"),
  
  # Declare a sidebar layout
  sidebarLayout(
    
    # Put sidebar elements in here
    sidebarPanel(
      radioButtons("part", label = "Part of the Flower",
                   choices = list("Sepal" = 'Sepal', "Petal" = 'Petal'), 
                   selected = 'Sepal'),
      selectInput("dim", label = h3("Dimension"), 
                  choices = list("Length" = 'Length', "Width" = 'Width'), 
                  selected = 'Length')
    ),
    
    #Put main stuff in here
    mainPanel(
      plotlyOutput('bar')
    )
  )
))