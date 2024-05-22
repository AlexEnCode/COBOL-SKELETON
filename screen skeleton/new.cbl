           IDENTIFICATION DIVISION.
           PROGRAM-ID. .
           AUTHOR. AlexEnCode.

           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
              SELECT InputFile1 ASSIGN TO 'fichier1.dat'
                   ORGANIZATION IS LINE SEQUENTIAL.
              SELECT InputFile2 ASSIGN TO 'fichier2.dat'
                   ORGANIZATION IS LINE SEQUENTIAL.
              SELECT OutputFile ASSIGN TO 'fichier3.dat'
                   ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD  InputFile1.
           01  InputRecord1.
               COPY RECORD-FORMAT.
           FD  InputFile2.
           01  InputRecord2.
               COPY RECORD-FORMAT.
           FD  OutputFile.
           01  OutputRecord.
               COPY RECORD-FORMAT.

           WORKING-STORAGE SECTION.
           01  EndOfFile      PIC X VALUE 'N'.

           PROCEDURE DIVISION.
           Main-Procedure.
               OPEN INPUT InputFile1
               OPEN INPUT InputFile2
               OPEN OUTPUT OutputFile

               PERFORM UNTIL EndOfFile = 'Y'
                   READ InputFile1 INTO InputRecord1
                       AT END
                           MOVE 'Y' TO EndOfFile
                       NOT AT END
                        MOVE InputRecord1 TO OutputRecord
                           WRITE OutputRecord
                   END-READ
               END-PERFORM

               MOVE 'N' TO EndOfFile
               PERFORM UNTIL EndOfFile = 'Y'
                   READ InputFile2 INTO InputRecord2
                       AT END
                           MOVE 'Y' TO EndOfFile
                       NOT AT END
                         MOVE InputRecord2 TO OutputRecord
                           WRITE OutputRecord
                   END-READ
               END-PERFORM

               CLOSE InputFile1
               CLOSE InputFile2
               CLOSE OutputFile

               STOP RUN.
