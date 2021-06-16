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



1 '-----------------------------------'
1  '       PLAYER 10000-10999
1 '-----------------------------------'

1 'inicialización player'
    1 'Componente position'
    1 'la posición se define en las pantallas, pw=ancho, ph=alto, pv=velocidad, capturas, etc'
    1 'pj=indica si el salto está activado para desactivar la comprobación del teclado'
    1 'po=player y old'
    1 'pj=distancia que recorre cuando el salto está activado'
    1 'pa=salta activdo'
    1 'pl=player life o vida'
    1 'pr=player record, puntuación'
    1 'pb=bloques cogidos por el player'
    1 'pg=player gungs, balas, disparos que le quedan'
    10000 px=3*8:py=17*8:pv=4:pj=0:po=py:pe=100:pa=0:pl=3:pr=0:pb=0:pg=100
    1 'para ver el sprite camnando a la derecha, izquierda, etc utilizaremos un array'
    1 'Sprite 0 camina a la dercha'
    1 'sprite 1 camina ala derecha moviéndose'
    10010 dim p(6):p(0)=0:p(1)=1:p(2)=2:p(3)=3:p(4)=4:p(5)=5
    1 'Componente render: Plano 1(para el color) y 0 para el personaje, sprite del 0(para el color) y del 1 al 7 para el personaje'
    10020 pp=0:ps=0

    10030 put sprite pp,(px,py),,ps
10090 return


1 'Physics player'
    10100 tx=(px+4)/8:ty=py/8
    1 'Rutina de quequeo contorno mapa de map.bas'
    10120 gosub 13600

    1 'Chequeo escalera
    1 'Si estamos sobre una escalera subimos: la definición de esto está en el input system'
   
    1 'Chequeo bloques collectables'
    1' Cuando lo cojamos se borra y le metemos al array uno vacío
    1 'Tambien descontamos de los que hay que coger por level y pintamos'
    10125 if t0=67 then beep:copy (0,0)-(8,8),1 to (px+4,py+8),0:m(ty+1,tx)=-1:pb=pb-1:gosub 8000

    1 'gravedad'
    1 'Si no está saltando y no hay nada debajo hacemos que caiga'
    10130 if pa=0 and t5=255 then py=py+pv
    1 'Si está saltando y hay suelo debajo paramos el salto y activamos la interrupción de la barra espaciadora'
    10140 if pa=1 and t5 = 32 then pa=0:strig(0) on
    10150 if pa=1 and t1 = 32 then py=py-pv

  

10195 return


1 'render player'
    10200 put sprite pp,(px,py),,ps
10290 return



1' ------------------------------------'
1'          map 13000-13999 '
1' -------------------------------------'
1 'mc=counter map
1 'mu=update map, nos dice que debemos de volver a cargar el archivo.bin del disco en el array (en la RAM)'
    1' tx=Es el tile
    13000 tx=0:ty=0:t1=0:t3=0:t5=0:t7=0
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
    13020 dim t(5,5)
    13030 t(1,0)=32:t(1,1)=39
    13040 t(2,0)=69
    13050 t(3,0)=67:t(3,1)=98
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
    1 't0 es el tile sobre el que estamos,le sumamos 1 a la y ya que es un sprite de 16px'
    13600 t0=m(ty+1,tx)
    1 't1 será el tile de arriba'
    13610 t1=m(ty-1,tx)
    1't3 será el tile de la derecha
    13620 t3=m(ty,tx+1)
    1 'Chequeando abajo'
    1  'tx=(px+8)/8:ty=(py+16+1)/8
    1 'Son 2 tiles hacia abao porque el sprite es de 16px'
    13630 t5=m(ty+2,tx)
    1 'Izquierda'
    13640 if tx<=0 then t7=m(ty,0) else t7=m(ty,tx-1)
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
1 '13310 return1' ------------------------------------'
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
11390 return