include console.inc
.data
    N dd ?
.code
Start:
    ConsoleTitle '������� �����, 110 ������, ������_7 (����_1) � ��������� �����, ������� ���� �'
    inint N,'Enter the number: '
    mov EAX, N
    sub EDX, EDX
    mov EBX, 7
    div EBX
    cmp EDX, 3
    jbe outp
    add EAX, 1

outp:   mul EBX
        outwordln EAX

    pause 'Press any key to exit'
    exit
end Start
