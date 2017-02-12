*-----------------------------------------------------------
* Title      : LAB1
* Written by : Jose Capestany & Sayaf Almeri
* Date       : 1/27/2016
* Description: Assembly Programming
*-----------------------------------------------------------
    
* Put program code here
   
    ORG    $C00           
X   DC.L   $12345678    ; defining X
Y   DC.L   $6789ABCD    ; defining Y

    ORG    $1000
X0  EQU    X            ; defining labels X0-X3
X1  EQU    X+1
X2  EQU    X+2
X3  EQU    X+3

Y0  EQU    Y            ; defining labels Y0-Y3
Y1  EQU    Y+1
Y2  EQU    Y+2
Y3  EQU    Y+3

    
INIT MOVE.L X0,$C10     ; copying a longword of X0 into M[$C10]
     MOVE.W X0,$C20     ; copying a word of X0 into M[$C20]
     MOVE.W X2,$C28     ; copying a word of X2 into M[$C28]
     MOVE.B X0,$C30     ; copying a byte of X0 into M[$C30]
     MOVE.B X1,$C34     ; copying a byte of X1 into M[$C34]
     MOVE.B X2,$C38     ; copying a byte of X2 into M[$C38]
     MOVE.B X3,$C3C     ; copying a byte of X3 into M[$C3C]
     MOVE.L X2,$C40     ; copying a longword of X2 into M[$C40]
     MOVE.L X0,D0       ; copying a longword of X0 into D0
     ADD.L  Y0,D0       ; adding a longword of Y0 to D0
     MOVE.L D0,$C50     ; copying D0 into M[$C50]
     MOVE.W X2,D0       ; copying a word of X2 into D0
     ADD.W  Y2,D0       ; adding a word of Y2 to D0
     MOVE.W D0,$C58     ; copying D0 into M[$C58]
     MOVE.B X3,D0       ; copying a byte of X3 into D0
     ADD.B  Y3,D0       ; adding a byte of Y3 to D0
     MOVE.B D0,$C5C     ; copying D0 into M[$C5C]
     MOVE.L Y0,D0       ; copying a longword of Y0 into D0
     SUB.L  X0,D0       ; subtracting a longword of X0 from D0
     MOVE.L D0,$C70     ; copying D0 into M[$C70]
     MOVE.W Y2,D0       ; copying a word of Y2 into D0
     SUB.W  X2,D0       ; subtracting a word of X2 from D0
     MOVE.W D0,$C78     ; copying D0 into M[$C78]
     MOVE.B Y3,D0       ; copying a byte of Y3 into D0
     SUB.B  X3,D0       ; subtracting a byte of X3 from D0
     MOVE.B D0,$C7C     ; copying D0 into M[$C7C]
     MOVE.L Y0,D0       ; copying a longword of Y0 into D0
     NOT.L  D0          ; turning D0 into its complement
     MOVE.L D0,$C80     ; copying D0 into M[$C80]
     MOVE.W Y2,D0       ; copying a word of Y2 into D0
     NOT.W  D0          ; turning D0 into its complement
     MOVE.W D0,$C88     ; copying D0 into M[$C88]
     MOVE.B Y3,D0       ; copying a byte of Y3 into D0
     NOT.B  D0          ; turning D0 into its complement
     MOVE.B D0,$C8C     ; copying D0 into M[$C8C]
     MOVE.L X2,D0       ; copying a longword of X2 into D0
     ADD.L  Y2,D0       ; adding a longword of Y2 to D0
     MOVE.L D0,$CA0     ; copying D0 into M[$CA0]
     MOVE.W X0,D0       ; copying a word of X0 into D0
     ADD.W  X0,D0       ; adding a word of X0 into D0
     MOVE.W D0,$CA8     ; copying D0 into M[$CA8]
     MOVE.L D0,$CB0     ; copying a longword of D0 into M[$CB0]
     
     STOP #2700
     END $1000
     
     
* Put variables and constants here
       ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
