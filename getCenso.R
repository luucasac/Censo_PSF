#---------------------------------------------------------------------#
#                     Importing and cleaning
#                       Censo escolar data
#---------------------------------------------------------------------#

library(data.table)
library(tidyverse)

memory.limit(54000)

### função para ler, filtrar, tratar e juntar os arquivos de cada região


getCenso <- function(ano){

  

    sul <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                          ano, "/DADOS/",
                          "MATRICULA_SUL.CSV"), sep = "|") %>%
    select(ano_censo = contains("ANO_CENSO"),
           ano_nasc = contains("NU_ANO"), 
           municipio = contains("MUNICIPIO"),
           etapa_ensino = contains("ETAPA_ENSINO")) %>%
    filter(ano_nasc == ano_censo - 11)
    

    sudeste <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_SUDESTE.CSV"), sep = "|") %>%
      select(ano_censo = contains("ANO_CENSO"),
             ano_nasc = contains("NU_ANO"), 
             municipio = contains("MUNICIPIO"),
             etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11)
    
    # binding data to censo
    
    censo <- sul %>% 
      bind_rows(sudeste)
    
    # removing the old objects
    
    rm(sul, sudeste)
    
    # nordeste data
    
    nordeste <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_NORDESTE.CSV"), sep = "|") %>%
      select(ano_censo = contains("ANO_CENSO"),
             ano_nasc = contains("NU_ANO"), 
             municipio = contains("MUNICIPIO"),
             etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11) 
    
    # binding data to censo
    
    censo <- censo %>% 
      bind_rows(nordeste)
    
    # removing the old objects
    
    rm(nordeste)
    
    # norte data
    
    norte <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_NORTE.CSV"), sep = "|") %>%
      select(ano_censo = contains("ANO_CENSO"),
             ano_nasc = contains("NU_ANO"), 
             municipio = contains("MUNICIPIO"),
             etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11) 
    
    # binding data to censo
    
    censo <- censo %>% 
      bind_rows(norte)
    
    # removing the old objects
    
    rm(norte)
    
    # nordeste data
    
    
    co <- fread(paste0("C:/Users/lucas/Documents/Censo_PSF/data/", 
                 ano, "/DADOS/",
                 "MATRICULA_CO.CSV"), sep = "|") %>%
      select(ano_censo = contains("ANO_CENSO"),
             ano_nasc = contains("NU_ANO"), 
             municipio = contains("MUNICIPIO"),
             etapa_ensino = contains("ETAPA_ENSINO")) %>%
      filter(ano_nasc == ano_censo - 11)
  
    # binding data to censo
    
    censo <- censo %>% 
      bind_rows(co)
    
    # removing the old objects
    
    rm(co)
    
    # nordeste data
    
    
  write.csv2(censo, paste0("censo", ano, ".csv"))

    
    
}

# getCenso(2007)
# getCenso(2008)
# getCenso(2009)
# getCenso(2010)
# getCenso(2011)
#getCenso(2012)
getCenso(2013)
getCenso(2014)
getCenso(2015)