library(shiny)

shinyServer(
    function(input,output){
        output$correlation <-renderPlot({            
            
            set.seed(input$seed)
            
            n = input$n
            dof = 20
            rho = input$rho
            
            switch(input$distrb,
                "Std.Normal" = {x1 <- rnorm(n);x2 <- rho*x1 +sqrt(1-rho^2)*rnorm(n)},
                "t-distrb" = {x1 <- rt(n,dof);x2 <- rho*x1 +sqrt(1-rho^2)*rt(n,dof)},
                "Chi-sq" = {x1 <- rchisq(n,dof); x2 <- rho*x1 +sqrt(1-rho^2)*rchisq(n,dof)},
                stop("Invalid Distribution")
            )
            
            plot(x1,x2,pch=19,col='blue',xlab='x1',ylab='x2',
                 xlim=c(min(x1)+1, max(x1)+1), 
                 ylim=c(min(x2)+1, max(x2)+1),
                 asp = 1, main = paste(n, " points from ",input$distrb, " rho = ",rho, spe=""))
            
            
            asp <- 1 
            abline(lm(x2~x1),col='red',lwd =2, lend='round', lty = 'dashed', )

            
            abline(0, 1, col='black', lwd =2, lend='round', lty = 'dashed')
            text(x=max(x1)+0.2, y=max(x1), "y = x", srt=180/pi*atan(asp))
            
            abline(0, -1, col='black', lwd =2, lend='round', lty = 'dashed')
            text(x=min(x1)+0.2, y=-min(x1), "y = -x", srt=180/pi*atan(-1*asp))
        })
        
        }
    )
