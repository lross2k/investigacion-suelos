# Eliminar cualquier fila con valor
limpiar = function(data, valor) {
    return(data[-c(which(data[,]==valor, arr.ind=TRUE)[,1]),])
}

read.csv("Datos Base/PERIODO_1.csv", sep = ",") -> Data
Data <- limpiar(Data, 'NAN')
write.csv(Data, "Datos Base/PERIODO_LIMPIO.csv", row.names = FALSE)
