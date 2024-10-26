entero <- 5 #variable global para usar en las funciones
decimal <- 1.5 #
#Funcion que importa o instala paquetes determinados en el sistema
ipak <- function(pkg){ # funcion para instalar paquetes
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
#funcion que muestra la parte 1 Variables y Tipos de Datos de la tarea
parte1 <- function(){
  # 1. Declaración de Variables:
  # a. Declara las siguientes variables: i. Un número entero llamado entero.
  entero <- 5 #se le asigna el valor entero
  
  #ii. Un número decimal llamado decimal.
  decimal <- 1.5  #se le asigna un valor decimal
  
  #*/ iii. Un texto llamado mensaje. 
  mensaje <- "Domingo" #se lzze asigna la cadena de texto
  
  #iv. Un valor lógico llamado es_verdadero.
  es_verdadero <- TRUE  #se le asigna el valor boolean TRUE.
  
   #*2. Operaciones con Variables:
  #* a. Suma el número entero con el decimal.
  suma <- decimal + entero #se le asigna a la variable suma el total de decimal + entero
  
  #* b. Multiplica el entero por 5.
  multiplicacion <- entero * 5 #se le asigna a multiplicacion el total de entero * 5
 
  cat("1. Declaración de Variables\n")
  cat("\nEl numero entero es: ",entero,"\nEl numero decimal es: ",decimal,
      "\nEl valor lógico es: ",es_verdadero,"\n") #muestra de los valores que contienen las variables
  cat("\n2. Operaciones con Variables\n\n")
  cat(paste("La suma del decimal y entero es:",suma),"\n") #muestra de resultado
  cat(paste("La multiplicacion es:",multiplicacion),"\n") #muestra de resultado
  #* c. Imprime el valor lógico en un mensaje concatenado (usa paste()).
  cat(paste("El valor logico de la variable mensaje es: ", es_verdadero),"\n")
}
#funcion que muestra la parte 2 de la tarea
parte2 <- function(){
  #1. Definición de una Función Simple:
  #  a. Crea una función llamada calcular_doble que acepte un número como parámetro y devuelva el doble de ese número.
  
  #Se crea funcion para calcula el doble de un x número
  calcular_doble <- function(num1){
    return(num1*2) #Retorna operacion 
  }
  
  cat("Funciones y Operaciones Básicas\n")# muestra mensaje en pantalla
  #Se declara control de excepciones 
  cat("Aplicación de la Función\n")# muestra mensaje en pantalla
  #2. Aplicación de la Función:
  #  a. Utiliza la función calcular_doble para calcular el doble de entero y decimal.
  
  cat("El doble de ",entero," es: ",calcular_doble(entero),"\n")#Muestra en pantalla el resultaod de la operacion
  cat("El doble de ",decimal," es: ",calcular_doble(decimal),"\n")#Muestra en pantalla el resultaod de la operacion
  
  #3. Números Complejos:
  cat("Números Complejos\n")# muestra mensaje en pantalla
  #  a. Crea un número complejo num_complejo (por ejemplo, 3 + 2i).
  num_complejo <- 5 + 2i #se declara variable que almacena numero complejo
  cat("Numero complejo: ",num_complejo,"\n")#Muestra en pantalla valor del numero complejo
  
  #  b. Multiplica este número por otro número complejo (por ejemplo, 2 + 3i).
  
  mult_complejo <- num_complejo * (2+3i)#Multiplica la variable num_complejo por otro complejo
  cat("Operacion ",num_complejo," * ",(2+3i)," es: ",mult_complejo)#Muestra en pantalla valor del numero complejo
}
#funcion que muestra la parte 3 Sentencias Condicionales y Ciclos de la tarea
parte3 <- function(){
  #1. Condicionales con if, else if, else:
  #  a. Escribe una sentencia condicional que compare el valor de entero con 10:
  #i. Si entero es mayor que 10, imprime 'Mayor a 10'./ #ii. Si entero es igual a 10, imprime 'Es igual a 10'./ #iii. Si entero es menor que 10, imprime 'Menor a 10'.
  #anteriormente se indicó que entero equivale a 5
  #se crea manejo de excepcion por motivo que por error se puede ingresar valor erroneo
  cat("1. Declaración de Variables\n")
  
  if (entero > 10) { #condición de  mayor a 10
    cat(paste("Mayor a 10\n"))
  } else if (entero == 10) { #condición de igual a 10
    cat(paste("Igual a 10\n"))
  } else {  #el resultado de menor a 10
    cat(paste("Menor a 10\n"))
  }
 
  cat("2. Ciclo for:\n")
  
  #a. Crea un ciclo for que imprima los números del 1 al 5.
  limite <- 1:5 #se le indica que tiene los numeros del 1 al 5
  
  for (i in limite) { # i va a recorrer el ciclo 5 veces
    cat("\nNúmero: ",i) #imprime cada vuelta
  }
 
  cat("3. Ciclo while\n")
  #3. Ciclo while:
  #a. Utiliza un ciclo while que sume números consecutivos desde 1 hasta que
  #la suma supere 15. Imprime la suma acumulada en cada iteración.
  suma <- 0
  contador <-  1 #se inicializan variables
  
  while (suma <= 15) {
    suma <- suma + contador #se le asigna a la suma el valor del contador aumentado en la vuelta anterior
    print(suma) #imprime resultado
    contador <- contador + 1 #se aumenta el contador en 1
  }
  
}
#funcion que muestra la parte 4 de la tarea
parte4 <- function(){
  cat("Uso de lapply() y sapply()\n")#Muestra mensaje en pantalla
 # 1. Lista de Números:
 #  a. Crea una lista llamada números que contenga los siguientes elementos: vector1 = c(1, 2, 3), vector2 = c(4, 5, 6), y vector3 = c(7, 8, 9).
 # Se declara lista con variables a nivel de vectores
list_vectores <- list(
    vector1 = c(1, 2, 3),
    vector2 = c(4, 5, 6),
    vector3 = c(7, 8, 9))
 # Se finaliza declaración de lista con variables a nivel de vectores
 
 # 2. Uso de lapply():
 cat("Uso de lapply\n")
 # Se crea funcion mulplicar para multiplicar por 2 el vector de la lista 
 multiplicar <- function(x){
   return(x * 2)
 }
 #    a. Utiliza lapply() para multiplicar cada número en la lista por 2.
 vect_mult <- lapply(list_vectores, multiplicar)#Se crea variable para guardar resultado de la operacion
 cat("Multiplicar vector1 con lapply: ", vect_mult[[1]], "\n")#Muestra resultado
 cat("Multiplicar vector2 con lapply: ", vect_mult[[2]], "\n")#Muestra resultado
 cat("Multiplicar vector3 con lapply: ", vect_mult[[3]], "\n\n")#Muestra resultado
 
 # 3. Uso de sapply():
 cat("Uso de sapply\n")
 #    a. Utiliza sapply() para calcular la suma de los elementos de cada vector en la lista. 
 vect_sum <- sapply(list_vectores, sum)#Se crea variable para guardar resultado de la operacion
 cat("Suma de vector1 con sapply: ", vect_sum["vector1"], "\n")#Muestra resultado
 cat("Suma de vector2 con sapply: ", vect_sum["vector2"], "\n")#Muestra resultado
 cat("Suma de vector3 con sapply: ", vect_sum["vector3"], "\n")#Muestra resultado
}
#funcion que muestra la parte 5 Vectores y Matrices de la tarea
parte5 <- function(){
  #Parte 5: Vectores y Matrices (30 puntos)
  #1. Creación de un Vector y Operaciones:
  # a. Crea un vector mi_vector con los números del 1 al 10.
  
  cat("1. Creación de un Vector y Operaciones\n")
  mi_vector <- seq(1:10) #los numeros son del 1 al 10
  
  #b. Realiza las siguientes operaciones: i. Multiplica el vector por 3.
  vector_multiplicado <- mi_vector * 3 #se multiplica vector original por 3
  cat ("mi_vector: ",mi_vector,"\nvector_multiplicado",vector_multiplicado) #se imprime
  
  #ii. Calcula el promedio (mean()) del vector.
  mean_vector_multiplicado <- mean(vector_multiplicado) # se le saca el promedio al ultimo vector
  cat("\nMean del promedio multiplicado: ",mean_vector_multiplicado) #se imprime
  
  #2. Condicionales con Vectores: a. Usa un ciclo for para imprimir si cada número del vector es par o impar.
  cat("\n2. Condicionales con Vectores")
  for (resultado in mi_vector) { # en este caso se está utilizando el vetcor original
    if (resultado %% 2 == 0) { #si el módulo es de 0, es par. De lo contrario, es impar.
      cat(resultado, "es par\n")
    } else {
      cat(resultado, "es impar\n")
    }
  }
  
  cat("\n3. Creación de una Matriz y Operaciones\n")
  #3. Creación de una Matriz y Operaciones:
  #a. Crea una matriz mi_matriz de 3x3 con los números del 1 al 9.
  mi_matriz <- matrix(1:9, byrow = TRUE, nrow = 3) #matriz 3x3 acomodada por filas
  #b. Realiza las siguientes operaciones: i. Multiplica la matriz por 2.
  mult_matriz <- mi_matriz * 2 #multiplicacion de la matriz
  cat("Matriz Original\n")
  print(mi_matriz)
  cat("Matriz Multiplicado\n")
  print(mult_matriz)
  #ii. Calcula la transposición de la matriz.
  matriz_transpuesta <- t(mult_matriz) #t para hacer la matriz transpuesta
  cat("Matriz Transpuesta\n")
  print(matriz_transpuesta)
  
  
}
#funcion que muestra la parte 6 de la tarea
parte6 <- function(){
  cat("Análisis Estadístico de un Data Frame\n")
#  1. Creación de un Data Frame:
  cat("Creación de un Data Frame\n")
#    a. Crea un data.frame con 3 columnas:
#      i. Altura: un vector de 10 valores numéricos aleatorios entre 150 y 200.
#     ii. Peso: un vector de 10 valores numéricos aleatorios entre 50 y 100.
#    iii. Edad: un vector de 10 valores numéricos aleatorios entre 20 y 60.
  datos <- data.frame( #Se crea variable datos como un data frame para almacenar Altura, peso y edad
    Altura = sample(150:200,10,replace = FALSE),  # Altura: valores aleatorios entre 150 y 200
    Peso = sample(50:100,10,replace = FALSE),     # Peso: valores aleatorios entre 50 y 100
    Edad = sample(20:60,10,replace = FALSE)      # Edad: valores aleatorios entre 20 y 60
  )
  print(datos)
# 2. Operaciones:
#   a. Calcula el promedio de las columnas altura y peso usando lapply() o sapply().
  cat("\n Promedio con lapply \n")
  prom_datos <- lapply(datos[,c("Altura", "Peso")], mean)
  print(prom_datos)
#   b. Filtra las filas donde la edad es mayor a 40 y muestra los resultados.
  cat("\n Filas donde la edad es mayor a 40  \n")
  mayores_40 <- datos %>% filter(datos$Edad > 40)#Se alamcena el data frame filtrado
  print(mayores_40)#Se muestra en pantall
}
#funcion que muestra la parte 7 de la tarea
parte7 <- function(){
  #Parte 7: Creación de Funciones Personalizadas (10 puntos)
  #1. Función para Operaciones Aritméticas: a. Crea una función llamada operaciones_basicas() que acepte dos números
  #y devuelva una lista con la suma, resta, multiplicación y división de esos
  #dos números.
  
  operaciones_basicas <- function(num1, num2) { # se hace la función y se agregan las variables a utilizar
    #se realizan las operaciones correspondientes
    suma <- num1 + num2
    resta <- num1 - num2
    multiplicacion <- num1 * num2
    
    if (num2 != 0) { 
      division <- num1 / num2 #se hace la operación para el caso de la división y que no sea divisible por 0
    } else {
      division <- print("No se puede dividir por 0")  
    }
    return(c(suma, resta, multiplicacion, division))
  }
  
  #Se declara control de excepciones 
  tryCatch({
    numero1 <-as.integer(readline(prompt = "Ingrese un número: "))#Se solicita numero por pantalla
    numero2 <-as.integer(readline(prompt = "Ingrese un número: "))#Se solicita numero por pantalla
    
    #2. Aplicación de la Función:
    #a. Utiliza la función operaciones_basicas() para calcular los resultados de
    #operar con los números 8 y 4.
    
    salida <- operaciones_basicas(numero1, numero2)#se llama funcion para calculo de la operaciones basicas
    print("Resultado")
    print(salida)#se muestra en pantalla resultado
   
  }, 
  error = function(e) {
    cat("Error: Al calcular operaciones basicas.\n")
  })
}
# Función para mostrar el menú y realizar operaciones
menu_principal <- function() {
  #Se llama funcion ipak para importar o instalar paqiete necesaria
  ipak("dplyr")
  repeat {
    # Mostrar el menú
    cat("\n\n")
    cat("\nSeleccione la parte que desea realizar:\n")
    cat("1: Variables y Tipos de Datos\n")
    cat("2: Funciones y Operaciones Básicas\n")
    cat("3: Sentencias Condicionales y Ciclos\n")
    cat("4: Uso de lapply() y sapply()\n")
    cat("5: Vectores y Matrices\n")
    cat("6: Análisis Estadístico de un Data Frame\n")
    cat("7: Creación de Funciones Personalizadas\n")
    cat("8: Salir\n")
    
    # Leer la opción del usuario con validación
    opcion <- as.integer(readline(prompt = "Ingrese el número de la parte que desa ver: "))
    #Valida que la opcion digitada este entre el rango de 1 a 8 
    if (is.na(opcion) || !(opcion %in% 1:8)) {
      cat("Error: Opción no válida. Intente nuevamente.\n")
    } else if (opcion == 8) {
      cat("Saliendo del sistema\n")
      cat("Integrantes: Hilary Granados y Pablo Marin\n")
      break
    } else {
     
        # Realizar la funcion seleccionada
        switch(opcion,
                            "1" = parte1(),
                            "2" = parte2(),
                            "3" = parte3(),
                            "4" = parte4(),
                            "5" = parte5(),
                            "6" = parte6(),
                            "7" = parte7())
        
      
    }
  }
}

#Ejecuta el menu principal
menu_principal()
