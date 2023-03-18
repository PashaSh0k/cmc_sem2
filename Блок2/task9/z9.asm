include console.inc
.data
    N equ 4
    M equ 6
    A dd N dup(M dup(?))
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_9 (блок_2) "Минимальный элемент матрицы"'
    inint A
    mov EDI, A              ; min
    mov ESI, 1              ; kol-vo
    mov ECX, N*M
    sub ECX, 1
    mov EBX, 4
L:  
    inint A[EBX]
    mov EAX, A[EBX]
    cmp EAX, EDI
    jne L2
    inc ESI
    jmp L1
L2: jG L1
    mov EDI, EAX
    mov ESI, 1
L1: add EBX, 4
    loop L
    
    outstr 'Минимальный элемент:'
    outint EDI
    outstr ', входит '
    outint ESI
    outstrln ' раз.'
    outstr 'Индексы его вхождений:'
    
    sub EDX, EDX
    mov EBX, 0      ;stb
    mov ECX, 0      ;str
    mov EAX, 4*M
    mul ECX
    
L7: cmp A[4*EBX+EAX], EDI
    jne L3
    outstr ' ['
    add ECX, 1
    outint ECX
    sub ECX, 1
    outstr ','
    add EBX, 1
    outint EBX
    sub EBX, 1
    outstr '] '
L3: inc EBX
    cmp EBX, M
    jne L7
    mov EBX, 0
    inc ECX
    sub EDX, EDX
    mov EAX, 4*M
    mul ECX
    cmp ECX, N
    jne L7
    
    newline
    pause 'Press any key to exit'
    exit
end Start
