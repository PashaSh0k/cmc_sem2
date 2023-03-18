include console.inc

COMMENT *

 ������� ������� ����� ����������     ������ 110

 ��������������� ������ 10 (12.04.2021)

 ������_2 (25 �����)
 
 ����� �� ����� Free Pascal ���� ��������� ��������:
 const N = 10;
 type vector = array [1..N] of longint;
 
 ������� ��������� Sum(X,N) �� ������������ ������������ � ������ stdcall
 ��� ��������� ��������:
 X - ������ ���� vector, N - ����������� ����� ������� 
 ��������� ����������� ������ � �� ���������� �������: 
 for i:= 1 to N-1 do X[i]:= X[i]+X[N];
 (����� �� ��������� longint �� ��������������)

 �������� ��������� � ���� ��������� ��� ������� Y, �������� ��������
 ���� � ������ ������ ���� ���������, � �����  ��������� � ���������
  - ������� ������ Y ����� ��������� (����� ����� ����������� ��������, 
  �� �������� ��� ����� ����������� ���������, �.�. ����� ����� �����
  ������ ��� �������� ������������ ������ ��������� Sum).

*
.data
T   db " ������� �����  ������_2 (�-� 10)",0		
N   = 10
Y   dd 1,-20,300,-4000,50000,-6000000,70000000,-800000000,2000000000,-1 ; �/��

.code
    sum proc
        push EBP
        mov EBP, ESP
        
        push ESI
        push EDI
        push EDX
        push EAX
        push EBX
        
        mov ESI, [EBP+8]                ; array
        mov EDI, [EBP+12]               ; dimension
        mov EBX, 0
        mov EDX, [ESI+4*EDI-4]          ; last elem
        dec EDI
    @L: 
        cmp EBX, EDI
        je @fin
        mov EAX, [ESI+4*EBX]            ;
        add EAX, EDX                    ; y[i] := y[i] + y[N]
        mov [ESI+4*EBX], EAX            ;
        inc EBX
        jmp @L
    @fin:
        pop EBX
        pop EAX
        pop EDX
        pop EDi
        pop ESI
        mov ESP, EBP
        pop EBP
        ret 4*2
    sum endp
Start:
;	����� ����������� ������� ���������
    ConsoleTitle offset T	
    mov ECX, N
    push ECX
    push offset Y
    call sum
    mov EBX, 0
outp:
    cmp EBX, ECX
    je fin
    outint Y[4*EBX]
    outchar ' '
    inc EBX
    jmp outp
fin:    
    pause						; ����� ��� ����� �� e-mail
    exit						
    end Start
