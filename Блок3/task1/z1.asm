include console.inc
.data
    N dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_1 (блок_3) "Алгебраическая сумма"'
L:  sub EAX, EAX
    inchar AL
    cmp AL, '.'
    je fin
    cmp AL, '+'
    jne L2
    push EAX
L2: cmp AL, '-'
    jne L3
    push EAX
L3: cmp AL, '0'
    jae L4
    jmp L6
L4: cmp AL, '9'
    jbe L5
    jmp L6
L5: sub EAX, '0'
    push EAX
L6: cmp AL, ')'
    jne L
    pop EBX
    pop ECX
    pop EDX
    cmp ECX, '+'
    jne L7
    add EDX, EBX
    jmp L8
L7: sub EDX, EBX  
L8: push EDX
    jmp L
    
fin:pop EAX
    outintln EAX

    pause 'Press any key to exit'
    exit
end Start
