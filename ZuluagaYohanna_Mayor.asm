.data #Se define texto y variables
    saludo: .asciiz "Hola usuario \n"
    primerNumero: .asciiz "Ingrese el primer numero: \n"
    segundoNumero: .asciiz "Ingrese el segundo numero: \n"
    tercerNumero: .asciiz "Ingrese el tercer numero: \n"
    resultado: .asciiz "El numero mayor es: "

.text #Intrucciones del programa
    main:
    #Impresion en pantalla del mensaje de saludo
    li $v0, 4
    la $a0, saludo
    syscall 
    #Impresion en pantalla del primer numero
    li $v0, 4
    la $a0, primerNumero
    syscall
    #Se obtiene el primer numero de pantalla
    li $v0, 5
    syscall
    #Se mueve el primer numero de registro con move a $t0
    move $t0, $v0
     #Impresion en pantalla del segundo numero
    li $v0, 4
    la $a0, segundoNumero
    syscall
    #Se obtiene el segundo numero de pantalla
    li $v0, 5
    syscall
    #Se mueve el segundo numero de registro con move a $t1
    move $t1, $v0
     #Impresion en pantalla del tercer numero
    li $v0, 4
    la $a0, tercerNumero
    syscall
    #Se obtiene el tercer numero de pantalla
    li $v0, 5
    syscall
    #Se mueve el tercer numero de registro con move a $t2
    move $t2, $v0
    
    #Se realiza la operacion de comparaciòn para encontrar el numero mayor
    
    #Se compara primero entre $t0 y $t1 usando la instrucciòn bge
    bge $t0, $t1, comparar2
    # se mueve el resultado mayor que es $t0 por ahora
    move $t0, $t1
    
    comparar2:
    #Se compara segundo entre $t0 y $t2 usando la instrucciòn bge
    bge $t0, $t2, resultadoFinal
    # se mueve el resultado mayor que es $t0 
    move $t0, $t2
    
    resultadoFinal:
    #Imprime resultado final   
    li $v0, 4
    la $a0, resultado
    syscall
    #se imprime un entero
    li $v0, 1
    #se mueve el entero a imprimir
    move $a0, $t0
    syscall
    
    #Terminar el programa
    #syscall para salir
    li $v0, 10
    syscall
    
    