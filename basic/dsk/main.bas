0defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0):defusr2=&H90:a=usr2(0)
5defusr3=&H41:defusr4=&H44
10bload"nbasic.bin",r
20open"grp:"as#1:definta-z
30 bload"sprites.bin",s:print #1,"Sprites leidos"
40 bload"scolor.bin",s:print #1,"colores sprites leidos"
50 bload"TILESET.S05",s,32768:print #1,"tileset leido"
70 print #1,"Cargando mapa":gosub 13000
80gx=0:gy=0:time=0:hr=0:hs=200:ha=0
100gosub10000
105gosub11000
106gosub12000
110strig(0)on:onstriggosub11100
130'bload"music.bin":defusr5=&hC000:b=usr5(0):defusr6=&hC009:defusr7=&hC01A:b=usr7(0):defusr8=&hC013
140gosub14000
2000'nada'
2005gosub3500
2010gosub10500
2020gosub12700
2030gosub10600
2040gosub11300
2050ifmc=1thencls:gosub13100:gosub13300:ma=ma+1:mc=0:gosub8000
2060ifpb=0thenmc=1:ifma>1thenma=0
2070ha=time/60:ifho<>hathengosub8100
2080'gosub9000
2090goto2000
2500onstick(0)gosub2600,2660,2700,2500,2800,2500,2860,2900
2599return
2600ifpj=0thenpo=py:pj=1:pd=3
2650return
2660ifpj=0thenpo=py:pj=1
2670ift3<>twthenpx=px+pv:pd=3
2680swapp(0),p(1):ps=p(1)
2690return
2700ift3<>twthenpx=px+pv:pd=3
2710swapp(0),p(1):ps=p(1)
2720return
2800'ift5=69thenpy=py+pv
2850return
2860ift7<>twthenpx=px-pv:pd=7
2870swapp(2),p(3):ps=p(3)
2890return
2900ifpj=0thenpo=py:pj=1
2910ift7<>twthenpx=px-pv:pd=7
2920swapp(2),p(3):ps=p(3)
2950return
3500onstick(0)goto3600,3660,3700,3500,3800,3500,3860,3900
3510goto3960
3600ifpj=0thenpo=py:pd=3:pj=1
3610goto3960
3660ifpj=0thenpo=py:pj=1
3670ift3<>twthenpx=px+pv:pd=3
3680swapp(0),p(1):ps=p(1)
3690goto3960
3700ift3<>twthenpx=px+pv:pd=3
3710swapp(0),p(1):ps=p(1)
3720goto3960
3800'ift5=69thenpy=py+pv
3850goto3960
3860ift7<>twthenpx=px-pv:pd=7
3870swapp(2),p(3):ps=p(3)
3890goto3960
3900ifpj=0thenpo=py:pj=1
3910ift7<>twthenpx=px-pv:pd=7
3920swapp(2),p(3):ps=p(3)
3960goto2010
4300a=usr2(0)
4310ifre=1thenPLAY"O5L8V4M8000AADFG2AAAAr60GEFDCDGR8A2A2A8","o1v4cr8o2cr8o1v6cr8o2v4cr8o1cr8o2v6cr8"
4350ifre=5thenplay"l10o4v4gc"
4360ifre=6thenplay"t250o5v12dv9e"
4370ifre=7thenplay"O5L8V4M8000AADFG2AAAA"
4380ifre=8thenPLAY"S1M2000T150O7C32"
4390ifre=9thenPLAY"o2l64t255v10m6500c"
4400ifre=10thensound6,5:sound8,16:sound12,6:sound13,9
4420return
8000preset(0,184):print#1,"Score:"pr"Vidas:"pl"cogidas:"pb
8010preset(0,196):print#1,"Level:"ma"balas:"pg"libre:"fre(0)
8020return
8100hr=hs-ha
8110ifhr<=0thenha=0:time=0:hs=200
8120ho=ha:preset(184,204):print#1,hr
8130return
9000'nada'
9090return
14000cls:preset(10,30):print#1,"Thehunter"
    14050 preset (10,160): print #1, "Cursores para mover, pulsa una tecla para continuar"
    14060 preset (10,180): print #1, "libre: "fre(0)
