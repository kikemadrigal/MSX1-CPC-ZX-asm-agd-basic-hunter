    output "scolor.bin"

    db   #fe               ; ID archivo binario, siempre hay que poner el mismo 0FEh
    dw   INICIO            ; dirección de inicio
    dw   FINAL - 1         ; dirección final
    dw   INICIO             ; dircción del programa de ejecución (para cuando pongas r en bload"nombre_programa", r)

    org #73FF ; Le quitamos 1 byte para que no cuente el ret

INICIO:
    ret


COLOR_DATA:
    ; 0-
    db 00Ch,00Ah,009h,009h,009h,009h,004h,004h
    db 004h,004h,004h,004h,004h,004h,008h,008h
    ; 1-
    db 005h,00Ah,009h,009h,009h,009h,004h,004h
    db 004h,004h,004h,004h,008h,008h,008h,008h
    ; 2-
    db 00Ch,00Ah,009h,009h,009h,009h,004h,004h
    db 004h,004h,004h,004h,004h,004h,008h,008h
    ; 3-
    db 005h,00Ah,009h,009h,009h,009h,004h,004h
    db 004h,004h,004h,004h,008h,008h,008h,008h
    ; 4-
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    ; 5-
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    ; 6-
    db 00Ch,00Ah,009h,009h,009h,009h,004h,004h
    db 004h,004h,004h,004h,004h,004h,008h,008h
    ; 7-
    db 00Ch,00Ah,009h,009h,009h,009h,004h,004h
    db 004h,004h,004h,004h,004h,004h,008h,008h
    ; 8-
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    ; 9-
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    ; 10-
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    ; 11-
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    ; 12-
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    ; 13-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 00Dh,00Dh,00Dh,00Dh,009h,009h,009h,009h
    ; 14-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 00Dh,00Dh,00Dh,00Dh,009h,009h,009h,009h
    ; 15-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 00Dh,00Dh,00Dh,00Dh,009h,009h,009h,009h
    ; 16-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 00Dh,00Dh,00Dh,00Dh,009h,009h,009h,009h
    ; 17-
    db 00Fh,00Fh,009h,009h,009h,009h,00Bh,00Bh
    db 00Bh,00Bh,00Bh,00Ah,009h,009h,009h,00Fh
    ; 18-
    db 009h,009h,009h,00Bh,00Bh,00Bh,00Bh,00Bh
    db 00Ah,009h,009h,009h,009h,00Fh,00Fh,00Fh
    ; 19-
    db 00Fh,00Fh,009h,009h,009h,009h,00Bh,00Bh
    db 00Bh,00Bh,00Bh,00Ah,009h,009h,009h,00Fh
    ; 20-
    db 009h,009h,009h,00Bh,00Bh,00Bh,00Bh,00Bh
    db 00Ah,009h,009h,009h,009h,00Fh,00Fh,00Fh
    ; 21-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 006h,006h,006h,006h,006h,009h,009h,009h
    ; 22-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 006h,006h,006h,006h,006h,009h,009h,009h
    ; 23-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 006h,006h,006h,006h,006h,009h,009h,009h
    ; 24-
    db 00Fh,00Fh,00Fh,00Fh,009h,009h,009h,009h
    db 006h,006h,006h,006h,006h,009h,009h,009h
    ; 25-
    db 009h,009h,009h,009h,009h,009h,009h,009h
    db 00Ch,00Ch,00Ch,00Ch,009h,009h,009h,009h
    ; 26-
    db 009h,009h,009h,009h,009h,009h,009h,009h
    db 00Ch,00Ch,00Ch,00Ch,009h,009h,009h,009h
    ; 27-
    db 009h,009h,009h,009h,009h,009h,009h,009h
    db 00Ch,00Ch,00Ch,00Ch,009h,009h,009h,009h
    ; 28-
    db 009h,009h,009h,009h,009h,009h,009h,009h
    db 00Ch,00Ch,00Ch,00Ch,009h,009h,009h,009h
    ; 29-
    db 00Fh,00Fh,008h,009h,009h,009h,00Dh,00Dh
    db 00Dh,00Dh,00Dh,00Dh,00Dh,009h,009h,009h
    ; 30-
    db 00Fh,00Fh,008h,009h,009h,009h,00Dh,00Dh
    db 00Dh,00Dh,00Dh,00Dh,00Dh,009h,009h,009h




FINAL: