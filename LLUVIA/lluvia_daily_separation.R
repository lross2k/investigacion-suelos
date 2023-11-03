# Lee datos de CSV
Data <- read.csv("LLUVIA/CLEAN_DATA.csv", sep = ",")

library(dplyr)
Promedio <- Data %>% group_by(FECHA) %>% 
  summarize(Lluvia = mean(Lluvia))
Maximo <- Data %>% group_by(FECHA) %>% 
  summarize(Lluvia = max(Lluvia))
Minimo <- Data %>% group_by(FECHA) %>% 
  summarize(Lluvia = min(Lluvia))

# Genera CSV con los valores generados
write.csv(Maximo, "LLUVIA/DIARIO_MAX.csv", row.names = FALSE)
write.csv(Minimo, "LLUVIA/DIARIO_MIN.csv", row.names = FALSE)
write.csv(Promedio, "LLUVIA/DIARIO_AVG.csv", row.names = FALSE)
