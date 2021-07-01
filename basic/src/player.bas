1 '-----------------------------------'
1  '       PLAYER 10000-10999
1 '-----------------------------------'

1 'inicialización player'
    1 'pv=velocidad horizontal
    1 'pw=velocidad vertical'
    1 'po=player y position old'
    1 'pd= player direction, 1 up, 3 right, 5 down, 7 left'
    1 'pj=player jump, salta activdo'
    1 'pl=player life o vida'
    1 'pr=player record, puntuación'
    1 'pb=bloques cogidos por el player'
    1 'pg=player gungs, balas, disparos que le quedan'
    10000 px=3*8:py=18*8:pv=8:pw=8:po=py:pd=3:pj=0:pl=3:pr=0:pb=0:pg=100:pc=11
    1 'para ver el sprite camnando a la derecha, izquierda, etc utilizaremos un array'
    1 'Sprite 0 camina a la dercha'
    1 'sprite 1 camina ala derecha moviéndose, no se porqué  pero si pongo dim p(6) no funciona, parece que es algo del nbasic'
    10010 p(0)=0:p(1)=1:p(2)=2:p(3)=3:p(4)=4:p(5)=5
    1 'Componente render: Plano 1(para el color) y 0 para el personaje, sprite del 0(para el color) y del 1 al 7 para el personaje'
    10020 pp=0:ps=0
10090 return


1 'Physics player'
    1 'Con esto vemos los tiles que tenemos alrededor

    10100 gx=px:gy=py:gosub 13600

    1 'Rutina salto: si esta saltando le restamos a la posición y la velocidad vertical
    10110 if pj=1 then py=py-pw
    1 'Si tenemos en la cabeza un bloque sólido bajamos'
    10111 if t1=tw then pj=2
    1 '-48 es la distancia máxima a la que puede saltar de la posición original (po), con pj=2 le decimos que está cayendo'
    10120 if pj=1 and py<po-48 then pj=2
    1 'Si cuando estemos cayendo hay un bloque sólido se termina el salto'
    10135 if t5=tw and pj=2 then pj=0
    1 'Rutina caida
    10136 if pj=2 then py=py+pw
   

    1 'Contorno, chqueamos que no se haya salido por la gravedad'
    10140 if py>170 then py=170
    10150 if py<=0 then py=0

    1 'Chequeo escalera
    1 'Si estamos sobre una escalera subimos: la definición de esto está en el input system'
   
    1 'Chequeo bloques collectables'
    1 'vamos a coprobar los tiles de alrededor y sobre el que estamos'
    1 'Con pb-1 le decimos que queda un bloque menos por recoger'
    10168 if t0=tc then copy (8,40)-(8+8,39+8),1 to (px,py+8),0:m(ty+1,tx)=-1:beep:pb=pb-1:gosub 8000

    1 'Gravedad'
    1 'Si no está saltando y no hay debajo un bloque sólido hacemos que caiga'
    10170 if pj=0 and t5<>tw then py=py+pv

10195 return


1 'render player'
    10200 'call turbo on (pp, px,py,ps)
    10201 put sprite pp,(px,py),,ps
    10202 'call turbo off
10290 return

1 ' Rutina player dead'
    1 ' 8000 es el HUD'
    1 ' 14100 es la rutina cuando se termina el juego
    10300 if gc=0 then sprite off
    10310 if pl<=0 then gosub 14100 else beep:pl=pl-1: gosub 8000
    10320 px=3*8:py=18*8:put sprite pp,(px,py),,ps
    10330 if gc=0 then sprite on
10390 return

 




