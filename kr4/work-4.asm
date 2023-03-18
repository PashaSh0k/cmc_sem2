include console.inc
; (����� ��� ������ 1,2,3 -  � ����� ���� ���������)
; �������� ����� (������) � (���������):
; ��������, ������ ������� ��������� � �������� ����� � ����������: 
Date_pack record D:5, M:4, Y:7
Date_unpack struc  ; ���� � ������ ���������� ��������
D   db ?           ; ���� (�� 1 �� 31)
M   db ?           ; ����� (�� 1 �� 12)
Y   db ?           ; ��� (�� 0 �� 99)
Date_unpack ends

; �������� ����������:
.data
T   db " ������� �����    ����_1 (�����-4)",0	;	
N   equ 6
D1  Date_pack <>                    ; ����������� ����_1
D2  Date_pack <>                    ; ����������� ����_2
Arr_of_Rec Date_pack N dup (<>)     ; ������ ������� (����������� ���)
Arr_of_Struc Date_unpack N dup (<>) ; ������ �������� (������������� ���)

; �������� ��������: 
.code
; -----------------------------------------------------
; procedure In_Rec(var D: Date_pack)
; ��������: ���� �������� ����� D, M, Y ������ ���� Date_pack
In_Rec proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    
    mov EAX, [EBP+8]
    inint BX
    shl BX, D
    or [EAX], BX
    inint BX
    shl BX, M
    or [EAX], BX
    inint BX
    or [EAX], BX
    
    pop EBX
    pop EAX
    pop EBP
    ret 4
In_Rec endp
; -----------------------------------------------------
; function Less(D1, D2: Date_pack): byte
; AL := 1 (���� D1<D2, �.�. ���� ����_1 ������������ ����_2)
; AL := 0 (�����)
Less proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDI
    push ESI
    
    mov EBX, [EBP+8]        ; D1
    mov ECX, [EBP+12]       ; D2
    mov EDI, EBX
    mov ESI, ECX
    and EBX, mask Y
    and ECX, mask Y
    cmp EBX, ECX
    jL yes
    jA no
    mov EBX, EDI
    mov ECX, ESI
    and EBX, mask M
    and ECX, mask M
    cmp EBX, ECX
    jL yes
    jA no
    and EDI, mask D
    and ESI, mask D
    cmp EDI, ESI
    jL yes
    jmp no
    
yes:
    mov AL, 1
    jmp fin
no:
    mov AL, 0
fin:
    pop ESI
    pop EDI
    pop ECX
    pop EBX
    pop EBP
    ret 4*2
Less endp
; -----------------------------------------------------
; procedure Out_Rec(D: Date_pack)
; ��������: ����� �������� ����� D, M, Y ������ ���� Date_pack
Out_Rec proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    
    mov EBX, [EBP+8]
    mov ECX, EBX
    and EBX, mask D
    shr EBX, D
    outword EBX
    outchar '.'
    mov EBX, ECX
    and EBX, mask M
    shr EBX, M
    outword EBX
    outchar '.'
    and ECX, mask Y
    outword ECX
    
    pop ECX
    pop EBX
    pop EBP
    ret 4
Out_Rec endp
; -----------------------------------------------------
; function Min_Date(var Arr: array of Date_pack; N: longword): word
; ��������: �� := ����������� ���� ����� ���������-��� ������� Arr
; (����������� - �������������� ���� ��������� �����)
; ������� Min_Date � �������� ����� ������ ��� ��������� �������� �������� 
; � ��������� ����� ���������� � ����� ���������� ������� Less(D1,D2)
Min_Date proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    push EDI
    push ESI
    
    mov EBX, [EBP+8]
    mov ECX, [EBP+12]
    mov DX, [EBX]
    dec ECX
    mov EDI, 1
cycle:
    movzx EDX, DX
    mov ESI, dword ptr [EBX+EDI*(type Date_pack)]
    push ESI
    push EDX
    call Less
    cmp AL, 0
    jNE LL
    mov DX, [EBX+EDI*(type Date_pack)]
LL: inc EDI
    loop cycle
    
    mov AX, DX
    pop ESI
    pop EDI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4*2
Min_Date endp
; -----------------------------------------------------
; procedure Rec_to_Stru�(D_pack: Date_pack; var D_unpack: Date_unpack)
; ��������: ���������� ���� 
; (�� ������ ���� Date_pack � ��������� ���� Date_unpack)
Rec_to_Struc proc

Rec_to_Struc endp
; -----------------------------------------------------
; procedure Out_Struc(var D: Date_unpack)
; ��������: ����� �������� ����� D, M, Y ��������� ���� Date_unpack
Out_Struc proc

Out_Struc endp
; -----------------------------------------------------
; ������� ����� (�������� ���������):
start:	
    ConsoleTitle offset T	
; ----------------------------------------------------- 

; ���� 1 (40 �����):
; (10 �����) ���� ���� ��� D1 � D2 (������ � ������� dd.mm.yy)
; �������:
    lea EAX, D1
    push EAX
    call In_Rec
    lea EAX, D2
    push EAX
    call In_Rec
