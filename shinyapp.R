


runApp(shinyApp(
  ui=(fluidPage(
    titlePanel("amend data frame"),
    
    mainPanel(
      fileInput("file", "Upload file"),
      
      #numericInput("Delete", "Delete row:", 1, step = 1),
      actionButton("Go", "Append!"),
      
      tableOutput("df_data_out")
    )
  )),
  server = (function(input, output) {
    values <- reactiveValues(df_data = df1)
    
    observeEvent(input$file, {
      df2 <- read.csv(input$file$datapath)
      values$df_data <- rbind.data.frame(df1,df2)
    })
    
    # observeEvent(input$Go, {
    #   temp <- values$df_data[-input$Delete, ]
    #   values$df_data <- temp
      
    #})
    
    output$df_data_out <- renderTable(values$df_data)
  })))