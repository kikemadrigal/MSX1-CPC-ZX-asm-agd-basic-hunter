@echo off
rem creamos los recursos
tools\sjasm\sjasm asm\sprites.asm
tools\sjasm\sjasm asm\scolor.asm
tools\sjasm\sjasm asm\level0.asm
tools\sjasm\sjasm asm\level1.asm
rem Copiamos los recursos
move sprites.bin dsk
move scolor.bin dsk
move level0.bin dsk
move level1.bin dsk

copy src\autoexec.bas dsk
copy assets\tileset.s05 dsk
rem Creamos el main uniendo los archivos y quitándo los espacios
copy "src\main.bas"+"src\player.bas"+"src\shot.bas"+"src\enemy.bas"+"src\map.bas" "dsk\temp.bas"
java -jar tools\deletecomments1.4\deletecomments1.4.jar dsk\temp.bas dsk\main.bas
rem abrimos el emulador con el dsk
tools\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska dsk