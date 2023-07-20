out dx,al
mov dx,0x1f3
mov al,0x60
out dx,al
inc dx
xor al,al
out dx,al
inc dx
out dx,al
inc dx
mov al,0xe0
out dx,al
mov al,0x20
mov dx,0x1f7
out dx,al

waits:
    in al,dx
    and al,1000_1000B    ;保留第3位和第7位
    cmp 0000_1000B    ;第7位为0第3位为1才可以进行读取
    jne waits        ;不相等就循环等待
    mov dx,0x1f0
    mov cx,256    ;读取一个扇区，512字节，即256字
    xor bx,bx
read_word
    in ax,dx
    mov [bx],ax
    add bx,2
    loop read_word
    ;检查用户程序是否读取完整
    xor bx,bx
    mov ax,[bx]
    mov dx,[bx+2]
    mov bx,512
    div bx
    
    cmp dx,0
    jne cmp_ax
    dec ax
    
cmp_ax:
    cmp ax,0
    je  redirect_entry    ;跳转到重定位
;读取剩余扇区
    push ds
    
    mov cx,ax
    mov si,start_sector    ;start_sector是定义的一个常数，这里等于100（用户程序在100扇区开始）
    
read_rest:
    mov ax,ds
    add ax,0x20
    mov ds,ax
    inc si
    call read_disk
    loop read_rest
    
    pop ds
;重定位用户程序
;重定位用户入口点的段地址
redirect_entry:
    mov ax,[0x06]    ;读取头部入口点地址信息
    mov dx,[0x08]
    call calc_seg_base
    mov [0x06],ax
    
;重定位其他段的段地址
    mov cx,[0x0a]
    mov bx,0x0c
redirect_other_seg:
    mov ax,[bx]
    mov dx,[bx+2]
    call calc_seg_base
    mov [bx],ax
    add bx,4
    loop redirect_other_seg
;过程计算段地址
;已知dx:ax物理地址，求出段地址并存放在ax中返回    
calc_seg_base:
    push dx
    
    add ax,[cs:usr_app_base]
    adc dx,[cs:usr_app_base+2]
    shr ax,4
    ror dx,4
    and dx,0xf000
    or  ax,dx
    
    pop dx
    
    ret
jmp far [0x04]
