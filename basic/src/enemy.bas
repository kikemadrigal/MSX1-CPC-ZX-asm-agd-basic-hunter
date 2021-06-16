1 '-----------------------------------'
1  '       Enemy 12000-12999
1 '-----------------------------------'

1 'Init
1 'Recuerda que hemos reservado el espacio para X enemigos en el loader'
1 'en=numero de enemigo'
1 'Componente de posicion'
    1 'ex=coordenada x, ey=coordenada y', e1=coordenada previa x, e2=coordenada previa y
1 'Componente de fisica'
    1 'ev=velocidad enemigo eje x, el=velocidad eje y'
1 'Componente de render'
    1 'es=enemigo sprite, ep=enemigo plano'
1 'Componente RPG'
    1 'ee=enemigo energia '
    12400 en=0
12410 return

1 ' Crear enemigo'
    12500 if en>5 then return
    12510 ex(en)=256:ey(en)=rnd(1)*140
    12520 if ey(en)<64 then goto 11510
    12530 ev(en)=16:el(en)=16
    1 'Los enemigos son los sprites 7,8,9'
    12540 es(en)=8:ep(en)=7+en:ec(en)=rnd(1)*15
    12550 if ec(en)<2 then goto 11540
    12560 ee(en)=100
    12570 en=en+1
12580 return

1 ' Rutina eliminar enemigos'
    12600 en=en-1
    12610 ey(ed)=rnd(1)*140
    12620 if ey(ed)<64 then goto 11610
    12630 ec(ed)=rnd(1)*15
    12640 if ec(ed)<2 then goto 11630
    12650 put sprite ep(ed),(-16,0),ec(ed),es(ed)
12660 return

1 'Update enemigo'
    12700 if en<=0 then return
    12710 for i=0 to en-1
        1 ' A cada uno le restamos la velocidad'
        12720 ex(i)=ex(i)-ev(i)        
        12730 'nada'
        12770 put sprite ep(i),(ex(i),ey(i)),ec(ei),es(i)
        12780 'preset (0,150+i*10):print #1,"es: "es(i)", ep: "ep(i)", ex: "ex(i)
        12790 if ex(i)<=0 then ed=i:gosub 11600
    12800 next i
12810 return