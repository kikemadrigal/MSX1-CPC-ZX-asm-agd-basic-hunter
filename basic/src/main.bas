1 'Inicilizamos dispositivo: 003B, inicilizamos teclado: 003E, incializamos y preparamos el sonido:&H90'
0 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0):defusr2=&H90:a=usr2(0)
1 'Enlazamos con las rutinas de la bios para aparagar y encender la pantalla'
5 defusr3=&H41:defusr4=&H44
10 bload"xbasic.bin",r
20 screen 5,2,0:color 15,1,1:open "grp:" as #1:defint a-z
30 bload"sprites.bin",s:print #1,"!Sprites leidos"
40 bload"scolor.bin",s:print #1,"!colores sprites leidos"
50 bload"TILESET.S05",s,32768:print #1,"!tileset leido"
60 'bload"level0.bin",r:print #1,"Tilemap cargado en RAM"
1 'Inicializamos el mapa'
70 print #1,"!Cargando mapa":gosub 13000
1 'Inicialización player'
100 gosub 10000
1 'Rutina barra espaciadora pulsada creamos un disparo
110 strig(0) on:on strig gosub 11100





1 'main loop'
    1 'input system
    2000 gosub 2500
    1 'Physics system'
    2010 gosub 10100
    1'Render player
    2020 gosub 10200
    1 'si el mapa cambia 1 'Rutina hacer copys con mapa, 2 Escribimos en la VRAM, aumentamos el nivel:ponmeos el mc=0'
    1 '8000=mostramos la puntuación'
    2030 if mc=1 then cls:gosub 13100:gosub 13300:ma=ma+1:mc=0:gosub 8000
    2040 if pb=0 then mc=1:if ma>1 then ma=0
    1 'debug'
    2080 'gosub 9000
2090 goto 2000



1 '2 Sistema de input'
    1 'Nos guardamos las posiciones del player antes de cambiarlas'
    2500 on stick(0) gosub 2700,2500,2600,2500,2800,2500,2640
    1 'Rutina salto va junto a la línea 120 y subrutina 5200'
    2520 if pa=1 then py=py-pj
    1 '50 es la distancia máxima a la que puede saltar'
    2530 if pa=1 and py<po-50 then pj=-pj
    2540 if pa=1 and py>po then py=po:pj=0:pj=-pj:pa=0:strig(0)on
2599 return
1 're=8 es el efecto de sonido 8 de la rutina de reprodución de sonidos 2300
1 '3 derecha'
    2600 px=px+pv:if px>246 then px=246
    2610 swap p(0),p(1):ps=p(1)
2630 return
1 '7 izquierda'
    2640 px=px-pv:if px<=0 then px=0
    2650 swap p(2),p(3):ps=p(3)
2660 return
1 '1 Arriba'
    1 'Si no estamos sobre una escalera y no estamos saltando y lo que hay debajo en un sólido entonces salta,
    1 'Guardamos la posición vieja de y en po'
    1 'pj=2 distancia en pixeles que se le va a sumar o restar en el input system'
    2700 if t0<>69 and pa=0 and t5=32 then po=py:pj=8:pa=1:strig(0)off else py=py-pv
    2710 if py<=0 then py=0
2750 return
1 '5 abajo'
    1 'Si lo que hay abajo es una escalera baja'
    2800 if t5=69 then py=py+pv
    2820 if py>180 then py=180
2850 return


1 'HUD'
    8000 preset (0,184):print #1,"Score: "pr" Vidas: "pl" cogidas: "pb
    8010 preset (0,196):print #1,"Level: "ma" balas: "pg" libre: "fre(0)
8020 return


1 'Debug'
    9000 'nada'
    9010 preset (0,0): print #1," px "px" py "py" tx "tx" ty "ty
    9020 preset (0,8): print #1," t0 "t0" t1 "t1" t3 "t3" t5 "t5" t7 "t7  
    1 '9010 preset (0,0): print #1,pa 
9090 return














1 ' ----------------------------------------------------------------------------------------'
1 '                                 SCREENS
1 ' ----------------------------------------------------------------------------------------'
1'------------------------------------'
1'  Pantalla de Bienvenida y records 
1'------------------------------------'
    14000 cls:preset (10,30):  print #1,"The hunter"
    1 ' Con inverse ponemos el fondo de los carcacteres en el frente y el frente en el fondo'
    14050 preset (10,160): print #1, "!Cursores para mover, pulsa una tecla para continuar"
    14060 preset (10,180): print #1, "!libre: "fre(0)
    1 'Si no se pulsa una tecla se queda en blucle infinito reproduciebdo una música, si se pulsa se para la música'
    1 '11870 re=1:gosub 4300
    14070 if inkey$="" then goto 14070
14090 return

1'------------------------------------'
1'          screen 0
1'------------------------------------'
    1 'Situamos al player
    1 'creamos 2 enemigos'
    20000 'gosub 12500: ex(en-1)=4*8:ey(en-1)=20*8
    20030 'gosub 12500: ex(en-1)=26*8:ey(en-1)=20*8
    1 'Rendremos que coger 6 bloques'
    20040 pb=2
20090 return

1'------------------------------------'
1'          screen 1
1'------------------------------------'
    1 'Situamos al player
    1 'creamos 2 enemigos'
    20100 'gosub 12500: ex(en-1)=4*8:ey(en-1)=20*8
    20130 'gosub 12500: ex(en-1)=26*8:ey(en-1)=20*8
    1 'Rendremos que coger 6 bloques'
    20140 pb=2
20190 return

1 ' ----------------------------------------------------------------------------------------'
1 '                                END SCREENS
1 ' ----------------------------------------------------------------------------------------'



