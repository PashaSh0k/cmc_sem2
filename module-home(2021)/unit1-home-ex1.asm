; 1-�� ��������������� ������ (unit1-home-ex1.asm)
include console.inc

public Input  ; ����� ����� � ������ 
extern X: dword, Y: dword, Return: near 
; X, Y, RETURN - ������� � �������� ������

.code
Input:
    inint X,"X = "
    inint Y,"Y = "
    jmp Return 
end 