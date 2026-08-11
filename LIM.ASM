        TITLE   ### LIMIT ZERO ###
;               ------------------
PROT    EQU     2
DISK    EQU     1
TAPE    EQU     0
TYPE    EQU     DISK
;
        COND    0!(TYPE=TAPE)!(TYPE=DISK)
        ORG     3C00H+44
        DEFB    191
        DEFM    ' LIMIT ZERO      **'
        ORG     3C40H+44
        DEFB    191
        DEFM    ' TRS-80 - MOD I/III'
        ORG     3C80H+44
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        ENDC
        COND    TYPE=PROT
        ORG     3C00H+512+12
        DEFM    'LIMIT ZERO'
        ORG     8000H
        ENDC
        COND    TYPE=TAPE
        ORG     4300H
        ENDC
        COND    TYPE=DISK
        INCLUDE SYSMACRO
        ORG     8000H
        ENDC
        INCLUDE LIM1
        INCLUDE INIT
DBASE   LD      A,(BASE)
        CP      1
        JR      NZ,DEXP
        LD      HL,SCR+960
        LD      A,(XBASE)
        LD      D,0
        LD      E,A
        SRL     E
        ADD     HL,DE
        SRL     A
        JR      C,DBS0
        LD      DE,TBASE1
        JR      DBS1
DBS0    LD      DE,TBASE2
DBS1    LD      (PBASE),HL
        EX      DE,HL
        LD      BC,400H
DBS2    LD      A,(DE)
        AND     (HL)
        OR      C
        LD      C,A
        LD      A,(DE)
        OR      (HL)
        LD      (DE),A
        INC     DE
        INC     HL
        DJNZ    DBS2
        LD      A,(XBASE)
        AND     1
        LD      (CBASE),A
        LD      A,C
        AND     3FH
        RET     Z
        CALL    IEXP
        LD      A,2
        LD      (BASE),A
        LD      HL,DATA8
        CALL    CSOUND
        LD      HL,0
        LD      (DATA2-2),HL
        LD      A,(PLAY)
        CP      1
        JR      NZ,DBS3
        LD      HL,SHP1
        JR      DBS4
DBS3    LD      HL,SHP2
DBS4    DEC     (HL)
        LD      A,3CH
        LD      (XBASE),A
        LD      A,0
        LD      (CBASE),A
        LD      HL,SCR+990
        LD      (PBASE),HL
        RET
DEXP    CP      2
        RET     NZ
        LD      IX,TEXP
        LD      B,15
DSHE0   PUSH    BC
        LD      A,(IX)
        OR      A
        JR      Z,DSHE1
        LD      L,(IX+2)
        LD      H,(IX+3)
        LD      A,(IX+1)
        CALL    DECAL
        LD      A,(HL)
        OR      B
        LD      (HL),A
DSHE1   LD      BC,6
        ADD     IX,BC
        POP     BC
        DJNZ    DSHE0
        RET
MOVBAS  LD      A,(BASE)
        CP      1
        JP      NZ,MEXP
        CALL    SOUND
        LD      A,(DRBASE)
        LD      H,A
        LD      A,(3820H)
        AND     10H
        LD      C,A
        LD      A,(3840H)
        AND     20H
        OR      C
        LD      C,A
        IN      A,(0)
        CPL
        AND     4
        OR      C
        JR      Z,MOV0
        LD      H,0FFH
MOV0    LD      A,(3840H)
        LD      B,A
        LD      A,(3820H)
        OR      B
        AND     40H
        LD      B,A
        IN      A,(0)
        CPL
        AND     8
        OR      B
        JR      Z,MOV1
        LD      H,1
MOV1    LD      A,(DEMO)
        OR      A
        JP      Z,MOV2
        LD      A,(XBASE)
        SRL     A
        LD      C,A
        XOR     A
        LD      (TYM),A
        LD      E,0FFH
        LD      IX,TALIEN
        LD      B,20
YM0     LD      A,(IX)
        CP      5
        JR      C,YM1
        CP      8
        JR      NC,YM7
        LD      A,(TYM)
        CP      8
        JR      NC,YM1
        JR      YM2
YM7     LD      A,(TYM)
        CP      8
        JR      C,YM3
YM2     LD      A,(TYM)
        OR      A
        JR      Z,YM3
        LD      A,(IX+2)
        AND     3FH
        SUB     C
        JP      P,YM4
        NEG
YM4     CP      E
        JR      NC,YM1
YM3     LD      A,(IX+3)
        SUB     SCR<-8
        AND     3
        CP      3
        JR      NC,YM1
        LD      A,(IX+2)
        AND     3FH
        SUB     C
        JP      P,YM5
        NEG
YM5     LD      E,A
        LD      A,(IX+2)
        AND     3FH
        LD      (TYP),A
        LD      A,(IX)
        LD      (TYM),A
YM1     PUSH    DE
        LD      DE,6
        ADD     IX,DE
        POP     DE
        DJNZ    YM0
        LD      A,(TYM)
        OR      A
        JR      NZ,YM8
        LD      A,30
        LD      (TYP),A
YM8     LD      A,(TYP)
        SUB     C
        JP      M,YM6
        LD      H,1
        JR      MOV2
YM6     LD      H,0FFH
MOV2    LD      A,H
        LD      (DRBASE),A
        LD      A,(XBASE)
        ADD     A,H
        CALL    SOUND
        RET     M
        CP      122
        RET     NC
        LD      (XBASE),A
        RET
