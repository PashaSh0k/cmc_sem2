include console.inc
.data
    N equ 5
    X db ?
    Y dw ?
    Z dd ?
    W dq ?
.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_1 (����_1)'
    
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
