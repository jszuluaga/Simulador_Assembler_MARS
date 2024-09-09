.data #Se define texto y variables
    saludo: .asciiz "Hola usuario \n"
    numerosIngresados: .asciiz "Ingresa la cantidad de numeros para la serie Fibonacci: "
    sumaNumeros: .asciiz "La suma de los numeros es: \n"
    nuevaLinea: .asciiz "\n"

.text #Intrucciones del programa
    #Se declara la etiqueta main como global
    .globl main
    
    main:
    #Impresion en pantalla del mensaje de saludo
    li $v0, 4
    la $a0, saludo
    syscall 
    #Impresion en pantalla de los numeros solicitados para la serie Fibonacci
    li $v0, 4
    la $a0, numerosIngresados
    syscall
    #Se obtiene los numeros ingresados por el usuario
    li $v0, 5
    syscall
    #Se mueve numeros con move a $t0
    move $t0, $v0
    #Se inicializa los valores de Fibonacci
    #primer nùmero de Fibonacci
    li $t1, 0
    #segundo numero de Fibonacci
    li $t2, 1
    #Suma total inicializada en 0
    li $t3, 0
    #contador inicializado en 0
    li $t4, 0
       
    serieFibonacci:
    #Impresion en pantalla el numero actual del Fibonacci que sea entero
    li $v0, 1
    move $a0, $t1
    syscall
    #Se imprime nueva linea para espacio
    li $v0, 4
    la $a0, nuevaLinea
    syscall
    #Se acumula el valor de $t1 en la suma total
    add $t3, $t3, $t1
    #Se calcula el siguiente número de Fibonacci
    add $t5, $t1, $t2
    move $t1, $t2
    move $t2, $t5
    #Se incrementa el contador +1
    addi $t4, $t4, 1
    #Si se llega al limite de numeros salir del bucle con bge
    bge $t4, $t0, finFibonacci
    #Se repite el ciclo con un salto de manera incondicional a la etiqueta de serieFibonacci
    j serieFibonacci
    
    finFibonacci:
    #Se imprime en pantalla el texto de suma
    li $v0, 4
    la $a0, sumaNumeros
    syscall
    #Se imprime en pantalla la suma total
    li $v0, 1
    move $a0, $t3
    syscall 
    #Terminar el programa, syscall para salir
    salida:
    li $v0, 10
    syscall