MEXP    CP      2
        RET     NZ
        XOR     A
        LD      (FEXP),A
        LD      IX,TEXP
        LD      IY,TSHE
        LD      B,15
MEX0    PUSH    BC
        LD      A,(IX)
        OR      A
        JR      Z,MEX1
        LD      A,1
        LD      (FEXP),A
        LD      B,(IX+1)
        LD      L,(IX+2)
        LD      H,(IX+3)
        LD      DE,0
        LD      A,(IX+4)
        DEC     A
        LD      (IX+4),A
        JR      NZ,MEX3
        LD      A,(IY+4)
        LD      (IX+4),A
        LD      E,(IY+2)
        LD      A,E
        OR      A
        JP      P,MEX3
        PUSH    HL
        PUSH    DE
        LD      DE,SCR
        OR      A
        SBC     HL,DE
        ADD     HL,HL
        ADD     HL,HL
        LD      A,H
        POP     DE
        POP     HL
        AND     0FH
        JR      NZ,MEX3
        LD      A,B
        AND     6
        JR      Z,MEX2
MEX3    LD      A,(IX+5)
        DEC     A
        LD      (IX+5),A
        JR      NZ,MEXE
        LD      A,(IY+5)
        LD      (IX+5),A
        LD      D,(IY+3)
        LD      A,D
        OR      D
        JP      P,MEX4
        LD      A,L
        AND     3FH
        JR      NZ,MEXE
        LD      A,B
        AND     1
        JR      Z,MEX2
        JR      MEXE
MEX4    LD      A,L
        AND     3FH
        CP      3FH
        JR      NZ,MEXE
        LD      A,B
        AND     1
        JR      NZ,MEX2
MEXE    CALL    MOVE
        LD      (IX+1),B
        LD      (IX+2),L
        LD      (IX+3),H
MEX1    LD      BC,6
        ADD     IX,BC
        ADD     IY,BC
        POP     BC
        DEC     B
        JP      NZ,MEX0
        LD      A,(FEXP)
        OR      A
        RET     NZ
        LD      A,3
        LD      (BASE),A
        RET
MEX2    LD      (IX),0
        JR      MEX1
FEXP    DEFB    0
DECAL   LD      B,1
        CALL    SOUND
DEC0    OR      A
        RET     Z
        SLA     B
        DEC     A
        JR      DEC0
VERY    PUSH    HL
        PUSH    DE
        LD      DE,SCR+1024
        OR      A
        SBC     HL,DE
        POP     DE
        POP     HL
        CALL    SOUND
        RET
BOFL    DEFB    0
BOCAL   DEFB    0
BOPOS   DEFW    0
BOWT    DEFB    100
DBOM    LD      A,(BOFL)
        OR      A
        RET     Z
        LD      HL,(BOPOS)
        LD      A,(BOCAL)
        CALL    DECAL
        LD      A,(HL)
        OR      B
        LD      (HL),A
        CALL    SOUND
        RET
MBOM    LD      A,(BOFL)
        OR      A
        JR      Z,CBOM
        LD      A,(BOCAL)
        LD      B,A
        LD      HL,(BOPOS)
        LD      DE,1
        CALL    MOVE
        LD      (BOPOS),HL
        LD      A,B
        LD      (BOCAL),A
        CALL    VERY
        RET     M
        XOR     A
        LD      (BOFL),A
        RET
CBOM    LD      A,(BOWT)
        DEC     A
        JR      Z,CBOM0
        LD      (BOWT),A
        RET
CBOM0   LD      A,100
        LD      (BOWT),A
        LD      IX,TALIEN
        LD      B,20
CBOM1   LD      A,(IX)
        CP      8
        JR      NC,CBOM2
        LD      DE,6
        ADD     IX,DE
        DJNZ    CBOM1
        RET
CBOM2   LD      L,(IX+2)
        LD      H,(IX+3)
        LD      DE,65
        ADD     HL,DE
        LD      A,(IX+1)
        XOR     1
        BIT     0,A
        JR      NZ,CBOM3
        INC     HL
CBOM3   LD      (BOCAL),A
        LD      (BOPOS),HL
        LD      A,1
        LD      (BOFL),A
        RET
INITS   LD      HL,TINIT
        LD      DE,SCORE1
        LD      BC,TINIT-SCORE1
        LDIR
INIT1   LD      HL,TALIEN
        LD      DE,TALIEN+1
        LD      BC,20*6-1
        LD      (HL),0
        LDIR
        XOR     A
        LD      (BOFL),A
        RET
INIT0   LD      HL,TINIT0
        LD      DE,FLASER
        LD      BC,TINIT-FLASER
        LDIR
        JR      INIT1
BRKCLR  LD      A,(3840H)
        AND     6
        CP      6
        JP      Z,DEBUT
        LD      A,(DEMO)
        OR      A
        CALL    SOUND
        JR      Z,BRK2
        LD      A,(38FFH)
        OR      A
        RET     Z
        JP      START
BRK2    LD      A,(3801H)
        AND     1
        RET     Z
        LD      A,(3880H)
        AND     1
        RET     Z
BRK0    LD      A,(38FFH)
        OR      A
        JR      NZ,BRK0
        LD      B,0
        DJNZ    $
BRK1    LD      A,(38FFH)
        OR      A
        JR      Z,BRK1
        LD      B,0
        DJNZ    $
        RET
