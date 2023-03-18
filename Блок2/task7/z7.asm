include console.inc
.data
    N equ 30
    X dd N dup(?)
    K dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_7 (блок_2) "сортировка обменом (метод пузырька)"'
    inint K, 'input dimension: '
    mov ECX, K
    mov EBX, 0
inp:
    inint X[4*EBX]
    inc EBX
    loop inp
    
    mov ECX, K
    sub ECX, 1
cycle:
    mov EDX, ECX
    mov EBX, 0
L:  mov EAX, X[4*EBX]
    cmp EAX, X[4*EBX+4]
    jb L1
    xchg EAX, X[4*EBX+4]
    mov X[4*EBX], EAX
L1: inc EBX
    dec EDX
    cmp EDX, 0
    jne L
    loop cycle
    
    outstr 'rez: '
    mov ECX, K
    mov EBX, 0
outp:
    outint X[4*EBX]
    outstr ' '
    inc EBX
    loop outp

    pause 'Press any key to exit'
    exit
end Start
