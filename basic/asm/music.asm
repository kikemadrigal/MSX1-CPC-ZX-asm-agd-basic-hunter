        output "music.bin"
;music.bin necestia 800 bytes para alojarse en la RAM, en basic tenemos hasta la direccion &hf380-800= eb00
    db   #fe               ; ID archivo binario, siempre hay que poner el mismo 0FEh
    dw   INICIO            ; dirección de inicio
    dw   FINAL - 1         ; dirección final
    dw   INICIO            ; dircción del programa de ejecución (para cuando pongas r en bload"nombre_programa", r)

    org #c000 ; org se utiliza para decirle al z80 en que posición de memoria empieza nuestro programa (es la 33280 en decimal), en hezadecimal sería #8200
    ; Las variables del pt3_player está definidas en el archivo PT3_player.asm en la dirección #f000
INICIO:
inicilizar_tracker:
    ;Deactivamos las interrupciones
    di	
	ld		hl,SONG-100		; hl vale la direccion donde se encuentra la cancion - 99
	call	PT3_INIT			; Inicia el reproductor de PT3
    ;Activamos las interrupciones
	ei 
    ;Volvemos al basic
    ret

reproducir_bloque_musica:
    ;------------------Reproducir Bloque de múscia--------
    halt						;sincronizacion
	di
	call	PT3_ROUT			;Borrar el valor anterior
	call	PT3_PLAY			;Reproduce el siguiente trozo de canción
    ei
    ;--------------Fin de reproducir bloque de música-----
    ;Volvemos al basic
    ret
para_cancion:
    call PT3_MUTE
    ret
evitar_repeticion_cancion:
    ld a, (#f7f8)
    ld (PT3_SETUP),a
    ret
tracker:
	include	"PT3_player.asm"					;replayer de PT3
SONG:
	incbin "music_game.pt3"			;musica de ejemplo




MAP:


    db 97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97
    db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    db 128,129,130,131,132,133,134,128,129,130,131,132,133,134,135,136,137,138,135,136,128,129,130,131,132,128,129,130,131,132,133,134
    db 160,161,162,163,164,165,166,160,161,162,163,164,165,166,167,168,169,170,167,168,160,161,162,163,164,160,161,162,163,164,165,166
    db 161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161
    db 67,161,161,161,161,161,161,161,161,161,161,161,161,161,161,67,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,67
    db 32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32
    db 161,161,161,161,161,161,161,161,161,32,161,45,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,161,161,161,11,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,11,161,45,161,161,32,161,161,45,161,161,161,161,161,161,161,161,161,32,161,11,161,161,161,161,161,161,161
    db 67,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,67,161,161,161,161,161,32,161,161,161,161,161,161,161,161,67
    db 32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32
    db 161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161
    db 161,161,45,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,45,161,161,161,161,161
    db 161,161,161,161,161,161,161,11,161,32,161,161,161,11,161,161,161,161,161,161,45,161,32,161,161,161,161,161,161,161,161,161
    db 67,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,161,161,161,161,32,161,161,161,161,161,161,161,161,67
    db 32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32,161,161,161,32,161,161,161,32,32,32,32,32,32
    db 161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,161,161,161,161,42,161,161,161,161,45,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161
    db 161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,11,161,161,161,161,45,161,161,161,161,161,161
    db 161,161,161,161,163,161,161,161,161,161,161,161,3,3,3,3,3,3,3,3,161,161,161,161,161,161,161,161,161,161,161,161
    db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
    db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32


FINAL:











