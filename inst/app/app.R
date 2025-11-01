library(shiny)
library(ggplot2)
library(bslib)
library(dplyr)

ui <- page_fluid(
  theme = bs_theme(bootswatch = "flatly"),
  titlePanel("How Common Is Your Surname?"),
  sidebarLayout(
    sidebarPanel(
      textInput("user_name", "Enter your name:", value = "Smith"),
      actionButton("search", "Search"),
      hr(),
      helpText("This app compares your name's frequency to others in the US Top 1000 list."),
      helpText("Type your name (case-insensitive) and click 'Search' to see how common it is.")
    ),
    mainPanel(
      plotOutput("histPlot"),
      hr(),
      verbatimTextOutput("summaryText"),
      hr(),
      h4("How to interpret the chart:"),
      p("The histogram shows the distribution of name counts across the dataset.
         The red line marks your name’s position — if it’s near the right, your name is very common!")
    )
  )
)

server <- function(input, output, session) {

  # ✅ Load dataset safely
  if ("Top1000" %in% ls("package:assignment4packagescrianto")) {
    data <- get("Top1000", envir = asNamespace("assignment4packagescrianto"))
  } else {
    data("Top1000", envir = environment())
    data <- Top1000
  }

  # Prepare the data
  data <- data %>%
    mutate(name_lower = tolower(name)) %>%
    mutate(count = as.numeric(count))

  # Observe search action
  observeEvent(input$search, {
    user_input <- tolower(trimws(input$user_name))

    # Find matching name
    matched <- data %>% filter(name_lower == user_input)

    output$histPlot <- renderPlot({
      ggplot(data, aes(x = count)) +
        geom_histogram(bins = 30, fill = "#0073C2FF", color = "white") +
        geom_vline(
          data = matched,
          aes(xintercept = count),
          color = "red", size = 1.2, linetype = "dashed"
        ) +
        theme_minimal() +
        labs(
          title = paste("How common is", input$user_name, "?"),
          x = "Number of people with the name",
          y = "Frequency of names"
        )
    })

    output$summaryText <- renderPrint({
      if (nrow(matched) == 0) {
        cat("Sorry, that name was not found in the Top 1000 list.")
      } else {
        cat(
          paste0(
            "Name: ", matched$name, "\n",
            "Rank: ", matched$rank, "\n",
            "Count: ", matched$count, " people\n",
            sprintf("This name represents %.2f per 100k population.", matched$prop100k)
          )
        )
      }
    })
  })
}

shinyApp(ui, server)

