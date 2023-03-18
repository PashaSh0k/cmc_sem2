include console.inc
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_8 (блок_1)'
    inchar AL           ; input symbol
    sub AL, '0'
    movsx EBX, AL
L:  inchar AL
    cmp AL, '.'
    je fin
    cmp AL, '+'
    je plus
    inchar AL
    sub AL, '0'
    movsx ECX, AL
    sub EBX, ECX
    jmp L
    
plus:   inchar AL
        sub AL, '0'
        movsx ECX, AL
        add EBX, ECX
        jmp L

fin: outintln EBX
    
    pause 'Press any key to exit'
    exit
end Start
