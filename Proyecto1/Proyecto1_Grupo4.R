################### Integrantes          ###########################

#              Roberto Montoya Leiva 
#              Pablo Andrés Marín Castillo 
#              Eduardo Nuñez Morales 
#              María José Romero Salas 

################### Funciones generales ###########################

ipak <- function(pkg){ # funcion para instalar paquetes
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])] # Crea una lista de paquetes que no están instalados
  if (length(new.pkg)) # Comprueba si hay paquetes que no están instalados
    install.packages(new.pkg, dependencies = TRUE) # Instala los paquetes no instalados y sus dependencias
  sapply(pkg, require, character.only = TRUE)# Carga los paquetes requeridos
}
loadPaquetes <- function(){
  packages <- c("dplyr","readr","ggplot2","plotrix","HistData","gridExtra","grid") # Lista de paquetes a instalar y cargar
  ipak(packages)# Llama a la función 'ipak' para instalar y cargar los paquetes
  #Setear ruta del directorio de trabajo
  setwd("C:/Users/Administrator/Documents/Pablo/Scripts/Proyecto1")
  
}
resumen_data <- function(dataset){
  # Definición de la función 'resumen_data' que recibe un dataset y devuelve un resumen de la informacion del dataset
  print("**************************** Class ***************************")
  cat("\n") 
  print(class(dataset))
  cat("\n") 
  
  print("**************************** dim ***************************")
  cat("\n") 
  print(dim(dataset))
  cat("\n") 
  
  print("**************************** names ***************************")
  cat("\n") 
  print(names(dataset))
  cat("\n") 
  
  print("**************************** str ***************************")
  cat("\n") 
  str(dataset) 
  cat("\n") 
  
  print("**************************** glimpse ***************************")
  cat("\n") 
  glimpse(dataset)
  cat("\n") 
  
  print("**************************** summary ***************************")
  cat("\n") 
  print(summary(dataset))
  cat("\n") 
  
  print("**************************** Is Null ***************************")
  cat("\n") 
  print(any(is.na(dataset)))
  cat("\n") 
  
}
export_data <- function(data, nom_archivo){
  # Función para exportar datos a un archivo CSV
  write.csv(data, file = paste0(nom_archivo, ".csv"), row.names = TRUE)
}
resumen_numerico_agrupado <- function(data, columna_agrupacion) {
  # Función que resume datos numéricos agrupados por una columna específica
  # Seleccionar solo las columnas numéricas
  data_numerica <- data %>%
    select(all_of(columna_agrupacion), where(is.numeric))
  # Agrupar por la columna indicada y calcular máximos, promedios y conteos
  resumen <- data_numerica %>%
    group_by(across(all_of(columna_agrupacion))) %>%
    summarise(across(everything(), 
                     list(Maximo = ~ max(.x, na.rm = TRUE),
                          Promedio = ~ mean(.x, na.rm = TRUE),
                          Conteo = ~ sum(!is.na(.x))),
                     .names = "{col}_{fn}"))
  
  return(resumen)
}


################### Funciones dataSet ###########################

dfIris <- function(){ # Función para manejar el dataset Iris
  dataIris <- read.csv("iris.csv", sep = ";", dec='.', header = T , stringsAsFactors = TRUE)
  resumen_data(dataIris)
  export_data(resumen_numerico_agrupado(dataIris, "tipo"),"resumen_iris")
  crear_grafico_girasol(dataIris, "s.largo", "s.ancho")
}

dfCredito <- function(){  # Función para manejar el dataset de crédito
  dataCR <- read.csv("MuestraCredito5000V2.csv", sep = ";", dec='.', header = T , stringsAsFactors = TRUE)
  resumen_data(dataCR)
  export_data(resumen_numerico_agrupado(dataCR, "GradoAcademico"),"resumen_MuestraCredito")
  crear_grafico_girasol(dataCR, "CoefCreditoAvaluo", "MontoCredito")
}

dfGalton <- function()
{
  dataGalton <- Galton
  
  resumen_data(dataGalton)
  png("plotGalton.png")
  plotGalton <-plot(dataGalton)
  dev.off()
  
  png("sunflowerplot.png")
  sunfplot <- sunflowerplot(dataGalton, size = 0.06)
  dev.off()
  
  img <- png::readPNG("sunflowerplot.png")
  sunf <- grid::rasterGrob(img, interpolate = TRUE)

  img2 <- png::readPNG("plotGalton.png")
  plotGal <- grid::rasterGrob(img2, interpolate = TRUE)
  
  
  grid.arrange(plotGal, sunf, ncol = 2)
}
# Función para crear un gráfico girasol
crear_grafico_girasol <- function(data, x, y) { # Función para crear un gráfico girasol
  # Verificar que las columnas existen en el data frame
  if (!x %in% names(data) || !y %in% names(data)) {
    stop("Las columnas especificadas no existen en el conjunto de datos.")
  }
  
  # Crear el gráfico girasol
  sunflowerplot(data[[x]], data[[y]],
                xlab = paste("Longitud del", x), 
                ylab = paste("Ancho del", y),
                main = paste("Gráfico Girasol de", deparse(substitute(data)), ":", x, "vs", y))
}


# Función para mostrar el menú y realizar operaciones
menu_principal <- function() {
  #Se llama funcion loadPaquetes para importar o instalar paqiete necesaria
  loadPaquetes()
  repeat {
    # Mostrar el menú
    cat("\n\n")
    cat("\nSeleccione el dataset a validar:\n")
    cat("1: Iris\n")
    cat("2: Credito\n")
    cat("3: Galton\n")
    cat("4: Salir\n")
    
    # Leer la opción del usuario con validación
    opcion <- as.integer(readline(prompt = "Ingrese el número del dataset que desa ver: "))
    #Valida que la opcion digitada este entre el rango de 1 a 8 
    if (is.na(opcion) || !(opcion %in% 1:4)) {
      cat("Error: Opción no válida. Intente nuevamente.\n")
    } else if (opcion == 4) {
      cat("Saliendo del sistema\n")
      break
    } else {
      
      # Realizar la funcion seleccionada
      switch(opcion,
             "1" = dfIris(),
             "2" = dfCredito(),
             "3" = dfGalton())
      
    }
  }
}

menu_principal()
