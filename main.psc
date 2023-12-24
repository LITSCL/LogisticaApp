Algoritmo main
	
	Definir __destino Como Texto
	Definir __peso Como Texto
	Definir __estado Como Texto
	Definir __reporte Como Texto
	
	Dimension __envios[4, 4]
	Dimension __regiones[16]
	Dimension __distancias[16]
	
	__regiones[1] = "Arica (2000Km)"
	__regiones[2] = "Tarapacá (1800Km)"
	__regiones[3] = "Atofagasta (1300Km)"
	__regiones[4] = "Atacama (850Km)"
	__regiones[5] = "Coquimbo (400Km)"
	__regiones[6] = "Valparaíso (120Km)"
	__regiones[7] = "Santiago (0Km)"
	__regiones[8] = "OHiggins (80Km)"
	__regiones[9] = "Maule (250Km)"
	__regiones[10] = "Ñuble (350Km)"
	__regiones[11] = "Biobío (500Km)"
	__regiones[12] = "Araucanía (670Km)"
	__regiones[13] = "Los Ríos (850Km)"
	__regiones[14] = "Los Lagos (1000Km)"
	__regiones[15] = "Aysén (1500Km)"
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
		Escribir "¿Que desea hacer?"
		Escribir "1. Registrar envío"
		Escribir "2. Mostrar envíos"
		Escribir "3. Actualizar envío"
		Escribir "0. Salir"
		Leer __opcion
		Segun __opcion Hacer
			Caso, "1":
				Escribir "Ingrese el peso del paquete: (0Kg/50Kg)"
				Leer __peso
				Escribir "Seleccione el destino del envío:"
				__imprimir_arreglo(__regiones)
				Leer __destino
				__calcular_precio(__peso, __distancias[__destino])
				__envios[__contador + 1, 1] = __peso
				__envios[__contador + 1, 2] = __regiones[__destino]
				__envios[__contador + 1, 3] = "Realizado"
				__envios[__contador + 1, 4] = "Su paquete está proximo a ser retirado por el vehículo de despacho"
				__contador = __contador + 1
			Caso, "2":
				Escribir "Mostrar envíos"
				Escribir __contador
			Caso, "3":
				Escribir "Actualizar envío"
				Escribir __contador
			Caso, "0":
				__seguir = Falso
			De Otro Modo:
				Escribir "La opcion seleccionada no es valida"
		FinSegun
	FinMientras
	
FinAlgoritmo

Funcion __imprimir_arreglo(__arreglo)
	Para i = 1 Hasta 16 Con Paso 1 Hacer
		Escribir i , ". " , __arreglo[i]
	FinPara
FinFuncion

Funcion __calcular_precio(__peso, __distancia)
	Escribir "Peso = " , __peso
	Escribir "Distancia = " , __distancia
	Escribir "Calculando..."
FinFuncion

Funcion __resultado <- __validar_numero(__arreglo)
	Escribir "Función"
FinFuncion
