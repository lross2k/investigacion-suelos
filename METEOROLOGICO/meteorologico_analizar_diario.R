# Lee datos de CSV
Data <- read.csv("Datos Base/CLEAN_DATA.csv", sep = ",")

library(dplyr)
Promedio <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(TemperaturaAmbiente = mean(TemperaturaAmbiente), HumedadRelativa = mean(HumedadRelativa))
Maximo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(TemperaturaAmbiente = max(TemperaturaAmbiente), HumedadRelativa = max(HumedadRelativa))
Minimo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(TemperaturaAmbiente = min(TemperaturaAmbiente), HumedadRelativa = min(HumedadRelativa))

# Genera CSV con los valores generados
write.csv(Maximo, "Datos Base/DIARIO_MAX.csv", row.names = FALSE)
write.csv(Minimo, "Datos Base/DIARIO_MIN.csv", row.names = FALSE)
write.csv(Promedio, "Datos Base/DIARIO_AVG.csv", row.names = FALSE)
