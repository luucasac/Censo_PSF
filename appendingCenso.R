#---------------------------------------------------------------------#
#                     Appending all years data
#                         Censo escolar data
#---------------------------------------------------------------------#

library(tidyverse)

datalist = list() # CREATING A EMPTY LIST TO RECEIVE EVERY DATA.FRAME OF CENSO

ano <- c(2007:2015) # INPUTING MANUALLY MY PARAMETERS

for (i in seq_along(ano)) {
  
  # READING CSV FILES FROM EACH YEAR OF CENSO
  
  dat <- read.csv2(paste0("censo_escolar", ano[i], ".csv"))
  
  # INPUTTING DATA INTO A LIST
  
  datalist[[i]] <- dat 
  
  # BINDING ALL DATA.FRAMES IN THE LIST
  
  r <- bind_rows(datalist)
  
  
}