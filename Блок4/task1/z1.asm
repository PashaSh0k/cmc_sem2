include console.inc
.const

.data
N equ 100
S db N dup (?)
.code
    ReadText proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        sub EAX, EAX
        mov ECX, dword ptr [EBP+8]
        outstr 'input: '
    @inp:
        inchar BL
        cmp BL, '.'
        je @fin
        inc EAX
        mov byte ptr [ECX], BL
        inc ECX
        jmp @inp
    @fin:
        pop ECX
        pop EBX
        pop EBP
        ret 4
    ReadText endp
    
    MaxLet proc
        push EBX
        mov EBP, ESP
        sub ESP, 28
        push EBX
        push ECX
        push ESI
        push EDX
        mov ECX, 28
        mov EBX, -28
    @L1: 
        mov byte ptr[EBP+EBX], 0
        inc EBX
        loop @L1
        mov EAX, dword ptr [EBP+8]                ; in EAX - point array
        mov ECX, dword ptr [EBP+12]               ; in ECX - length array
        mov ESI, 0
        mov EBX, EBP
        sub EBX, 28                     ; in EBX - start loc array
    @L2:
        cmp ESI, ECX
        je @ffin
        mov DL, byte ptr [EAX+ESI]      ; in DL array element
        sub DL, 'a'
        cmp DL, 26
        ja @LLL
        cmp DL, 0
        jb @LLL
        movzx EDX, DL
        add byte ptr [EBX][EDX], 1
    @LLL:
        inc ESI
        jmp @L2
    @ffin:
        sub ESI, ESI                    
        sub ECX, ECX                    ; max
    @L3:
        cmp byte ptr [EBX+ESI], CL
        jB @LB
        mov CL, byte ptr [EBX+ESI]
        mov EAX, ESI 
    @LB:
        inc ESI
        cmp ESI, 26
        je @fffin
        jmp @L3
    @fffin:
        add EAX, 'a'
        
        pop EDX
        pop ESI
        pop ECX
        pop EBX
        mov ESP, EBP
        pop EBP
        ret 4*2
    MaxLet endp
        
Start:
    ConsoleTitle 'Аксенов Павел, 110 группа, Задача_1 (блок_4)'
    push offset S
    call ReadText
    push EAX
    push offset S
    call MaxLet
    outcharln AL
    pause 'Press any key to exit'
    exit
end Start
