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
1 'Inicialización de las variables del juego'
1 'x,y son variables temporales'
80 x=0:y=0
1 'Inicialización player'
100 gosub 10000
1 'Rutina barra espaciadora pulsada creamos un disparo
110 strig(0) on:on strig gosub 11100
1 ' Rutina inicializar enemigos'
120 gosub 12000




1 'main loop'
    2000 'nada
    1 'input system
    2005 gosub 2500
    1 'Physics player'
    2010 gosub 10100
    1 'Physics enemy'
    2020 'gosub 12700
    1'Render player
    2030 gosub 10200
    1 'Render enemies'
    2040 'gosub 12800
    1 'si el mapa cambia 1 'Rutina hacer copys con mapa, 2 Escribimos en la VRAM, aumentamos el nivel:ponmeos el mc=0'
    1 '8000=mostramos la puntuación'
    2050 if mc=1 then cls:gosub 13100:gosub 13300:ma=ma+1:mc=0:gosub 8000
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
    9010 preset (0,0): print #1,"en  "en" en0 "ex(0)" en1 "ex(1)
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
    
    20000 en=0:gosub 12500: ex(en-1)=4*8:ey(en-1)=20*8
    20030 gosub 12500: ex(en-1)=26*8:ey(en-1)=20*8
    1 'Rendremos que coger 6 bloques'
    20040 pb=2
    20050 px=3*8:py=18*8
20090 return

1'------------------------------------'
1'          screen 1
1'------------------------------------'
    1 'Situamos al player
    1 'creamos 2 enemigos'
    20100 en=0:gosub 12500: ex(en-1)=14*8:ey(en-1)=5*8
    20130 gosub 12500: ex(en-1)=28*8:ey(en-1)=4*8
    1 'Rendremos que coger 6 bloques'
    20140 pb=2
    20150 px=3*8:py=18*8
20190 return

1 ' ----------------------------------------------------------------------------------------'
1 '                                END SCREENS
1 ' ----------------------------------------------------------------------------------------'



1 '-----------------------------------'
1  '       PLAYER 10000-10999
1 '-----------------------------------'

1 'inicialización player'
    1 'pv=velocidad horizontal
    1 'pw=velocidad vertical'
    1 'po=player y old'
    1 'pa=salta activdo'
    1 'pl=player life o vida'
    1 'pr=player record, puntuación'
    1 'pb=bloques cogidos por el player'
    1 'pg=player gungs, balas, disparos que le quedan'
    10000 px=3*8:py=18*8:pv=8:pw=8:pj=0:po=py:pe=100:pa=0:pl=3:pr=0:pb=0:pg=100
    1 'para ver el sprite camnando a la derecha, izquierda, etc utilizaremos un array'
    1 'Sprite 0 camina a la dercha'
    1 'sprite 1 camina ala derecha moviéndose'
    10010 dim p(6):p(0)=0:p(1)=1:p(2)=2:p(3)=3:p(4)=4:p(5)=5
    1 'Componente render: Plano 1(para el color) y 0 para el personaje, sprite del 0(para el color) y del 1 al 7 para el personaje'
    10020 pp=0:ps=0

    10030 put sprite pp,(px,py),,ps
10090 return


1 'Physics player'
    10100 'nada'
    1 'Rutina de quequeo de tiles está en el main.bas'
    1 'Rutina salto: si esta saltando le restamos a la posición y la velocidad vertical
    10110 if pa=1 then py=py-pw
    1 'Si tenemos en la cabeza un bloque sólido bajamos'
    10111 if t1=tw then pa=2
    1 '-48 es la distancia máxima a la que puede saltar de la posición original (po), con pa=2 le decimos que está cayendo'
    10120 if pa=1 and py<po-48 then pa=2
    1 'Si cuando estemos cayendo hay un bloque sólido se termina el salto'
    10135 if t5=tw and pa=2 then pa=0
    1 'Rutina caida
    10136 if pa=2 then py=py+pw
   

    1 'Contorno, chqueamos que no se haya salido por la gravedad'
    10140 if py>170 then py=170
    10150 if py<=0 then py=0

    1 'Chequeo escalera
    1 'Si estamos sobre una escalera subimos: la definición de esto está en el input system'
   
    1 'Chequeo bloques collectables'
    1 'vamos a coprobar los tiles de alrededor y sobre el que estamos'
    1 'Con pb-1 le decimos que queda un bloque menos por recoger'
    1 'Con gosub 8000 actualizamos el marcador'
    10165 x=px:y=py:gosub 13600
    10168 if t0=tc then copy (8,40)-(8+8,39+8),1 to (px,py+8),0:m(ty+1,tx)=-1:beep:pb=pb-1:gosub 8000

    1 'Gravedad'
    1 'Si no está saltando y no hay debajo un bloque sólido hacemos que caiga'
    10170 if pa=0 and t5<>tw then py=py+pv