SCRVID  LD      A,(DEMO)
        OR      A
        JR      Z,SCRV0
        LD      HL,CEI0
        LD      DE,SCR+24
        LD      B,16
SCRV1   LD      A,(HL)
        CALL    DISA
        INC     HL
        INC     DE
        DJNZ    SCRV1
SCRV0   CALL    AFF
        CALL    SOUND
        RET
CEI0    DEFM    '** LIMIT ZERO **'
DIALOG  LD      A,(BASE)
        CP      1
        RET     Z
        OR      A
        JR      NZ,DIA0
        LD      HL,TPLAY
        LD      DE,SCR+448+28
        LD      BC,7
        CALL    AFF1L
        LD      A,(PLAY)
        OR      '0'
        LD      (DE),A
        CALL    SOUND
        RET
DIA0    CP      2
        RET     NZ
        LD      A,(PLAY)
        CP      1
        JR      NZ,DIA1
        LD      A,'1'
        EX      AF,AF'
        LD      A,(SHP1)
        JR      DIA2
DIA1    LD      A,'2'
        EX      AF,AF'
        LD      A,(SHP2)
DIA2    OR      A
        RET     NZ
        LD      A,(OBUS)
        OR      A
        RET     NZ
        LD      HL,TGAM
        LD      DE,SCR+448+23
        LD      BC,17
        CALL    AFF1L
        CALL    SOUND
        EX      AF,AF'
        LD      (DE),A
        RET
TGAM    DEFM    'Game Over '
TPLAY   DEFM    'Player '
DSCORE  LD      A,(BLINK)
        INC     A
        AND     7
        LD      (BLINK),A
        LD      HL,LAST1
        LD      A,(SCORE1+2)
        CP      (HL)
        CALL    SOUND
        JR      Z,DSC0
        LD      (HL),A
        RRCA
        JR      C,DSC0
        LD      HL,SHP1
        INC     (HL)
        LD      HL,DATA3
        CALL    CSOUND
DSC0    LD      HL,LAST2
        LD      A,(SCORE2+2)
        CP      (HL)
        JR      Z,DSC1
        LD      (HL),A
        RRCA
        JR      C,DSC1
        LD      HL,SHP2
        INC     (HL)
        LD      HL,DATA3
        CALL    CSOUND
DSC1    LD      A,(PLAY)
        CP      1
        JR      NZ,DSC2
        LD      A,(BLINK)
        CP      4
        JR      NC,DSC3
DSC2    LD      HL,SCORE1
        LD      DE,SCR+3
        LD      BC,600H
DSC4    LD      A,(HL)
        CP      '0'
        JR      NZ,DSC5
        LD      A,C
        OR      A
        JR      Z,DSC6
        LD      A,'0'
DSC5    CALL    DISA
        CALL    SOUND
        LD      C,1
DSC6    INC     HL
        INC     DE
        DJNZ    DSC4
        DEC     DE
        LD      A,'0'
        CALL    DISA
        LD      A,(SHP1)
        OR      A
        JR      Z,DSC3
        CP      16H
        JR      C,DSC7
        LD      A,16H
DSC7    LD      DE,SCR+10
        LD      B,A
        LD      A,'+'
DSC8    CALL    DISA
        INC     DE
        DJNZ    DSC8
DSC3    LD      A,(NPLAY)
        CP      1
        JR      Z,DSC20
        LD      A,(PLAY)
        CP      2
        JR      NZ,DSC12
        LD      A,(BLINK)
        CP      4
        JR      NC,DSC20
DSC12   LD      HL,SCORE2
        LD      DE,SCR+38H
        LD      BC,600H
DSC14   LD      A,(HL)
        CP      '0'
        JR      NZ,DSC15
        LD      A,C
        OR      A
        DEC     DE
        JR      Z,DSC16
        INC     DE
        LD      A,'0'
DSC15   CALL    DISA
        CALL    SOUND
        LD      C,1
DSC16   INC     DE
        INC     HL
        DJNZ    DSC14
        LD      A,'0'
        DEC     DE
        CALL    DISA
        LD      A,(SHP2)
        OR      A
        JR      Z,DSC20
        CP      16H
        JR      C,DSC17
        LD      A,16H
DSC17   LD      DE,SCR+35H
        LD      B,A
        LD      A,'+'
DSC18   CALL    DISA
        DEC     DE
        DJNZ    DSC18
        CALL    SOUND
DSC20   LD      A,(VLASER)
        SUB     11
        LD      B,0FFH
DSC21   INC     B
        SUB     3
        JP      P,DSC21
        LD      A,12
        SUB     B
        OR      A
        DAA
        LD      DE,SCR+20
        CALL    HAFF
        RET
DHSCOR  LD      A,(DEMO)
        OR      A
        RET     NZ
        LD      A,(NPLAY)
        CP      1
        JR      Z,DHS0
        LD      HL,SCORE1
        LD      DE,SCORE2
        LD      B,5
        CALL    SOUND
DHS1    LD      A,(DE)
        CP      (HL)
        JR      C,DHS0
        JR      NZ,DHS2
        INC     HL
        INC     DE
        DJNZ    DHS1
DHS0    LD      HL,SCORE1
        LD      A,1
        EX      AF,AF'
        JR      DHS3
DHS2    LD      HL,SCORE2
        LD      A,2
        EX      AF,AF'
DHS3    LD      DE,HSCORE
        PUSH    DE
        PUSH    HL
        CALL    SOUND
        LD      B,5
