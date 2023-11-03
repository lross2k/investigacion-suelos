# Lee datos de CSV
Data <- read.csv("METOROLOGICO/CLEAN_DATA.csv", sep = ",")

library(dplyr)
Promedio <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(TemperaturaAmbiente = mean(TemperaturaAmbiente), HumedadRelativa = mean(HumedadRelativa))
Maximo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(TemperaturaAmbiente = max(TemperaturaAmbiente), HumedadRelativa = max(HumedadRelativa))
Minimo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(TemperaturaAmbiente = min(TemperaturaAmbiente), HumedadRelativa = min(HumedadRelativa))

# Genera CSV con los valores generados
write.csv(Maximo, "METOROLOGICO/HORARIO_MAX.csv", row.names = FALSE)
write.csv(Minimo, "METOROLOGICO/HORARIO_MIN.csv", row.names = FALSE)
write.csv(Promedio, "METOROLOGICO/HORARIO_AVG.csv", row.names = FALSE)
