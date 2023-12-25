Algoritmo main
	
	Definir __destino Como Texto
	Definir __peso Como Texto
	Definir __precio Como Numero
	Definir __estado Como Texto
	Definir __reporte Como Texto
	
	Definir __envio_seleccionado Como Texto
	
	Dimension __envios[1000, 5]
	Dimension __regiones[16]
	Dimension __distancias[16]
	
	__regiones[1] = "Arica (2000Km)      "
	__regiones[2] = "Tarapacá (1800Km)   "
	__regiones[3] = "Atofagasta (1300Km) "
	__regiones[4] = "Atacama (850Km)     "
	__regiones[5] = "Coquimbo (400Km)    "
	__regiones[6] = "Valparaíso (120Km)  "
	__regiones[7] = "Santiago (0Km)      "
	__regiones[8] = "OHiggins (80Km)     "
	__regiones[9] = "Maule (250Km)       "
	__regiones[10] = "Ñuble (350Km)      "
	__regiones[11] = "Biobío (500Km)     "
	__regiones[12] = "Araucanía (670Km)  "
	__regiones[13] = "Los Ríos (850Km)   "
	__regiones[14] = "Los Lagos (1000Km) "
	__regiones[15] = "Aysén (1500Km)     "
	__regiones[16] = "Magallanes (3000Km)"
	
	__distancias[1] = 2000
	__distancias[2] = 1800
	__distancias[3] = 1300
	__distancias[4] = 850
	__distancias[5] = 400
	__distancias[6] = 120
	__distancias[7] = 0
	__distancias[8] = 80
	__distancias[9] = 250
	__distancias[10] = 350
	__distancias[11] = 500
	__distancias[12] = 670
	__distancias[13] = 850
	__distancias[14] = 1000
	__distancias[15] = 1500
	__distancias[16] = 3000
	
	__seguir = Verdadero
	Mientras __seguir == Verdadero Hacer	
		__validado = Falso
		Escribir "¿Que desea hacer?"
		Escribir "1. Registrar envío"
		Escribir "2. Mostrar envíos"
		Escribir "3. Actualizar envío"
		Escribir "0. Salir"
		Leer __opcion
		Segun __opcion Hacer
			Caso, "1":
				Mientras __validado == Falso Hacer
					Escribir "Ingrese el peso del paquete: (0Kg/50Kg)"
					Leer __peso
					Si __validar_numero(__peso) == Verdadero Entonces
						Si ConvertirANumero(__peso) >= 0 y ConvertirANumero(__peso) <= 50 Entonces
							__validado = Verdadero
						SiNo
							Escribir "ERROR: La edad no está dentro del rango"
						FinSi
					SiNo
						Escribir "ERROR: Debe ingresar un número válido"
					FinSi
				FinMientras
				
				__validado = Falso
				
				Mientras __validado == Falso Hacer
					Escribir "Seleccione el destino del envío:"
					__imprimir_arreglo(__regiones)
					Leer __destino
					Si __validar_numero(__destino) == Verdadero Entonces
						Si ConvertirANumero(__destino) >= 1 y ConvertirANumero(__destino) <= 16 Entonces
							__precio = __calcular_precio(__peso, __distancias[__destino])
							__envios[__contador + 1, 1] = __peso
							__envios[__contador + 1, 2] = __regiones[__destino]
							__envios[__contador + 1, 3] = "$" + ConvertirATexto(__precio)
							__envios[__contador + 1, 4] = "Realizado"
							__envios[__contador + 1, 5] = "Su paquete está proximo a ser retirado por el vehículo de despacho"
							__contador = __contador + 1
							__validado = Verdadero
						SiNo
							Escribir "ERROR: La opcion seleccionada no es valida"
						FinSi
					SiNo
						Escribir "ERROR: Debe ingresar un número válido"
					FinSi
				FinMientras
			Caso, "2":
				Para i = 1 Hasta __contador Con Paso 1 Hacer
					Escribir "Peso: " , __envios[i, 1] , " | " , "Destino: " , __simulacion_trim(__envios[i, 2]) , " | " , "Precio: " , __envios[i, 3] , " | " , "Estado: " , __envios[i, 4] , " | " , "Reporte: " , "..."
				FinPara
			Caso, "3":
				Mientras __validado == Falso Hacer
					Escribir "Seleccione el envío que desea actualizar"
					Para i = 1 Hasta __contador Con Paso 1 Hacer
						Escribir i , "." ,  " -> " , __envios[i, 1] , " | " , "Destino: " , __simulacion_trim(__envios[i, 2]) , " | " , "Precio: " , __envios[i, 3] , " | " , "Estado: " , __envios[i, 4] , " | " , "Reporte: " , "..."
					FinPara
					Leer __envio_seleccionado
					Si __validar_numero(__envio_seleccionado) == Verdadero Entonces
						Si ConvertirANumero(__envio_seleccionado) >= 1 y ConvertirANumero(__envio_seleccionado) <= __contador Entonces
							__validado = Verdadero
						SiNo
							Escribir "ERROR: La opcion seleccionada no es valida"
						FinSi
					SiNo
						Escribir "ERROR: Debe ingresar un número válido"
					FinSi
				FinMientras
				
				__validado = Falso
				
				Mientras __validado == Falso Hacer
					Escribir "¿Cual es el nuevo estado del envío?"
					Escribir "1. En tránsito"
					Escribir "2. Entregado"
					Escribir "3. Devuelto"
					Leer __estado
					Segun __estado Hacer
						Caso, "1":
							__envios[ConvertirANumero(__envio_seleccionado), 4] = "En tránsito"
							__validado = Verdadero
						Caso, "2":
							__envios[ConvertirANumero(__envio_seleccionado), 4] = "Entregado"
							__validado = Verdadero
						Caso, "3":
							__envios[ConvertirANumero(__envio_seleccionado), 4] = "Devuelto"
							__validado = Verdadero
						De Otro Modo:
							Escribir "ERROR: La opcion seleccionada no es valida"
					FinSegun
				FinMientras
			Caso, "0":
				__seguir = Falso
			De Otro Modo:
				Escribir "ERROR: La opcion seleccionada no es valida"
		FinSegun
	FinMientras
	