DHS4    LD      A,(DE)
        CP      (HL)
        JR      C,DHS5
        JR      NZ,DHS6
        INC     HL
        INC     DE
        DJNZ    DHS4
        XOR     A
        EX      AF,AF'
DHS5    POP     HL
        POP     DE
        EX      AF,AF'
        LD      B,A
        LD      A,(PLAY)
        CP      B
        JR      NZ,DHS7
        LD      A,(BLINK)
        CP      4
        RET     NC
        JR      DHS7
DHS6    POP     DE
        POP     HL
DHS7    CALL    SOUND
        LD      DE,SCR+1DH
        LD      B,6
DHS8    LD      A,(HL)
        CP      '0'
        JR      NZ,DHS9
        INC     HL
        INC     DE
        DJNZ    DHS8
        CALL    SOUND
        RET
DHS9    CALL    DISA
        INC     DE
        INC     HL
        LD      A,(HL)
        DJNZ    DHS9
        CALL    SOUND
        RET
HAFF    LD      B,A
        RRCA
        RRCA
        RRCA
        RRCA
        CALL    SHAFF
        LD      A,B
SHAFF   AND     0FH
        OR      30H
        CALL    DISA
        INC     DE
        RET
DISA    PUSH    BC
        LD      C,A
        LD      A,(DE)
        CP      80H
        LD      A,C
        POP     BC
        RET     NZ
        LD      (DE),A
        RET
EDIS    DEFB    0
PROC    LD      A,(BASE)
        CP      3
        RET     NZ
        CALL    SOUND
        LD      A,(SHP1)
        LD      B,A
        LD      A,(NPLAY)
        CP      1
        LD      A,0
        JR      Z,PROC0
        LD      A,(SHP2)
PROC0   OR      B
        JR      NZ,PROC1
        LD      A,(DEMO)
        OR      A
        JP      NZ,START
        LD      A,(NPLAY)
        CP      1
        JR      NZ,PROC2
        XOR     A
        LD      (EDIS),A
        CALL    SCHST
        COND    0!(TYPE=DISK)!(TYPE=PROT)
        LD      A,(EDIS)
        OR      A
        CALL    NZ,WRITHS
        ENDC
        JP      START
PROC2   LD      HL,SCORE1
        LD      DE,SCORE2
        LD      B,5
PROC3   LD      A,(DE)
        CP      (HL)
        JR      C,PROC4
        JR      NZ,PROC5
        INC     HL
        INC     DE
        DJNZ    PROC3
PROC4   LD      A,1
        JR      PROC6
PROC5   LD      A,2
PROC6   LD      (PLAY),A
        XOR     A
        LD      (EDIS),A
        CALL    SCHST
        LD      A,(PLAY)
        NEG
        ADD     A,3
        LD      (PLAY),A
        CALL    SCHST
        COND    0!(TYPE=DISK)!(TYPE=PROT)
        LD      A,(EDIS)
        OR      A
        CALL    NZ,WRITHS
        ENDC
        JP      START
PROC1   LD      A,(VLASER)
        LD      (VLAS0),A
        LD      IX,TALIEN
        LD      IY,COM1
        LD      B,20
PROC17  LD      A,(IX)
        CP      5
        JR      C,PROC19
        CP      8
        JR      NC,PROC19
        SUB     5
        LD      (PROC18+2),A
PROC18  INC     (IY+0)
PROC19  LD      DE,6
        ADD     IX,DE
        DJNZ    PROC17
        CALL    INIT0
        LD      A,(NPLAY)
        CP      1
        JR      NZ,PROC7
        CALL    SOUND
        RET
PROC7   LD      A,(PLAY)
        CP      1
        JR      Z,PROC8
        LD      A,(SHP1)
        JR      PROC9
PROC8   LD      A,(SHP2)
PROC9   OR      A
        RET     Z
        LD      HL,PLAY
        LD      A,3
        SUB     (HL)
        LD      (HL),A
        LD      IX,VLAS0
        LD      DE,VAR2
        LD      BC,VAR2-VLAS0
        CALL    EXIXDE
        CALL    SOUND
        CALL    SCR191
        CALL    DISPL
        CALL    CLSSCR
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
        RET
EXIXDE  LD      H,(IX)
        LD      A,(DE)
        LD      (IX),A
        LD      A,H
        LD      (DE),A
        INC     IX
        INC     DE
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,EXIXDE
        RET
MALIEN  LD      A,(CMOVE)
        INC     A
        AND     7
        LD      (CMOVE),A
        CALL    SOUND
        LD      IX,TALIEN
        LD      B,20
MAL0    PUSH    BC
        LD      A,(CMOVE)
        LD      B,A
        LD      A,(IX)
        CP      5
        JP      C,MAL1
        LD      IY,TVIT
        SUB     5
        LD      (MALX+2),A
MALX    LD      A,(IY+0)
        AND     B
        JP      NZ,MAL1
        LD      B,(IX+1)
        LD      L,(IX+2)
        LD      H,(IX+3)
        LD      A,(IX)
        CP      8
        JR      C,MALR
        LD      A,(IX+5)
        OR      A
        JR      Z,MALR
        JP      MALB
MALR    LD      A,(IX+4)
        OR      A
        JP      P,MAL2
        LD      A,L
        AND     3FH
        JR      NZ,MAL3
        LD      A,B
        AND     1
        JR      NZ,MAL3
        CALL    SOUND
        JR      MAL4
