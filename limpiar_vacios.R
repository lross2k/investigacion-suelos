# Eliminar cualquier fila con valor
limpiar = function(data, valor) {
    val <- which(data[,]==valor, arr.ind=TRUE)
    if (length(val) == 0) {
        return(data)
    } else {
        return(data[-c(val[,1]),])
    }
}

read.csv("Datos Base/FORMATTED_DATA.csv", sep = ",") -> Data
Data <- limpiar(Data, 'NAN')
Data <- na.omit(Data)
write.csv(Data, "Datos Base/CLEAN_DATA.csv", row.names = FALSE)