; (20 �����) ��������� ���� ��� (D1 < D2 ?)
; �������:
    mov EAX, dword ptr D1
    mov EBX, dword ptr D2
    push EBX
    push EAX
    call Less
; (10 �����) ����� ���������� ��������� � ���� "D1<D2 is true/false",
; ��� ������ D1 � D2 ������ ���� ���������� ���� � ������� dd.mm.yy
; �������:
    mov EBX, dword ptr D1
    push EBX
    call Out_Rec
    outchar 60
    mov EBX, dword ptr D2
    push EBX
    call Out_Rec
    cmp AL, 0
    je null
    outstr ' is true'
    jmp et2
null:
    outstr ' is false'
et2:
COMMENT ~
; ----------------------------------------------------- 
; ���� 2 (50 �����):
; (15 �����) ���� ��� ����� N ��� � ���������� �� � ������� Arr_of_Rec:
; �������:
    mov ECX, 0
L:  cmp ECX, N
    jE con
    lea EAX, Arr_of_Rec[ECX*type Date_pack]
    push EAX
    call In_Rec
    inc ECX
    jmp L 
con:
; (15 �����) ���� ��� ������ N ���, ���������� � ������� Arr_of_Rec
; �������:
    mov ECX, 0
L1: cmp ECX, N
    jE ffin
    mov EAX, dword ptr Arr_of_Rec[ECX*type Date_pack]
    push EAX
    call Out_Rec
    outchar ' '
    inc ECX
    jmp L1
ffin:
; (20 �����) ���� ��� �������� ����������� �� ��������-���� �� �����������
; �������:
    newline
    mov AL, 1
    mov ECX, 0
    mov EDX, 1
L2:
    cmp AL, 1
    jNE noo
    mov ESI, dword ptr Arr_of_Rec[ECX*(type Date_pack)]
    mov EDI, dword ptr Arr_of_Rec[EDX*(type Date_pack)]
    push EDI
    push ESI
    call Less
    inc ECX
    inc EDX
    cmp ECX, N
    jE yess
    jmp L2
    
noo:
    outstr 'not sorted'
    jmp fffin
yess:
    outstr 'sorted'
fffin:
        

; ----------------------------------------------------- 

; ���� 3 (40 �����):
; ���������� ������� Min_Date ��� ������ ���������� ���� � ������� Arr_of_Rec
; �������:
    mov EBX, N
    push EBX
    lea EAX, Arr_of_Rec
    push EAX
    call Min_Date

; ����� ���������� ���� � ���� "dd.mm.yy is minimum"
; �������:
    newline
    movzx EBX, AX
    push EBX
    call Out_Rec
    outstr ' is minimum'
    ~
; ----------------------------------------------------- 
; ���� 4 (60 �����):
; (30 �����) ���� �������� �� ������� Arr_of_Rec � ����� ���������� ��� 
; � ���������� �� � ������� ��������  Arr_of_Struc
; �������:

    
; (30 �����) ���� �������� �� ������� Arr_of_Struc � ����� ������ ��� 
; �� ����� (������ ���� - � ������� dd.mm.yy)
; �������


; ----------------------------------------------------- 
	
	pause
	exit
	end start
	
�����, �� ������� ���� ������� ���������:
---------------------------------------------------------
���� 1
---------------------------------------------------------
1)  10.2.20 13.2.20	   ===>   10.2.20<13.2.20 is true
2)  20.2.20 10.3.20	   ===>   20.2.20<10.3.20 is true  
3)  15.2.20 10.2.21	   ===>   15.2.20<10.2.21 is true  
4)  1.2.3 1.2.3	       ===>   1.2.3<1.2.3 is false
5)  10.2.20 15.1.20	   ===>   10.2.20<15.1.20 is false
6)  9.2.20 10.2.19	   ===>   9.2.20<10.2.19 is false
---------------------------------------------------------
���� 2
---------------------------------------------------------
1)  10.2.19 13.2.19 13.3.19 14.3.19 14.3.20 15.4.20	===> sorted
2)  10.2.19 13.2.19 13.3.19 13.3.19 14.3.20 15.4.2	===> not sorted
3)  10.2.19 13.2.19 13.3.19 14.3.19 14.3.18 15.4.20	===> not sorted
4)  10.2.19 13.2.19 13.3.19 14.3.19 14.3.20 13.3.20	===> not sorted
---------------------------------------------------------
���� 3
---------------------------------------------------------
1)  15.4.20 14.3.19 10.2.19 13.3.19 14.3.20 13.2.19 ===> 10.2.19 is minimum  
2)  15.4.20 14.3.20 14.3.19 13.3.19 13.2.19 10.2.19 ===> 10.2.19 is minimum
3)  10.2.19 15.4.20 14.3.19 14.3.20 13.2.19 13.3.19 ===> 10.2.19 is minimum
---------------------------------------------------------