MAL2    LD      A,L
        AND     3FH
        CP      3CH
        JR      NZ,MAL3
        LD      A,B
        AND     1
        JR      Z,MAL3
        CALL    SOUND
MAL4    LD      A,(IX)
        CP      8
        JR      NC,MALGH
        PUSH    HL
        CALL    RND
        POP     HL
        AND     7
        JR      Z,MAL3
MALGH   LD      A,(IX+4)
        NEG
        LD      (IX+4),A
MAL3    LD      A,(IX+5)
        OR      A
        JP      M,MAL5
        PUSH    HL
        LD      DE,SCR+960
        OR      A
        SBC     HL,DE
        POP     HL
        JP      M,MAL7
        LD      A,B
        AND     6
        JR      NZ,MAL7
        CALL    SOUND
        JR      MAL6
MAL5    LD      A,B
        AND     6
        CP      4
        JR      NZ,MAL7
        LD      A,(VLASER)
        SUB     3
        LD      E,0
MAL8    INC     E
        SUB     3
        JP      P,MAL8
        LD      D,0
        EX      DE,HL
        PUSH    BC
        LD      B,6
MAL9    ADD     HL,HL
        DJNZ    MAL9
        POP     BC
        EX      DE,HL
        PUSH    HL
        LD      HL,SCR
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        PUSH    HL
        OR      A
        SBC     HL,DE
        POP     HL
        JP      P,MAL7
        CALL    SOUND
MAL6    LD      A,(IX+5)
        NEG
        LD      (IX+5),A
MAL7    LD      D,(IX+4)
        LD      E,(IX+5)
        LD      A,(IX)
        CP      7
        JR      NZ,MAL10
        LD      A,B
        AND     1
        JR      Z,MAL10
        LD      E,0
MAL10   CALL    MOVE
        LD      (IX+1),B
        LD      (IX+2),L
        LD      (IX+3),H
        CALL    SOUND
        LD      A,(IX)
        CP      8
        JR      C,MAL1
        XOR     1
        LD      (IX),A
        PUSH    AF
        PUSH    BC
        LD      C,5
SONO    LD      A,1
        OUT     (255),A
        LD      B,(IX)
        SLA     B
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,(IX)
        SLA     B
        DJNZ    $
        DEC     C
        JR      NZ,SONO
        POP     BC
        POP     AF
MAL1    LD      DE,6
        ADD     IX,DE
        POP     BC
        DEC     B
        JP      NZ,MAL0
        CALL    SOUND
        RET
MALB    PUSH    HL
        LD      DE,SCR+960
        OR      A
        SBC     HL,DE
        POP     HL
        JP      M,MAL7
        LD      A,B
        AND     6
        JR      NZ,MAL7
        XOR     A
        LD      (IX+5),A
        LD      A,L
        AND     3FH
        SLA     A
        LD      C,A
        LD      A,B
        AND     1
        ADD     A,C
        LD      C,A
        LD      A,(XBASE)
        SUB     C
        JP      M,MALB0
        LD      A,1
        JR      MALB1
MALB0   LD      A,0FFH
MALB1   LD      (IX+4),A
        JP      MAL7
CALIEN  LD      A,(FLASER)
        OR      A
        RET     Z
        LD      A,(FLAS0)
        OR      A
        RET     NZ
        CALL    SOUND
        CALL    CBONUS
        LD      HL,COM1
        LD      B,3
        XOR     A
CAL0    ADD     A,(HL)
        INC     HL
        DJNZ    CAL0
        OR      A
        JR      NZ,CAL1
        LD      A,(NBRE)
        OR      A
        RET     NZ
        LD      A,(PHASE)
        CP      4
        JR      Z,CAL2
        INC     A
        LD      (PHASE),A
CAL2    LD      (NBON),A
        DEC     A
        LD      B,A
        SLA     A
        ADD     A,B
        LD      E,A
        LD      D,0
        LD      HL,TPHA
        ADD     HL,DE
        LD      DE,COM1
        LD      BC,3
        LDIR
        LD      A,32
        LD      (WAIT),A
        CALL    SOUND
        LD      A,(PHASE)
        CP      1
        RET     Z
        LD      A,1
        LD      (FLAS0),A
        RET
CAL1    LD      A,(WAIT)
        DEC     A
        JR      Z,CAL3
        LD      (WAIT),A
        RET
CAL3    LD      A,32
        LD      (WAIT),A
        LD      IX,TALIEN
        LD      B,20
CAL4    LD      A,(IX)
        OR      A
        JR      Z,CAL5
        LD      DE,6
        ADD     IX,DE
        DJNZ    CAL4
        CALL    SOUND
        RET
CAL5    LD      A,(COMPT)
        INC     A
        CP      4
        JR      NZ,CAL6
        LD      A,1
CAL6    LD      (COMPT),A
        CALL    SOUND
        LD      E,A
        LD      D,0
        LD      HL,WAIT
        ADD     HL,DE
        LD      A,(HL)
        OR      A
        JR      Z,CAL5
        DEC     A
        LD      (HL),A
        LD      A,(COMPT)
        ADD     A,4
        LD      (IX),A
        CALL    SOUND
        LD      A,(HBABLE)
        SUB     8
        LD      B,A
        AND     1
        LD      (IX+1),A
        LD      A,B
        SRL     A
        LD      E,A
        LD      D,0
        LD      HL,SCR+128
        ADD     HL,DE
        LD      (IX+2),L
        LD      (IX+3),H
        LD      A,(HBABLE)
        LD      B,A
        LD      A,(DIRBAB)
        SUB     B
        JP      M,CAL7
        LD      A,0FFH
        JR      CAL8
