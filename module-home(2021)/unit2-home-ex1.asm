; 2-�� ��������������� ������ (unit2-home-ex1.asm)
include console.inc

public MAX_MIN          ; ����� ����� � ������ 

.code
; procedure MAX_MIN(X, Y: longint; var MAX, MIN: longint)
; ��������:
; MAX := ��������(X,Y)
; MIN := �������(X,Y)
MAX_MIN proc
;��.���������� � ������ stdcall
    push EBP
    mov EBP,ESP
    
    push EAX
    push EBX
    push ECX
    push EDX

    mov EAX,[EBP+8]      ; X c/��
    mov EBX,[EBP+12]     ; Y c/��
    
    mov ECX,[EBP+16]     ; offset MAX
    mov EDX,[EBP+20]     ; offset MIN
    
    cmp EAX,EBX
    jGE @F
    xchg EAX,EBX
@@: ;EAX = MAX, EBX = MIN
    mov [ECX],EAX       ; MAX
    mov [EDX],EBX       ; MIN
    
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    
    pop EBP
    ret 4*4
    
MAX_MIN endp    

end 