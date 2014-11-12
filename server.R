library(shiny)
library(UsingR)
data(galton)
#prob <<- pnorm(myheight,mean=mean(galton$child),sd=sd(galton$child))

prob <- function(height) pnorm(height,mean=mean(galton$child),sd=sd(galton$child))


shinyServer(
  function(input, output) {
    output$heightHist <- renderPlot({
      hist(galton$child, xlab='height', col='lightblue',main='Probability', prob=TRUE)
      curve(dnorm(x,mean=mean(galton$child),sd=sd(galton$child)),add=TRUE)
      myheight <- input$myheight
      lines(c(myheight, myheight), c(0, 200),col="red",lwd=5)
      #prob <<- pnorm(myheight,mean=mean(galton$child),sd=sd(galton$child))
#      text(63, 150, paste("Percentage of people in 1885 shorter than you = ", prob))
#      text(63, 250, paste("Percentage of people in 1885 shorter than you = ", prob))
      })
    
    output$text1 <- renderText({input$myheight})
    output$prob <- renderText(round(prob(input$myheight),4)*100.)
  }
)
