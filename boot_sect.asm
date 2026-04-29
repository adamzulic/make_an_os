;
; A simple boot sector program that loops forever.
; Written in x86 NASM assembly.
;

loop:                 ; Define a label, "loop", that will allow
                      ; us to jump back to it, forever.

    jmp loop          ; Use a simple CPU instruction that jumps
                      ; to a new memory address to continue execution.
                      ; In this case, jump to the address of the current 
                      ; instruction.

times 510-($-$$) db 0 ; When compiled, the program must fit into 512 bytes,
                      ; with the last two bytes being the magic number,
                      ; so here, tell the assembly compiler to pad out the
                      ; program with enough zero bytes (db 0) to bring it to the
                      ; 510th byte.

dw 0xAA55             ; Last two bytes (one word) form the magic number.
                      ; so BIOS knows this is a boot sector.