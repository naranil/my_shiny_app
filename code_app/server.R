shinyServer(function(input, output) {  

  output$main_plot <- renderPlot({
    
    dist <- NULL
    estmean <- NULL
    
    if (input$radio == 1){
      for (i in 1:input$n_exp){
        dist <- c(dist, runif(input$n_exp, input$a, input$b))
        estmean <- c(estmean, sum(runif(input$n_exp, input$a, input$b))/input$n_exp)
      }
    }
    else if (input$radio == 2) {
      for (i in 1:input$n_exp){        
        dist <- c(dist, rnorm(input$n_exp, input$muexp, input$sdexp))  
        estmean <- c(estmean, sum(rnorm(input$n_exp, input$muexp, input$sdexp))/input$n_exp)        
      }
    } 
    else 
    {
      for (i in 1:input$n_exp){  
        dist <- c(dist, rexp(input$n_exp, input$lambda))
        estmean <- c(estmean, sum(rexp(input$n_exp, input$lambda))/input$n_exp)     
      }
    }
    
    par(mfrow=c(1,2))
    hist(dist,
         xlab = "",
         main = "Density of the law")
    hist(estmean,
         probability = TRUE,
         xlab = "",
         main = "Histogram of the estimate means")
    
    if (input$mean_th){
      if (input$radio == 1){
        abline(v = (input$a + input$b)/2, lwd=4, col="red")
      }
      
      else if (input$radio == 2){
        abline(v = input$muexp, lwd=4, col="red")
      }
      
      else {
        abline(v = 1 / input$lambda, lwd=4, col="red")
      }
    }
    
    if (input$mean_est){
        abline(v = mean(estmean), lwd=4)
    }
    
    if (input$gaussian){
      if (input$radio == 1){
        curve(dnorm(x, mean=(input$a + input$b)/2, sd=((input$b - input$a)/sqrt(12)/sqrt(input$n_exp))), add=TRUE)
      }
      
      else if (input$radio == 2){
        curve(dnorm(x, mean= input$muexp, sd= input$sdexp/sqrt(input$n_exp)), add=TRUE)
      }
      
      else {
        curve(dnorm(x, mean= 1 / input$lambda, sd= 1 / (sqrt(input$n_exp)*input$lambda)), add=TRUE)
      }
    }
    
  })

})
