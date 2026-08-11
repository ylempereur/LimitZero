VIDEO   EQU     3C00H
STACK   EQU     $
SCR     DEFS    1024
        DEFS    64
SCRTIR  DEFS    1024
DCB     DEFS    64
DEMO    DEFS    1
NPLAY   DEFS    1
TEXP    DEFS    15*6
TALIEN  DEFS    20*6
HSCORE  EQU     $+10
TSCOR   DEFS    10*(10+6)
SCORE1  DEFM    '000000'
SCORE2  DEFM    '000000'
SHP1    DEFS    1
SHP2    DEFS    1
LAST1   DEFB    '0'
LAST2   DEFB    '0'
PLAY    DEFS    1
VLAS0   DEFB    11
PHASE   DEFB    0
WAIT    DEFB    0
COM1    DEFB    0
COM2    DEFB    0
COM3    DEFB    0
NBON    DEFB    0
VAR2    DEFS    7
FLASER  DEFB    0
VLASER  DEFB    0
HLASER  DEFB    1
CLASER  DEFB    0
FLAS0   DEFB    0
HBABLE  DEFB    0
DIRBAB  DEFB    68
FBAB    DEFB    0
DBAB    DEFB    0
OBUS    DEFB    0
COBUS   DEFB    0
POBUS   DEFW    SCRTIR
BLINK   DEFB    0
BASE    DEFB    0
CBASE   DEFB    0
PBASE   DEFW    SCR+990
XBASE   DEFB    60
TYM     DEFB    0
TYP     DEFB    0
DRBASE  DEFB    0
POINT   DEFB    0
POI0    DEFB    1
NBRE    DEFB    0
CMOVE   DEFB    0
COMPT   DEFB    0
CBON    DEFW    500
HEAT    DEFB    0
WHEAT   DEFB    1
FHEAT   DEFB    0
TINIT   DEFM    '000000'
        DEFM    '000000'
        DEFB    3
        DEFB    3
        DEFB    '0'
        DEFB    '0'
        DEFB    1
        DEFB    11
        DEFB    0
        DEFB    1
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    11
        DEFB    0
        DEFB    1
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    0
TINIT0  DEFB    0
        DEFB    0
        DEFB    1
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    68
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    0
        DEFW    SCRTIR
        DEFB    0
        DEFB    0
        DEFB    0
        DEFW    0
        DEFB    60
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    1
        DEFB    0
        DEFB    0
        DEFB    0
        DEFW    500
        DEFB    0
        DEFB    1
        DEFB    0
TACEI   DEFW    80BFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BF83H
        DEFW    8083H
        DEFW    0BCBFH
        DEFW    0BC80H
        DEFW    80BFH
        DEFW    0BF83H
        DEFW    8083H
        DEFW    8383H
        DEFW    83BFH
        DEFW    8083H
        DEFW    80BFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BF80H
        DEFW    8080H
        DEFW    80BFH
        DEFW    808FH
        DEFW    80BFH
        DEFW    0BF80H
        DEFW    8080H
        DEFW    8080H
        DEFW    80BFH
        DEFW    8080H
        DEFW    0B0BFH
        DEFW    0B0B0H
        DEFW    80B0H
        DEFW    0BFB0H
        DEFW    80B0H
        DEFW    80BFH
        DEFW    8080H
        DEFW    80BFH
        DEFW    0BFB0H
        DEFW    80B0H
        DEFW    8080H
        DEFW    80BFH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8380H
        DEFW    8383H
        DEFW    0BF83H
        DEFW    0BF80H
        DEFW    8383H
        DEFW    8383H
        DEFW    0BF80H
        DEFW    8383H
        DEFW    0BC83H
        DEFW    0BC80H
        DEFW    8383H
        DEFW    0BC83H
        DEFW    8080H
        DEFW    8080H
        DEFW    8CB0H
        DEFW    8083H
        DEFW    0BF80H
        DEFW    8C8CH
        DEFW    808CH
        DEFW    0BF80H
        DEFW    0BC8CH
        DEFW    838CH
        DEFW    0BF80H
        DEFW    8C80H
        DEFW    0BF80H
        DEFW    8080H
        DEFW    0BF80H
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0BF80H
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0BF80H
        DEFW    8380H
        DEFW    0B08CH
        DEFW    8F80H
        DEFW    0B0B0H
        DEFW    8FB0H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFM    '     ## MICRO 2000 ##     '
        DEFM    '7000 Mons, Belgium, Europe'
EXP3    DEFW    8880H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8084H
        DEFW    8080H
        DEFW    8080H
        DEFW    0A080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8090H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8280H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8081H
EXP2    DEFW    0A680H
        DEFW    8084H
        DEFW    8080H
        DEFW    8080H
        DEFW    8880H
        DEFW    8099H
        DEFW    8080H
        DEFW    8080H
        DEFW    9880H
        DEFW    8090H
        DEFW    8280H
        DEFW    8080H
        DEFW    0A080H
        DEFW    80A4H
        DEFW    8080H
        DEFW    8081H
        DEFW    0A080H
        DEFW    8080H
        DEFW    8980H
        DEFW    8081H
        DEFW    8080H
        DEFW    8090H
        DEFW    8280H
        DEFW    8086H
EXP1    DEFW    9988H
        DEFW    8099H
        DEFW    8080H
        DEFW    8080H
        DEFW    0A680H
        DEFW    84A6H
        DEFW    8080H
        DEFW    8080H
        DEFW    0A4A0H
        DEFW    80A4H
        DEFW    8180H
        DEFW    8081H
        DEFW    9880H
        DEFW    9098H
        DEFW    8280H
        DEFW    8082H
        DEFW    9080H
        DEFW    8090H
        DEFW    8682H
        DEFW    8086H
        DEFW    0A080H
        DEFW    80A0H
        DEFW    8980H
        DEFW    8189H
ALI1    DEFW    0BFAEH
        DEFW    84BFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BF88H
        DEFW    9DBFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCB8H
        DEFW    90BCH
        DEFW    8382H
        DEFW    8083H
        DEFW    0BCA0H
        DEFW    0B4BCH
        DEFW    8380H
        DEFW    8183H
        DEFW    0B0A0H
        DEFW    80B0H
        DEFW    8F8BH
        DEFW    818FH
        DEFW    0B080H
        DEFW    90B0H
        DEFW    8F82H
        DEFW    878FH
ALI2    DEFW    0BBA7H
        DEFW    85B3H
        DEFW    8080H
        DEFW    8080H
        DEFW    0B38AH
        DEFW    9BA7H
        DEFW    8080H
        DEFW    8080H
        DEFW    0AC9CH
        DEFW    948CH
        DEFW    8382H
        DEFW    8083H
        DEFW    8CA8H
        DEFW    0AC9CH
        DEFW    8380H
        DEFW    8182H
        DEFW    0B0B0H
        DEFW    90B0H
        DEFW    8E89H
        DEFW    818CH
        DEFW    0B0A0H
        DEFW    0B0B0H
        DEFW    8C82H
        DEFW    8689H
