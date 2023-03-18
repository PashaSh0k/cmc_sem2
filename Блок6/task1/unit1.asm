include console.inc
public In4, Out4

.code
In4 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    
    xor EAX, EAX
    inchar BL
@L:
    cmp BL, ' '
    jE @fininp
    shl EAX, 2
    sub BL, '0'
    or AL, BL
    inchar BL
    jmp @L
@fininp:
    
    mov EBX, [EBP+8]
    mov [EBX], EAX
    pop EBX
    pop EAX
    pop EBP
    ret 4
In4 endp

Out4 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    
    mov EAX, [EBP+8]
    mov ECX, 16
@L:
    rol EAX, 2
    mov EBX, EAX
    and EBX, 11b
    outword EBX
    loop @L
    
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*1
Out4 endp
end
    
    