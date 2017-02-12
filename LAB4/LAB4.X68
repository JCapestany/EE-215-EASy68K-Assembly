*-----------------------------------------------------------
* Title      : LAB 4
* Written by : Jose Capestany & Sayaf Almeri
* Date       : 2/24/2016
* Description: Recursive Subroutines
*-----------------------------------------------------------
START   ORG    $1000

QUEST1  DC.B   'ENTER M: '
QUEST2  DC.B   'ENTER N: '
QUEST3  DC.B   'Y(M,N)is '
MQUEST  EQU    9

MAIN    MOVE.L #1,D0        * Displays ENTER M: to the user
        MOVEA.L #QUEST1,A1
        MOVE.L #MQUEST,D1
        TRAP #15
        MOVE.L #4,D0        * Asks the user to enter a number
        TRAP #15
        MOVE.L D1,D7        * Stores the number in D7
        JSR Y               * CALCULATES Y(M)
        MOVE.L #1,D0        * Displays ENTER N: to the user
        MOVEA.L #QUEST2,A1
        MOVE.L #MQUEST,D1
        TRAP #15
        MOVE.L #4,D0        * Asks he user to enter a number
        TRAP #15
        MOVE.L D1,D7        * Stores the number in D7
        JSR Y               * CALCULATES Y(N)
        MOVE.L #1,D0        * Displays Y(M,N)is to the user
        MOVEA.L #QUEST3,A1  
        MOVE.L #MQUEST,D1
        TRAP #15    
        MOVE.L #3,D0
        MOVE.L D6,D1
        TRAP #15            * Displays the value of Y
        JSR STOP
        
Y       ADD.L D7,D6         * CALCULATES Y(M), THEN ADDS Y(N) TO Y(M)
        SUB.L #1,D7
        CMP #1,D7
        BNE Y
        ADD.L #1,D6
        RTS MAIN
                
STOP    STOP #2700
        END START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
