install.packages(tidyverse)
library(tidyverse)

# Lee datos de CSV
DataOriginal <- read.csv("Datos Base/COMPLETO.csv", sep = ";")

# Agrupar cantidad de instancias según día
Data <- DataOriginal
Data <- cbind(TIMESTAMP = format(as.Date(Data$TIMESTAMP, "%d/%m/%Y %H:%M"), format="%d/%m/%Y"), Data)
Data <- Data[,-2]
# Agrupar fecha diaria y agregar contador de instancias
ByDay <- Data %>% 
  group_by(TIMESTAMP) %>% 
summarise(INSTANCES = n())
# Guardar en CSV el resumen de instancias por fecha
write.csv2(ByDay, "Datos Base/DAILY_COUNT.csv", row.names = FALSE)
# Limpia datos temporales
rm(Data)

# Agrupar cantidad de instancias según mes
Data <- DataOriginal
Data <- cbind(TIMESTAMP = format(as.Date(Data$TIMESTAMP, "%d/%m/%Y %H:%M"), format="%m/%Y"), Data)
Data <- Data[,-2]
# Agrupar fecha mensual y agregar contador de instancias
ByMonth <- Data %>% 
  group_by(TIMESTAMP) %>% 
  summarise(INSTANCES = n())
# Guardar en CSV el resumen de instancias por fecha
write.csv2(ByMonth, "Datos Base/MONTHLY_COUNT.csv", row.names = FALSE)
# Limpia datos temporales
rm(Data)

# Agrupar cantidad de instancias según año
Data <- DataOriginal
Data <- cbind(TIMESTAMP = format(as.Date(Data$TIMESTAMP, "%d/%m/%Y %H:%M"), format="%Y"), Data)
Data <- Data[,-2]
# Agrupar fecha anual y agregar contador de instancias
ByYear <- Data %>% 
  group_by(TIMESTAMP) %>% 
  summarise(INSTANCES = n())
# Guardar en CSV el resumen de instancias por fecha
write.csv2(ByYear, "Datos Base/YEARLY_COUNT.csv", row.names = FALSE)
# Limpia datos temporales
rm(Data)

#ggplot2::ggplot(ggplot2::aes(x = TIMESTAMP, y = SoilTemp_1), data = data) + ggplot2::geom_point() + ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90)) + ggplot2::theme(axis.text = ggplot2::element_text(size=10))
