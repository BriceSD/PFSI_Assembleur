                SEUIL EQU 3
                INA EQU 0xFFA0
                OUTA EQU 0xFFA2
                RESET_ADDRESS EQU 0xFFE4
                LOADA EQU 0xFFDC

                ORG LOADA
                START LOADA
DEBUT           LDW R0,@INA
                LDW R0,#SEUIL
                SUB R0,R1,R0
                JGE #4
                NEG R0,R0
POSIT           SRA R0,R0
                STW R0,@OUTA
                JMP #DEBUT-$-2