ALI3    DEFW    0B78CH
        DEFW    849DH
        DEFW    8080H
        DEFW    8080H
        DEFW    0AE88H
        DEFW    8CBBH
        DEFW    8080H
        DEFW    8080H
        DEFW    9CB0H
        DEFW    90B4H
        DEFW    8380H
        DEFW    8081H
        DEFW    0B8A0H
        DEFW    0B0ACH
        DEFW    8280H
        DEFW    8083H
        DEFW    0B080H
        DEFW    8090H
        DEFW    8D83H
        DEFW    8187H
        DEFW    0A080H
        DEFW    80B0H
        DEFW    8B82H
        DEFW    838EH
BONUS1  DEFW    0B789H
        DEFW    819DH
        DEFW    8080H
        DEFW    8080H
        DEFW    0AE82H
        DEFW    86BBH
        DEFW    8080H
        DEFW    8080H
        DEFW    9CA4H
        DEFW    84B4H
        DEFW    8380H
        DEFW    8081H
        DEFW    0B888H
        DEFW    98ACH
        DEFW    8280H
        DEFW    8083H
        DEFW    0B090H
        DEFW    9090H
        DEFW    8D82H
        DEFW    8087H
        DEFW    0A0A0H
        DEFW    0A0B0H
        DEFW    8B80H
        DEFW    818EH
BONUS2  DEFW    0B798H
        DEFW    909DH
        DEFW    8080H
        DEFW    8080H
        DEFW    0AEA0H
        DEFW    0A4BBH
        DEFW    8080H
        DEFW    8080H
        DEFW    9CA0H
        DEFW    80B4H
        DEFW    8381H
        DEFW    8181H
        DEFW    0B880H
        DEFW    90ACH
        DEFW    8282H
        DEFW    8283H
        DEFW    0B080H
        DEFW    8090H
        DEFW    8D86H
        DEFW    8487H
        DEFW    0A080H
        DEFW    80B0H
        DEFW    8B88H
        DEFW    898EH
GLL     DEFW    0BF98H
        DEFW    90ADH
        DEFW    9C9FH
        DEFW    959FH
GLR     DEFW    0AFB8H
        DEFW    909DH
        DEFW    9D9FH
        DEFW    959EH
GRL     DEFW    0AEA0H
        DEFW    0B49FH
        DEFW    0ADAAH
        DEFW    0AFAEH
GRR     DEFW    9EA0H
        DEFW    0A4BFH
        DEFW    0AFAAH
        DEFW    0AFACH
TLASER  DEFW    0BEBDH
        DEFW    8281H
        DEFW    0B8B4H
        DEFW    8B87H
        DEFW    0A090H
        DEFW    0AF9FH
TBASE1  DEFW    0BFB8H
        DEFW    90BDH
TBASE2  DEFW    0BEA0H
        DEFW    0B4BFH
TPHA    DEFB    20
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    20
        DEFB    0
        DEFB    0
        DEFB    0
        DEFB    20
        DEFB    7
        DEFB    7
        DEFB    7
TADD    DEFW    EXP3
        DEFW    EXP2
        DEFW    EXP1
        DEFW    0
        DEFW    ALI1
        DEFW    ALI2
        DEFW    ALI3
        DEFW    BONUS1
        DEFW    BONUS2
TCAL    DEFB    0*8
        DEFB    1*8
        DEFB    2*8
        DEFB    3*8
        DEFB    4*8
        DEFB    5*8
TVIT    DEFB    3
        DEFB    1
        DEFB    0
        DEFB    7
        DEFB    7
TPOI    DEFW    0BBB7H
        DEFW    0AF9FH
        DEFW    0BEBDH
TSHE    DEFW    2FEH
        DEFW    0FFFFH
        DEFW    202H
        DEFW    3FEH
        DEFW    0FFH
        DEFW    101H
        DEFW    4FEH
        DEFW    1FFH
        DEFW    202H
        DEFW    1FFH
        DEFW    0FFFFH
        DEFW    104H
        DEFW    2FFH
        DEFW    0FFFFH
        DEFW    102H
        DEFW    3FFH
        DEFW    0FFFFH
        DEFW    401H
        DEFW    4FFH
        DEFW    1FFH
        DEFW    102H
        DEFW    5FFH
        DEFW    1FFH
        DEFW    104H
        DEFW    0
        DEFW    0FF00H
        DEFW    101H
        DEFW    100H
        DEFW    0FFFFH
        DEFW    107H
        DEFW    200H
        DEFW    0FFFFH
        DEFW    105H
        DEFW    300H
        DEFW    1FFH
        DEFW    401H
        DEFW    400H
        DEFW    1FFH
        DEFW    105H
        DEFW    500H
        DEFW    1FFH
        DEFW    107H
        DEFW    600H
        DEFW    100H
        DEFW    101H
DATA1   DEFW    309H
        DEFW    308H
        DEFW    30AH
        DEFW    318H
        DEFW    322H
        DEFW    30FH
        DEFW    30BH
        DEFW    30AH
        DEFW    30CH
        DEFW    0
DATA2   DEFW    5001H
        DEFW    402H
        DEFW    203H
        DEFW    204H
        DEFW    205H
        DEFW    206H
        DEFW    207H
        DEFW    0C02H
        DEFW    0
DATA3   DEFW    9001H
        DEFW    4002H
        DEFW    9001H
        DEFW    4002H
        DEFW    9001H
        DEFW    4002H
        DEFW    9001H
        DEFW    4002H
        DEFW    9001H
        DEFW    4002H
        DEFW    9001H
        DEFW    4002H
        DEFW    9001H
        DEFW    0
DATA5   DEFW    0A01H
        DEFW    0A07H
        DEFW    0A01H
        DEFW    0A06H
        DEFW    0A01H
        DEFW    0A05H
        DEFW    0A01H
        DEFW    0A04H
        DEFW    0A03H
        DEFW    0A02H
        DEFW    0A01H
        DEFW    0
DATA6   DEFW    2706H
        DEFW    5082H
        DEFW    2706H
        DEFW    5082H
        DEFW    3005H
        DEFW    5082H
        DEFW    3005H
        DEFW    5082H
        DEFW    4004H
        DEFW    5082H
        DEFW    4004H
        DEFW    5082H
        DEFW    6003H
        DEFW    5082H
        DEFW    6003H
        DEFW    5082H
        DEFW    0C002H
        DEFW    5082H
        DEFW    0FF02H
        DEFW    0
DATA7   DEFW    5B05H
        DEFW    5B04H
        DEFW    5B03H
        DEFW    5B02H
        DEFW    5B01H
        DEFW    0
DATA8   DEFW    306H
        DEFW    408H
        DEFW    409H
        DEFW    40AH
        DEFW    418H
        DEFW    422H
        DEFW    418H
        DEFW    40AH
        DEFW    409H
        DEFW    408H
        DEFW    40CH
        DEFW    0
