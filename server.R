library("shiny")
library("ggplot2")
library("dplyr")
library("rsconnect")

cereal <- read.table("./data/cereal.tsv", header = TRUE, stringsAsFactors = FALSE)

my.server <- function(input, output) {
    # filter out data values based on user input for calories and ratings
    changing.data.calories <- eventReactive(input$go,{
    data <-  cereal %>%
      filter(rating > input$rating[1]) %>%
      filter(calories > input$calories[1])
    return(data)
  })
  
    # filter out data values based on user input for calories and ratings
    changing.data.sodium <- eventReactive(input$go,{
    data1 <-  cereal %>%
      filter(rating > input$rating[1]) %>%
      filter(sodium > input$sodium[1])
    return(data1)
  })
  
  # create scatter plot based on user input for calories and ratings
  output$plot1 <- renderPlot({
    return(ggplot(data = changing.data.calories(), mapping = aes(rating, calories, color = calories)) + geom_point() + 
      labs(title = "Nutrition Facts Based on Calories and Ratings", x = "rating(arbitrary value)", y = "calories(per serving)"))
  }) 
  
  # create scatter plot based on user input for sodium and ratings
  output$plot2 <- renderPlot({
    return(ggplot(data = changing.data.sodium(), mapping = aes(x = rating, y = sodium, color = sodium)) + geom_point() + 
      labs(title = "Nutrition Facts Based on Sodium and Ratings", x = "rating(arbitrary value)", y = "sodium(mg)"))
  })
}