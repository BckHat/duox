#********************************************************************
#		      (c) Intersched Coporation.		    *
#********************************************************************

CHANGE = -o
GCC = gcc
CHAOS = CHAOS.bin
LINKER = linker.ld
FUNCS = -nostdlib -ffreestanding -lgcc -fPIC
T = -T
EXCALIBUR = systemcompilation iso extra

all: $(EXCALIBUR)
	@clear

iso:
	@echo "Generando Imagen ISO..."
	@(cd ../; mkdir Chronnos_chaosx86; cd Chronnos_chaosx86; mkdir boot; mkdir bin; cd boot; mkdir grub; cd ../bin; mkdir chaOS; cd ../../; cd duox/boot/grub; cp grub.cfg ../../../Chronnos_chaosx86/boot/grub; cd ../../bin/chaOS; cp CHAOS.bin ../../../Chronnos_chaosx86/bin/chaOS; cd ../../../; grub-mkrescue -o duox86.iso Chronnos_chaosx86; rm -fr Chronnos_chaosx86)

run:
	@echo "Iniciando sistema..."
	@(cd ../; qemu-system-i386 duox86.iso)

help:
	@echo ""
	@echo "Compilación del duox kernel - Herson Castillo."
	@echo ""
	@echo "Para realizar la compilación del Makefile tiene que ingresar solamente 'make' para ejecutar el compilador y realizar los cambios necesarios; si desea hacerlo manualmente debe ingresar 'make' [COMANDO], [COMANDO] dependera de las siguientes instrucciones:"
	@echo ""
	@echo " * systemcompilation   >   Compila los scripts basicos."
	@echo " * iso                 >   Genera una imagen ISO del kernel."
	@echo " * run                 >   Ejecuta el sistema."
	@echo ""
	@echo "Makefile - v5.9.10"
	@echo ""

systemcompilation:
	@echo "Compilando kernel..."
	@(cd kernel; as kernel.s -o kernel_ini.o; gcc -c main.c -o main.o)
	@echo "Compilando libreria..."
	@$(GCC) $(CHANGE) $(CHAOS) $(FUNCS) kernel/*o include/*h $(T)kernel/$(LINKER)
	@echo "Compilando sistema sperativo..."
	@mv $(CHAOS) bin/chaOS/
	@echo "Compilacion terminada exitosamente."

extra:
	@(echo "Iniciando limpieza..."; echo "Objetivo: [~]..."; rm *~; cd boot/grub; rm *~; cd ../../; cd kernel/; rm *~; rm *o; cd ../; cd include/; rm *~; cd ../; cd tools/;  rm *o && rm *~; echo "Limpieza completada.";)



#TODO: Sistema Operativo duox - 20160625

