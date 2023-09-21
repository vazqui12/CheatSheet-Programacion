#!/bin/bash

# Paleta de Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


# Funcion para cerrar proceso al usar control + c
function ctrl_c(){
	echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
	tput cnorm;
	exit 1
}

# Ctrl+C
trap ctrl_c INT

# Sección para declararar Variables globales


# Help Panel (el parametro -e sirve para capturar caracteres especiales)
function helpPanel(){
	echo -e "\n${yellowColour}[+]${endColour}${grayColour} Uso:${endColour}\n"
	echo -e "\t${purpleColour}u)${endColour}${grayColour} Añadir las opciones que sean necesarias${endColour}\n"
	echo -e "\t${purpleColour}h)${endColour}${grayColour} Mostrar este panel de ayuda${endColour}\n"
}

# Plantilla para declarar funciones
function nombreFuncion(){
	variable="$1" # Usamos el $1 para quedarnos con el valor del primer parámtro pasado por la terminal

}


# Sección para declarar Indicadores (-i para que sea un valor integer)
declare -i parameter_counter=0


# Menú
# m tiene : porque se espera que se proporcione un argumento siempre que se use -m. Con -h no es necesario
# especificar argumento. La variable arg contiene el valor de la opcion actual que ha sido analizada por
# getopts.
while getopts "número de argumentos que necesitemos" arg; do
	case $arg in
		opcion) variable="$OPTARG"; let parameter_counter+=1;; # $OPTARG almacena el valor asociado al parametro indicado
		h) ;; # Para cada sentencia hay que poner ;; para cerrarla
	esac
done


# Sección para llamar a las distintas funciones acorde a cada opción
# utilizamos -eq cuando comparamos valores numericos
if [ $parameter_counter -eq x ]; then 
	nombreFuncion $variable1
elif [ $parameter_counter -eq y ]; then
	nombreFuncion2 $variable2
else
	helpPanel
fi