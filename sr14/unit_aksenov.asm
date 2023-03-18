; 
; ������� ����� 110 ������

comment ~

c-p 14   (max = 60 �����)
�������� ���������, ��������� �� ���� �������.

� �������� ������ ������ ���� �������: 
1) �������� ��������� � ������ K � ��������� �� ��������� [1..31]
  (������������ � ��������� ��� ������������� �������� 29); 
2) ������ S ��� ������ ��������� �Undivisible�; 
3) ������� ����� � ������ D (��� ���������� ��������); 
4) ���� � ������ B (��� ���������� ��������). 

�� ��������������� ������ ������ ���� ������� ��������� IsDivided 
��� ���������� (� ��� ����������� ���������� � �����) - �����������
��� ��� ��������� - ��. ����.

�������� ������  ������  ��������  �������� �� ���� �����������  
���������� D (�� ������������ inint), � ����� ������� ���������� 
�� ��������������� ������ �� ��������� IsDivided, ������� �� �����������
�������� �������� D ������ ������������ �������� ����� �. ����� �������� 
������ ��������  ���������� �������� ����� � � �� ���� ��������� ����
������.

����������� ��� ��������� IsDivide.
���������, � ������, ���� �������� D ������� �� 2^K ������, 
� �������� (D div (2^K)) ��� ���� ���������� � ������ �����, ������ 
��������� ��� �������� ���������� B.
�� ���� ��������� ������� (�� �������; �������, �� ��� ���� �� ����������
� ����) ��������� ������ ��������� ���������� � �������� 0 � ���������� 
�����, �������� � ������ S.
��������! ��������� IsDivided �� ����� ���������� � �������� ��������  
� ����������� D, B, S � ���������� � (�� �� ������). 

�����������: ������ "2^K" ���������� "��� � ������� �".

���������� � ����������: �� ������������ �������������� ������. 

~

; (unit_sername.asm) ��������������� ������
; ����� ���� �������
include console.inc

public IsDivided
extern K: abs, S: byte, D: dword, B: byte, Return: near

.code
IsDivided proc
    push EAX
    push EDX
    push ECX
    push EBX
    
    xor EDX, EDX
    mov EAX, D
    mov ECX, K
  L:
    SHR EAX, 1
    jc no
    loop L
    
    mov EBX, EAX
    and EAX, 11111111b
    cmp EBX, EAX
    jne no
    
    mov B, AL
    jmp Return
 
 no:
    mov B, 0
    outstrln offset S
    
    pop EBX
    pop ECX
    pop EDX
    pop EAX
IsDivided endp
exit
end

; ����� ������ �������