10195 return


1 'render player'
    10200 put sprite pp,(px,py),,ps
10290 return



1' ------------------------------------'
1' Rutinas disparos / fires 11000-11999 '
1' -------------------------------------'
1 'Rutina inicializar disparos'
1 'Recuerda que reservaste el espacio para X variables disparo en un array en el loader'
1 'Los disparos se irán creando dinámicamente según vayamos pulsando la barra espaciadora'
1 'Los parámteros se los metemos a ojo, la posición e y, son las del player'
1 'dn= disparo número, sirve para ir creando disparos ya que despues se incrementa'
1 'dd=disparo destruido, variable utilizada para eliminar enemigos (ver linea 11330 y 11200)'
    11000 dn=0:dd=0
11060 return

1 ' Rutina crear disparos'
1 ' Recuerda que hemos reservamos espacio para disparos en el loader'
    1 ' solo permitiremos X disparos (recuerda que el 1 es la plantilla del cual copiamos, solo se mostraán 4)'
    11100 if dn>9 then return 
    1 'Posición'
    11120 dx(dn)=px+16:dy(dn)=py+8
    1 'Físicas: velocidad'
    11130 dv(dn)=8
    1 'Render: sprite y plano'
    11140 ds(dn)=6:dp(dn)=6+dn
    1 'RPG: disparo activo (no utlizado)'
    11150 da(dn)=0
    1 ' Para crear disparos sumamos 1 al contador de numero de disparos'
    11160 dn=dn+1
    11170 beep
11180 return

1 ' Rutina eliminar disparos'
    1 ' Si el enemigo es la última posición de array simplemente le restamos 1 al número de enemigos'
    1 ' Aunque tenemos 5 disparos reservados en memoria, la rutina actualizar disparos solo pinta dn '
    11200 'Bajamos el número de disparos para que nos pinte los X que habíamos reservado en el loader, solo los que le decimos
    11210 dn=dn-1
    11220 'Ponemos el sprite fuera para que no se vea'
    11230 put sprite dp(dd),(-16,0),15,ds(dd)
    11240 'preset (0,130):print #1,"D:ds: "ds(dd)", dp: "dp(dd)", dx: "dx(dd)
    1 'Copiamos los valores del ultimo disparo sobre el disparo destruido (al fin y al cabo es solo moverlos)'
    11250 dx(dd)=dx(dn):dy(dd)=dy(dn):dv(dd)=dv(dn):ds(dd)=ds(dn):dp(dd)=dp(dn):da(dd)=da(dn) 
11260 return

1 'Rutina actualizar disparos'
    1 'Si no hay disparos no pintes'
    11300 if dn=0 then return 
    11310 for i=0 to dn-1 
        1 'Si hay le sumamos la velocidad'
        11320 dx(i)=dx(i)+dv(i) 
        1 'lo pintamos
        11330 put sprite dp(i),(dx(i),dy(i)),15,ds(i)
        1 'Si está fuera de la pantalla el disparo lo eliminamos'
        11340 if dx(i)>=256 then dd=i:gosub 11200
        11350 'preset (0,150+i*10):print #1,"i: "i", ds: "ds(i)", dp: "dp(i)
        1 'Si la pantalla es superior a 256px, nos guardamos la posición del array del enemigo destruido y llamamos a la rutina destruir enemigo'
    11360 next i
11390 return1 '-----------------------------------'
1  '       Enemy 12000-12999
1 '-----------------------------------'

1 'Init
    1 'Definiendo el espacio para los arrays con los valores de los enemigos' 
    1 'em=enemigos maximos'
    12000 em=3
    1 'Reservamos el espacio en RAM para 5 enemigos'
    12010 DIM ex(em),ey(em),ev(em),el(em),es(em),ep(em),ec(em),ee(em)
    1 'Componente de posicion'
    1 'ex=coordenada x, ey=coordenada y', e1=coordenada previa x, e2=coordenada previa y
    1 'Componente de fisica'
    1 'ev=velocidad enemigo eje x, el=velocidad eje y'
    1 'Componente de render'
    1 'es=enemigo sprite, ep=enemigo plano'
    1 'Componente RPG'
    1 'ee=enemigo energia '
    1 'en=enemigo numero, variable utilizar para gestionar la creación y destrucción de enemigos'
    12020 en=0
12030 return

