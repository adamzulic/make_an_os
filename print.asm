;
; Simple boot sectore that prints a message to the screen using a BIOS routine.
;

mov ah, 0x0e    ; int 10/sh = 0eh -> Scrolling teletype BIOS routine.

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

jmp $   ; jump to the current address forever.

times 510-($-$$) db 0   ; pad the boot sector out with zeroes

dw 0xaa55 ; Magic number so BIOS knows it's a boot sector.