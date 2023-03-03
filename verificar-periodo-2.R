###############################
## Conversions for Periodo 2 ##
###############################

#install.packages('readxl')
library(readxl)
#install.packages('openxlsx')
library(openxlsx)

# Open Excel file to verify
readxl::read_excel("02-Datos Estación1_TB_Limpios_periodo 2.xlsx","SUELOS") -> data
# Format date and time to follow the standard
format(data$Hora, format="%H:%M") -> data$Hora
format(data$Fecha, format="%d/%m/%Y") -> data$Fecha

missing <- data[which(data[,-(1:2)]=="NaN", arr.ind=TRUE)[,1],1:2]
missing$Dato = colnames(data[,-(1:2)])[which(data[,-(1:2)]=="NaN", arr.ind=TRUE)[,2]]
openxlsx::write.xlsx(data, "faltantes_02-Datos Estación1_TB_Limpios_periodo 2.xlsx")

rm(data)
rm(missing)
