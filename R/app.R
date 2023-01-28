#' STF shiny server
#'
#' @param input Input to server.
#' @param output Output from server.
#'
#' @return I'm not sure.
server = function(input, output) {
  scores = shiny::reactive({
    simScores(ns = input$ns, nw = input$nw, multi = input$multi)
  })
  probability = shiny::reactive({
    empiricalDistTable(scores())
  })
  output$plot = shiny::renderPlot({
    plotScores(scores())
  })
  output$probTable = shiny::renderTable(probability())
}

#' Run the STF application
#'
#' @return Does it "return" anything?
#' @export
runSTF = function() {

  # define application UI
  ui = shiny::fluidPage(

    # application title
    shiny::titlePanel("Star Traders: Frontiers"),

    # collect user input
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::numericInput("ns",
                           "Number of strong dice:",
                           value = 100,
                           step = 1),
        shiny::numericInput("nw",
                           "Number of weak dice:",
                           value = 100,
                           step = 1),
        shiny::numericInput("multi",
                           "Multiplier:",
                           value = 1,
                           step = 0.1),
        shiny::numericInput("cutoff",
                           "Probability cutoff:",
                           value = 50,
                           step = 1)
      ),

      # show plot of simulated distribution
      shiny::mainPanel(
        shiny::plotOutput("plot"),
        shiny::tableOutput("probTable")
      )
    )
  )

  # run application
  shiny::shinyApp(ui = ui, server = server)
}
