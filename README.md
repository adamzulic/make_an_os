Following the book by Nick Blundell:

***********************************************************************************************************************

                                                Writing a Simple Operating System -
                                                          from Scratch

***********************************************************************************************************************

or trying to..


File list (commands listed are appropriate for my system - e.g. use of qemu):

boot.bin - Written in hexadecimal using Hex Fiend. Begins with 0xE9, 0xFD, 0xFF (machine code instructions, defined by the CPU manufacturer, to perform an endless jump/infinite loop - holds the CPU's instruction pointer within the bootloader's address space so it doesn't start running uninitialised bytes in memory). Null 0x00 bytes are then placed in between to ensure that the file is exactly 512 bytes. The last two bytes are 0x55 and 0xAA, which is the 'magic number'. The BIOS is programmed to look for the magic number at the *end* of a disk image file, which signals that the binary is a bootable disk image. In the case of this binary, which doesn't do much except create an infinite loop, loading it will produce a blinking cursor - rather than an 'Operating System not found' message. 

Run using the command (for QEMU):

-----------------------------------------------------------------------------------------------------------------------
                                qemu-system-x86_64 -drive format=raw,file=boot.bin,if=floppy
-----------------------------------------------------------------------------------------------------------------------

boot_sect.asm - An x86 assembly code rendition of boot.bin. A more human readable type of machine code. Compiled to boot_sect.bin using the terminal command:

-----------------------------------------------------------------------------------------------------------------------
                                        nasm boot_sect.asm -f bin -o boot_sect.bin
-----------------------------------------------------------------------------------------------------------------------

boot_sect.bin - Disk image compilation of boot_sect.asm (using nasm command above). Raw bytes can be viewed in the terminal using the command:

-----------------------------------------------------------------------------------------------------------------------
                                                od -t x1 -A n boot_sect.bin
-----------------------------------------------------------------------------------------------------------------------

Outputs (* = omitted zeros for brevity):

-----------------------------------------------------------------------------------------------------------------------
                        ❯ od -t x1 -A n boot_sect.bin
                                eb  fe  00  00  00  00  00  00  00  00  00  00  00  00  00  00
                                00  00  00  00  00  00  00  00  00  00  00  00  00  00  00  00
                        *
                                00  00  00  00  00  00  00  00  00  00  00  00  00  00  55  aa
-----------------------------------------------------------------------------------------------------------------------

