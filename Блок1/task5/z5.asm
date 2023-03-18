include console.inc
.const

.data
    N dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_5 (блок_1) “ Произведение старшей и младшей десятичных цифр ”'
    inint N,'Enter the number: '
    mov EAX, N
    mov ESI, 10
    cmp EAX, ESI
    jb one;
    
    sub EDX, EDX
    div ESI
    mov EBX, EDX        ; last
    
L:  cmp EAX, ESI        ; < 10?
    jb F                ; first
    sub EDX, EDX
    div ESI
    jmp L
    
one:    mul EAX
        jmp fin

F:  mul EBX

fin:    outintln EAX

    pause 'Press any key to exit'
    exit
end Start
