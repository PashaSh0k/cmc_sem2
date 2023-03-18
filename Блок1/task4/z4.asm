include console.inc
.const

.data
    P dd ?
    Q dd ?
.code
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_4 (блок_1) "Дробь P/Q"'
    inint P,'Enter the 1st number: '
    inint Q,'Enter the 2nd number: '
    mov EAX, P      ; EAX := P
    mov EBX, Q      ; EBX := Q
    sub EDX, EDX    ; EDX := 0
    div EBX         ; EAX/EBX --> div in EAX, mod in EDX
    outword EAX     ; out div(p/q)
    outchar '.'     ; out '.'
    mov ECX, 5      ; ECX := 5
    mov ESI, 10
    
L:  mov EAX, EDX    ; EAX := EDX
    mul ESI         ; EAX := 10*EAX
    div EBX         ; EAX/EBX --> div in EAX, mod in EDX
    outint EAX
    loop L

    newline
    pause 'Press any key to exit'
    exit
end Start
