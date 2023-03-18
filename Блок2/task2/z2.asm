include console.inc
.data
    z2 db 'неуд',0
    z3 db 'удовл',0
    z4 db 'хорошо',0
    z5 db 'отлично',0
    adr dd z2,z3,z4,z5;
    N dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_2 (блок_2) "Зачёт с оценкой"'
    inint N, 'input: '
    mov EAX, N
    sub EAX, 2
    mov EAX, adr[4*EAX]
    outstrln EAX
    
fin:
    newline
    pause 'Press any key to exit'
    exit
end Start