14070'b=usr6(0)
14080ifinkey$=""thengoto14070
14085'b=usr8(0)
14090return
14100en=0
14110cls:preset(10,30):print#1,"Gameover"
14120py=212
14130mc=1:ma=0
14140fori=0to1000:nexti
14150goto130
14190return
20000en=0
20010'gosub12500:ex(en-1)=14*8:ey(en-1)=9*8
20030gosub12500:ex(en-1)=14*8:ey(en-1)=14*8:es(en-1)=17
20040pb=8
20050gosub10100
20090return
20100en=0
20140pb=6
20150px=3*8:py=18*8
20190return
10000px=3*8:py=18*8:pv=8:pw=8:po=py:pd=3:pj=0:pl=3:pr=0:pb=0:pg=100:pc=11
10010p(0)=0:p(1)=1:p(2)=2:p(3)=3:p(4)=4:p(5)=5
10020pp=0:ps=0
10090return
10100px=3*8:py=18*8
10110'fori=1to16:reada:sc0$=sc0$+chr$(a):nexti
10120'colorsprite$(0)=sc0$
10130'putspritepp,(px,py),,ps
10140'data&h0C,&h0A,&h09,&h09,&h09,&h09,&h04,&h04
10150'data&h04,&h04,&h04,&h04,&h04,&h04,&h08,&h08
10190return
10200ifpl<=0thengosub14100elsebeep:pl=pl-1:gosub8000
10220gosub10100:putspritepp,(px,py),,ps
10290return
10500gx=px:gy=py
10502gosub13600
10510ifpj=1thenpy=py-pw
10511ift1=twthenpj=2
10520ifpj=1andpy<po-48thenpj=2
10535ift5=twandpj=2thenpj=0
10536ifpj=2thenpy=py+pw
10540ifpy>160thenpy=160
10550ifpy<=0thenpy=0:pj=2
10551ifpx>248thenpx=248
10552ifpx<=0thenpx=0
10568ift0=tcthencopy(8,40)-(8+8,39+8),1to(px,py+8),0:m(ty+1,tx)=-1:beep:pb=pb-1:gosub8000
10569ift0=tdthen10200
10570ifpj=0andt5<>twthenpy=py+pv
10595return
10600'callturboon(pp,px,py,ps)
10601putspritepp,(px,py),,ps
10602'callturbooff
10690return
11000dn=0:'dd=0:dm=3
11000dx=0:dy=0:dv=8:dd=0:ds=12:dp=0:dc=11
11060return
11100ifdn>0thengosub11200
11120dy=py
11125dd=pd:ifdd=3thendx=px+16elsedx=px
11130dv=8
11140dp=2+dn
11150dn=dn+1
11170re=10:gosub4300
11180return
11200dn=dn-1
11210putspritedp,(0,212),0,ds
11290return
11300ifdn<=0thenreturn
11320ifdd=3thendx=dx+dvelsedx=dx-dv
11330putspritedp,(dx,dy),dc,ds
11340ifdx>=256-16thengosub11200
11350ifdx<0thengosub11200
11390return
12000em=3
12010en=0
12020DIMex(em),ey(em),ev(em),ew(em),ed(em),es(em),ep(em),ec(em),et(em),ee(em),ef(em)
12030return
12500ifen>5thenreturn
12530ev(en)=8:ew(en)=8
12540ed(en)=3
12550es(en)=13
12560ep(en)=10+en
12570ec(en)=6
12580en=en+1
12590return
12600en=en-1
12610ex(er)=0:ey(er)=212
12620putspriteep(er),(ex(er),ey(er)),0,es(er)
12630ex(er)=ex(en):ey(er)=ey(en):ev(er)=ev(en):es(er)=es(en):ep(er)=ep(en)
12640'putspriteep(ed),(-16,0),ec(ed),es(ed)
12650'en=en-1
12660return
12700ifen<=0thenreturn
12710fori=0toen-1
12720ifed(i)=3thengx=ex(i)+8elseifed(i)=7thengx=ex(i)-8
12730gy=ey(i):gosub13600
12740ift5<>twthenev(i)=-ev(i):ifed(i)=7thened(i)=3elseifed(i)=3thened(i)=7
12750ifex(i)>256-40thenex(i)=ex(i)-ev(i):ifex(i)<0thenex(i)=ex(i)-ev(i)
12755ex(i)=ex(i)+ev(i)
12756ef(i)=ef(i)+1:ifef(i)>1thenef(i)=0
12760ifex(i)<px+16andex(i)+16>pxandey(i)<py+16and16+ey(i)>pythengosub10200
12770ifex(i)<dx+16andex(i)+16>dxandey(i)<dy+16and16+ey(i)>dythener=i:gosub12600:gosub11200
12780ifed(i)=7thenes(i)=es(i)+2
12785ifef(i)mod2=0thenes(i)=es(i)+1
12790putspriteep(i),(ex(i),ey(i)),ec(i),es(i)
12795ifef(i)mod2=0thenes(i)=es(i)-1
12796ifed(i)=7thenes(i)=es(i)-2
12800nexti
12810return
13000dimm(22,31):ma=0:mc=1
13005te=255:tw=32:tl=0:tf=0:td=3:tc=67
13010ty=19:tx=3:t0=m(ty+1,tx):t1=161:t3=m(ty,tx+1):t5=m(ty+2,tx):t7=m(ty,tx-1)
13090return
    13100 'print #1, "cargando mapa"
