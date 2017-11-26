library("shiny")


cereal <- read.table("./data/cereal.tsv", header = TRUE, stringsAsFactors = FALSE)

# creating the range for the sidebars
calories <- range(cereal$calories)
rating <- range(cereal$rating)
sodium <- range(cereal$sodium)

ui <- fluidPage(
  # title for the app
  titlePanel("Nutrition Facts about Cereal"),
  sidebarLayout( 
    sidebarPanel(
      # action button that updates graphs based on information from sliders
      actionButton('go', 'Update Graphs') ,
      # sliders that allow user to input information
      sliderInput('calories', label = "calories", min = calories[1], max = calories[2], value = calories[1]),
      sliderInput('rating', label = "rating", min = rating[1], max = rating[2], value = rating[1]),
      sliderInput('sodium', label = "sodium", min = sodium[1], max = sodium[2], value = sodium[1])
      
    ),
    mainPanel(
      # outputs two graphs 
      plotOutput("plot1") ,
      plotOutput("plot2")
    )
  )
)