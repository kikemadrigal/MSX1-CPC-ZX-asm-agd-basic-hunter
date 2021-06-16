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



