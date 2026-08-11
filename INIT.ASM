        COND    TYPE=DISK
WRITHS  LD      HL,FILES
        LD      DE,DCB
        LD      BC,13
        LDIR
        OPEN    DCB,ERROR,SCRTIR,10*(10+6)
        POSN    DCB,ERROR,0
        WRITLR  DCB,ERROR,TSCOR
        CLOSE   DCB,ERROR
        DI
        RET
        ENDC
        COND    TYPE=PROT
WRITHS  CALL    WRITE
        RET
        ENDC
SCHST   LD      IY,TSCOR
        CALL    SCOR12
        LD      B,5
        XOR     A
SCH0    OR      (HL)
        INC     HL
        DJNZ    SCH0
        CP      '0'
        RET     Z
        LD      B,10
SCH1    LD      C,10
        CALL    SCOR12
SCH2    LD      A,C
        LD      (SCH3+2),A
SCH3    LD      A,(IY+0)
        CP      (HL)
        JR      C,SCH5
        JR      NZ,SCH4
        INC     HL
        INC     C
        LD      A,C
        CP      16
        JR      NZ,SCH2
SCH4    LD      DE,16
        ADD     IY,DE
        DJNZ    SCH1
        RET
SCH5    PUSH    IY
        LD      A,B
        LD      (SVPL+1),A
        CP      1
        JR      Z,SCH7
        LD      HL,0
        LD      DE,16
        DEC     B
SCH6    ADD     HL,DE
        DJNZ    SCH6
        PUSH    HL
        POP     BC
        LD      HL,TSCOR+9*(10+6)-1
        LD      DE,TSCOR+10*(10+6)-1
        LDDR
SCH7    CALL    SCOR12
        POP     DE
        PUSH    DE
        LD      BC,10
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        LD      BC,6
        LDIR
SVPL    LD      B,0
        LD      HL,VIDEO+832+43
        LD      DE,-64
SCH8    ADD     HL,DE
        DJNZ    SCH8
        LD      IX,BLK1
        LD      A,(PLAY)
        CP      1
        JR      NZ,SCH9
        LD      IX,BLK2
SCH9    LD      (IX),L
        LD      (IX+1),H
        POP     HL
        LD      A,(PLAY)
        LD      B,A
        JP      INGS
SVHL    DEFW    0
SVBC    DEFW    0
WAITER  DEFW    0
INGS    PUSH    HL
        PUSH    BC
        LD      (SVBC),BC
        LD      (SVHL),HL
        LD      B,10
ING5    LD      (HL),' '
        INC     HL
        DJNZ    ING5
        LD      A,1
        LD      (EDIS),A
        LD      HL,15000
        LD      (WAITER),HL
        CALL    CLSSCR
        XOR     A
        LD      (BLINK),A
        CALL    DSCORE
        CALL    DHSCOR
        CALL    AFFHS
        LD      A,' '
        LD      (SCR+20),A
        LD      (SCR+21),A
        CALL    SCRVID
        LD      HL,TAGS
        LD      DE,VIDEO+192+14
ING0    LD      A,(HL)
        INC     HL
        OR      A
        JR      Z,ING1
        DEC     HL
        CALL    AFF1C
        INC     HL
        INC     DE
        JR      ING0
ING1    LD      A,(HL)
        CP      0FFH
        JR      Z,ING2
        LD      C,A
        LD      B,0
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        INC     HL
        JR      ING0
ING2    POP     BC
        LD      A,B
        LD      HL,VIDEO+10
        LD      B,'<'
        CP      1
        JR      Z,ING3
        LD      A,'2'
        LD      B,'>'
        LD      HL,VIDEO+42
        LD      (VIDEO+192+24),A
ING3    LD      A,10
ING4    LD      (HL),B
        INC     HL
        DEC     A
        JR      NZ,ING4
        POP     IX
        LD      B,0
        LD      HL,(BLK1)
        LD      A,(PLAY)
        CP      1
        JR      NZ,INGH
        LD      HL,(BLK2)
INGH    DEC     HL
        LD      (HL),'>'
        INC     HL
        CALL    2BH
ING6    LD      (HL),8FH
ING7    CALL    2BH
        OR      A
        JR      NZ,INGI
INGI0   DEC     A
        JR      NZ,INGI0
        LD      DE,(WAITER)
        DEC     DE
        LD      (WAITER),DE
        LD      A,E
        OR      D
        JR      Z,INGI1
        LD      A,E
        OR      A
        JR      Z,INGI2
        CP      80H
        JR      NZ,INGI3
        LD      A,' '
        LD      (VIDEO+192+24),A
