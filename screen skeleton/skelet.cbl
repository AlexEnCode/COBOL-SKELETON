       IDENTIFICATION DIVISION.
       PROGRAM-ID. skeket.
       AUTHOR. AlexEnCode.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

        SELECT OUTPUTFILE ASSIGN TO "new.cbl"
        ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION. 
       FD  OUTPUTFILE.
       01  SKELETON  PIC X(80).
       
       WORKING-STORAGE SECTION.
       01 WS-OPTIONS.
           05 WS-APP-NAME        PIC X(8).
           05 WS-AUTHOR-NAME     PIC X(8).
           05 WS-CHOICE          PIC X(2).
       01 WS-MESSAGE.
           05 WS-MSG             PIC X(100).
       01  WS-EXIT-FLAG           PIC X VALUE 'N'.
       
       SCREEN SECTION.
       01 MAIN-SCREEN FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(75) VALUE all "-" LINE 1 COL 5 
           .
           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5 .           
           05  FILLER PIC X(23)
           VALUE "Enter Application Name:" COL 10.
           05 PIC X(10) USING WS-APP-NAME  COL 35 .
           05  FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(18)
           VALUE "Enter Author Name:" COL 10.
           05 PIC X(10) USING WS-AUTHOR-NAME  COL 35 .           
           05 FILLER PIC X VALUE "|" COL 80.
           05  FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05  FILLER PIC X(7)
           VALUE "Options:" COL 15.
           05 FILLER PIC X VALUE "|" COL 80 .

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5 .
           05 FILLER PIC X(29)
           VALUE "1. Lire un fichier sequentiel" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5 .
           05 FILLER PIC X(31)
           VALUE "2. Ecrire un fichier sequentiel" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(19)
           VALUE "3. Trier un fichier" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(31)
           VALUE "4. Fusionner plusieurs fichiers" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(31)
           VALUE "5. Acceder a une base de donnee" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(38)
           VALUE "6. Generer une requete SELECT COUNT(*)" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(21)
           VALUE "7. Generer un curseur" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(29)
           VALUE "8. Generer une requete UPDATE" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(25)
           VALUE "9. Creer une sous-routine" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(42)
           VALUE "15. Integrer un appel type de sous-routine" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(36)
           VALUE "11. Preparer un template de Copybook" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(24)
           VALUE "12. Integrer un Copybook" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(25)
           VALUE "13. Ajouter un HelloCobol" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(28)
           VALUE "14. Integrer des paragraphes" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5.
           05 FILLER PIC X(24)
           VALUE "15. Quitter le programme" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X VALUE "|" LINE PLUS 1 COL 5. 
           05 FILLER PIC X(18)
           VALUE "Enter your choice:" COL 15.
           05 FILLER PIC X VALUE "|" COL 80.

           05 FILLER PIC X(75) VALUE all "-" LINE plus 1 COL 5.        

       PROCEDURE DIVISION.
       MAIN-PARA.


           PERFORM INITIALIZE-SCREEN
           PERFORM UNTIL WS-EXIT-FLAG = 'Y'
               PERFORM DISPLAY-MENU
               PERFORM PROCESS-CHOICE
           END-PERFORM
           STOP RUN.
       
       INITIALIZE-SCREEN.
           DISPLAY MAIN-SCREEN.
           DISPLAY " " LINE 2 COL 35 .
           ACCEPT WS-APP-NAME AT LINE 2 COL 35.
           DISPLAY " " LINE 3 COL 35 .
           ACCEPT WS-AUTHOR-NAME AT LINE 3 COL 35.

       DISPLAY-MENU.
           DISPLAY " " LINE 21 COL 35 .
           ACCEPT WS-CHOICE AT LINE 21 COL 35.
       
       PROCESS-CHOICE.
           EVALUATE WS-CHOICE
               WHEN "1" PERFORM READ-SEQUENTIAL-FILE
               WHEN "2" PERFORM WRITE-SEQUENTIAL-FILE
               WHEN "3" PERFORM SORT-FILE
               WHEN "4" PERFORM MERGE-FILES
               WHEN "5" PERFORM ACCESS-DATABASE
               WHEN "6" PERFORM GENERATE-SELECT-COUNT
               WHEN "7" PERFORM GENERATE-CURSOR
               WHEN "8" PERFORM GENERATE-UPDATE
               WHEN "9" PERFORM CREATE-SUBROUTINE
               WHEN "10" PERFORM INTEGRATE-SUBROUTINE-CALL
               WHEN "11" PERFORM PREPARE-COPYBOOK-TEMPLATE
               WHEN "12" PERFORM INTEGRATE-COPYBOOK
               WHEN "13" PERFORM ADD-HELLOCOBOL
               WHEN "14" PERFORM INTEGRATE-PROCEDURE-PARAGRAPHS
               WHEN "15" PERFORM EXIT-PROGRAM
               WHEN OTHER DISPLAY "Invalid Choice" LINE 29 END-DISPLAY
           END-EVALUATE.

       EXIT-PROGRAM.
           MOVE 'Y' TO WS-EXIT-FLAG.

       READ-SEQUENTIAL-FILE.
           DISPLAY "Option 1: Lire un fichier sequentiel"  LINE 30.
           OPEN OUTPUT OUTPUTFILE.
           COPY 'lecture.cpy'.
           CLOSE OUTPUTFILE.
                 
       WRITE-SEQUENTIAL-FILE.
           DISPLAY "Option 2: Ecrire un fichier sequentiel" LINE 30 .
           OPEN OUTPUT OUTPUTFILE.
           COPY 'ecriture.cpy'.
           CLOSE OUTPUTFILE.

       SORT-FILE.
           DISPLAY "Option 3: Trier un fichier" LINE 30 .
           OPEN OUTPUT OUTPUTFILE.
           COPY 'fusion.cpy'.
           CLOSE OUTPUTFILE.

       MERGE-FILES.
           DISPLAY "Option 4: Fusionner plusieurs fichiers" LINE 30 .
       
       ACCESS-DATABASE.
           DISPLAY "Option 5: Acceder a une base de donnee" LINE 30 .
       
       GENERATE-SELECT-COUNT.
           DISPLAY "Option 6: Generer une requete SELECT COUNT(*)" 
           LINE 30 .
       
       GENERATE-CURSOR.
           DISPLAY "Option 7: Generer un curseur" LINE 30.
       
       GENERATE-UPDATE.
           DISPLAY "Option 8: Generer une requete UPDATE" LINE 30 .
       
       CREATE-SUBROUTINE.
           DISPLAY "Option 9: Creer une sous-routine" LINE 30 .
       
       INTEGRATE-SUBROUTINE-CALL.
           DISPLAY "Option 10: Integrer un appel type de sous-routine"
           LINE 30.
       
       PREPARE-COPYBOOK-TEMPLATE.
           DISPLAY "Option 11: Preparer un template de Copybook"  
           LINE 30.
       
       INTEGRATE-COPYBOOK.
           DISPLAY "Option 12: Integrer un Copybook" LINE 30 .
       
       ADD-HELLOCOBOL.
           DISPLAY "Option 13: Ajouter un HelloCobol" LINE 30 .
       
       INTEGRATE-PROCEDURE-PARAGRAPHS.
           DISPLAY "Option 14: Integrer des paragraphes" LINE 30 .
