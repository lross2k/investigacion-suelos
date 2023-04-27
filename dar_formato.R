# Load data from CSV file
read.csv("Datos Base/RAW_DATA.csv", sep = ",") -> Data
# Format date and time for easier data management
cbind(MINUTO = format(as.POSIXct(Data$Date, format = "%d/%m/%Y %H:%M"), format="%M"), Data) -> Data
cbind(HORA = format(as.POSIXct(Data$Date, format = "%d/%m/%Y %H:%M"), format="%H"), Data) -> Data
cbind(FECHA = format(as.POSIXct(Data$Date, format = "%d/%m/%Y %H:%M"), format="%d/%m/%Y"), Data) -> Data
Data <- Data[,-4]
#cbind(MINUTO = format(as.POSIXct(Data$HORA, format = "%H:%M"), format="%M"), Data) -> Data
#cbind(HORA = format(as.POSIXct(Data$HORA, format = "%H:%M"), format="%H"), Data) -> Data
#cbind(FECHA = Data$FECHA, Data) -> Data
#Data <- Data[,-(4:5)]

Missing <- Data[which(Data=="NAN", arr.ind=TRUE)[,1],1:2]
Missing$DATO = colnames(Data)[which(Data=="NAN", arr.ind=TRUE)[,2]]
#write.csv(Missing, "Datos Base/FALTANTES_UNIFICADO_2.csv")

#install.packages("dplyr", repos = "http://cran.us.r-project.org")
library(dplyr)
if (length(Missing[,1]) != 0) {
PorDato <- Missing %>% 
  dplyr::group_by(DATO) %>% 
  dplyr::summarise(INSTANCES = n())
}

# Save modified CSV
write.csv(Data, "Datos Base/FORMATTED_DATA.csv", row.names = FALSE)