INGI3   LD      A,E
        AND     7FH
        CP      10
        JR      Z,INGI4
        CP      74
        JR      NZ,ING7
        LD      A,8FH
        JR      INGI5
INGI4   LD      A,' '
INGI5   LD      (HL),A
        JR      ING7
INGI2   LD      A,(PLAY)
        ADD     A,'0'
        LD      (VIDEO+192+24),A
        JR      INGI3
INGI    CP      24
        JR      Z,ING9
        CP      0DH
        JR      NZ,INGL
INGI1   LD      (HL),' '
        RET
INGL    CP      8
        JR      Z,ING8
        CP      ' '
        JR      C,ING6
        EX      AF,AF'
        LD      A,B
        CP      10
        JR      Z,ING6
        EX      AF,AF'
        LD      (IX),A
        LD      (HL),A
        INC     HL
        INC     B
        INC     IX
        JR      ING6
ING8    LD      A,B
        OR      A
        JR      Z,ING6
        LD      (HL),' '
        DEC     IX
        DEC     HL
        LD      (IX),' '
        DEC     B
        JR      ING6
ING9    LD      HL,(SVHL)
        LD      BC,(SVBC)
        JP      INGS
TAGS    DEFM    '** Player 1 **'
        DEFB    0
        DEFB    114
        DEFW    0A3B7H
        DEFW    0B791H
        DEFW    90BBH
        DEFW    0B3B7H
        DEFW    0BA81H
        DEFW    95B3H
        DEFW    0B783H
        DEFB    81H
        DEFB    0
        DEFB    49
        DEFW    8C8FH
        DEFW    8F85H
        DEFW    8580H
        DEFW    8C8FH
        DEFW    8F84H
        DEFW    8580H
        DEFW    8F80H
        DEFB    80H
        DEFB    0
        DEFB    49
        DEFW    0B3B7H
        DEFW    0B791H
        DEFW    8583H
        DEFW    0A397H
        DEFW    0B795H
        DEFW    90BBH
        DEFW    0B3B7H
        DEFB    81H
        DEFB    0
        DEFB    49
        DEFW    8E8CH
        DEFW    8F85H
        DEFW    858CH
        DEFW    8E8DH
        DEFW    8F85H
        DEFW    8580H
        DEFW    8C8FH
        DEFB    84H
        DEFB    0
        DEFB    113
        DEFM    'Please   enter'
        DEFB    0
        DEFB    50
        DEFM    'your  name  or'
        DEFB    0
        DEFB    50
        DEFM    '   initials   '
        DEFB    0
        DEFB    0FFH
TAB     DEFW    3C00H+192+5
        DEFM    'Distributed by'
        DEFB    0
        DEFW    3C00H+512+41
        DEFM    'M I C R O   2 0 0 0'
        DEFB    0
        DEFW    3C00H+576+41
        DEFM    'Av. Tervueren 44-46'
        DEFB    0
        DEFW    3C00H+640+43
        DEFM    '1040   Brussels'
        DEFB    0
        DEFW    3C00H+704+42
        DEFM    'Tel. 02/733 65 40'
        DEFB    0
        DEFW    3C00H+768+42
        DEFM    'Belgium    Europe'
        DEFB    1
