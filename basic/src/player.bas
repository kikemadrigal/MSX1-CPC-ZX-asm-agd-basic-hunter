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
    10000 px=3*8:py=19*8:pv=8:pw=8:pj=0:po=py:pe=100:pa=0:pl=3:pr=0:pb=0:pg=100
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
    1 'Rutina salto va junto a la línea 120 y subrutina 5200'
    10110 if pa=1 then py=py-pw
    1 '50 es la distancia máxima a la que puede saltar, con pa=2 le decimos que está cayendo'
    10120 if pa=1 and py<po-32 then pa=2
    1 '10130 if pa=1 and py>po then py=po:pw=0:pw=-pw:pa=0
    
    10130 if pa=2 then py=py+pw


    1 'Contorno, chqueamos que no se haya salido por la gravedad'
    10140 if py>170 then py=170
    10150 if py<=0 then py=0

    1 'Chequeo escalera
    1 'Si estamos sobre una escalera subimos: la definición de esto está en el input system'
   
    1 'Chequeo bloques collectables'
    1' Cuando lo cojamos se borra y le metemos al array uno vacío
    1 'Tambien descontamos de los que hay que coger por level y pintamos'
    10160 if t0=67 then beep:copy (0,0)-(8,8),1 to (px+4,py+8),0:m(ty+1,tx)=-1:pb=pb-1:gosub 8000

    1 'gravedad'
    1 'Si no está saltando y no hay nada debajo hacemos que caiga'
    10170 'if pa=0 and t5<>32 then py=py+pv
    1 'Si está saltando y el tile no es suelo le hacemos que cauga'
    10175 if t5=32 and pa=2 then py=po:pw=0:pw=-pw:pa=0
    1 'Si está saltando y hay suelo debajo paramos el salto y activamos la interrupción de la barra espaciadora'
    10180 'if pa=1 and t5 = 32 then pa=0:strig(0) on
    10190 'if pa=1 and t1 = 32 then py=py-pv

  

10195 return


1 'render player'
    10200 put sprite pp,(px,py),,ps
10290 return



