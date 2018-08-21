#---------------------------------------------------------------------#
#                     Appending all years data
#                         Censo escolar data
#---------------------------------------------------------------------#

library(tidyverse)

appendCenso <- function(ano) {
  
  
  
  for(i in seq_along(ano)){
    data <- read.csv2(paste0("censo_escolar",
                             ano[i],
                             ".csv")) %>% 
      bind_rows(data)
    
    write.csv2(data, "censo_escolarFinal.csv")
    
    }

}

appendCenso(c(2007:2015))