M2000   DEFW    25<8+46
        DEFW    24<8+47
        DEFW    23<8+48
        DEFW    22<8+49
        DEFW    21<8+50
        DEFW    20<8+51
        DEFW    19<8+52
        DEFW    18<8+53
        DEFW    19<8+53
        DEFW    20<8+53
        DEFW    21<8+53
        DEFW    22<8+53
        DEFW    21<8+54
        DEFW    20<8+55
        DEFW    19<8+56
        DEFW    18<8+57
        DEFW    19<8+57
        DEFW    20<8+57
        DEFW    21<8+57
        DEFW    22<8+57
        DEFW    18<8+59
        DEFW    19<8+59
        DEFW    20<8+59
        DEFW    21<8+59
        DEFW    22<8+59
        DEFW    18<8+66
        DEFW    18<8+65
        DEFW    18<8+64
        DEFW    18<8+63
        DEFW    18<8+62
        DEFW    19<8+61
        DEFW    20<8+61
        DEFW    21<8+61
        DEFW    22<8+62
        DEFW    22<8+63
        DEFW    22<8+64
        DEFW    22<8+65
        DEFW    22<8+68
        DEFW    21<8+68
        DEFW    20<8+68
        DEFW    19<8+68
        DEFW    18<8+69
        DEFW    18<8+70
        DEFW    18<8+71
        DEFW    18<8+72
        DEFW    19<8+73
        DEFW    20<8+72
        DEFW    20<8+71
        DEFW    20<8+70
        DEFW    21<8+71
        DEFW    22<8+72
        DEFW    19<8+75
        DEFW    18<8+76
        DEFW    18<8+77
        DEFW    18<8+78
        DEFW    18<8+79
        DEFW    19<8+80
        DEFW    20<8+80
        DEFW    21<8+80
        DEFW    22<8+79
        DEFW    22<8+78
        DEFW    22<8+77
        DEFW    22<8+76
        DEFW    21<8+75
        DEFW    20<8+75
        DEFW    15<8+44         ;2000
        DEFW    14<8+45
        DEFW    14<8+46
        DEFW    14<8+47
        DEFW    14<8+48
        DEFW    14<8+49
        DEFW    14<8+50
        DEFW    15<8+50
        DEFW    16<8+49
        DEFW    17<8+48
        DEFW    18<8+47
        DEFW    19<8+46
        DEFW    20<8+45
        DEFW    21<8+44
        DEFW    22<8+43
        DEFW    23<8+42
        DEFW    24<8+41
        DEFW    25<8+40
        DEFW    26<8+40
        DEFW    26<8+41
        DEFW    26<8+42
        DEFW    26<8+43
        DEFW    26<8+44
        DEFW    26<8+45
        DEFW    16<8+58
        DEFW    15<8+59
        DEFW    14<8+60
        DEFW    14<8+61
        DEFW    14<8+62
        DEFW    14<8+63
        DEFW    14<8+64
        DEFW    14<8+65
        DEFW    15<8+64
        DEFW    16<8+63
        DEFW    24<8+55
        DEFW    25<8+54
        DEFW    26<8+53
        DEFW    26<8+52
        DEFW    26<8+51
        DEFW    26<8+50
        DEFW    26<8+49
        DEFW    26<8+48
        DEFW    25<8+49
        DEFW    24<8+50
        DEFW    16<8+68
        DEFW    15<8+69
        DEFW    14<8+70
        DEFW    14<8+71
        DEFW    14<8+72
        DEFW    14<8+73
        DEFW    14<8+74
        DEFW    14<8+75
        DEFW    15<8+74
        DEFW    16<8+73
        DEFW    24<8+65
        DEFW    25<8+64
        DEFW    26<8+63
        DEFW    26<8+62
        DEFW    26<8+61
        DEFW    26<8+60
        DEFW    26<8+59
        DEFW    26<8+58
        DEFW    25<8+59
        DEFW    24<8+60
        DEFW    16<8+78
        DEFW    15<8+79
        DEFW    14<8+80
        DEFW    14<8+81
        DEFW    14<8+82
        DEFW    14<8+83
        DEFW    14<8+84
        DEFW    14<8+85
        DEFW    15<8+84
        DEFW    16<8+83
        DEFW    17<8+82
        DEFW    24<8+75
        DEFW    25<8+74
        DEFW    26<8+73
        DEFW    26<8+72
        DEFW    26<8+71
        DEFW    26<8+70
        DEFW    26<8+69
        DEFW    26<8+68
        DEFW    25<8+69
        DEFW    24<8+70
        DEFW    0       ;FIN DE TABLE
D2000   LD      HL,M2000
D2      LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        LD      A,D
        OR      E
        RET     Z
        PUSH    HL
        CALL    SONK
        CALL    SET
        POP     HL
        JR      D2
SONK    LD      A,D
        ADD     A,11H
        LD      C,A
SONKO0  LD      A,1
        OUT     (255),A
        LD      B,C
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,C
        DJNZ    $
        DEC     C
        LD      A,C
        CP      D
        JR      NZ,SONKO0
SONKO1  LD      A,1
        OUT     (255),A
        LD      B,C
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,C
        DJNZ    $
        INC     C
        LD      A,D
        ADD     A,11H
        CP      C
        JR      NZ,SONKO1
        RET
CADRE   LD      HL,3C00H
        LD      DE,3C00H+960
        LD      B,40H
CAD0    LD      (HL),8CH
        LD      A,83H
        LD      (DE),A
        INC     HL
        INC     DE
        DJNZ    CAD0
        LD      A,0BCH
        LD      (3C00H),A
        LD      (3C3FH),A
        LD      IX,3C00H+64
        LD      DE,64
        LD      B,10H-2
        LD      A,0BFH
