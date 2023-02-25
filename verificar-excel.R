# Script simple para ver filas y columnas con valores inválidos "NAN"
#setwd("/home/lross/OneDrive/2023/IS/Asistencia CEQIATEC/verificando-datos/")
#install.packages('openxlsx')
#df <- df[-c(which(df=="NAN", arr.ind=TRUE)[,1])]
#any(df=="NAN")
library(openxlsx)
df <- openxlsx::read.xlsx("Unificado_TBnov2020a29julio2021_Limpio.xlsx","Suelos")
which(df=="NAN", arr.ind=TRUE) -> x
df <- df[-c(x[,1])]
openxlsx::write.xlsx(df, "prueba.xlsx", sheetName="Suelos")