FinAlgoritmo

Funcion __imprimir_arreglo(__arreglo)
	Para i = 1 Hasta 16 Con Paso 1 Hacer
		Si i > 1 y i % 2 == 0
			Escribir i , ". " , __arreglo[i]
		SiNo
			Escribir i , ". " , __arreglo[i] , "|  " Sin Saltar
		FinSi
	FinPara
FinFuncion

Funcion __precio <- __calcular_precio(__peso, __distancia)
	Definir __precio Como Numero
	Definir __valor_por_peso Como Numero
	Definir __valor_por_distancia Como Numero
	__valor_por_peso = ConvertirANumero(__peso) * 1.4
	__valor_por_distancia = __distancia * 1.4
	__precio = __valor_por_peso * __valor_por_distancia
FinFuncion

Funcion __validado <- __validar_numero(__numero)
	__validado = Verdadero
	Para i = 1 Hasta Longitud(__numero) Con Paso 1 Hacer
		__v = Subcadena(__numero, i, i)
		Si __v <> "0" y __v <> "1" y __v <> "2" y __v <> "3" y __v <> "4" y __v <> "5" y __v <> "6" y __v <> "7" y __v <> "8" y __v <> "9" Entonces
			__validado = Falso
		FinSi
	FinPara
FinFuncion

Funcion __cadena <- __simulacion_trim(__cadena)
	Mientras Subcadena(__cadena, 1, 1) == " " Hacer
		__cadena = Subcadena(__cadena, 2, Longitud(__cadena))
	FinMientras
	Mientras Subcadena(__cadena, Longitud(__cadena), Longitud(__cadena)) == " " Hacer
		__cadena = Subcadena(__cadena, 1, Longitud(__cadena) - 1)
	FinMientras
FinFuncion