CAD1    LD      (IX),A
        LD      (IX+63),A
        ADD     IX,DE
        DJNZ    CAD1
        RET
PRINT   LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
PRI0    LD      A,(HL)
        INC     HL
        DEC     A
        RET     Z
        INC     A
        JR      Z,PRINT
        LD      B,A
        LD      (DE),A
        LD      A,(DE)
        CP      B
        JR      Z,PRI1
        LD      A,B
        SUB     20H
        LD      (DE),A
PRI1    INC     DE
        JR      PRI0
DEBUT   DI
        LD      SP,STACK
        LD      A,1
        LD      (37E4H),A
        LD      A,38H
        OUT     (0ECH),A
        CALL    EHS
        CALL    SCR191
        CALL    DISPL
        CALL    CLSSCR
        CALL    DISPL
        LD      BC,4000H
        CALL    60H
        CALL    D2000
        LD      BC,8000H
        CALL    60H
        LD      D,30
        CALL    SONK
        CALL    CADRE
        LD      BC,8000H
        CALL    60H
        LD      D,40
        CALL    SONK
        LD      HL,TAB
        CALL    PRINT
        LD      DE,SCR+1
        LD      B,14
KLOOP0  PUSH    BC
        LD      HL,TTR
        LD      BC,11
        LDIR
        POP     BC
        DJNZ    KLOOP0
        LD      B,192
KLOOP1  PUSH    BC
        LD      HL,SCR+1
        LD      DE,3C00H+66
        LD      BC,60
        LDIR
        EX      DE,HL
        DEC     HL
        LD      B,12
KLOOP2  PUSH    BC
        LD      BC,64
        ADD     HL,BC
        LD      A,(DE)
        INC     DE
        LD      (HL),A
        POP     BC
        DJNZ    KLOOP2
        LD      HL,3C00H+130
        LD      DE,SCR+78
        LD      B,12
KLOOP3  PUSH    BC
        LD      A,(DE)
        INC     DE
        LD      (HL),A
        LD      BC,64
        ADD     HL,BC
        POP     BC
        DJNZ    KLOOP3
        EX      DE,HL
        LD      BC,60
        LDIR
        LD      A,(SCR+77)
        LD      (SCR),A
        LD      HL,SCR+76
        LD      DE,SCR+77
        LD      BC,77
        LDDR
        LD      A,(SCR+78)
        LD      (SCR+155),A
        LD      HL,SCR+79
        LD      DE,SCR+78
        LD      BC,77
        LDIR
        LD      BC,1000H
KLOOP4  LD      A,(3840H)
        AND     1
        JR      NZ,KLOOP5
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,KLOOP4
        POP     BC
        DJNZ    KLOOP1
KLOOP5  JP      START
TTR     DEFM    'MICRO 2000 '
BEGIN   LD      SP,STACK
        XOR     A
        LD      (COUNTS),A
        LD      A,(DEMO)
        OR      A
        JR      Z,BEG0
        LD      A,2
        LD      (NPLAY),A
        JR      BEG1
BEG0    LD      HL,0
        LD      (BLK1),HL
        LD      (BLK2),HL
BEG1    CALL    CLSVID
        CALL    CLSSCR
        CALL    CLSTIR
        CALL    INITS
        CALL    DBABLE
        CALL    DOBUS
        CALL    DALIEN
        CALL    DBASE
        CALL    DLASER
        CALL    DSCORE
        CALL    DHSCOR
        CALL    DIALOG
        CALL    DISPL
        XOR     A
        LD      (COUNTS),A
MAIN    CALL    CLSSCR
        CALL    DBABLE
        CALL    DOBUS
        CALL    BRKCLR
        CALL    DALIEN
        CALL    DBOM
        CALL    DBASE
        CALL    AOBUS
        CALL    DLASER
        CALL    DSCORE
        CALL    DHSCOR
        CALL    DHEAT
        CALL    DIALOG
        CALL    SCRVID
        CALL    PROC
        CALL    MBABLE
        CALL    MALIEN
        CALL    MALIEN
        CALL    CALIEN
        CALL    MBOM
        CALL    MOVBAS
        CALL    MLASER
        CALL    MHEAT
        JR      MAIN
CLSTIR  LD      HL,SCRTIR
        LD      DE,SCRTIR+1
        LD      BC,43FH
        LD      (HL),80H
        LDIR
        RET
AOBUS   LD      HL,(POBUS)
        CALL    SOUND
        LD      (HL),80H
        LD      A,(OBUS)
        OR      A
        JR      NZ,AOB0
        LD      A,(BASE)
        CP      1
        RET     NZ
        LD      HL,(PBASE)
        LD      DE,-63
        ADD     HL,DE
        LD      B,20H
        LD      A,(CBASE)
        OR      A
        JR      Z,AOB1
        LD      B,10H
        INC     HL
