    output "level0.bin"

    db   #fe               ; ID archivo binario, siempre hay que poner el mismo 0FEh
    dw   INICIO            ; dirección de inicio
    dw   FINAL - 1         ; dirección final
    dw   INICIO             ; dircción del programa de ejecución (para cuando pongas r en bload"nombre_programa", r)

    org #d000 ; o 57344, org se utiliza para decirle al z80 en que posición de memoria RAM empieza nuestro programa en ensamblador
    
INICIO:
    ret
MAP:



    db 97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97
    db 97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97
    db 128,129,130,131,132,133,134,128,129,130,131,132,133,134,135,136,137,138,135,136,128,129,130,131,132,128,129,130,131,132,133,134
    db 160,161,162,163,164,165,166,160,161,162,163,164,165,166,167,168,169,170,167,168,160,161,162,163,164,160,161,162,163,164,165,166
    db 161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161
    db 67,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,67
    db 32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32
    db 161,161,161,161,161,161,161,161,161,32,161,45,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,161,161,161,11,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,11,161,45,161,161,32,161,161,45,161,161,161,161,161,161,161,161,161,32,161,11,161,161,161,161,161,161,161
    db 67,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,67,161,161,161,161,161,32,161,161,161,161,161,161,161,161,67
    db 32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32
    db 161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161
    db 161,161,45,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,45,161,161,161,161,161
    db 161,161,161,161,161,161,161,11,161,32,161,161,161,11,161,161,161,161,161,161,45,161,32,161,161,161,161,161,161,161,161,161
    db 67,161,161,67,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,67
    db 32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32
    db 161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,161,161,161,161,42,161,161,161,161,45,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,11,161,161,161,161,45,161,161,161,161,161,161
    db 161,161,161,161,163,161,161,161,161,67,161,161,161,161,161,161,67,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161
    db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
    db 39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39



FINAL:
