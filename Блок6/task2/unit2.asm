include console.inc

public multi
extern A: dword, B: dword, Z: qword

.code
multi:
    xor EDX, EDX
    mov EAX, A
    mul B
    mov dword ptr Z, EAX
    mov dword ptr Z+4, EDX
    outwordln Z
    
    pause 
    exit
end
