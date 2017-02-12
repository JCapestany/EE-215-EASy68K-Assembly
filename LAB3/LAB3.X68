*-----------------------------------------------------------
* Title      : Lab 3
* Written by : Jose Capestany and Sayaf Almari
* Date       : 2/10/2016
* Description: TRAP #15
*-----------------------------------------------------------

START   ORG    $1000

QUEST1  DC.B 'ENTER M: '
QUEST2  DC.B 'ENTER N: '
QUEST3  DC.B 'Y(M,N)is '
MQUEST  EQU 9

MAIN    MOVE.L #1,D0        * Displays ENTER M: to the user
        MOVEA.L #QUEST1,A1
        MOVE.L #MQUEST,D1
        TRAP #15
        MOVE.L #4,D0        * Asks the user to enter a number
        TRAP #15
        MOVE.L D1,D5        * Stores the number in D5
        CMP #0,D5           * Compares the number to 0
        BEQ STOP            * If the number is 0 stop the program
        MOVE.L #1,D0        * Displays ENTER N: to the user
        MOVEA.L #QUEST2,A1
        MOVE.L #MQUEST,D1
        TRAP #15
        MOVE.L #4,D0        * Asks he user to enter a number
        TRAP #15
        MOVE.L D1,D6        * Stores the number in D6
        JSR Y               * Jump to subroutine Y
        MOVE.L #1,D0        * Displays Y(M,N)is to the user
        MOVEA.L #QUEST3,A1  
        MOVE.L #MQUEST,D1
        TRAP #15    
        MOVE.L #3,D0
        MOVE.L D7,D1
        TRAP #15            * Displays the value of Y
        MOVE.L #0,D0
        MOVE.L #0,D1
        TRAP #15            * Used to create a new line
        JSR MAIN            * Restarts the program
            
Y       MULU D5,D6          * Multiple D5 and D6 and stores it in D6
        ADD.L #5,D6         * Adds 5 to D6
        MOVE.L D6,D7        * Copies D6 into D7                   
        RTS                 * Returns to main program
        
STOP    STOP #2700    
        END START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
