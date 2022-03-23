

library(tidyverse) # Paquete utilizado para hacer cualquier limpieza de datos o conversión de variables
library(xlsx)      # Paquete utilizado para abrir documento de Excel
library(networkD3) # Paquete utilizado para realizar el diagrama de Sankey 
library(htmltools) # Paquete utilizado para usar widgets de html
library(htmlTable)

nodes <- read.xlsx("Sankey.xlsx", sheetIndex = 2, encoding="UTF-8", as.data.frame = TRUE, header=TRUE) # Se cargan los nodos del diagrama
links <- read.xlsx("Sankey.xlsx", sheetIndex = 1, encoding="UTF-8", as.data.frame = TRUE, header=TRUE) # Se cargan los links o enlaces para el diagrama
links <- links %>% select(-NA.) ; nodes <- nodes %>% na.omit() # Se realiza una limpieza breve de datos faltantes en las hojas de datos.
p <- sankeyNetwork(Links = links, Nodes = nodes, Source = "From.", 
                   Target = "To", Value = "Value", NodeID = "name",
                   units = "GWh", nodeWidth = 30, sinksRight = TRUE, height = 800, width = 1000, fontSize= 12) # Función para construir el diagrama: 
sankey <- htmlwidgets::prependContent(p, htmltools::tags$h1("Balance Energético Colombiano 2019"))
sankey