CAL7    LD      A,1
CAL8    LD      (IX+4),A
        LD      A,1
        LD      (IX+5),A
        LD      A,(NBRE)
        INC     A
        LD      (NBRE),A
        CALL    SOUND
        RET
CBONUS  LD      HL,(CBON)
        DEC     HL
        LD      A,H
        OR      L
        JR      Z,CBO0
        LD      (CBON),HL
        RET
CBO0    CALL    RND
        CALL    SOUND
        OR      80H
        LD      L,A
        LD      H,1
        LD      (CBON),HL
        LD      IX,TALIEN
        LD      B,20
CBO1    LD      A,(IX)
        OR      A
        JR      Z,CBO2
        LD      DE,6
        ADD     IX,DE
        DJNZ    CBO1
        RET
CBO2    LD      A,(NBON)
        OR      A
        RET     Z
        DEC     A
        LD      (NBON),A
        LD      A,8
        LD      (IX),A
        CALL    SOUND
        LD      A,(HBABLE)
        SUB     8
        LD      B,A
        AND     1
        LD      (IX+1),A
        LD      A,B
        SRL     A
        LD      E,A
        LD      D,0
        LD      HL,SCR+128
        ADD     HL,DE
        LD      (IX+2),L
        LD      (IX+3),H
        XOR     A
        LD      (IX+4),A
        LD      A,1
        LD      (IX+5),A
        LD      A,(NBRE)
        INC     A
        LD      (NBRE),A
        CALL    SOUND
        RET
DALIEN  LD      HL,POINT
        LD      A,(POI0)
        ADD     A,(HL)
        LD      (HL),A
        JR      Z,DAL0
        CP      4
        JR      NZ,DAL1
DAL0    LD      A,(POI0)
        NEG
        LD      (POI0),A
DAL1    LD      B,20
        LD      HL,TALIEN
        CALL    SOUND
DAL2    PUSH    BC
        PUSH    HL
        LD      A,(HL)
        OR      A
        JP      Z,DAL10
        DEC     A
        ADD     A,A
        LD      E,A
        LD      D,0
        PUSH    HL
        LD      HL,TADD
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        INC     HL
        PUSH    HL
        LD      C,(HL)
        LD      B,0
        LD      HL,TCAL
        ADD     HL,BC
        LD      L,(HL)
        LD      H,0
        LD      A,(DE)
        LD      C,A
        INC     DE
        LD      A,(DE)
        LD      B,A
        ADD     HL,BC
        CALL    SOUND
        EX      DE,HL
        POP     HL
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        PUSH    BC
        POP     HL
        PUSH    DE
        PUSH    HL
        LD      DE,SCRTIR-SCR
        ADD     HL,DE
        PUSH    HL
        EXX
        POP     HL
        EXX
        POP     HL
        POP     DE
        LD      B,2
        EXX
        LD      E,0
        EXX
DAL3    LD      C,4
DAL4    LD      A,(DE)
        EXX
        AND     (HL)
        OR      E
        LD      E,A
        INC     HL
        EXX
        LD      A,(DE)
        OR      (HL)
        LD      (HL),A
        INC     DE
        INC     HL
        DEC     C
        JR      NZ,DAL4
        DJNZ    DAL5
        JR      DAL6
DAL5    PUSH    DE
        LD      DE,3CH
        ADD     HL,DE
        POP     DE
        EXX
        PUSH    DE
        LD      DE,3CH
        ADD     HL,DE
        POP     DE
        EXX
        JR      DAL3
DAL6    POP     HL
        CALL    SOUND
        POP     BC
        EXX
        LD      A,E
        EXX
        AND     3FH
        JR      Z,DAL11
        LD      A,(HL)
        CP      5
        JP      C,DAL12
        CP      8
        PUSH    HL
        PUSH    BC
        JR      C,DAL7
        LD      HL,DATA5
        CALL    CSOUND
        JR      DAL8
DAL7    LD      HL,DATA1
        CALL    CSOUND
        LD      HL,0
        LD      (DATA2-2),HL
DAL8    POP     BC
        POP     HL
        LD      A,0
        LD      (OBUS),A
        LD      A,(HL)
        PUSH    BC
        PUSH    HL
        PUSH    HL
        POP     IX
        CALL    ADDPO
DAL9    LD      (IX),4
        LD      HL,NBRE
        DEC     (HL)
DAL10   POP     HL
        POP     BC
DAL11   LD      A,(HL)
        CP      5
        JR      NZ,DAL12
        CALL    SOUND
        PUSH    BC
        PUSH    HL
        INC     HL
        LD      A,(HL)
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      C,A
        RRCA
        LD      A,C
        JR      NC,DAL13
        INC     DE
DAL13   CP      4
        JR      C,DAL14
        LD      HL,64
        ADD     HL,DE
        EX      DE,HL
DAL14   LD      C,A
        LD      (POI1),A
        LD      A,(POINT)
        AND     1
        XOR     C
        LD      C,A
        LD      B,0
        LD      HL,TPOI
        ADD     HL,BC
        LD      C,(HL)
        LD      A,(POI1)
        CPL
        AND     1
        LD      HL,POINT
        ADD     A,(HL)
        SRL     A
        LD      L,A
        LD      H,0
        ADD     HL,DE
        LD      A,(HL)
        AND     C
        LD      (HL),A
        POP     HL
        POP     BC
