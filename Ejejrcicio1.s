/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA
* Fabian Estuardo Juarez Tello 21440
* Sara Maria Perez Echeverria 21371
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
*
* CalculoPerimetroCuadrados.s
* Caclulo de premietros por medio de 1 valor ingresado por el usuario
*  x = l * 4
*  entrada de datos con scanf
*  si hubo error en ingreso imprime mensaje
*  sino prosigue hasta imprimir el resultado de los 3 datos
 ----------------------------------------------- */

	@@ codigo de assembler: se coloca en la seccion .text
	.text
	.align		2
	@@ etiqueta "main" llama a la funcion global
	.global		main
	.type		main, %function
main:
	@@ grabar registro de enlace en la pila
	stmfd	sp!, {lr}

	@ ingreso de datos
	@ r0 contiene formato de ingreso
	@ r1 contiene direccion donde almacena dato leido
    @ingreso op2
    ldr r0,=mensaje_ingreso
    bl puts
    ldr r0, =entrada
	ldr r1,=maximo
	bl scanf

    @carga valores
    ldr r6, =bandera
    ldr r8,[r6]

    cmp r1,#61
    add r8,#2
    add r8,#1
    @guarda valor y regresa
    str r8,[r6]
    ldr r0,=entrada
    ldr r1,=bandera
    ldr r1,[r1]
    bl printf
    
	@@ Muestra una cadena
	ldr r1,=Lmessage @@ direccion de Lmessage
	ldr r0,=cadena
	bl printf
	
	@@ r0, r3 <- 0 como sennal de no error al sistema operativo
	mov	r3, #0
	mov	r0, r3

    @ colocar registro de enlace para desactivar la pila y retorna al SO
	ldmfd	sp!, {lr}
	bx	lr
.data
.align 2

maximo:	.word 0
bandera: .word 0

mensaje_ingreso:
	.asciz "Ingrese su nota maxima obtenida en el examen corto "

entrada:
    .asciz " %d"