1 ' Crear enemigo'
    12500 if en>5 then return
    12510 en=en+1
    12530 'ev(en)=16:el(en)=16
    1 'Los enemigos son los sprites 10 al un motón'
    12540 'es(en)=13:ep(en)=13+en:ec(en)=rnd(1)*15
    12560 'ee(en)=100

12580 return
1 '
1 '1 ' Rutina eliminar enemigos'
1 '    12600 en=en-1
1 '    12610 ey(ed)=rnd(1)*140
1 '    12620 if ey(ed)<64 then goto 11610
1 '    12630 ec(ed)=rnd(1)*15
1 '    12640 if ec(ed)<2 then goto 11630
1 '    12650 put sprite ep(ed),(-16,0),ec(ed),es(ed)
1 '12660 return
1 '
1 'Update enemigo'
    12700 if en<=0 then return
    1 '12710 for i=0 to en-1
    1 '    1 ' A cada uno le restamos la velocidad'
    1 '    12720 ex(i)=ex(i)-ev(i)        
    1 '    12730 'nada'
    1 '    12770 put sprite ep(i),(ex(i),ey(i)),ec(ei),es(i)
    1 '    12780 'preset (0,150+i*10):print #1,"es: "es(i)", ep: "ep(i)", ex: "ex(i)
    1 '    12790 'if ex(i)<=0 then ed=i:gosub 11600
    1 '12800 next i
12810 return

1 'Rutina eliminar todos los enemigos'
    12900 en=0
12910 return1' ------------------------------------'
1'          map 13000-13999 '
1' -------------------------------------'
1 'mc=counter map
1 'mu=update map, nos dice que debemos de volver a cargar el archivo.bin del disco en el array (en la RAM)'
    1' tx=Es el tile en el que está el player en el eje x
    1 't0=tile sobre el que está el player,t1 =tile arriba, t3 derecha, t5 abajo, t7 izquierda'
    13000 tx=0:ty=0:t0=0:t1=0:t3=0:t5=0:t7=0
    1 'te= tile vacío (empty)'
    1 'tw= tile pared (wall)'
    1 'tl= tile escalera (ladder)'
    1 'tf= tile pienso (fodder)'
    1 'td= tile mortal (deadly)'
    1 'tc= tile coleccionable (collectable)'
    13005 te=255:tw=32:tl=0:tf=0:td=0:tc=67
    1 'dim mapa(filas,clumnas)'
    1 'ma=mapa activo o actual, se empieza con el 0'
    1 'mc=mapa cambia'
    13010 dim m(22,32):ma=0:mc=1
    1 ' Arary de tiles:'
    1 '0: tiles tipo vacíos'
    1 '1: tiles tipo muro'
    1 '2: tile tipo escalera'
    1 '3: tiles coleccionables'
    1 '4: tiles asesinos'
    1 '13020 dim t(5,5)
    1 '13030 t(1,0)=32:t(1,1)=39
    1 '13040 t(2,0)=69
    1 '13050 t(3,0)=67:t(3,1)=98
13090 return


1 'Cargar mundo con los mapas de los niveles en el buffer o array'
    13100 'esto almacenará el array a partir de la posición 8dc8 de la RAM'
    1 '20000 rutina de inicialización mundo 0
    13110 if ma=0 then bload"level0.bin",r:gosub 20000
    13111 if ma=1 then bload"level1.bin",r:gosub 20100
    13115 call turbo on (m())
    13120 md=&hd001
    13130 for f=0 to 22
        13140 for c=0 to 32-1
            13150 tn=peek(md):md=md+1
            13160 m(f,c)=tn
        13170 next c
    13180 next f
    13190 call turbo off
13195 return

1 'Pintamos en la VRAM page 0, los valores definidos en el array hasta la columna 32
    13300 a=usr3(0):call turbo on (m())
    13310 for f=0 to 22
        13360 for c=0 to 31
            13370 tn=m(f,c)
            13380 if tn >=0 and tn <32 then copy (tn*8,0*8)-((tn*8)+8,(0*8)+8),1 to (c*8,f*8),0,tpset
            13390 if tn >=32 and tn <64 then copy ((tn-32)*8,1*8)-(((tn-32)*8)+8,(1*8)+8),1 to (c*8,f*8),0,tpset
            13400 if tn >=64 and tn <96 then copy ((tn-64)*8,2*8)-(((tn-64)*8)+8,(2*8)+8),1 to (c*8,f*8),0,tpset
            13410 if tn>=96 and tn <128 then copy ((tn-96)*8,3*8)-(((tn-96)*8)+8,(3*8)+8),1 to (c*8,f*8),0,tpset
            13420 if tn>=128 and tn <160 then copy ((tn-128)*8,4*8)-(((tn-128)*8)+8,(4*8)+8),1 to (c*8,f*8),0,tpset
            13430 if tn>=160 and tn <192 then copy ((tn-160)*8,5*8)-(((tn-160)*8)+8,(5*8)+8),1 to (c*8,f*8),0,tpset
            13440 if tn>=192 and tn <224 then copy ((tn-192)*8,6*8)-(((tn-192)*8)+8,(6*8)+8),1 to (c*8,f*8),0,tpset
            13450 if tn>=224 and tn <256 then copy ((tn-224)*8,7*8)-(((tn-224)*8)+8,(7*8)+8),1 to (c*8,f*8),0,tpset
        13510 next c
    13520 next f 
    13540 a=usr4(0):call turbo off
