1 '-----------------------------------'
1  '       Enemy 12000-12999
1 '-----------------------------------'

1 'Init
    1 'Definiendo el espacio para los arrays con los valores de los enemigos' 
    1 'em=enemigos maximos'
    1 'en=enemigo numero, variable utilizar para gestionar la creación y destrucción de enemigos'
    12000 em=3
    12010 en=0
    1 'ex=coordenada x, ey=coordenada y'
    1 'ev=velocidad enemigo eje x, ew=velocidad eje y'r'
    1 'ed=enemigo dirección'
    1 'es=enemigo sprite, ep=enemigo plano'
    1 'ee=enemigo energia '
    1 'et= define el tipo, si es un perro, un pinguino, un pájaro, etc
    1 'Perro sprites derecha 13 y 14, izquierda 15 y 16 '
    1 'Conejo derecha 17,18  i<quierda 19,20'
    1 'Tortuga derecha 21,22   izquierda 23,24'
    1 'Reservamos el espacio en RAM para 5 enemigos'
    12020 DIM ex(em),ey(em),ev(em),ew(em),ed(em),es(em),ep(em),ec(em),et(em),ee(em)
12030 return

1 ' Crear enemigo'
    12500 if en>5 then return
    12530 ev(en)=8:ew(en)=8
    12540 ed(en)=3
    12550 es(en)=13
    12560 ep(en)=10+en
    12570 ec(en)=6
    12580 en=en+1
12590 return
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
    12710 for i = 0 to en-1
        1 'Chequeo bloques collectables'
        1 'vamos a coprobar los tiles de alrededor y sobre el que estamos'
        12720 if ed(i)=3 then x=ex(i)+8: if ed(i)=7 then x=ex(i)-8
        12730 y=ey(i):gosub 13600
        1 'Si el tile en el que estamos no es sólido cambiamos la velocidad horizontal'
        12740 if t5<>tw then ev(i)=-ev(i)
        12750 ex(i)=ex(i)-ev(i):if ex(i)>256-40 then ex(i)=ex(i)-ev(i): if ex(i)<0 then ex(i)=ex(i)-ev(i)
      
        1 'Chequeamos la colisión con el player'
        1 'La rutina 10300 es cuando el player muere'
        12760  if ex(i) < px + 16 and ex(i) + 16 > px and ey(i) < py + 16 and 16 + ey(i) > py then gosub 10300
        1 'put sprite numero_plano, (coordenada),color, numero de sprite'
        12770 put sprite ep(i),(ex(i),ey(i)),ec(i),es(i)
    12800 next i
12810 return





