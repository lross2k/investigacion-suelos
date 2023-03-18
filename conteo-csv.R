install.packages(tidyverse)
library(tidyverse)

data <- read.csv("PERIODO_1.csv", sep = ";")
data <- cbind(TIMESTAMP = format(as.Date(data$TIMESTAMP, "%d/%m/%Y %H:%M"), format="%d/%m/%Y"), data)
data <- data[,-2]

#Conteo por día
conteoPordia <- data %>% 
  group_by(TIMESTAMP) %>% 
summarise(cantidad = n())
head(conteoPordia)
view(conteoPordia)

#ggplot2::ggplot(ggplot2::aes(x = TIMESTAMP, y = SoilTemp_1), data = data) + ggplot2::geom_point() + ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90)) + ggplot2::theme(axis.text = ggplot2::element_text(size=10))

library(readr)
library(magrittr)
