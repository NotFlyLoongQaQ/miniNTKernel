void drawLine(int startX,int startY,int overX){
    asm("mov cx," + (char *)startX);
    asm("mov bx," + (char *)overX);
    asm("mov dx," + (char *)startY)
    asm("mov al 1100b");
    asm("mov ah,0ch");
    asm("int cx");
    asm("cmp cx,bx");
    asm("int 10h");
}

