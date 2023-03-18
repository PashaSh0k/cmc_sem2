include console.inc

COMMENT ~

 ������� ������� �����     ������ 110
 ��������������� ������ 11

 ������_2 (����������� 30 �����)
 
 ������� ��������� Assign(X) C� ������������ ������������ � ������, ������� 
 ��������� �� ���� ����� �������� ����� (��� �����) � ����������� ��� �������
 ����� �� ���������� �������: 
 � := 40 * (� div 64 + � mod 8) - 17
 
 ������ ����������: � ������� ��������� ������������ ������� ��������, 
 ���������, ��������� � �������.
 ���������: ������������ ������� shr, shl, and, lea.

 �������� ��������� � ���� ��������� ��� ���������� Y, �������� �������
 ���� � ������ ������ ���� ���������, � �����  ��������� � ���������
 - ������� ����� �������� ���������� Y (����� ����� ������������ �� �������� 
 ���������). ��� ���������� ������ ��������� Assign ������ ���� ���������� 
 ����� 370495

~

.data
T   db " ������� �����   ������_2 (�-� 11)",0		
Y   dd 987654  ; �/��

.code
assign proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    
    mov EAX, dword ptr [EBP+8]
    mov EBX, [EAX]
    mov ECX, [EAX]
    shr EBX, 6
    and ECX, 111b
    lea EBX, [EBX+ECX]
    lea EBX, [8*EBX]
    mov ECX, EBX
    lea EBX, [4*ECX+EBX-17]
    mov ECX, [EBP+8]
    mov [ECX], EBX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4
assign endp
    
Start:
;	����� ����������� ������� ���������
    ConsoleTitle offset T
    lea EAX, Y	
    push EAX
    call assign

;   ������ ������ �������� ���������� Y ����� ������ ��������� Assign:
    outwordln Y,,"Y = "   

    pause						; ����� ��� ����� �� e-mail
    exit						
    end Start