EFFPOI  LD      HL,3C00H
        LD      DE,3C01H
        LD      BC,3FH
        LD      (HL),80H
        LDIR
        LD      HL,3F80H
        LD      DE,3F81H
        LD      BC,3FH
        LD      (HL),80H
        LDIR
        LD      HL,3C40H
        LD      DE,3C7FH
        LD      B,0DH
        LD      A,80H
EFF0    LD      (HL),A
        LD      (DE),A
        PUSH    BC
        LD      BC,64
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        POP     BC
        DJNZ    EFF0
        RET
AFFPOI  LD      A,(COPOI)
        INC     A
        AND     3
        CALL    SOUND
        LD      (COPOI),A
        LD      HL,3F80H
        LD      DE,-64
        LD      B,14
FPO0    OR      A
        JR      Z,FPO3
        CP      1
        JR      Z,FPO2
        CP      2
        JR      Z,FPO1
        LD      (HL),0BCH
        JR      FPO4
FPO1    LD      (HL),0B3H
        JR      FPO4
FPO2    LD      (HL),8FH
        JR      FPO4
FPO3    LD      (HL),0BFH
FPO4    INC     A
        CALL    SOUND
        AND     3
        ADD     HL,DE
        DJNZ    FPO0
        LD      A,(COPOI)
        LD      B,64
        CP      3
        JR      Z,FPO5
        OR      A
        JR      Z,FOP0
        LD      (HL),0BCH
        JR      FPO7
FOP0    LD      (HL),0B0H
        JR      FPO7
FPO5    OR      A
        CALL    SOUND
        JR      NZ,FPO6
        LD      (HL),80H
        JR      FPO7
FPO6    LD      (HL),8CH
FPO7    INC     HL
        CALL    SOUND
        DEC     A
        AND     3
        DJNZ    FPO5
        LD      A,(COPOI)
        OR      A
        JR      Z,FPO8
        CP      3
        JR      NC,FOP1
        DEC     HL
        LD      (HL),0BCH
        JR      FPO8
FOP1    DEC     HL
        LD      (HL),0B0H
FPO8    LD      HL,3C7FH
        CALL    SOUND
        LD      B,14
        LD      DE,64
FPO9    OR      A
        JR      Z,FPO12
        CP      1
        JR      Z,FPO11
        CP      2
        JR      Z,FPO10
        LD      (HL),8FH
        JR      FPO13
FPO10   LD      (HL),0B3H
        JR      FPO13
FPO11   LD      (HL),0BCH
        JR      FPO13
FPO12   LD      (HL),0BFH
        CALL    SOUND
FPO13   INC     A
        CALL    SOUND
        AND     3
        ADD     HL,DE
        DJNZ    FPO9
        LD      A,(COPOI)
        INC     A
        AND     3
        LD      B,62
        LD      HL,3FBEH
FPO14   OR      A
        JR      NZ,FPO15
        LD      (HL),80H
        JR      FPO16
FPO15   LD      (HL),0B0H
FPO16   DEC     HL
        CALL    SOUND
        DEC     A
        AND     3
        DJNZ    FPO14
        RET
COPOI   DEFB    0
DISPL   LD      A,(CMODE)
        OR      A
        JP      Z,SPIRE
        DEC     A
        JP      Z,ALEA
        DEC     A
        JP      Z,GRILL
        DEC     A
        JP      Z,SCAN
        DEC     A
        JP      Z,HGRILL
        DEC     A
        JP      Z,RADAR
        JP      ZIG
CMODE   DEFB    0
COMMOD  LD      HL,CMODE
        LD      A,(HL)
        INC     A
        AND     7
        CP      7
        JR      NZ,COM0
        XOR     A
COM0    LD      (HL),A
        RET
SCR191  LD      HL,SCR
        LD      DE,SCR+1
        LD      (HL),0BFH
SCR0    LD      B,15
SCR1    PUSH    BC
        LD      BC,64
        LDIR
        CALL    SOUND
        POP     BC
        DJNZ    SCR1
        LD      BC,63
        LDIR
        CALL    SOUND
        RET
CLSVID  LD      HL,VIDEO
        LD      DE,VIDEO+1
CLS0    LD      (HL),80H
        JR      SCR0
CLSSCR  LD      DE,SCR+1
        LD      HL,SCR
        JR      CLS0
CLSMSC  LD      HL,SCR
        LD      DE,SCR+1
        LD      BC,766
        LD      (HL),80H
        LDIR
        RET
AFF     LD      HL,SCR
        LD      DE,VIDEO
        LD      B,16
AFF0    PUSH    BC
        LD      BC,64
        LDIR
        CALL    SOUND
        POP     BC
        DJNZ    AFF0
        RET
RESET   LD      A,86H
        JR      TEST10
TEST    LD      A,46H
        JR      TEST10
SET     LD      A,0C6H
TEST10  LD      (INST0+1),A
        LD      A,D
        LD      B,0FFH
LOOP    INC     B
        SUB     3
        JP      P,LOOP
        ADD     A,3
        SLA     A
        LD      C,A
        LD      L,B
        LD      H,0
        LD      B,6
LOOP1   ADD     HL,HL
        DJNZ    LOOP1
        LD      D,0
        SRL     E
        JR      NC,CONT
        INC     C
CONT    ADD     HL,DE
BUFFER  LD      DE,VIDEO
        ADD     HL,DE
        SLA     C
        SLA     C
        SLA     C
INST0   LD      A,0
        ADD     A,C
        LD      (INST1+1),A
INST1   DEFB    0CBH
        DEFB    0
        RET
        COND    TYPE=TAPE
EHS     EQU     EHA
        ENDC
        COND    TYPE=DISK
FILES   DEFM    'LIMIT0/HSC'
        DEFB    0DH
EHS     LD      HL,FILES
        LD      DE,DCB
        LD      BC,13
        LDIR
        INIT    DCB,ERROR,SCRTIR,10*(10+6)
        JR      NC,EHS0
        POSN    DCB,ERROR,0
        CALL    EHA
        WRITLR  DCB,ERROR,TSCOR
        JR      EHS1
EHS0    POSN    DCB,ERROR,0
        READLR  DCB,ERROR,TSCOR
        LD      A,0C9H
        LD      (EHS),A
EHS1    CLOSE   DCB,ERROR
        DI
        RET
ERROR   JP      0
        ENDC
        COND    TYPE=PROT
EHS     CALL    READ
        LD      A,(TSCOR)
        OR      A
        JR      Z,EHS0
        LD      A,0C9H
        LD      (EHS),A
EHS1    DI
        RET
EHS0    CALL    EHA
        CALL    WRITE
        JR      EHS1
SEEK    LD      A,1
        LD      (37E1H),A
        LD      BC,4000H
        CALL    60H
        LD      A,0BH
        LD      (37ECH),A
        CALL    BUSY
        LD      A,3
        LD      (37EFH),A
        LD      A,1BH
        LD      (37ECH),A
        CALL    BUSY
        LD      DE,5348H
        LD      (37EDH),DE
        RET
