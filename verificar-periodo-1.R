###############################
## Conversions for Periodo 1 ##
###############################

#install.packages('readxl')
library(readxl)
#install.packages('openxlsx')
library(openxlsx)

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
