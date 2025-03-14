org 0x7c00

boot:
    mov al, message ; our message
    mov ah, 0x0e ; bios command to print
    mov cl, 0 ; our counter
.loop:
    ; al holds pointer to the message
    cmp al, 0 ; if it is null we have reached the end
    je halt
    int 0x10 
    add al, 1 ; next byte
    jmp .loop

halt:
    hlt         ; Stop

message:
    db "Howdy!", 0

times 510-($-$$) db 0
dw 0xAA55
