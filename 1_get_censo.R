#---------------------------------------------------------------------#
#                     Importing and cleaning
#                       Censo escolar data
#---------------------------------------------------------------------#

library(data.table)
library(tidyverse)
library(stringr)

memory.limit(54000)

### function to load, clean and append the regions csv's.


getCenso <- function(ano){

  # Getting South data

    sul <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                          ano, "/DADOS/",
                          "MATRICULA_SUL.CSV"), 
                 sep = "|") %>%
      select(
        ano_censo = ends_with("ANO_CENSO"),
        ano_nasc = ends_with("NU_ANO"),
        municipio = contains("MUNICIPIO"),
        etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11)
  
  # Getting Southeast data

    sudeste <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_SUDESTE.CSV"), sep = "|") %>%
      select(
        ano_censo = ends_with("ANO_CENSO"),
        ano_nasc = ends_with("NU_ANO"),
        municipio = contains("MUNICIPIO"),
        etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11)
    
    # binding data to censo (south and southeast is being appended)
    
    censo <- sul %>% 
      bind_rows(sudeste)
    
    # removing the old objects
    
    rm(sul, sudeste)
    
    # Getting northeast data
    
    nordeste <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_NORDESTE.CSV"), sep = "|") %>%
      select(
        ano_censo = ends_with("ANO_CENSO"),
        ano_nasc = ends_with("NU_ANO"),
        municipio = contains("MUNICIPIO"),
        etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11)
    
    # binding data to censo
    
    censo <- censo %>% 
      bind_rows(nordeste)
    
    # removing the old objects
    
    rm(nordeste)
    
    # Getting North data
    
    norte <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_NORTE.CSV"), sep = "|") %>%
      select(
        ano_censo = ends_with("ANO_CENSO"),
        ano_nasc = ends_with("NU_ANO"),
        municipio = contains("MUNICIPIO"),
        etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11)
    
    # binding data to censo
    
    censo <- censo %>% 
      bind_rows(norte)
    
    # removing the old objects
    
    rm(norte)
    
    # Getting Center West data
    
    
    co <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_CO.CSV"), sep = "|") %>%
      select(
        ano_censo = ends_with("ANO_CENSO"),
        ano_nasc = ends_with("NU_ANO"),
        municipio = contains("MUNICIPIO"),
        etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11)
  
    # binding data to censo
    
    censo <- censo %>% 
      bind_rows(co)
    
    # removing the old objects
    
    rm(co)
    
    # writing a csv with all regions csv appended
    
  write.csv2(censo, paste0("censo", ano, ".csv"))

    
    
}

# getCenso(2007)
# getCenso(2008)
# getCenso(2009)
# getCenso(2010)
# getCenso(2011)
# getCenso(2012)
# getCenso(2013)
# getCenso(2014)
getCenso(2015)