13570 return



1'chequeando contorno de una coordeanda dada por tx y ty
    13600 tx=x/8:ty=y/8
    1 't0 es el tile sobre el que estamos,le sumamos 1 a la y ya que es un sprite de 16px y solo queremos ver las piernas'
    13605 if ty>0 then t0=m(ty+1,tx)
    1 't1 será el tile de arriba'
    13610 t1=m(ty-1,tx)
    1't3 será el tile de la derecha
    13620 t3=m(ty,tx+1)
    1 'Chequeando abajo'
    1  'tx=(px+8)/8:ty=(py+16+1)/8
    1 'Son 2 tiles hacia abao porque el sprite es de 16px'
    13630 if ty>0 and ty<20 then t5=m(ty+2,tx)
    1 'Izquierda'
    13640 if tx>0 then t7=m(ty,tx-1)
    
13690  return




























1 '1 'Rutina hacer coipys con mapa
1 '    13100 a=usr3(0):call turbo on
1 '    13110 md=&hd001
1 '        13120 for f=0 to 23
1 '        1 'ahora leemos las columnas c
1 '            13130 for c=0 to 31
1 '                1 'Obtenemos el valor que representa al tile de la fila y la columna'
1 '                13140 tn=peek(md):md=md+1
1 '                13150 if tn >=0 and tn <32 then copy (tn*8,(0*8)+2)-((tn*8)+8,(0*8)+8),1 to (c*8,f*8),0,tpset
1 '                13160 if tn >=32 and tn <64 then copy ((tn-32)*8,(1*8)+2)-(((tn-32)*8)+8,(1*8)+8),1 to (c*8,f*8),0,tpset
1 '                13170 if tn >=64 and tn <96 then copy ((tn-64)*8,(2*8)+2)-(((tn-64)*8)+8,(2*8)+8),1 to (c*8,f*8),0,tpset
1 '                13180 if tn>=96 and tn <128 then copy ((tn-96)*8,(3*8)+2)-(((tn-96)*8)+8,(3*8)+8),1 to (c*8,f*8),0,tpset
1 '                13190 if tn>=128 and tn <160 then copy ((tn-128)*8,(4*8)+2)-(((tn-128)*8)+7,(4*8)+8),1 to (c*8,f*8),0,tpset
1 '                13200 if tn>=160 and tn <192 then copy ((tn-160)*8,(5*8)+2)-(((tn-160)*8)+7,(5*8)+8),1 to (c*8,f*8),0,tpset
1 '                13210 if tn>=192 and tn <224 then copy ((tn-192)*8,(6*8)+2)-(((tn-192)*8)+7,(6*8)+8),1 to (c*8,f*8),0,tpset
1 '                13220 if tn>=224 and tn <256 then copy ((tn-224)*8,(7*8)+2)-(((tn-224)*8)+7,(7*8)+8),1 to (c*8,f*8),0,tpset
1 '                1 '13230 if tn>=128 and tn <144 then copy ((tn-128)*16,8*16)-(((tn-128)*16)+16,(8*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13240 if tn>=144 and tn <160 then copy ((tn-144)*16,9*16)-(((tn-144)*16)+16,(9*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13250 if tn>=160 and tn <176 then copy ((tn-160)*16,10*16)-(((tn-160)*16)+16,(10*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13260 if tn>=176 and tn <192 then copy ((tn-176)*16,11*16)-(((tn-176)*16)+16,(11*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13270 if tn>=192 and tn <208 then copy ((tn-192)*16,12*16)-(((tn-192)*16)+16,(12*16)+16),1 to (c*16,f*16),0,tpset
1 '                13280 next c
1 '        13290 next f 
1 '        13300 a=usr4(0):call turbo off
1 '13310 return