AOB1    LD      A,(HL)
        OR      B
        LD      (HL),A
        CALL    SOUND
        RET
AOB0    LD      DE,SCR-SCRTIR
        ADD     HL,DE
        LD      B,14H
        LD      A,(COBUS)
        OR      A
        JR      Z,AOB1
        LD      B,28H
        JR      AOB1
DOBUS   LD      A,(OBUS)
        OR      A
        JR      Z,DOB0
        LD      HL,(POBUS)
        CALL    SOUND
        LD      DE,-64
        ADD     HL,DE
        LD      (POBUS),HL
        LD      DE,SCRTIR+128
        OR      A
        SBC     HL,DE
        JR      NC,DOB1
        XOR     A
        LD      (OBUS),A
        LD      HL,SCRTIR
        LD      (POBUS),HL
DOB1    LD      A,(OBUS)
        OR      A
        JR      NZ,DOB2
DOB0    LD      A,(DEMO)
        OR      A
        JR      Z,DOB3
        CALL    RND
        AND     3
        JR      Z,DOB5
DOB3    LD      A,(3840H)
        AND     88H
        JR      NZ,DOB5
        IN      A,(0)
        CPL
        AND     10H
        JR      NZ,DOB5
        IN      A,(0)
        CPL
        AND     3
        CP      3
        JR      NZ,DOB2
DOB5    LD      A,(BASE)
        CP      1
        JR      NZ,DOB2
        LD      A,(FHEAT)
        OR      A
        JR      NZ,DOB2
        LD      A,1
        LD      (OBUS),A
        LD      HL,(PBASE)
        LD      DE,-63
        ADD     HL,DE
        LD      B,1
        LD      A,(CBASE)
        OR      A
        JR      Z,DOB6
        LD      B,0
        INC     HL
DOB6    LD      DE,SCRTIR-SCR
        ADD     HL,DE
        LD      (POBUS),HL
        LD      A,B
        LD      (COBUS),A
        LD      HL,HEAT
        INC     (HL)
        LD      A,(COUNTS)
        OR      A
        JR      NZ,DOB4
        LD      HL,DATA2
        CALL    CSOUND
        JR      DOB2
DOB4    LD      HL,181H
        LD      (DATA2-2),HL
DOB2    LD      A,(OBUS)
        OR      A
        RET     Z
        CALL    SOUND
        LD      HL,(POBUS)
        LD      B,95H
        LD      A,(COBUS)
        OR      A
        JR      Z,DOB7
        LD      B,0AAH
DOB7    LD      (HL),B
        CALL    SOUND
        RET
MHEAT   LD      A,(BASE)
        CP      1
        JR      Z,MHE0
        XOR     A
        LD      (HEAT),A
        RET
MHE0    LD      HL,WHEAT
        DEC     (HL)
        JR      NZ,MHE1
        LD      (HL),32
        LD      A,(HEAT)
        OR      A
        JR      Z,MHE1
        DEC     A
        LD      (HEAT),A
MHE1    LD      A,(HEAT)
        CP      31
        JR      NZ,MHE2
        LD      A,1
        LD      (FHEAT),A
        RET
MHE2    CP      24
        RET     NC
        XOR     A
        LD      (FHEAT),A
        RET
DHEAT   LD      A,(BASE)
        CP      1
        RET     NZ
        LD      A,(HEAT)
        SRL     A
        LD      HL,SCR+42
DHE0    CP      4
        JR      C,DHE1
        EX      AF,AF'
        LD      A,(HL)
        BIT     7,A
        JR      Z,DHE3
        OR      8FH
DHE3    LD      (HL),A
        EX      AF,AF'
        INC     HL
        SUB     4
        JR      DHE0
DHE1    LD      IX,THEAT
        LD      (DHE2+2),A
DHE2    LD      A,(IX+0)
        LD      B,A
        LD      A,(HL)
        BIT     7,A
        JR      Z,DHE4
        OR      B
DHE4    LD      (HL),A
        INC     HL
        LD      A,(FHEAT)
        OR      A
        RET     Z
        LD      A,(BLINK)
        CP      4
        RET     NC
        LD      A,(HL)
        CP      80H
        RET     NZ
        LD      (HL),'H'
        RET
THEAT   DEFB    81H
        DEFB    85H
        DEFB    8DH
        DEFB    8FH