13110ifma=0thenbload"level0.bin",r:gosub20000
13111ifma=1thenbload"level1.bin",r:gosub20100
13115callturboon(m())
13120md=&hd001
13130forf=0to22
13140forc=0to31
13150tn=peek(md):md=md+1
13160m(f,c)=tn
13170nextc
13180nextf
13190callturbooff
13195return
13300a=usr3(0)
13301callturboon(m())
13310forf=0to22
13360forc=0to31
13370tn=m(f,c)
13380iftn>=0andtn<32thencopy(tn*8,0*8)-((tn*8)+8,(0*8)+8),1to(c*8,f*8),0,tpset
13390iftn>=32andtn<64thencopy((tn-32)*8,1*8)-(((tn-32)*8)+8,(1*8)+8),1to(c*8,f*8),0,tpset
13400iftn>=64andtn<96thencopy((tn-64)*8,2*8)-(((tn-64)*8)+8,(2*8)+8),1to(c*8,f*8),0,tpset
13410iftn>=96andtn<128thencopy((tn-96)*8,3*8)-(((tn-96)*8)+8,(3*8)+8),1to(c*8,f*8),0,tpset
13420iftn>=128andtn<160thencopy((tn-128)*8,4*8)-(((tn-128)*8)+8,(4*8)+8),1to(c*8,f*8),0,tpset
13430iftn>=160andtn<192thencopy((tn-160)*8,5*8)-(((tn-160)*8)+8,(5*8)+8),1to(c*8,f*8),0,tpset
13440iftn>=192andtn<224thencopy((tn-192)*8,6*8)-(((tn-192)*8)+8,(6*8)+8),1to(c*8,f*8),0,tpset
13450iftn>=224andtn<256thencopy((tn-224)*8,7*8)-(((tn-224)*8)+8,(7*8)+8),1to(c*8,f*8),0,tpset
13510nextc
13520nextf
13540a=usr4(0):
13541callturbooff
13570return
13600'ifgx<8orgx>256-16orgy<0orgy>192-16thenreturn
13610tx=gx/8:ty=gy/8
13620iftx<0ortx>31orty<0orty>22thenreturn
13630iftx<32thent0=m(ty+1,tx)
13640ifty>0thent1=m(ty-1,tx)
13650iftx<31thent3=m(ty,tx+1)
13660ifty<20thent5=m(ty+2,tx)
13670iftx>0thent7=m(ty,tx-1)
13690return
