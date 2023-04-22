# Lee datos de CSV
Data <- read.csv("Datos Base/PERIODO_1.csv", sep = ";")

# Separar dataframe por dia
Fechas <- split(Data, factor(Data$FECHA, levels = unique(Data$FECHA)))

Promedio <- data.frame(cbind(Fechas[[1]][1,-2]))
names(Promedio) <- colnames(Fechas[[1]][,-2])
Maximo <- data.frame(cbind(Fechas[[1]][1,-2]))
names(Maximo) <- colnames(Fechas[[1]][,-2])
Minimo <- data.frame(cbind(Fechas[[1]][1,-2]))
names(Minimo) <- colnames(Fechas[[1]][,-2])
# Iterar sobre todas las fechas existentes en el dataframe
for (Fecha in Fechas) {
  # Genera valores para agregar a las filas de cada respectivo valor
  ColMean <- apply(Fecha[,-c(1:2)], 2, mean, simplify = FALSE)
  ColMean <- append(ColMean, Fecha[1,1], after = 0)
  ColMax <- apply(Fecha[,-c(1:2)], 2, max, simplify = FALSE)
  ColMax <- append(ColMax, Fecha[1,1], after = 0)
  ColMin <- apply(Fecha[,-c(1:2)], 2, min, simplify = FALSE)
  ColMin <- append(ColMin, Fecha[1,1], after = 0)
  # Genera un dataframe para cada respectivo valor y lo une al dataframe final
  DatosTMP = data.frame(ColMean)
  names(DatosTMP) <- colnames(Fechas[[1]][,-2])
  Promedio <- rbind(Promedio, DatosTMP)
  DatosTMP = data.frame(ColMax)
  names(DatosTMP) <- colnames(Fechas[[1]][,-2])
  Maximo <- rbind(Maximo, DatosTMP)
  DatosTMP = data.frame(ColMin)
  names(DatosTMP) <- colnames(Fechas[[1]][,-2])
  Minimo <- rbind(Minimo, DatosTMP)
  # Limpia environment de iteracion
  rm(DatosTMP, ColMean, ColMax, ColMin)
}
# Limpia environment
rm(Fecha, Fechas, Data)

# Elimina valor dummy colocado al inicio
Promedio <- Promedio[-c(1), ]
Maximo <- Maximo[-c(1), ]
Minimo <- Minimo[-c(1), ]

# Genera CSV con los valores generados
write.csv(Maximo, "Datos Base/PERIODO_1_MAX.csv", row.names = FALSE)
write.csv(Minimo, "Datos Base/PERIODO_1_MIN.csv", row.names = FALSE)
write.csv(Promedio, "Datos Base/PERIODO_1_AVG.csv", row.names = FALSE)
