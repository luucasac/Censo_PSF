library(tidyverse)

colapsando <- function(ano){
  
  censo <- read.csv2(paste0("censo", ano, ".csv"))

  
  censo_escolar <- censo %>% 
  select(etapa_ensino, cod_mun = municipio1, ano_nasc, ano_censo) %>% 
  mutate(educacao = ifelse(etapa_ensino == 14, 1, ifelse(
                                                    etapa_ensino == 15|etapa_ensino == 4, 2, 
                                                    ifelse(etapa_ensino == 16|etapa_ensino == 5, 3, ifelse(
                                                      etapa_ensino == 17|etapa_ensino == 6, 4, ifelse(
                                                        etapa_ensino == 18|etapa_ensino == 7, 5, ifelse(
                                                          etapa_ensino == 19|etapa_ensino == 8, 6, ifelse(
                                                            etapa_ensino == 20|etapa_ensino == 9, 7, ifelse(
                                                              etapa_ensino == 21|etapa_ensino == 10, 8, ifelse(
                                                                etapa_ensino == 41|etapa_ensino == 11, 9, ifelse(
                                                                  etapa_ensino == 25|etapa_ensino == 30, 10, ifelse(
                                                                    etapa_ensino == 26|etapa_ensino == 31, 11, 12)
                                                                    )
                                                                  )
                                                                )
                                                              )
                                                            )
                                                          )
                                                        )
                                                      )
                                                    ))
         ) %>% 
    group_by(cod_mun, ano_censo) %>% 
    summarize(mediaEducacao = mean(educacao, na.rm = T))

    
  write.csv2(censo_escolar, paste0("censo_escolar", ano,".csv"))
  
  
}



lapply(list(2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015), colapsando)