1 '-----------------------------------'
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
12910 return