DAL12   LD      DE,6
        LD      A,(HL)
        CP      5
        JR      NC,DAL15
        OR      A
        JR      Z,DAL15
        DEC     (HL)
DAL15   CALL    SOUND
        ADD     HL,DE
        DEC     B
        JP      NZ,DAL2
        RET
POI1    DEFB    0
ADDPO   SUB     5
        ADD     A,A
        LD      C,A
        LD      B,0
        LD      HL,TSCO
        ADD     HL,BC
        LD      D,(HL)
        INC     HL
        LD      C,(HL)
        LD      B,0
        CALL    SCOR12
        CALL    SOUND
        ADD     HL,BC
ADD3    LD      A,(HL)
        ADD     A,D
        CP      '9'+1
        JR      C,ADD2
        LD      D,1
        SUB     10
ADD0    CP      '9'+1
        JR      C,ADD1
        SUB     '9'+1
        INC     D
        JR      ADD0
ADD1    LD      (HL),A
        DEC     C
        DEC     HL
        JP      P,ADD3
        CALL    SOUND
        RET
ADD2    LD      (HL),A
        CALL    SOUND
        RET
TSCO    DEFB    1
        DEFB    4
        DEFB    2
        DEFB    4
        DEFB    3
        DEFB    4
        DEFB    1
        DEFB    3
        DEFB    1
        DEFB    3
SCOR12  LD      A,(PLAY)
        CP      1
        JR      Z,SCE0
        LD      HL,SCORE2
        RET
SCE0    LD      HL,SCORE1
        RET
MOVE    LD      A,D
        CALL    SOUND
        OR      A
MOVE0   JR      Z,MOVE6
        LD      A,B
        JP      P,MOVE2
        DEC     A
        SRL     A
        JR      NC,MOVE1
        INC     B
        DEC     HL
        JR      MOVE4
MOVE1   DEC     B
        JR      MOVE4
MOVE2   INC     A
        SRL     A
        CALL    SOUND
        JR      C,MOVE3
        DEC     B
        INC     HL
        JR      MOVE4
MOVE3   INC     B
MOVE4   LD      A,D
        OR      A
        JP      P,MOVE5
        INC     D
        JR      MOVE0
MOVE5   DEC     D
        JR      MOVE0
MOVE6   LD      A,E
        OR      A
MOVE7   RET     Z
        PUSH    DE
        LD      A,B
        JP      P,MOVE11
        SUB     2
        JP      P,MOVE9
        ADD     A,6
        LD      DE,-64
MOVE8   ADD     HL,DE
MOVE9   LD      B,A
        POP     DE
        CALL    SOUND
        LD      A,E
        OR      A
        JP      P,MOVE10
        INC     E
        JR      MOVE7
MOVE10  DEC     E
        JR      MOVE7
MOVE11  ADD     A,2
        CP      6
        JR      C,MOVE9
        SUB     6
        LD      DE,64
        JR      MOVE8
DLASER  LD      A,(HLASER)
        OR      A
        RET     Z
        LD      A,(VLASER)
        LD      B,0FFH
DLA0    INC     B
        SUB     3
        JP      P,DLA0
        ADD     A,3
        LD      C,A
        LD      L,B
        LD      H,0
        LD      B,6
DLA1    ADD     HL,HL
        DJNZ    DLA1
        LD      DE,SCR-128
        ADD     HL,DE
        PUSH    HL
        POP     IX
        LD      A,C
        SLA     A
        SLA     A
        LD      E,A
        LD      D,0
        LD      HL,TLASER
        ADD     HL,DE
        LD      A,(VLASER)
        CP      6
        JR      NC,DLA3
        INC     HL
        INC     HL
        CP      3
        JR      NC,DLA4
        RET
DLA3    LD      A,(HL)
        INC     HL
        OR      (IX)
        LD      (IX),A
        LD      A,(HL)
        INC     HL
        OR      (IX+3FH)
        LD      (IX+3FH),A
DLA4    LD      A,(HL)
        INC     HL
        OR      (IX+40H)
        LD      (IX+40H),A
        LD      A,(HL)
        OR      (IX+7FH)
        LD      (IX+7FH),A
        LD      A,C
        CP      2
        RET     NZ
        LD      A,(HLASER)
        CP      1
        RET     Z
        LD      DE,64
        ADD     IX,DE
        LD      (IX+1),'('
        LD      (IX+3EH),')'
        LD      A,(HLASER)
        CP      2
        RET     Z
        PUSH    IX
        POP     DE
        INC     DE
        INC     DE
        LD      HL,3BH
        ADD     HL,DE
        EX      DE,HL
        LD      A,(HLASER)
        SUB     2
        LD      B,A
        LD      C,'-'
DLA2    LD      A,(HL)
        CP      80H
        JR      NZ,DLA5
        LD      (HL),C
DLA5    LD      A,(DE)
        CP      80H
        JR      NZ,DLA6
        LD      A,C
        LD      (DE),A
DLA6    INC     HL
        DEC     DE
        CALL    SOUND
        DJNZ    DLA2
        RET
