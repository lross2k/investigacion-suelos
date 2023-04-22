# Simple script to remove rows with incomplete data
#any(df=="NAN")

# Load data from CSV file
read.csv("Datos Base/PERIODO_1.csv", sep = ";") -> Data
# Format date and time for easier data management
cbind(HORA = format(as.POSIXct(Data$TIMESTAMP, format = "%d/%m/%Y %H:%M"), format="%H:%M"), Data) -> Data
cbind(FECHA = format(as.POSIXct(Data$TIMESTAMP, format = "%d/%m/%Y %H:%M"), format="%d/%m/%Y"), Data) -> Data
Data <- Data[,-3]

Missing <- Data[which(Data=="NAN", arr.ind=TRUE)[,1],1:2]
Missing$DATO = colnames(Data)[which(Data=="NAN", arr.ind=TRUE)[,2]]
#write.csv(Missing, "Datos Base/FALTANTES_UNIFICADO_2.csv")

#install.packages(dplyr)
library(dplyr)
if (length(Missing[,1]) != 0) {
PorDato <- Missing %>% 
  dplyr::group_by(DATO) %>% 
  dplyr::summarise(INSTANCES = n())
}

# Remove any row with "NaN" values
#data[-c(which(data[,3:20]=="NaN", arr.ind=TRUE)[,1]),] -> data

# Save modified CSV
write.csv(Data, "Datos Base/PERIODO_1.csv", row.names = FALSE)

rm(Data)
rm(Missing)
rm(PorDato)
