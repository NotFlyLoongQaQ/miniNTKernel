[BITS 32]
global io_hlt
global clear

clear:
    ; 清屏
    mov ax, 03h
    int 10h
    RET

io_hlt:
    HLT
    RET