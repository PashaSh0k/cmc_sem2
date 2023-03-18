include console.inc
.data
    N equ 5
    X db ?
    Y dw ?
    Z dd ?
    W dq ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_1 (блок_1)'
    
    div Y+N
    mov W-1,12345h
    mov AX,'AX'
    add Z+2, offset Z
    sbb X+N, Z-Y+N
    movzx EAX,-123
    jmp Z
    pause 'Press any key to exit'
    exit
end Start