MLASER  LD      A,(VLAS0)
        LD      B,A
        LD      A,(VLASER)
        CP      B
        JP      C,ILASER
        LD      A,(FLAS0)
        OR      A
        RET     Z
        DEC     A
        JR      Z,MLA0
        DEC     A
        JR      Z,MLA1
        LD      A,(HLASER)
        CP      32
        JR      Z,MLA2
        INC     A
        LD      (HLASER),A
        CALL    SON
        RET
MLA2    XOR     A
        LD      (FLAS0),A
        LD      A,1
        LD      (FLASER),A
        LD      A,(BASE)
        OR      A
        RET     NZ
        LD      A,1
        LD      (BASE),A
        RET
MLA0    LD      A,(HLASER)
        CP      1
        JR      Z,MLA3
        DEC     A
        LD      (HLASER),A
        CALL    SON
        RET
MLA3    LD      A,(FLAS0)
        INC     A
        LD      (FLAS0),A
        RET
MLA1    LD      A,(CLASER)
        INC     A
        AND     3
        LD      (CLASER),A
        CALL    SONI
        RET     NZ
        LD      A,(VLASER)
        CP      47
        JR      Z,MLA4
        INC     A
        LD      (VLASER),A
MLA4    SUB     3
        JP      P,MLA4
        ADD     A,3
        CP      2
        RET     NZ
        JR      MLA3
SON     PUSH    AF
        PUSH    BC
        LD      A,1
        OUT     (255),A
        LD      A,(HLASER)
        LD      B,A
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      A,(HLASER)
        LD      B,A
        DJNZ    $
        POP     BC
        POP     AF
        RET
SONI    PUSH    AF
        PUSH    BC
        LD      C,16
SOI1    LD      A,1
        OUT     (255),A
        LD      A,(VLASER)
        ADD     A,16
        LD      B,A
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      A,(VLASER)
        ADD     A,16
        LD      B,A
        DJNZ    $
        DEC     C
        JR      NZ,SOI1
        POP     BC
        POP     AF
        RET
ILASER  LD      A,(FBAB)
        OR      A
        RET     Z
        LD      A,2
        LD      (FLAS0),A
        JR      MLA1
DBABLE  LD      A,(HBABLE)
        SRL     A
        LD      E,A
        LD      D,0
        LD      IX,SCR-1
        ADD     IX,DE
        LD      HL,0
        LD      A,(HBABLE)
        AND     1
        JR      Z,DBA0
        LD      HL,16
DBA0    CALL    SOUND
        LD      A,(HBABLE)
        LD      B,A
        LD      A,(DIRBAB)
        CP      B
        JR      C,DBA1
        LD      DE,8
        ADD     HL,DE
DBA1    LD      IY,GLL+3
        EX      DE,HL
        ADD     IY,DE
        CALL    SOUND
        LD      A,(HBABLE)
        SRL     A
        LD      C,A
        LD      B,4
DBA2    LD      A,C
        OR      A
        RET     Z
        LD      A,(IY)
        OR      (IX)
        LD      (IX),A
        LD      A,(IY+4)
        OR      (IX+64)
        LD      (IX+64),A
        DEC     IX
        DEC     IY
        DEC     C
        DJNZ    DBA2
        CALL    SOUND
        RET
MBABLE  LD      HL,HBABLE
        LD      A,(DIRBAB)
        CP      (HL)
        JR      Z,MBA1
        JR      C,MBA0
        INC     (HL)
        RET
MBA0    DEC     (HL)
        RET
MBA1    LD      A,1
        LD      (FBAB),A
        LD      A,(FLASER)
        OR      A
        RET     Z
        LD      A,(DBAB)
        OR      A
        JR      NZ,MBA2
        LD      A,(HL)
        SUB     7
        LD      B,A
        CALL    RAND
        ADD     A,8
        LD      (DIRBAB),A
        JR      MBA3
MBA2    LD      A,(HL)
        LD      B,A
        LD      A,130
        SUB     B
        LD      B,A
        CALL    RAND
        LD      B,A
        LD      A,(HBABLE)
        ADD     A,B
        LD      (DIRBAB),A
MBA3    LD      A,(DBAB)
        CPL
        LD      (DBAB),A
        JR      MBABLE
RAND    LD      A,R
        LD      C,A
        LD      A,(RND0)
        ADD     A,C
        LD      (RND0),A
        LD      E,A
        LD      D,0
        CALL    MUL16
        LD      A,H
        RET
RND0    DEFB    0
MUL16   LD      HL,0
MUL0    SRL     B
        JR      NC,MUL1
        ADD     HL,DE
MUL1    RET     Z
        EX      DE,HL
        ADD     HL,HL
        EX      DE,HL
        JR      MUL0
IEXP    LD      A,(BASE)
        CP      1
        RET     NZ
        LD      IX,TEXP
        LD      IY,TSHE
        LD      B,15
IEX0    PUSH    BC
        LD      A,(CBASE)
        ADD     A,4
        LD      B,A
        LD      HL,(PBASE)
        LD      E,(IY)
        LD      D,(IY+1)
        CALL    MOVE
        LD      (IX),1
        LD      (IX+1),B
        LD      (IX+2),L
        LD      (IX+3),H
        LD      A,(IY+4)
        LD      (IX+4),A
        LD      A,(IY+5)
        LD      (IX+5),A
        LD      BC,6
        ADD     IX,BC
        ADD     IY,BC
        POP     BC
        DJNZ    IEX0
        RET
        DEFM    '--( LIMIT ZERO IS THE 2ND '
        DEFM    'PROGRAM OF Y. LEMPEREUR )--'
        END     DEBUT
