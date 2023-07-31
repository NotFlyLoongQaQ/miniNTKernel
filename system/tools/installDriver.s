SECTION header vstart=0                     ;定义用户程序头部段 
    program_length  dd program_end          ;程序总长度[0x00]
    
    ;用户程序入口点
    code_entry      dw start                ;偏移地址[0x04]
                    dd section.code_1.start ;段地址[0x06] 
    
    realloc_tbl_len dw (header_end-code_1_segment)/4
                                            ;段重定位表项个数[0x0a]
    
    ;段重定位表           
    code_1_segment  dd section.code_1.start ;[0x0c]
    code_2_segment  dd section.code_2.start ;[0x10]
    data_1_segment  dd section.data_1.start ;[0x14]
    data_2_segment  dd section.data_2.start ;[0x18]
    stack_segment   dd section.stack.start  ;[0x1c]
    
    header_end:                

DATA SEGMENT
MESS1 DB 'INPUT: ',13,10,'$'
NEWLINEDB 13, 10, '$'
MESS2 DB 'Please Copy Your File To ./system/net/driver,Your File name:',13,10,'$'
BUF DB 20
BUF1 DB ?
BUF2 DB 20 DUP(?)
COUNT EQU $-BUF
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
MOV DS,AX
MOV SI, 0
LEA DX,MESS1
MOV AH,09H
INT 21H
MOV DX,OFFSET BUF
MOV AH,0AH
INT 21H
LEA DX, NEWLINE ;专门用来换行
MOV AH, 9
INT 21H
MOV CL, BUF1
MOV CH, 0 ;BUF1单元中存放的是有效输入字符数
LOOP1:MOV AL,BUF2[SI] ;从BUF2单元开始才是有效字符
CMP AL,61H
JB NEXT ;JBE改为JB
CMP AL,7AH
JA NEXT ;JGE改为JA
SUB AL,20H
MOV BUF2[SI],AL ;从BUF2单元开始才是有效字符
NEXT: INC SI
LOOP LOOP1
MOV BUF2[SI], '$' ;循环结束，把当前的字符修改为'$'
LEA DX,MESS2
MOV AH,09H
INT 21H
MOV DX,OFFSET BUF2 ;从BUF2单元开始才是有效字符
MOV AH,09H
INT 21H
MOV AH,4CH
INT 21H
CODE ENDS
END START