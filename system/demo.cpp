#include <picture/picturecore.h>
#include <stdc++.h>
#include <std.h>
using namespace std;
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
int main(){
    initer(); // 初始化显示模式
    drawLine(10,100,10); // 绘制仿3D长方体
    drawLine(10,200,10);
    drawLine(20,100,10);
    drawLine(20,200,10);
    drawLine(10,100,20);
    drawLine(10,200,20);
    return 0;
}