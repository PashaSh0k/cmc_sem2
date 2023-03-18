include console.inc
public Mult

.code
Mult proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    mov EDI, [EBP+8]    ;A
    mov ESI, [EBP+12]   ;B
    mov EDX, [EBP+16]   ;Z
    
    mov ECX, 32
    xor EAX, EAX
    xor EBX, EBX
@L: 
    shl EBX, 1
    shl EAX, 1
    adc EBX, 0
    shl ESI, 1
    jNC @skip
    add EAX, EDI
    adc EBX, 0
@skip:
    loop @L
    
    mov [EDX], EAX
    mov [EDX+4], EBX
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*3
Mult endp
end
    
    