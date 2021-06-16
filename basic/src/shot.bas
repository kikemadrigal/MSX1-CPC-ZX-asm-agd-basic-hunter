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
11390 return