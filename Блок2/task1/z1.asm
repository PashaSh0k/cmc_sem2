include console.inc
.data
    lat db 'Z'-'A'+1 dup(0)
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_1 (блок_2) "Первые вхождения"'
    mov EAX, 0
    outstr 'input: '
L1: inchar AL
    cmp AL,'.'
    jE fin
    cmp AL,'A'
    jB L1
    cmp AL,'Z'
    jA L1
    cmp lat[EAX-'A'],0
    jne L1
    mov lat[EAX-'A'],1
    outchar AL
    jmp L1
    
fin:newline
    pause 'Press any key to exit'
    exit
end Start
