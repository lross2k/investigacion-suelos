# Lee datos de CSV
Data <- read.csv("Datos Base/CLEAN_DATA.csv", sep = ",")

library(dplyr)
Promedio <- Data %>% group_by(FECHA) %>% 
  summarize(Lluvia = mean(Lluvia))
Maximo <- Data %>% group_by(FECHA) %>% 
  summarize(Lluvia = mean(Lluvia))
Minimo <- Data %>% group_by(FECHA) %>% 
  summarize(Lluvia = mean(Lluvia))

# Genera CSV con los valores generados
write.csv(Maximo, "Datos Base/DIARIO_MAX.csv", row.names = FALSE)
write.csv(Minimo, "Datos Base/DIARIO_MIN.csv", row.names = FALSE)
write.csv(Promedio, "Datos Base/DIARIO_AVG.csv", row.names = FALSE)
