# Lee datos de CSV
Data <- read.csv("Datos Base/PERIODO_2.csv", sep = ",")

# Separar dataframe por dia
Fechas <- split(Data, factor(Data$FECHA, levels = unique(Data$FECHA)))

datos_final <- data.frame(cbind(Fechas[[1]][1,-2]))
names(datos_final) <- colnames(Fechas[[1]][,-2])
# Iterar sobre todas las fechas existentes en el dataframe
for (Fecha in Fechas) {
  col.mean <- apply(Fecha[,-c(1:2)], 2, mean, simplify = FALSE)
  col.mean <- append(col.mean, Fecha[1,1], after = 0)
  datos = data.frame(col.mean)
  names(datos) <- colnames(Fechas[[1]][,-2])
  datos_final <- rbind(datos_final, datos)
}

#names(datos) <- Fecha[1,-2]
#col.max <- apply(Fechas$`20/04/2021`[,-c(1:2)], 2, max)
#col.min <- apply(Fechas$`20/04/2021`[,-c(1:2)], 2, min)

# Generar data frame con los datos almacenados
#df <- data.frame(Fecha[1,1], mean(Fecha$SoilTemp_2), max(Fecha$SoilTemp_2), min(Fecha$SoilTemp_2))
#names(df) <- c("FECHA", "MEAN_SoilTemp_2", "MAX_SoilTemp_2", "MIN_SoilTemp_2")
#print(df)
