comment *
-------------------------------------------------------------------
�����-5 (������_2, ��������������� ������) 
-------------------------------------------------------------------
*

include console.inc

public In_text, Out_text, Find_min_word 

.code
;-----------------------------------------------------------------------
; procedure In_word(var Elem_of_Arr: array of byte; K: longword)
;-----------------------------------------------------------------------
; ��������: ���� ����� �� � ����, �������������� ��� � �������� ��������
; � ���������� ����� ����� �� ������, ��������� ���������� Elem_of_Array.
; ����� ���������� ������ ��������� In_word  "������" ����� ����� 
; (������������� flush) �� ����������� ��������, �������� � ����� � 
; ���������� ������� ������� ENTER (������� ��� �����������, ����� ���������� 
; ���� ����� �������������� ����������� !!!). 
;-----------------------------------------------------------------------
In_word proc
    push EBP
    mov EBP, ESP
    push EAX
    push ECX
    push EDX
    push EBX
    
    mov EAX, [EBP+8]    ; in EAX address Elem_of_Arr
    mov ECX, [EBP+12]   ; in ECX K
    mov EDX, 0
    
@L1:
    inchar BL
    cmp BL, 01100000b
    jB @no
    sub BL, 00100000b
@no:
    mov [EAX+EDX], BL
    inc EDX
    cmp EDX, ECX
    jBE @L1
    flush
    pop EBX
    pop EDX
    pop ECX
    pop EAX
    pop EBP
    ret 4*2
In_word endp

;-----------------------------------------------------------------------
; procedure Out_word(var Elem_of_Arr: array of byte; K: longword)
;-----------------------------------------------------------------------
; ��������: ����� ����� �� � ����, ����� ������ ����� ����� 
; ���������� Elem_of_Arr. 
;-----------------------------------------------------------------------
Out_word proc
    push EBP
    mov EBP, ESP
    push EAX
    push ECX
    push EDX
    push EBX
    
    mov EAX, [EBP+8]    ; in EAX address Elem_of_Arr
    mov ECX, [EBP+12]   ; in ECX K
    mov EDX, 0
@L1:
    mov BL, [EAX+EDX]
    outchar BL
    inc EDX
    loop @L1
    
    pop EBX
    pop EDX
    pop ECX
    pop EAX
    pop EBP
    ret 4*2
Out_word endp

;-----------------------------------------------------------------------
; procedure In_text(var Arr_of_words: array of byte; N,K: longword) 
;-----------------------------------------------------------------------
; ��������: ���� ������������������ �� N ���� (�� � ���� � ������ �����), 
; �������������� ���� � �����.�������� � ���������� �� � ������� Arr_of_words.
; � �������� ������ ��������� In_text ���������� � ��������������� ���������
; In_word ��� ����� ���������� ����� � ���������� ��� � ��������� �������� 
; ������� Arr_of_words
;-----------------------------------------------------------------------
In_text proc
    push EBP
    mov EBP, ESP
    push EAX
    push ECX
    push EBX
    push EDX
    push ESI
    
    mov EAX, [EBP+8]
    mov ECX, [EBP+12]   ; in ECX N
    mov EBX, [EBP+16]   ; in EBX K
    mov EDX, 0
    
 @L:
    lea ESI, [EAX+EDX]
    push EBX
    push ESI
    call In_word
    add EDX, EBX
    loop @L
    
    pop ESI
    pop EDX
    pop EBX
    pop ECX
    pop EAX
    pop EBP
    ret 4*3
In_text endp

;-----------------------------------------------------------------------
; procedure Out_text(var Arr_of_words: array of byte; N,K: longword) 
;-----------------------------------------------------------------------
; ��������: ����� N ���� (�� � ���� � ������ �����), ������ ����� � � ����� 
; ������ ������. ����� ������ ������� �� ���� ������� ���������� Arr_of_words.
; � �������� ������ ��������� Out_text ���������� � ��������������� ���������
; Out_word ��� ������ ���������� �����
;-----------------------------------------------------------------------
Out_text proc
    push EBP
    mov EBP, ESP
    push EAX
    push ECX
    push EBX
    push EDX
    push ESI
    
    mov EAX, [EBP+8]
    mov ECX, [EBP+12]   ; in ECX N
    mov EBX, [EBP+16]   ; in EBX K
    mov EDX, 0
 @L:
    lea ESI, [EAX+EDX]
    push EBX
    push ESI
    call Out_word
    add EDX, EBX
    newline
    loop @L    
    
    pop ESI
    pop EDX
    pop EBX
    pop ECX
    pop EAX
    pop EBP
    ret 4*3
Out_text endp	

;-----------------------------------------------------------------------		
; procedure Find_min_word(var Arr_of_words: array of byte; N,K: longword) 
;-----------------------------------------------------------------------
; ��������: ����� ����� (� ������� Arr_of_words), ������� ����������������� 
; ������������ ���� ��������� ������ � ����� ���������� ����� �� �����.
; ����� ������ ������� �� N ���� (������ ����� ������ � ����) ������� 
; ���������� Arr_of_words.
; � �������� ����� ������ ��������� Find_min_word ���������� � ���������������
; ��������� Out_word ��� ������ ���������� �����.
;-----------------------------------------------------------------------  
Find_min_word proc
    push EBP
    mov EBP, ESP
    push EAX
    push ECX
    push EDX
    push ESI
    push EDI
    push EBX
    
    mov EAX, [EBP+8]
    mov EDX, [EBP+12]       ; N
    mov ECX, [EBP+16]       ; K
    dec EDX
    CLD
    
    mov EDI, EAX
 @L:
    add EDI, ECX
    mov ESI, EAX
    push EDI
    push ECX
repE cmpsb
    pop ECX
    pop EDI
    jBE @F
    mov EAX, EDI
@@: dec EDX
    jNZ @L
    
    push ECX
    push EAX
    call Out_word
    
    pop EBX
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EAX
    pop EBP
    ret 4*3
Find_min_word endp			
;-----------------------------------------------------------------------
	
end