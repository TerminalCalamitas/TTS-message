org 0x7c00

boot:
    mov bh, message ; our message
    mov ah, 0x0e ; bios command to print
.loop:
    ; bh now holds pointer to the message
    mov al, [bh] ; we have to dereference this first (i forgot, omegalul)
    cmp al, 0 ; if it is null we have reached the end
    je halt
    int 0x10 
    add bh, 1 ; next byte
    jmp .loop

halt:
    hlt         ; Stop

message:
    db "Hey Doug, Im worried that our friendship is only parasocial, can you acknowledge this message so that it isnt anymore?", 0

times 510-($-$$) db 0
dw 0xAA55
