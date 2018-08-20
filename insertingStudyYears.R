getStdYears <- function(ano){
  
  censo <- read.csv2(paste0("censo", ano, ".csv"))
  
  censo <- censo %>% 
  select(contains(etapa = "ETAPA_ENSINO"), cod_mun = municipio1, ano_nasc, ano_censo) %>% 
  mutate(censo, educacao = ifelse(etapa == 14, 1, ifelse(
                                                    etapa == 15|etapa == 4, 2, 
                                                    ifelse(etapa == 16|etapa == 5, 3, ifelse(
                                                      etapa == 17|etapa == 6, 4, ifelse(
                                                        etapa == 18|etapa == 7, 5, ifelse(
                                                          etapa == 19|etapa == 8, 6, ifelse(
                                                            etapa == 20|etapa == 9, 7, ifelse(
                                                              etapa == 21|etapa == 10, 8, ifelse(
                                                                etapa == 41|etapa == 11, 9, ifelse(
                                                                  etapa == 25|etapa == 30, 10, ifelse(
                                                                    etapa == 26|etapa == 31, 11, 12)
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
    summarize(mediaEducacao = mean(educacao))
  
  
  
}