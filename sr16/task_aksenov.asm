include console.inc

COMMENT ~

��������������� ������ 16
������� �����    110 ������

~
COMMENT~ 
----------------------------------------------------------------------------
��������: ��� ������������ �������� ���������� � �������� ������ � ������
������ ���� ��������� !!!
---------------------------------------------------------------------------- 
 ������ (����������� 60 �����), ����� ���������� 90 �����
 
 ������� ������� Search(Str1,Str2,n,k), ��� Str1 � Str2 - ���������� ������
 ������������� ����� �� n (n>0) �������� ������, k - ����� �� ��������� 
 �� 1 �� n. ������� ����������, ������ �� ������ k �������� ������ Str2 
 � ������ Str1 ��� ���������. 
 ���� ��, �� ���������� ����� ������� EAX ����� ������� (� Str1), ������� 
 � ������� ������� ������ ��������� ��������� (������� ���������� � ����!).
 ���� ���, �� ���������� ����� ��� ����� -1 (����� �������).
 
 ����������. 
 ----------
 1) ��������� Str1 � Str2 ������ ���� �������� �� ������, ��������� n � k - 
 �� �������� (+ c���������� ���������� � ������ stdcall).
  
 2) ��������� ������� Search(Str1,Str2,n,k) � ��������� ������:
 Search(S1,S2,n,k)
 (�������� ��� S1, S2, n � k ��������� ���� � ������ ������)
 �������� ��� k ������� �������������� ������ � ����������.
 ��������� �������� ������� (������� ������������ ����� ���) - 
 ���������� �� �������� ��������� ����� ������ ������� Search
 
 3) ����������: � ������� ������������ ������� cmpsb � ���� � ������ 
 ��������� ���������� ��� ������ ��������� (��� ��������� �������). 
 
 ��. ����������� � ����� (����� ��������� end) ��� ����٨���� ����������
 ���� ������, �� �� 30 ����� (���� � �������� ���������� ������ ������ ������)
  
 ������� ������ ��������� ��� S1 � S2 � ���������� (� .data) ����������
 (��� ������������ ��������� Search):
 k = 1   i = 0
 k = 2   i = 0
 k = 3   i = 2
 k = 4   i = 5
 k = 5   i = 9
 k = 6   i = 17
 k = 11  i = 17
 k = 28  i = -1
 ����� �������� ��� k ������������� ���������� � �������� � ����������, 
 �������� ��� i (������� ���������) - ����������� � ���������� �� �����.

��������� �� �������� � ��������� ����:
���� ��������� �������� �� ���������������� ��������� (����� ����������
����������, ��� � �������������� ������) - �������� zip-����� � �������: 
asm, lst � exe �� ���� ��������� + �������� ������ � ������������ ������
����� ��������� �� ���� �������������� ������. ���� �� ��������� �� ��������
��� �� �������� �� ����� - ��������� � ����� ������ ���� Task_sername.asm.
��������! �������� � �������� ����� ����� Sername �� ���� ������� �� 
���������� �����. ���� �� ������ ������ � �������� ����������, �� ������
�� ������� � ������ 67 (��� ���������� ���������� �). ���� �� ������ ������
� ���������� ����������, ��  ������� ����� ����٨���� ������� �� �����.
~
.data
T   db  "������ (�-� 16) ������� 110 (�������� ����������)",0

S1  db "ababcabcdabcdelmnabcdefghijk"
S2  db "abcdefghijklmnopqrstuvwxyzab"

n   equ ($-S2)                ; ����� ����� ������ (=28)
k   db ?                      ; ����� ������� ��������� (1..n)

.code
; procedure Search(var Str1, Str2: array of byte; n, k: longword)
Search proc
;   [EBP+8]  - ����� Str1
;   [EBP+12] - ����� Str2
;   [EBP+16] - �������� n
;   [EBP+20] - �������� k
;   ����� ���� ������� 
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    
    cld
    mov ECX, [EBP+16]
    sub ECX, [EBP+20]
    xor EDX, EDX
@cycle:
    cmp EDX, ECX
    jA @no
    mov ESI, [EBP+8]
    mov EDI, [EBP+12]
    add ESI, EDX
    push ECX
    mov ECX, [EBP+20]
    repE cmpsb
    pop ECX
    jZ @yes
    inc EDX
    jmp @cycle
@no:   
    mov EAX, -1
    jmp @fin
@yes:
    mov EAX, EDX
@fin:
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4*4
Search endp
 
Start:
    ConsoleTitle offset T	
    ; �������, ��� �������� ��� k ����� ������� ��������� (�� 1 �� n)
    inint k,"k = "
    movzx EAX, k
    lea ECX, S1
    lea EDX, S2
    push EAX
    push n
    push EDX
    push ECX
    call Search
    outint EAX,, 'i = '
; ����� ���������� ����� ��������� (� ������������ � ��������� �����������):
; �� �������� � ������ 67 ������� (� �������) ����� ���������� ������ �������
    
; ���� ��������� �������� �����, �� �������� ��������� � ����� ��������� 
; ����������� ������ ��������� �� ���� ������ (������ 44-51) 
    pause						; ����� ��� ����� �� e-mail
    exit						
end Start
-------------------------------------------------------------------
����������� (���������� ���������� ������ - �� 30 ����� ������ 60):
-------------------------------------------------------------------
���������� �������_1:
���� ������ ��������� ������ ������� ���������, �� ����� ���� ����� � 
����� ������� ��������:
���� �� (������), �� ���������� ����� ������� EAX �������� 0 (����).
���� ��� (�� ������), �� ���������� ����� ��� ����� -1 (����� �������).
������� (�����������!) � ������ 67 ��� �������� ���������� �, ��� 
������� ����� ������� ���������� ������ � ���������� ��������_1
(��� ���������� ��������). 
-------------------------------------------------------------------
���������� �������_2:
���� �� ������ ��� ������������ ������� cmpsb � ���� � ������ ���������
���������� ��� ������ ��������� (��� ��������� �������), �� ������� ��� 
������ (��� ��������� ������), �� ����� �� ��� �������� 30 �����.
������� (�����������!) � ������ 67 ��� �������� ���������� �, ��� 
������� ����� ������� ���������� ������ � ���������� ��������_2
(��� ���������� ��������). 
-------------------------------------------------------------------


 