library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel('Data science Project'),
        sidebarPanel(
            h4('Seed'),
            numericInput('seed',label='',value = 1234),
            
            h4('Distribution'),
            radioButtons('distrb',label='',
                         c("Std.Normal","t-distrb","Chi-sq"), 
                         selected = "Std.Normal", 
                         inline = FALSE),
            h4('Number of points'),
            numericInput('n',label='',min= 10, max= 1000,value = 50, step = 1),
            
            h4('Correlation'),
            sliderInput('rho', label='', value = 0, min = -1, max = 1, step = 0.1)
            ),
        mainPanel(
            plotOutput('correlation'),
            helpText("This app shows the effect of correlation on two sets of random variables",
                     "1. Note the seed number to regenerate the results.",
                     "2. Choose the distribution for generting the random variable.",
                     "3. Choose the number of random variables to generate.",
                     "4. Set the correlation between the random variables.",
                     "5. Results will be displayed on the plot.")
            
            )
        
        
        )
    )