READ    XOR     A
        LD      (TSCOR),A
        CALL    SEEK
        LD      HL,37ECH
        LD      DE,37EFH
        LD      BC,TSCOR
        LD      (HL),84H
        CALL    WAITK
        JR      RD1
RD0     XOR     1
        AND     81H
        JR      NZ,RD2
RD1     LD      A,(HL)
        BIT     1,A
        JR      Z,RD0
        LD      A,(DE)
        LD      (BC),A
        INC     BC
        JR      RD1
RD2     LD      A,(HL)
        LD      (HL),0D0H
        AND     7CH
        CP      60H
        RET
WRITE   CALL    SEEK
        LD      HL,37ECH
        LD      DE,37EFH
        LD      BC,TSCOR
        LD      (HL),0A7H
        CALL    WAITK
        JR      WR1
WR0     XOR     1
        AND     81H
        JR      NZ,WR2
WR1     LD      A,(HL)
        BIT     1,A
        JR      Z,WR0
        LD      A,(BC)
        LD      (DE),A
        INC     BC
        JR      WR1
WR2     LD      A,(HL)
        LD      (HL),0D0H
        AND     7CH
        RET
BUSY    CALL    WAITK
BUS0    LD      A,(37ECH)
        BIT     0,A
        JR      NZ,BUS0
        RET
WAITK   EX      (SP),HL
        EX      (SP),HL
        EX      (SP),HL
        EX      (SP),HL
        RET
        ENDC
EHA     LD      HL,TSCOR
        LD      DE,TSCOR+1
        LD      BC,10*(10+6)-1
        LD      (HL),0
        LDIR
        LD      HL,THS
        LD      DE,TSCOR
        LD      BC,16
        LDIR
        LD      A,0C9H
        LD      (EHS),A
        RET
THS     DEFM    'Yves L.   005360'
TADHS   DEFM    'HIGH  SCORES'
AFFHS   LD      HL,TADHS
        LD      DE,SCR+64+46
        LD      BC,12
        CALL    AFF1L
        LD      HL,SCR+128+42
        LD      B,20
AFH0    LD      (HL),8CH
        INC     HL
        DJNZ    AFH0
        LD      HL,SCR+64+41
        LD      DE,SCR+64+62
        LD      A,0BFH
        LD      B,12
AFH1    LD      (HL),A
        LD      (DE),A
        PUSH    BC
        LD      BC,64
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        POP     BC
        DJNZ    AFH1
        LD      B,22
        LD      HL,SCR+832+41
AFH2    LD      (HL),83H
        INC     HL
        DJNZ    AFH2
        LD      DE,SCR+192+43
        LD      HL,TSCOR
        LD      B,10
AFH3    LD      A,(HL)
        OR      A
        RET     Z
        PUSH    BC
        LD      B,10
AFH4    CALL    AFF1C
        INC     DE
        INC     HL
        DJNZ    AFH4
        LD      A,' '
        LD      (DE),A
        INC     DE
        XOR     A
        LD      (FL00),A
        CALL    AFF3C
        DEC     DE
        LD      A,(DE)
        INC     DE
        CP      80H
        JR      Z,AFH5
        LD      A,','
        LD      (DE),A
AFH5    INC     DE
        CALL    AFF3C
        POP     BC
        PUSH    HL
        LD      HL,46
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    AFH3
        RET
FL00    DEFB    0
AFF3C   LD      B,3
AHK0    LD      A,(HL)
        CP      '0'
        JR      Z,AHK3
AHK1    LD      (DE),A
        LD      A,1
        LD      (FL00),A
AHK2    INC     DE
        INC     HL
        DJNZ    AHK0
        RET
AHK3    LD      A,(FL00)
        OR      A
        JR      Z,AHK2
        LD      A,'0'
        JR      AHK1
BLK1    DEFW    VIDEO+192+43
BLK2    DEFW    0
BLKC    DEFB    0
BLKHS   LD      A,(BLKC)
        INC     A
        AND     0FH
        LD      (BLKC),A
        CALL    SOUND
        JR      Z,BLH0
        CP      4
        JR      Z,BLH3
        LD      BC,9
        JP      PAUSE
BLH0    LD      HL,(BLK1)
        CALL    BLH1
        LD      HL,(BLK2)
BLH1    LD      B,18
BLH2    LD      (HL),' '
        INC     HL
        BIT     0,L
        CALL    Z,SOUND
        DJNZ    BLH2
        RET
BLH3    LD      DE,(BLK1)
        CALL    BLH4
        LD      DE,(BLK2)
BLH4    LD      A,D
        OR      E
        RET     Z
        LD      HL,SCR-VIDEO
        ADD     HL,DE
        LD      BC,18
        LDIR
        JP      SOUND
DINSE   LD      HL,TSE
        LD      DE,3FC5H
        LD      BC,53
        JP      AFF1L
DINE    LD      HL,TE
        LD      DE,3FD3H
        LD      BC,27
        JP      AFF1L
TSE     DEFM    'Press <SPACE> for instructions, <ENTER> to start game.'
TE      DEFM    'Press <ENTER> to start game.'
TSP     DEFM    '<SPACE>'
TEN     DEFM    '<ENTER>'
AFFCEI  CALL    CLSSCR
        LD      DE,SCR+0D3H
AFC1    LD      B,11
        EXX
        LD      DE,38
        EXX
        LD      HL,TACEI
AFC2    LD      C,26
AFC3    CALL    AFF1C
        INC     HL
        INC     DE
        DEC     C
        JR      NZ,AFC3
        PUSH    DE
        EXX
        POP     HL
        ADD     HL,DE
        PUSH    HL
        EXX
        POP     DE
        DJNZ    AFC2
        RET
RECOP   LD      A,C
        LD      (REC0+2),A
REC0    LD      A,(IY+0)
        AND     (HL)
        EXX
        JR      Z,REC2
        LD      A,C
        ADD     A,3
        LD      (REC1+2),A
REC1    LD      A,(IY+0)
        OR      (HL)
        LD      (HL),A
        JR      REC4
REC2    LD      A,C
        ADD     A,6
        LD      (REC3+2),A
REC3    LD      A,(IY+0)
        AND     (HL)
        LD      (HL),A
REC4    EXX
        RET
DECHL   DEC     C
        RET     P
        LD      C,2
        PUSH    BC
        LD      BC,-64
        ADD     HL,BC
        POP     BC
        RET
SLIDE   LD      HL,DATA7
        CALL    CSOUND
        LD      IY,TRECA
        LD      HL,SCR+704+19
        LD      BC,28*256+2
        EXX
        LD      HL,VIDEO+704+19
        LD      C,2
        EXX
SLI0    PUSH    HL
        PUSH    BC
        EXX
        PUSH    HL
        PUSH    BC
        EXX
        LD      A,B
        ADD     A,5
        LD      B,A
        LD      D,6
SLI6    PUSH    HL
        PUSH    BC
        EXX
        PUSH    HL
        PUSH    BC
        EXX
        LD      E,D
SLI2    PUSH    HL
        PUSH    BC
        EXX
        PUSH    HL
        PUSH    BC
        EXX
        LD      B,25
