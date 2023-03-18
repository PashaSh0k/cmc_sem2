include console.inc
.data
    N equ 30
    X dd N dup(?)
    K dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_6 (блок_2) "сортировка выбором"'
    inint K, 'input dimension: '
    mov ECX, K
    mov EBX, 0
inp:
    inint X[4*EBX]
    inc EBX
    loop inp
    
    mov ECX, K
cycle:
    mov ESI, X              ; ESI:= max:=x[0]
    lea EDI, X              ; EDI:= adress max = [x[0]]
    mov EBX, 0
    push ECX
L:  cmp X[4*EBX], ESI
    jB L1
    mov ESI, X[4*EBX]
    lea EDI, X[4*EBX]
L1: inc EBX
    cmp EBX, ECX
    jne L
    pop ECX
    mov EAX, [EDI]
    xchg EAX, X[4*ECX-4]
    mov [EDI], EAX
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
