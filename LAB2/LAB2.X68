*-----------------------------------------------------------
* Title      :lab02
* Written by :sayaf Almari & Jose Capestany 
* Date       :2/3/2016
* Description:Sorting Numbers
*-----------------------------------------------------------
        ORG    $400
DATA    DC.B    17,25,63,27,41,15,12,2,35,37,22,69,44,21,87,86,45,33,5,98 * 20 random numbers
n       EQU     19  * Number of times for the inner loop
m       EQU     20  * Number of times for the outer loop             
* Put program code here

        ORG    $1000
        MOVE.B #m,D6    * Sets the outer loop counter to 20
INIT    LEA.L DATA,A0   * Sets the data into address register 0
        MOVE.B #n,D5    * Sets the inner loop counter to 19
        MOVE.B (A0),D1  * Moves the first data point into D1
        MOVE.B (A0)+,D2 * Moves the second data point into D2
        SUB.B #1,D6     * Subtracts one from the outer counter
        BEQ STOP        * When the outer counter is zero end the program
LOOP_1  CMP D1,D2       * Subtracts the first number from the second one
        BMI NEG         * If negative go to subroutine NEG
        BPL POS         * If postive go to subroutine POS
POS     MOVE.B D2,D1    * This subroutine just sets the next two...
        MOVE.B (A0)+,D2 * numbers in place to be compared next.
        BPL SUB         * It then goes to the SUB subroutine.
        
NEG     MOVE.B D1,D4    * This subroutines switches the place of two numbers...
        MOVE.B D2,D3    * when the second number is smaller than the first one.
        MOVE.B D3,-(A0)
        MOVE.B D3,-(A0)
        MOVE.B D3,(A0)+
        MOVE.B D4,(A0)+
        MOVE.B (A0)+,D2
        SUB.B D4,D4
        SUB.B D3,D3
        BPL SUB         * It then goes to the SUB subroutine
        BMI SUB
SUB     SUB.B #1,D5     * This subroutine just subtracts one from the inner counter
        BEQ INIT        * If inner counter is zero it starts the comparison from the begining again.
        BNE LOOP_1      * If inner counter is not zero it will continue to check the rest of the numbers.
        
STOP
                     
* Put variables and constants here
        STOP    #2700
        END     $1000


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