SLI3    PUSH    BC
        CALL    RECOP
        EXX
        INC     HL
        EXX
        INC     HL
        POP     BC
        DJNZ    SLI3
        CALL    SOUND
        EXX
        POP     BC
        POP     HL
        CALL    DECHL
        EXX
        POP     BC
        POP     HL
        DEC     E
        JR      Z,SLI4
SLI1    DJNZ    SLI2
        JR      SLI5
SLI4    CALL    DECHL
        LD      E,6
        JR      SLI1
SLI5    EXX
        POP     BC
        POP     HL
        EXX
        POP     BC
        POP     HL
        DEC     D
        LD      A,D
        CP      1
        JR      NZ,SLI6
        EXX
        POP     BC
        POP     HL
        CALL    DECHL
        EXX
        POP     BC
        POP     HL
        CALL    DECHL
        LD      A,(387FH)
        OR      A
        JR      NZ,SLIDX
        DJNZ    SLI0
SLIDX   CALL    AFF
        RET
TRECA   DEFB    3
        DEFB    0CH
        DEFB    030H
        DEFB    83H
        DEFB    8CH
        DEFB    0B0H
        DEFB    0BCH
        DEFB    0B3H
        DEFB    8FH
ALEA    LD      BC,100H
ALE0    CALL    RND
        AND     0FCH
        LD      E,A
        CALL    RND
        AND     3
        LD      D,A
ALE1    LD      HL,SCR
        ADD     HL,DE
        LD      A,(HL)
        OR      A
        JR      Z,ALE2
        CALL    ASQU
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,ALE0
        LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
ALE2    LD      HL,12
        ADD     HL,DE
        EX      DE,HL
        LD      A,D
        AND     3
        LD      D,A
        JR      ALE1
ASQU    PUSH    DE
        POP     HL
        ADD     HL,HL
        ADD     HL,HL
        LD      D,H
        LD      A,E
        RRCA
        RRCA
        AND     0FH
        LD      E,A
        CALL    SQUARE
        RET
SPIRE   LD      L,1
        LD      DE,0FFH
        LD      C,10H
SPIR1   LD      B,C
SPIR2   LD      A,E
        ADD     A,L
        LD      E,A
        CALL    SQUARE
        DJNZ    SPIR2
        DEC     C
        JR      Z,SPIR4
        LD      B,C
SPIR3   LD      A,D
        ADD     A,L
        LD      D,A
        CALL    SQUARE
        DJNZ    SPIR3
        LD      A,L
        NEG
        LD      L,A
        JR      SPIR1
SPIR4   LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
SQUARE  PUSH    DE
        EXX
        POP     DE
        LD      L,D
        LD      H,0
        LD      B,6
SQU0    ADD     HL,HL
        DJNZ    SQU0
        SLA     E
        SLA     E
        LD      D,0
        ADD     HL,DE
        PUSH    HL
        POP     BC
        LD      HL,VIDEO
        ADD     HL,BC
        EX      DE,HL
        LD      HL,SCR
        ADD     HL,BC
        LD      B,4
SQU1    LD      A,(HL)
        LD      (DE),A
        LD      (HL),0
        INC     HL
        INC     DE
        DJNZ    SQU1
        EXX
        CALL    SON1
        RET
SON1    PUSH    DE
        EXX
        POP     DE
        SRL     E
        INC     E
        SLA     D
        INC     D
        LD      C,10H
SOS     LD      A,1
        OUT     (255),A
        LD      B,E
        DJNZ    $
        LD      A,0
        OUT     (255),A
        LD      B,D
        DJNZ    $
        DEC     C
        JR      NZ,SOS
        EXX
        RET
DLINE   LD      HL,(YA)
        LD      DE,(YB)
        CALL    LINE
        LD      A,(X)
        LD      E,A
        LD      A,(Y)
        LD      D,A
        CALL    SON1
        RET
ZIG     LD      DE,0FF00H
        LD      C,0FFH
        JR      ZIG0
ZIG1    LD      B,63
ZIG2    LD      A,E
        ADD     A,C
        LD      E,A
        CALL    ZIG3
        DJNZ    ZIG2
ZIG0    LD      A,D
        INC     A
        CP      16
        RET     Z
        LD      D,A
        LD      A,C
        NEG
        LD      C,A
        CALL    ZIG3
        JR      ZIG1
ZIG3    PUSH    DE
        EXX
        POP     DE
        LD      L,D
        LD      H,0
        LD      B,6
ZIG4    ADD     HL,HL
        DJNZ    ZIG4
        LD      D,0
        ADD     HL,DE
        PUSH    HL
        POP     BC
        LD      HL,VIDEO
        ADD     HL,BC
        EX      DE,HL
        LD      HL,SCR
        ADD     HL,BC
        LD      A,(HL)
        LD      (DE),A
        EXX
        PUSH    DE
        SRL     E
        SRL     D
        CALL    SON1
        POP     DE
        RET
SCAN    LD      HL,1F0FH
        LD      (YA),HL
        LD      HL,2000H
        LD      (YB),HL
SCA0    CALL    DLINE
        LD      A,(XB)
        CP      63
        JR      Z,SCA1
        INC     A
        LD      (XB),A
        LD      A,(XA)
        DEC     A
        LD      (XA),A
        JR      SCA0
SCA1    CALL    DLINE
        LD      A,(YB)
        CP      15
        JR      Z,SCA2
        INC     A
        LD      (YB),A
        LD      A,(YA)
        DEC     A
        LD      (YA),A
        JR      SCA1
SCA2    CALL    DLINE
        LD      A,(XB)
        CP      32
        RET     Z
        DEC     A
        LD      (XB),A
        LD      A,(XA)
        INC     A
        LD      (XA),A
        JR      SCA2
HGRILL  LD      HL,0
        LD      (YA),HL
        LD      HL,3FCH
        LD      (YB),HL
        LD      B,16
HGR0    PUSH    BC
        LD      B,8
HGR1    PUSH    BC
        LD      DE,(YA)
        CALL    ASQU
        LD      DE,(YB)
        CALL    ASQU
        LD      HL,(YA)
        LD      DE,128
        ADD     HL,DE
        LD      (YA),HL
        LD      HL,(YB)
        LD      DE,-128
        ADD     HL,DE
        LD      (YB),HL
        POP     BC
        DJNZ    HGR1
        LD      HL,(YA)
        LD      DE,-1020
        ADD     HL,DE
        LD      (YA),HL
        LD      HL,(YB)
        LD      DE,1020
        ADD     HL,DE
        LD      (YB),HL
        POP     BC
        DJNZ    HGR0
        LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
GRILL   LD      HL,0
        LD      (YA),HL
        LD      HL,3FCH
        LD      (YB),HL
        LD      B,128
GRI0    PUSH    BC
        LD      DE,(YA)
        CALL    ASQU
        LD      DE,(YB)
        CALL    ASQU
        LD      HL,(YA)
        LD      DE,8
        ADD     HL,DE
        LD      (YA),HL
        LD      HL,(YB)
        LD      DE,-8
        ADD     HL,DE
        LD      (YB),HL
        POP     BC
        DJNZ    GRI0
        LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
