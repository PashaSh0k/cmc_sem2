include console.inc
.data
    z2 db '����',0
    z3 db '�����',0
    z4 db '������',0
    z5 db '�������',0
    adr dd z2,z3,z4,z5;
    N dd ?
.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_2 (����_2) "����� � �������"'
    inint N, 'input: '
    mov EAX, N
    sub EAX, 2
    mov EAX, adr[4*EAX]
    outstrln EAX
    
fin:
    newline
    pause 'Press any key to exit'
    exit
end Start
