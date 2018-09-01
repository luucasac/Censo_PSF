library(dplyr)

# --------------------------------------------------------------------#
#             appending more information about psf coverage
# --------------------------------------------------------------------#

r <- read.csv("PSF.csv")[ ,-1 ]
r1 <- read.csv2("Historico_Cobertura_SF_Competencia_Municipio_2014.csv", 
                skip = 30, 
                sep = ";", 
                stringsAsFactors = F)

r2 <- read.csv2("Historico_Cobertura_SF_Competencia_Municipio_2015.csv", 
                skip = 30, 
                sep = ";", 
                stringsAsFactors = F)


# changing the header of two new datasets

names(r1) <- c(
  "ano", "mes", "regiao", "mun_res", "uf", "mun", "psf_prop", "hig_bucal", "x"
)

names(r2) <- c(
  "ano", "mes", "regiao", "mun_res", "uf", "mun", "psf_prop", "hig_bucal", "x"
)

# select only interesting columns

r1 <- r1[, c("mun_res", "ano", "psf_prop") ]
r2 <- r2[, c("mun_res", "ano", "psf_prop") ]


r1 <- r1 %>% mutate(psf = ifelse(psf_prop >= 50, 1, 0)) %>% 
  select(mun_res, ano, psf)

r2 <- r2 %>% mutate(psf = ifelse(psf_prop >= 50, 1, 0)) %>% 
  select(mun_res, ano, psf)

# converting all columns to numeric data

r1$ano <- as.numeric(as.character(r1$ano))

r2$ano <- as.numeric(as.character(r2$ano))

# appending all data.frames

psf <- r %>% 
  filter(!is.na(ano)) %>% 
         bind_rows(r1, r2)

write.csv(psf, "PSF_completo.csv")