RADAR   LD      HL,1F07H
        LD      (YA),HL
        LD      HL,1F00H
        LD      (YB),HL
RAD0    CALL    DLINE
        LD      A,(XB)
        CP      63
        JR      Z,RAD1
        INC     A
        LD      (XB),A
        JR      RAD0
RAD1    CALL    DLINE
        LD      A,(YB)
        CP      15
        JR      Z,RAD2
        INC     A
        LD      (YB),A
        JR      RAD1
RAD2    CALL    DLINE
        LD      A,(XB)
        OR      A
        JR      Z,RAD3
        DEC     A
        LD      (XB),A
        JR      RAD2
RAD3    CALL    DLINE
        LD      A,(YB)
        OR      A
        JR      Z,RAD4
        DEC     A
        LD      (YB),A
        JR      RAD3
RAD4    CALL    DLINE
        LD      A,(XB)
        CP      31
        RET     Z
        INC     A
        LD      (XB),A
        JR      RAD4
YA      DEFB    0
XA      DEFB    0
YB      DEFB    0
XB      DEFB    0
LINE    LD      (Y),HL
        CALL    PLOT
        PUSH    DE
        LD      A,H
        CP      D
        JR      NC,LIN0
        LD      D,1
        JR      LIN1
LIN0    LD      D,0FFH
LIN1    LD      A,L
        CP      E
        JR      NC,LIN2
        LD      E,1
        JR      LIN3
LIN2    LD      E,0FFH
LIN3    POP     BC
        LD      A,H
        SUB     B
        JP      P,LIN4
        NEG
LIN4    LD      H,A
        LD      A,L
        SUB     C
        JP      P,LIN5
        NEG
LIN5    LD      L,A
        LD      A,H
        CP      L
        JR      C,LIN6
        JR      Z,LIN6
        SRL     A
        LD      C,A
        LD      B,H
LIN7    LD      A,(X)
        ADD     A,D
        LD      (X),A
        LD      A,C
        ADD     A,L
        LD      C,A
        CP      H
        JR      C,LIN8
        SUB     H
        LD      C,A
        LD      A,(Y)
        ADD     A,E
        LD      (Y),A
LIN8    CALL    PLOT
        DJNZ    LIN7
        RET
LIN6    LD      A,L
        SRL     A
        LD      C,A
        LD      B,L
LIN9    LD      A,(Y)
        ADD     A,E
        LD      (Y),A
        LD      A,C
        ADD     A,H
        LD      C,A
        CP      L
        JR      C,LIN10
        SUB     L
        LD      C,A
        LD      A,(X)
        ADD     A,D
        LD      (X),A
LIN10   CALL    PLOT
        DJNZ    LIN9
        RET
Y       DEFB    0
X       DEFB    0
PLOT    EXX
        LD      A,(Y)
        LD      L,A
        LD      H,0
        LD      B,6
PLO0    ADD     HL,HL
        DJNZ    PLO0
        LD      A,(X)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        PUSH    HL
        POP     BC
        LD      HL,VIDEO
        ADD     HL,BC
        EX      DE,HL
        LD      HL,SCR
        ADD     HL,BC
        LD      A,(HL)
        LD      (DE),A
        EXX
        RET
RND     LD      A,R
        ADD     A,C
        RRCA
        LD      L,A
        AND     2
        SRL     A
        LD      H,A
        ADD     A,(HL)
        RRCA
        ADD     A,(HL)
        SRL     A
        SUB     (HL)
        ADD     A,E
        RRCA
        ADD     A,C
        RET
AFFEXP  CALL    CLSSCR
        CALL    AFFHS
        LD      DE,SCR+128+4
AFP1    LD      B,12
        LD      HL,TAEXP
AFP2    PUSH    DE
AFP3    LD      A,(HL)
        INC     HL
        CP      '%'
        JR      Z,AFP4
        DEC     HL
        CALL    AFF1C
        INC     HL
        INC     DE
        JR      AFP3
AFP4    POP     DE
        PUSH    HL
        LD      HL,64
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    AFP2
        LD      HL,SCR+64+14
        LD      DE,SCR+192+14
        LD      B,14
        LD      A,83H
AFSDF   LD      (HL),8CH
        LD      (DE),A
        INC     HL
        INC     DE
        DJNZ    AFSDF
        LD      A,0BCH
        LD      (SCR+64+14),A
        LD      (SCR+64+27),A
        LD      A,0BFH
        LD      (SCR+128+14),A
        LD      (SCR+128+27),A
        LD      HL,TSHP1
        LD      DE,SCR+512+6
        LD      BC,28
        LDIR
        LD      A,0A6H
        LD      (SCR+512+6),A
        RET
TAEXP   DEFM    '            LIMIT ZERO%'
        DEFM    '%'
        DEFM    '        By  Yves Lempereur%'
        DEFM    'Copyright (C) 1982  by  MICRO 2000%'
        DEFM    '%'
        DEFM    '    Destroy aliens to survive.%'
        DEFM    '      10      20      30      100%'
        DEFM    '%'
        DEFM    'Use arrows or < > to move the ship%'
        DEFM    'and press "SPACEBAR" key  to fire.%'
        DEFM    'An  extra ship  is awarded at each%'
        DEFM    '2000 pts. Good luck...%'
TSHP1   DEFW    0BFAEH
        DEFW    84BFH
        DEFM    '10  '
        DEFW    9BA7H
        DEFW    85B3H
        DEFM    '20  '
        DEFW    0B78CH
        DEFW    849DH
        DEFM    '30  '
        DEFW    0B798H
        DEFW    909DH
TSHP2   DEFW    0BFAEH
        DEFW    84BFH
        DEFM    '10  '
        DEFW    0BBA7H
        DEFW    85B3H
        DEFM    '20  '
        DEFW    0B78CH
        DEFW    849DH
        DEFM    '30  '
        DEFW    0B789H
        DEFW    819DH
CSHP    DEFB    9
AFFSHP  LD      HL,CSHP
        DEC     (HL)
        JR      NZ,AFS1
        LD      (HL),9
        LD      HL,TSHP1
        JR      AFS2
AFS1    LD      A,(HL)
        CP      5
        JR      NZ,AFSH2
        LD      HL,TSHP2
AFS2    LD      DE,VIDEO+512+6
        LD      BC,28
        LDIR
        CALL    SOUND
AFSH2   LD      D,25
        LD      E,13
        LD      A,(POSPF)
        PUSH    DE
        ADD     A,E
        LD      E,A
        CALL    SET
        POP     DE
        LD      HL,POSPF
        LD      A,(POSPF0)
        ADD     A,(HL)
        LD      (HL),A
        JR      Z,AFSH6
        CP      4
        JR      NZ,AFSH7
AFSH6   LD      A,(POSPF0)
        NEG
        LD      (POSPF0),A
