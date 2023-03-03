# Simple script to remove rows with incomplete data
#any(df=="NAN")

#install.packages('readxl')
library(readxl)
#install.packages('openxlsx')
library(openxlsx)

###############################
## Conversions for Unificado ##
###############################

# Open Excel file to verify
readxl::read_excel("Unificado_TBnov2020a29julio2021_Limpio.xlsx","Suelos") -> data
# Format date and time to follow the standard
format(data$Hora, format="%H:%M") -> data$Hora
format(data$Fecha, format="%d/%m/%Y") -> data$Fecha

missing <- data[which(data[,-(1:2)]=="NaN", arr.ind=TRUE)[,1],1:2]
missing$Dato = colnames(data[,-(1:2)])[which(data[,-(1:2)]=="NaN", arr.ind=TRUE)[,2]]
openxlsx::write.xlsx(data, "faltantes_Unificado_TBnov2020a29julio2021_Limpio.xlsx")

# Remove any row with "NaN" values
#data[-c(which(data[,3:20]=="NaN", arr.ind=TRUE)[,1]),] -> data
# Write changes to Excel file "test.xlsx"
#openxlsx::write.xlsx(data, "test.xlsx", sheetName="Suelos")

rm(data)
rm(missing)

###############################
## Conversions for Periodo 1 ##
###############################

# Open Excel file to verify
readxl::read_excel("01-Datos Estación 1_TB_Limpios_periodo 1.xlsx","Tierra Blanca Suelos ") -> data
# Format date and time to follow the standard
data <- cbind(Hora = format(data$Date, format="%H:%M"), data)
data <- cbind(Fecha = format(data$Date, format="%d/%m/%Y"), data)
data <- data[,-3]

missing <- data[which(data[,-(1:2)]=="NaN", arr.ind=TRUE)[,1],1:2]
missing$Dato = colnames(data[,-(1:2)])[which(data[,-(1:2)]=="NaN", arr.ind=TRUE)[,2]]
openxlsx::write.xlsx(data, "faltantes_01-Datos Estación 1_TB_Limpios_periodo 1.xlsx")

rm(data)
rm(missing)

###############################
## Conversions for Periodo 2 ##
###############################

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
