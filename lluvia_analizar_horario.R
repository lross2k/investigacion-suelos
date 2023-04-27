# Lee datos de CSV
Data <- read.csv("Datos Base/CLEAN_DATA.csv", sep = ",")

library(dplyr)
Promedio <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(Lluvia = mean(Lluvia))
Maximo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(Lluvia = mean(Lluvia))
Minimo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(Lluvia = mean(Lluvia))

# Genera CSV con los valores generados
write.csv(Maximo, "Datos Base/HORARIO_MAX.csv", row.names = FALSE)
write.csv(Minimo, "Datos Base/HORARIO_MIN.csv", row.names = FALSE)
write.csv(Promedio, "Datos Base/HORARIO_AVG.csv", row.names = FALSE)
