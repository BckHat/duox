# duox
Basic Operative System in C

**************************************************************************
		       (c) Intersched Corporation
**************************************************************************

Solo compiladores compatibles con las distribuciones basadas en Debian.
Programas: xorriso, gcc, grub, qemu-system ó virtualbox.

Compilación:
[c file]: gcc -c <file> -o <objet file>
[asm file (gas)]: as <file> -o <object file>
[asm file (nasm)]: nasm -f elf32 <file> -o <object file>

Si no lo desea compilar de manera manual, utilize la herramienta MAKEFILE para hacer automáticamente.

[bin file]: gcc -o <bin file or ELF file> <kernel (assembly) file> <main (language c) file> <headers files> -nostdlib -ffreestanding -lgcc -T <ld file>
[grub]: grub-mkrescue <project file> -o <ISO name file>

Correr en virtualbox o qemu-system.

#TODO: Herson Castillo - duox kernel - 20161129
