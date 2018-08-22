#---------------------------------------------------------------------#
#             Joining with the table with psf information
#                       Censo escolar data
#---------------------------------------------------------------------#
library(tidyverse)

# importing csv file with psf information about PSF's coverage area 

psf <- read.csv("psf.csv", col.names = c("x",
                                         "cod_mun",
                                         "ano_censo",
                                         "psf"))[-1]

# dataset with data of censo in period of 2007 to 2015

censo <- read.csv("censo_escolar.csv")[-c(1,2)]

# setting manualy the same format in psf table

censo$cod_mun <- as.numeric(gsub('.{1}$', '', censo$cod_mun))

# final dataframe, ready to analysis

base <- censo %>%
  left_join(psf, by = c("cod_mun", "ano_censo")) %>% 
  filter(ano_censo != 2014 & ano_censo != 2015)

# removing from memory old datasets

rm(censo, psf)


# our dataset is read for analysis !!

