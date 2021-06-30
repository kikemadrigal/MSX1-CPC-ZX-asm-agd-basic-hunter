1 'Inicilizamos dispositivo: 003B, inicilizamos teclado: 003E, incializamos y preparamos el sonido:&H90'
0 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0):defusr2=&H90:a=usr2(0)

1 'Enlazamos con las rutinas de la bios para aparagar y encender la pantalla'
5 defusr3=&H41:defusr4=&H44
10 bload"nbasic.bin",r
20 open "grp:" as #1:defint a-z
30 bload"sprites.bin",s:print #1,"!Sprites leidos"
40 bload"scolor.bin",s:print #1,"!colores sprites leidos"
50 bload"TILESET.S05",s,32768:print #1,"!tileset leido"
1 'Inicializamos el mapa'
70 print #1,"!Cargando mapa":gosub 13000
1 'Inicialización de las variables del juego'
1 'x,y son variables temporales'
80 x=0:y=0
1 'Inicialización player'
100 gosub 10000
1 'Inicializamos shots'
105 gosub 11000
1 'Rutina barra espaciadora pulsada creamos un disparo
110 strig(0) on:on strig gosub 11100
1 ' Rutina inicializar enemigos'
120 gosub 12000
130 'bload"music.bin":defusr5=&hC000:b=usr5(0):defusr6=&hC009:defusr7=&hC01A:b=usr7(0):defusr8=&hC013
1 'Mostramos la pantalla de presentación
140 gosub 14000



1 'main loop'
    2000 'nada'
    1 'input system
    2005 gosub 2500
    1 'Physics player'
    2010 gosub 10100
    1 'Physics enemies'
    2020 gosub 12700
    1'Render player
    2030 gosub 10200
    1 'Render shots'
    2040 'gosub 11300
    1 'si el mapa cambia 1 'Rutina hacer copys con mapa, 2 Escribimos en la VRAM, aumentamos el nivel:ponmeos el mc=0'
    1 '8000=mostramos la puntuación'
    2050 if mc=1 then cls:gosub 13100:gosub 13300:ma=ma+1:mc=0:gosub 8000
    1 'marcamos como que el mapa ha cambiado para que vuelva a cargarlo y le decimos que el mapa actual es el 0'
    2060 if pb=0 then mc=1:if ma>1 then ma=0
    1 'debug'
    2070 'gosub 9000
2090 goto 2000



1 '2 Sistema de input'
    1 'Nos guardamos las posiciones del player antes de cambiarlas'
    2500 on stick(0) gosub 2600,2660,2700,2500,2800,2500,2860,2900

2599 return
1 '1 Arriba'
    1 'Si  no estamos saltando y lo que hay debajo en un sólido entonces salta,
    1 'Guardamos la posición vieja de y en po'
    2600 if pa=0 then po=py:pa=1 
2650 return
1 '2 arriba-derecha'
    2660 if pa=0 then po=py:pa=1 
    2670 if t3<>tw then px=px+pv:if px>246 then px=246 
    2680 swap p(0),p(1):ps=p(1)
2690 return
1 're=8 es el efecto de sonido 8 de la rutina de reprodución de sonidos 2300
1 '3 derecha'
    1 'comprobamos que no hay un sólido a la derecha y despues si se ha salido lo recolocamos'
    2700 if t3<>tw then px=px+pv:if px>246 then px=246 
    2710 swap p(0),p(1):ps=p(1)
2720 return
1 '5 abajo'
    1 'Si lo que hay abajo es una escalera baja'
    2800 'if t5=69 then py=py+pv
2850 return
1 '7 izquierda'
    2860 if t7<>tw then px=px-pv:if px<=0 then px=0
    2870 swap p(2),p(3):ps=p(3)
2890 return
1 '8 izquierda-arriba'
    2900 if pa=0 then po=py:pa=1 
    2910 if t7<>tw then px=px-pv:if px<=0 then px=0
    2920 swap p(2),p(3):ps=p(3)
2950 return




1 'HUD'
    8000 preset (0,184):print #1,"Score: "pr" Vidas: "pl" cogidas: "pb
    8010 preset (0,196):print #1,"Level: "ma" balas: "pg" libre: "fre(0)
8020 return


1 'Debug'
    9000 'nada'
    1 '9010 preset (0,0): print #1," px "px" py "py" tx "tx" ty "ty
    1 '9010 preset (0,0): print #1,"px "px" py "py" pa "pa" tx "tx" ty "ty
    1 '9020 preset (0,8): print #1," t0 "t0" t1 "t1" t3 "t3" t5 "t5" t7 "t7  
    1 '9010 preset (0,0): print #1,"pa "pa" ty "ty" t5 "t5" tx "tx" t1 "t1
    1 '9010 preset (0,0): print #1,"en  "en" ex0 "ex(0)" ex1 "ex(1)
    1 '9020 preset (0,8): print #1,"ep0  "ep(0)" es0 "es(0)" ep1 "ep(1)" es1 "es(1)
    1 '9030 preset (0,16): print #1," ev0 "ev(0)" ev1 "ev(1)" ed0  "ed(0)" ed1 "ed(1)
    9010 preset (0,16): print #1," dn "dn" dx0 "dx(0)" dy0 "dy(0)" ds0  "ds(0)" dp0 "dp(0)
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
    14070 'b=usr6(0)
    14080 if inkey$="" then goto 14070 
    14085 'b=usr8(0)
14090 return
1'------------------------------------'
1'  Pantalla de payer muere
1'------------------------------------'
    1 'Borramos los enemigos'
    14100 en=0
    14110 cls:preset (10,30):  print #1,"Game over"
    1 'Recolocamos el player para que no se vea'
    14120 py=212
    1 'Marcamos el mapa como que ha cambiado para que lo vuelva a cargar'
    14130 mc=1: ma=0
    1 'hacemos una pequeña espera'
    14140 for i =0 to 1000:next i
    14150 goto 130
14190 return

1'------------------------------------'
1'          screen 0
1'------------------------------------'
    1 'Situamos al player
    1 'creamos 2 enemigos'
    20000 en=0
    20010 gosub 12500: ex(en-1)=14*8:ey(en-1)=14*8:es(en-1)=17
    20030 gosub 12500: ex(en-1)=26*8:ey(en-1)=4*8
    1 'Rendremos que coger 6 bloques'
    20040 pb=8
    20050 px=3*8:py=18*8
20090 return

1'------------------------------------'
1'          screen 1
1'------------------------------------'
    1 'Situamos al player
    1 'creamos 2 enemigos'
    20100 en=0
    1 'Rendremos que coger 6 bloques'
    20140 pb=6
    20150 px=3*8:py=18*8
20190 return

1 ' ----------------------------------------------------------------------------------------'
1 '                                END SCREENS
1 ' ----------------------------------------------------------------------------------------'



