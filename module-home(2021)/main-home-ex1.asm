; main-home-ex1.asm (�������� ������)
; ������_1 (�� �-� �� �������)
include console.inc

public X, Y, Return
extern  Input: near, MAX_MIN@0: near

.data
X    dd   ?          ; c/��
Y    dd   ?          ; c/��
MAX  dd   ?
MIN  dd   ?
 
.code

Start:
    jmp Input        ; �������� ���������� � 1-�� ��������������� ������ (unit1)
	                 ; ��� ����� �������� ���������� X � Y
Return:              ; ��������� � ��� ����� �� unit1 (����� ����� X � Y)
	;���������� � ������ MAX_MIN(X, Y, MAX, MIN)
    ;���������� ��������� � ���� (� �������� �������)
    push offset MIN  ; ����� MIN -> � ����
    push offset MAX  ; ����� MAX -> � ����
    push Y           ; �������� Y -> � ����
    push X           ; �������� � -> � ����
    call MAX_MIN@0   ; �������� ���������� �� 2-�� ��������������� ������ (unit2)
    outint MAX,,"MAX = "
    outintln MIN,,"  MIN = "

    exit

end Start

comment ~

���������� �� ���������� ���� �Ш���������� ���������:

��������� �������� ���� prompt1.bat � ��� �������, ��� ��������� �������� 
������������ ������ (main-home-ex1.asm, unit1-home-ex1.asm � unit2-home-ex1.asm)
� ��������� ��� (��������� ���� ��������� ������)

��� ���������� ����� ������ (main-home-ex1.asm) ��������� �� ��������� ������:
ml /c /coff /Fl main-home-ex1.asm

��� ���������� 1-�� ���������������� ������ (unit1-home-ex1.asm) ��������� 
�� ��������� ������:
ml /c /coff /Fl unit1-home-ex1.asm

��� ���������� 2-�� ���������������� ������ (unit2-home-ex1.asm) ��������� 
�� ��������� ������:
ml /c /coff /Fl unit2-home-ex1.asm

��� ������ (��������) ��� ������� ��������� �� ��������� ������:
link /subsystem:console main-home-ex1.obj unit1-home-ex1.obj unit2-home-ex1.obj

��� ������� ������� ��������� �� ���� ��������� �� ��������� ������:
main-home-ex1

~