AFSH7   LD      A,(HL)
        ADD     A,E
        LD      E,A
        CALL    RESET
        RET
POSPF   DEFB    0
POSPF0  DEFB    1
PAUSE   DEC     BC
        LD      A,B
        OR      C
        JR      NZ,PAUSE
        RET
PROCEI  CALL    AFFPOI
        LD      HL,DATA6
        CALL    CSOUND
        CALL    DINSE
        LD      B,6EH
PRC     PUSH    BC
        LD      HL,3FCBH
        CALL    EFF7C
        LD      HL,3FE5H
        CALL    EFF7C
        CALL    SOUND
        LD      D,4
PRC0    LD      BC,78H
PRC1    CALL    INKSE
        CALL    SOUND
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,PRC1
        PUSH    DE
        CALL    AFFPOI
        CALL    SOUND
        POP     DE
        DEC     D
        JR      NZ,PRC0
        LD      HL,TSP
        LD      DE,3FCBH
        LD      BC,7
        LDIR
        LD      HL,TEN
        LD      DE,3FE5H
        LD      BC,7
        LDIR
        CALL    SOUND
        LD      D,4
PRC2    LD      BC,78H
PRC3    CALL    INKSE
        CALL    SOUND
        DEC     BC
        LD      A,C
        OR      B
        JR      NZ,PRC3
        PUSH    DE
        CALL    AFFPOI
        CALL    SOUND
        POP     DE
        DEC     D
        JR      NZ,PRC2
        POP     BC
        DJNZ    PRC
        RET
EFF7C   LD      B,7
EFU     LD      (HL),80H
        INC     HL
        DJNZ    EFU
        RET
PROEXP  CALL    AFFPOI
        LD      HL,DATA6
        CALL    CSOUND
        CALL    SOUND
        LD      B,9AH
PRE0    PUSH    BC
        LD      HL,3FD9H
        CALL    EFF7C
        LD      D,4
PRE1    LD      BC,0C8H
PRE2    CALL    INKE
        CALL    SOUND
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,PRE2
        PUSH    DE
        CALL    AFFPOI
        CALL    BLKHS
        CALL    SOUND
        CALL    AFFSHP
        POP     DE
        DEC     D
        JR      NZ,PRE1
        CALL    DINE
        LD      D,4
PRE3    LD      BC,0C8H
PRE4    CALL    INKE
        CALL    SOUND
        DEC     BC
        LD      A,C
        OR      B
        JR      NZ,PRE4
        PUSH    DE
        CALL    AFFPOI
        CALL    BLKHS
        CALL    SOUND
        CALL    AFFSHP
        POP     DE
        DEC     D
        JR      NZ,PRE3
        POP     BC
        DJNZ    PRE0
        RET
HJINK   DEFB    1
INKSE   LD      A,(3840H)
        AND     81H
        JR      Z,INS0
        EX      AF,AF'
        LD      A,(HJINK)
        OR      A
        LD      A,3
        LD      (HJINK),A
        RET     NZ
        EX      AF,AF'
        JR      INS1
INS0    LD      A,(HJINK)
        DEC     A
        RET     M
        LD      (HJINK),A
        RET
INS1    CP      1
        JR      Z,INS2
        POP     BC
        POP     BC
        RET
INS2    LD      SP,STACK
        XOR     A
        LD      (COUNTS),A
        JP      STRT0
INKE    LD      A,(3840H)
        AND     1
        RET     Z
        JR      INS2
AFF1L   CALL    AFF1C
        DEC     BC
        INC     HL
        INC     DE
        LD      A,B
        OR      C
        JR      NZ,AFF1L
        RET
AFF1C   LD      A,(HL)
        CP      60H
        JR      C,AFF1C2
        CP      80H
        JR      NC,AFF1C2
        PUSH    HL
        LD      HL,LOWER1
        DEC     (HL)
        POP     HL
        JR      NZ,AFF1C1
        LD      A,(VIDEO)
        PUSH    AF
        LD      A,0C0H
        LD      (VIDEO),A
        LD      A,(VIDEO)
        CP      0C0H
        LD      A,0E0H
        JR      NZ,AFF1C0
        XOR     A
AFF1C0  LD      (LOWER0),A
        POP     AF
        LD      (VIDEO),A
        LD      A,(HL)
AFF1C1  PUSH    HL
        LD      HL,LOWER0
        ADD     A,(HL)
        POP     HL
AFF1C2  LD      (DE),A
        RET
LOWER0  DEFB    0
LOWER1  DEFB    1
SOUND   PUSH    HL
        PUSH    AF
        LD      A,(COUNTS)
        OR      A
        JR      Z,SOUND3
        LD      HL,STATE
        LD      A,(HL)
        OR      A
        INC     HL
        JR      NZ,SOUND1
        DEC     (HL)
        JR      NZ,SOUND4
        LD      A,2
        LD      (STATE),A
SOUND0  OUT     (255),A
        JR      SOUND4
SOUND1  INC     HL
        DEC     (HL)
        JR      NZ,SOUND4
        XOR     A
        LD      (STATE),A
        INC     A
SOUND2  OUT     (255),A
        INC     HL
        DEC     (HL)
        JR      Z,SOUND5
        LD      HL,(ADDSON)
        LD      A,(HL)
        AND     3FH
        LD      (LOCOU),A
        LD      (HICOU),A
        JR      SOUND4
SOUND3  PUSH    BC
        LD      B,6
        DJNZ    $
        POP     BC
SOUND4  POP     AF
        POP     HL
        RET
SOUND5  LD      HL,(ADDSON)
        INC     HL
        INC     HL
SOUND6  LD      (ADDSON),HL
        LD      A,(HL)
        OR      A
        JP      P,SOUND7
        LD      HL,0
        LD      (SOUND0),HL
        LD      (SOUND2),HL
        JR      SOUND8
SOUND7  LD      HL,0FFD3H
        LD      (SOUND0),HL
        LD      (SOUND2),HL
SOUND8  AND     3FH
        LD      (LOCOU),A
        LD      (HICOU),A
        LD      HL,(ADDSON)
        INC     HL
        LD      A,(HL)
        LD      (COUNTS),A
        JR      SOUND4
CSOUND  LD      DE,SOUND9
        PUSH    DE
        PUSH    DE
        PUSH    DE
        JR      SOUND6
SOUND9  LD      A,1
        OUT     (255),A
        RET
STATE   DEFB    0
LOCOU   DEFB    0
HICOU   DEFB    0
COUNTS  DEFB    0
ADDSON  DEFW    0
NOMPLA  CALL    SCR191
        CALL    DISPL
        CALL    CLSSCR
        LD      HL,TNPLA
        LD      DE,SCR+200H
        LD      BC,29
        CALL    AFF1L
        CALL    DISPL
        LD      E,10H
NOM0    LD      BC,0
NOM1    LD      A,(3810H)
        BIT     1,A
        JR      NZ,NOM2
        BIT     2,A
        JR      NZ,NOM3
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,NOM1
        DEC     E
        JR      NZ,NOM0
        JP      START
