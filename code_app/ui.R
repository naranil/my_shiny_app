shinyUI(bootstrapPage(
  fluidPage(
    title="Law of Large Numbers and Central Limit Theorem",
    sliderInput(inputId = "n_exp",
              label = h5("Chose the size of your sample"),
              min = 5,
              max = 300,
              value = 5,
              step=1),
  
  checkboxInput(inputId = "gaussian",
                label = strong("Asymptotic normal distribution"),
                value = FALSE),
  
  checkboxInput(inputId = "mean_th",
                label = strong("Theoretical mean"),
                value = FALSE),
  
  checkboxInput(inputId = "mean_est",
                label = strong("Estimate of the mean"),
                value = FALSE),
  
  

    
    column(3,
           radioButtons("radio", label = h5("Distribution"),
                        choices = list("Uniform" = 1, "Normal" = 2,
                                       "Exponential" = 3),selected = 1)),
    
    column(3, label = h3("Parameters"),
           conditionalPanel(condition = "input.radio == 1",
                            numericInput("a", h5("Lower Bound a:"), 0),
                            numericInput("b", h5("Upper Bound b:"), 1)
           ),
           conditionalPanel(condition = "input.radio == 2",
                            numericInput("muexp", h5("Mean:"), 0),
                            numericInput("sdexp", h5("Standard Deviation:"), 1)
           ),
           conditionalPanel(condition = "input.radio == 3",
                            numericInput("lambda", h5("Rate Parameter"), 1)
                            ))   
  ),
  mainPanel(  
  plotOutput(outputId = "main_plot")
) 
)

  )
  
