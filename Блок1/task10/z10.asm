include console.inc
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_10 (блок_1)'
    mov ECX, 10
    mov EAX, 0
    outstr '      |  '
L:  outint EAX,3
    outstr '  '
    inc EAX
    loop L
    newline
    outstr '---------------------------------------------------------'
    newline
    sub EAX, EAX
S:  mov ECX, 10
    outint EAX,3
    outstr '   |  '
    sub EBX, EBX
vn: outint EBX,3
    outstr '  '
    add EBX, EAX
    loop vn
    newline
    add EAX, 1
    cmp EAX, 10
    jne S

    pause 'Press any key to exit'
    exit
end Start
