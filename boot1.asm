[org 0x7C00] ; Points the assembler to the memory address where this code will be stored.

mov ah, 0x0E ; Sets BIOS to TTY mode
mov al, 'H'  ; Stores the H character in the al register.
int 0x10     ; BIOS video interrupt signal

times 510-($-$$) db 0 ; Dynamically fills in null bytes to make the binary always exactly 512 bytes.

loop:
    jmp loop ; Changes the CPU's Instruction Pointer (IP) to the memory address of 'loop' constantly (infinite loop), this stops the IP from overflowing outside of the bootloader's 512 bytes, which would evenutally cause a crash.

dw 0xAA55 ; The BIOS' 'bootable disk' signal. During the boot process, the BIOS looks for this code at the end of the binary. 