                SEUIL EQU 3
                INA EQU 0xFFA0
                OUTA EQU 0xFFA2
                RESET_ADDRESS EQU 0xFFE4
                LOADA EQU 0xFFDC

                ORG LOADA
                START LOADA

DEBUT           LDW R0,@INA     // On load IN dans R0
                LDW R1,#SEUIL   // On load le seuil de ?? dans R1

                SUB R0,R1,R0    // On soustrait R1 à R0. R0 = R1-R0
                JGE #POSIT-$-2  // Si le résultat de la soustraction est < 0, Sinon on passe directement au SR (division)
                NEG R0,R0       //    On fait le complément de R0 dans R0 (car on veut la val absolue), Puis on passe à la division
POSIT           SRA R0,R0       // On fait un SR arithmétique
                                // ⇒ On vient de faire une division par 2 de R0, que l’on stock dans R0
                STW R0,@OUTA    // Puis on stocke le résultat dans OUTA
                JMP #DEBUT-$-2  // On recommence la boucle
