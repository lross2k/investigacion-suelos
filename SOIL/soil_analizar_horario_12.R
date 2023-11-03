# Lee datos de CSV
Data <- read.csv("SOIL/CLEAN_DATA.csv", sep = ",")

library(dplyr)
Promedio <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(SoilTemp_1 = mean(SoilTemp_1), Perm_1 = mean(Perm_1), SoilTemp_2 = mean(SoilTemp_2), Perm_2 = mean(Perm_2), SoilTemp_3 = mean(SoilTemp_3), Perm_3 = mean(Perm_3), SoilTemp_4 = mean(SoilTemp_4), Perm_4 = mean(Perm_4), SoilTemp_6 = mean(SoilTemp_6), Perm_6 = mean(Perm_6), SoilTemp_7 = mean(SoilTemp_7), Perm_7 = mean(Perm_7), SoilTemp_8 = mean(SoilTemp_8), Perm_8 = mean(Perm_8), SoilTemp_12 = mean(SoilTemp_12), Perm_12 = mean(Perm_12))
Maximo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(SoilTemp_1 = max(SoilTemp_1), Perm_1 = max(Perm_1), SoilTemp_2 = max(SoilTemp_2), Perm_2 = max(Perm_2), SoilTemp_3 = max(SoilTemp_3), Perm_3 = max(Perm_3), SoilTemp_4 = max(SoilTemp_4), Perm_4 = max(Perm_4), SoilTemp_6 = max(SoilTemp_6), Perm_6 = max(Perm_6), SoilTemp_7 = max(SoilTemp_7), Perm_7 = max(Perm_7), SoilTemp_8 = max(SoilTemp_8), Perm_8 = max(Perm_8), SoilTemp_12 = max(SoilTemp_12), Perm_12 = max(Perm_12))
Minimo <- Data %>% group_by(FECHA, HORA) %>% 
  summarize(SoilTemp_1 = min(SoilTemp_1), Perm_1 = min(Perm_1), SoilTemp_2 = min(SoilTemp_2), Perm_2 = min(Perm_2), SoilTemp_3 = min(SoilTemp_3), Perm_3 = min(Perm_3), SoilTemp_4 = min(SoilTemp_4), Perm_4 = min(Perm_4), SoilTemp_6 = min(SoilTemp_6), Perm_6 = min(Perm_6), SoilTemp_7 = min(SoilTemp_7), Perm_7 = min(Perm_7), SoilTemp_8 = min(SoilTemp_8), Perm_8 = min(Perm_8), SoilTemp_12 = min(SoilTemp_12), Perm_12 = min(Perm_12))

# Genera CSV con los valores generados
write.csv(Maximo, "SOIL/HORARIO_MAX.csv", row.names = FALSE)
write.csv(Minimo, "SOIL/HORARIO_MIN.csv", row.names = FALSE)
write.csv(Promedio, "SOIL/HORARIO_AVG.csv", row.names = FALSE)
