library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Would you be tall in 1885?"),
  sidebarPanel(
    sliderInput('myheight', 'What is your height (inches)',value = 72, min = 60, max = 85, step = 0.05,)
  ),
  mainPanel(
    plotOutput('heightHist'),
    p('Your height:'),
    textOutput('text1'),
    p('Percentage of men in 1885 were shorter than you"'),
    textOutput('prob')    
    
  )
))
