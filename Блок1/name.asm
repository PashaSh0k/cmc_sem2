include console.inc
.data
    N dd ?
.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_1 (����_1)'
    inint N,'Enter the number: '
    mov EAX, N
    sub EDX, EDX
    mov EBX, 7
    div EBX
    mul EBX
    cmp EDX, 0
    je outp
    cmp EDX, 3
    jA right
    sub EAX, EDX

right: add EAX, EDX

outp: outintln EAX

    pause 'Press any key to exit'
    exit
end Start
