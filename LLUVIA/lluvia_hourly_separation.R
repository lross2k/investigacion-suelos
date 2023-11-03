# Lee datos de CSV
Data <- read.csv("LLUVIA/CLEAN_DATA.csv", sep = ",")

library(dplyr)
Promedio <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(Lluvia = mean(Lluvia))
Maximo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(Lluvia = max(Lluvia))
Minimo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(Lluvia = min(Lluvia))

# Genera CSV con los valores generados
write.csv(Maximo, "LLUVIA/HORARIO_MAX.csv", row.names = FALSE)
write.csv(Minimo, "LLUVIA/HORARIO_MIN.csv", row.names = FALSE)
write.csv(Promedio, "LLUVIA/HORARIO_AVG.csv", row.names = FALSE)
