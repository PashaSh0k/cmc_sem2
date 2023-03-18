include console.inc
.data
    n db 10 dup(?), 0
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_5 (блок_2) "Беззнаковое 16-е число"'
    inint EAX, 'input: '
    mov EBX, 16
    mov ECX, 8
    cmp EAX, 0
    jne L
    outint EAX
L:  
    sub EDX, EDX
    div EBX
    cmp EDX, 9
    jA lit
    add EDX, '0'
    jmp move
lit:
    add EDX, 'A'
    sub EDX, 10
move:
    mov n[ECX], DL
    loop L
    
fin:
    lea ESI, n
    inc ECX
    add ESI, ECX
    outstrln ESI
temp:   
    newline
    pause 'Press any key to exit'
    exit
end Start
