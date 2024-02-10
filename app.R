library(shiny)
library(RMySQL)
library(leaflet)
library(DT)
library(reactlog)
reactlog::reactlog_enable()

#Sys.setenv(user  = "abishekbalaji97", "password" = 'sacredstuff1889%')

#Get the user credentials to connect to the MySQL local database through the environment variables
user  = Sys.getenv("user")
pwd = Sys.getenv("password")

Sys.getenv("R_USER")

#Connect to the mysql Database instance present on the local server

con <- dbConnect(MySQL(), user = user, password = pwd, 
                 dbname = "dhcs_medical_programs", host = "127.0.0.1")

query <- "SELECT ffs.Provider_Name,ffs.Enroll_Status_Eff_DT,l.Address_Line_1,l.City,l.State,l.Zip_Code,l.County,l.Latitude,l.Longitude 
FROM ffs_providers ffs INNER JOIN locations l 
WHERE 
ffs.Location_ID = l.Location_ID AND (l.Latitude != -9999 OR l.Longitude !=-9999)"
ffs_data <- dbGetQuery(con, query)
state_unique_values = unique(ffs_data$State)
city_unique_values = unique(ffs_data$City)
zip_code_unique_values = unique(ffs_data$Zip_Code)


# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel(h1("DHCS Database Portal", align = "center")),
  sidebarLayout(
    
    #Define the sidebar component for holding the user configurable slicers
    sidebarPanel(
      textInput("LanguageInputId", label = "Enter the language in which you want to view the tabular details", value = "English"),
      selectInput("StateInputId", label = "Filter for a particular State:", 
                  choices = state_unique_values,selected = state_unique_values,multiple = TRUE),
    
      selectInput("CityInputId", label = "Filter for a particular City:", selected = city_unique_values,
                  choices = city_unique_values,multiple = TRUE),
      selectInput("ZipCodeInputId", label = "Filter for a particular Zip Code:", selected = zip_code_unique_values,
                  choices = zip_code_unique_values,multiple = TRUE)   
      
    ),
        
    
    mainPanel(
      h4(textOutput("slicer_selections")),
      leafletOutput("map"),
      dataTableOutput('ffs_data_table')
    )
  )
)


# Define server logic required to generate the visual components of the page ----

server <- function(input, output,session) {
    
  #Filter the ffs providers data based on the user selections
  ffs_data_filtered <- reactive({
      filtered_data <- ffs_data[(ffs_data$State %in% c(input$StateInputId)) & (ffs_data$City %in% c(input$CityInputId))
               & (ffs_data$Zip_Code %in% c(input$ZipCodeInputId)),]
      return(filtered_data)

      
      })
  
  observeEvent(input$StateInputId,{
    
    updateSelectInput(session, "CityInputId",  selected = unique(ffs_data_filtered()$City))
    updateSelectInput(session, "ZipCodeInputId", selected = unique(ffs_data_filtered()$Zip_Code))
    })
  

  observeEvent(input$CityInputId,{
    updateSelectInput(session, "StateInputId",  selected = unique(ffs_data_filtered()$State))
    updateSelectInput(session, "ZipCodeInputId", selected = unique(ffs_data_filtered()$Zip_Code))
  })
  
  
  observeEvent(input$ZipCodeInputId,{
    updateSelectInput(session, "CityInputId",  selected = unique(ffs_data_filtered()$City))
    updateSelectInput(session, "StateInputId", selected = unique(ffs_data_filtered()$State))
  })  
  
  output$slicer_selections <- renderText("Displaying the details of providers based on
                                         user inputs")
  #Rendering the leaflet map
  output$map <-
      renderLeaflet({leaflet(ffs_data_filtered()) %>%
      addTiles() %>% 
      addCircles(lng = ~Longitude, lat = ~Latitude) %>%
      addMarkers(lng= ~Longitude, lat= ~Latitude, popup = ~Provider_Name)})
  #Rendering the tabular data representation of the provider details
  #Pagelength option determines the number of rows that is shown on each page
  output$ffs_data_table <- renderDataTable({
    datatable(ffs_data_filtered(),
              options = list(
                pageLength = 3,
                lengthMenu = c(1, 2, 3, 4, 9),
                language = list(url = paste('//cdn.datatables.net/plug-ins/1.10.11/i18n/', input$LanguageInputId, '.json', sep = ''))))
  })
  
  
}

#Disconnect from the mysql database
onStop(function() {
  dbDisconnect(con)
})

# Create Shiny app ----
shinyApp(ui = ui, server = server)

