include console.inc

COMMENT *

 ������� ������� ����� ����������     ������ 110

 ��������������� ������ 10 (12.04.2021)

 ������_1 (25 �����)
 
 ������� ��������� Assign(A,B), ����������� ��������� ��������: 
 B := (A-13) mod B 
 ����� A � ����� �/��, B � ���� �/�� (������� �� ����). 
 �������� � ��������� �� �������� ����� ������� AX.  
 �������� � ��������� �� ������ ����� ������� EBX. 
 �������� ��������� � ���� ��������� ��� ���������� A � B,
 �������� ������� ��������� � ������ ������ (��������������
 ������ �������� ���� ����������, � �����  ��������� � ���������
 - ������� ����� �������� ���������� �).
 ��������� ����� ��������� � ����� ���������.

*
.data

T   db " ������� �����   ������_1 (�-� 10)",0		
A   dw ?  ; c/��
B   db ?  ; �/��

.code
    Assign proc
    push EAX
    push ECX
    push EDX
    movsx EAX, AX
    sub EAX, 13
    CDQ
    mov CL, [EBX]
    movsx ECX, CL
    idiv ECX
    mov [EBX], DL
    
    pop EDX
    pop ECX
    pop EAX
    ret
    Assign endp
    
Start:
;	����� ����������� ������� ���������
    ConsoleTitle offset T	
    outstr 'input A, B: '
    inint A
    inint B
    mov AX, A
    lea EBX, B
    call Assign
    outstr 'new value B is '
    outint B
    pause						; ����� ��� ����� �� e-mail
    exit						
    end Start
    
�����:
A = -32768  B = -1    (A-13) mod B = 0   
A = -32768  B = 2     (A-13) mod B = -1   
A = -32768  B = -128  (A-13) mod B = -13
A =  32767  B = 127   (A-13) mod B = 115 
A = -32767  B = 127   (A-13) mod B = -14     