NOM2    LD      A,1
        LD      (NPLAY),A
        JR      NOM4
NOM3    LD      A,2
        LD      (NPLAY),A
NOM4    XOR     A
        LD      (DEMO),A
        RET
TNPLA   DEFM    'How many players (1 or 2) ? '
        DEFB    5FH
START   DI
        LD      SP,STACK
        LD      A,1
        LD      (37E4H),A
        XOR     A
        LD      (COUNTS),A
        CALL    EHS
        CALL    SCR191
        CALL    DISPL
        CALL    AFFCEI
        CALL    CLSMSC
        CALL    DISPL
        CALL    AFFCEI
        CALL    SLIDE
        CALL    PROCEI
        XOR     A
        LD      (COUNTS),A
        CALL    EFFPOI
        CALL    AFFEXP
        CALL    BREAKF
        CALL    PROEXP
        XOR     A
        LD      (COUNTS),A
        LD      A,1
        LD      (DEMO),A
        JR      STRT1
STRT0   CALL    EFFPOI
        CALL    NOMPLA
STRT1   CALL    CLSVID
        CALL    COMMOD
        JP      BEGIN
FILL    OR      A
        JR      Z,FIL1
        CP      1
        JR      Z,FIL0
        EXX
        LD      BC,83BFH
        EXX
        LD      BC,0B0BFH
        RET
FIL0    EXX
        LD      BC,8CBCH
        EXX
        LD      BC,8C8FH
        RET
FIL1    EXX
        LD      BC,0B0B0H
        EXX
        LD      BC,8383H
        RET
SREG    LD      HL,VIDEO+960
        LD      BC,-64
        EXX
        LD      HL,VIDEO
        LD      BC,64
        LD      A,(PYH)
SRE1    OR      A
        JR      Z,SRE0
        EXX
        ADD     HL,BC
        EXX
        ADD     HL,BC
        DEC     A
        JR      SRE1
SRE0    EXX
        EX      DE,HL
        LD      HL,63
        ADD     HL,DE
        EX      DE,HL
        EXX
        EX      DE,HL
        LD      HL,63
        ADD     HL,DE
        EX      DE,HL
        RET
BREAKF  LD      A,31
        LD      (PX),A
        LD      A,7
        LD      (PYH),A
        LD      A,2
        LD      (PYL),A
BRF0    CALL    AFSQ
        LD      A,0A0H
        LD      (FORME),A
        LD      A,(PX)
        LD      (FREQ),A
        LD      HL,100
        LD      (DUREE),HL
        CALL    SSON
        CALL    AFSCQ
        LD      A,(PX)
        DEC     A
        LD      (PX),A
        LD      A,(PYL)
        DEC     A
        LD      (PYL),A
        JP      P,BRF0
        LD      A,2
        LD      (PYL),A
        LD      A,(PYH)
        DEC     A
        LD      (PYH),A
        JP      P,BRF0
        CALL    AFF
        RET
PX      DEFB    0
PYH     DEFB    0
PYL     DEFB    0
DROP    LD      B,A
        EX      DE,HL
        CALL    DRP
        EX      DE,HL
DRP     LD      A,B
        BIT     7,(HL)
        JR      Z,DRP0
        LD      A,C
        XOR     3FH
        AND     (HL)
        OR      B
DRP0    LD      (HL),A
        RET
DRUP    LD      A,(HL)
        BIT     7,A
        JR      Z,DRU0
        AND     B
DRU1    LD      (DE),A
        RET
DRU0    LD      A,B
        CP      0BFH
        LD      A,80H
        JR      NZ,DRU1
        LD      A,(HL)
        JR      DRU1
FULL    LD      A,(PYL)
        OR      A
        JR      Z,FUL1
        CP      1
        JR      Z,FUL0
        EXX
        LD      B,83H
        EXX
        LD      B,0B0H
        RET
FUL0    EXX
        LD      B,8FH
        EXX
        LD      B,0BCH
        RET
FUL1    EXX
        LD      B,0BFH
        EXX
        LD      B,0BFH
        RET
AFSQ    CALL    SREG
        LD      A,(PYL)
        CALL    FILL
        LD      A,(PX)
ASQ1    OR      A
        JR      Z,ASQ0
        PUSH    AF
        EXX
        LD      A,B
        CALL    DROP
        INC     HL
        DEC     DE
        EXX
        LD      A,B
        CALL    DROP
        INC     HL
        DEC     DE
        POP     AF
        DEC     A
        JR      ASQ1
ASQ0    EXX
        LD      A,C
        CALL    DROP
        EXX
        LD      A,C
        CALL    DROP
        LD      A,(PYH)
ASQ2    OR      A
        RET     Z
        PUSH    AF
        EXX
        LD      BC,64
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        LD      A,0BFH
        LD      (HL),A
        LD      (DE),A
        EXX
        LD      BC,-64
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        LD      A,0BFH
        LD      (HL),A
        LD      (DE),A
        POP     AF
        DEC     A
        JR      ASQ2
AFSCQ   CALL    SREG
        CALL    FULL
        LD      A,2
ASC0A   PUSH    AF
        EXX
        PUSH    HL
        LD      HL,SCR-VIDEO
        ADD     HL,DE
        LD      A,(PX)
ASC1A   PUSH    AF
        CALL    DRUP
        DEC     HL
        DEC     DE
        POP     AF
        DEC     A
        JR      NZ,ASC1A
        POP     DE
        LD      HL,SCR-VIDEO
        ADD     HL,DE
        LD      A,(PX)
ASC2A   PUSH    AF
        CALL    DRUP
        INC     HL
        INC     DE
        POP     AF
        DEC     A
        JR      NZ,ASC2A
        POP     AF
        DEC     A
        JR      NZ,ASC0A
        LD      HL,VIDEO+63
        LD      A,(PX)
        LD      E,A
        LD      D,0
        OR      A
        SBC     HL,DE
        EX      DE,HL
        LD      HL,SCR-VIDEO
        ADD     HL,DE
        EXX
        LD      HL,VIDEO
        LD      A,(PX)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        EX      DE,HL
        LD      HL,SCR-VIDEO
        ADD     HL,DE
        LD      A,17
ASC0    DEC     A
        RET     Z
        PUSH    AF
        EXX
        LD      A,(HL)
        LD      (DE),A
        LD      BC,64
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        EXX
        LD      A,(HL)
        LD      (DE),A
        LD      BC,64
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        POP     AF
        JR      ASC0
FORME   DEFB    0
FREQ    DEFB    0
DUREE   DEFW    0
SSON    PUSH    AF
        PUSH    BC
        PUSH    HL
SSO0    LD      A,(FORME)
        RLCA
        LD      (FORME),A
        AND     1
        OUT     (255),A
        LD      A,(FREQ)
        LD      B,A
        DJNZ    $
        LD      HL,(DUREE)
        DEC     HL
        LD      (DUREE),HL
        LD      A,H
        OR      L
        JR      NZ,SSO0
        POP     HL
        POP     BC
        POP     AF
        RET
