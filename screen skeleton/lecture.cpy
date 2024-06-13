           MOVE "           IDENTIFICATION DIVISION."               
           TO SKELETON
           WRITE SKELETON    .
           MOVE "           PROGRAM-ID. lecture."                
           TO SKELETON
           WRITE SKELETON.
           MOVE " "                                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "           ENVIRONMENT DIVISION."                  
           TO SKELETON
           WRITE SKELETON.
      
           MOVE "           INPUT-OUTPUT SECTION."                  
           TO SKELETON
           WRITE SKELETON.
           MOVE "           FILE-CONTROL."                          
           TO SKELETON
           WRITE SKELETON.
           MOVE '              SELECT InputFile ASSIGN TO "fichier.dat"' 
           TO SKELETON
           WRITE SKELETON.
           MOVE '                   ORGANIZATION IS LINE SEQUENTIAL.'    
           TO SKELETON
           WRITE SKELETON.
           MOVE '               SELECT OutputFile ASSIGN TO "new.dat"'  
            TO SKELETON
           WRITE SKELETON.
           MOVE '                   ORGANIZATION IS LINE SEQUENTIAL.'  
             TO SKELETON
           WRITE SKELETON.
           MOVE " "                                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "           DATA DIVISION."                         
           TO SKELETON
           WRITE SKELETON.
           MOVE "           FILE SECTION."                          
           TO SKELETON
           WRITE SKELETON.
           MOVE "           FD  InputFile."                         
           TO SKELETON
           WRITE SKELETON.
           MOVE "           01  InputRecord."                       
           TO SKELETON
           WRITE SKELETON.
           MOVE "               COPY RECORD-FORMAT."                
           TO SKELETON
           WRITE SKELETON.
           MOVE "           FD  OutputFile."                        
           TO SKELETON
           WRITE SKELETON.
           MOVE "           01  OutputRecord."                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "               COPY RECORD-FORMAT."                
           TO SKELETON
           WRITE SKELETON.
           MOVE " "                                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "           WORKING-STORAGE SECTION."               
           TO SKELETON
           WRITE SKELETON.
           MOVE "           01  EndOfFile      PIC X VALUE 'N'."    
           TO SKELETON
           WRITE SKELETON.
           MOVE " "                                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "           PROCEDURE DIVISION."                    
           TO SKELETON
           WRITE SKELETON.
           MOVE "           Main-Procedure."                        
           TO SKELETON
           WRITE SKELETON.
           MOVE "               OPEN INPUT InputFile"               
           TO SKELETON
           WRITE SKELETON.
           MOVE "               OPEN OUTPUT OutputFile"             
           TO SKELETON
           WRITE SKELETON.
           MOVE " "                                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "               PERFORM UNTIL EndOfFile = 'Y'"      
           TO SKELETON
           WRITE SKELETON.
           MOVE "                   READ InputFile INTO InputRecord" 
           TO SKELETON
           WRITE SKELETON.
           MOVE "                       AT END"                     
           TO SKELETON
           WRITE SKELETON.
           MOVE "                           MOVE 'Y' TO EndOfFile"  
           TO SKELETON
           WRITE SKELETON.
           MOVE "                       NOT AT END"                 
           TO SKELETON
           WRITE SKELETON.
           MOVE "                MOVE InputRecord TO OutputRecord" 
           TO SKELETON
           MOVE "                WRITE OutputRecord"     
           TO SKELETON
           WRITE SKELETON.
           MOVE "                   END-READ"                       
           TO SKELETON
           WRITE SKELETON.
           MOVE "               END-PERFORM"                        
           TO SKELETON
           WRITE SKELETON.
           MOVE " "                                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "               CLOSE InputFile"                    
           TO SKELETON
           WRITE SKELETON.
           MOVE "               CLOSE OutputFile"                  
            TO SKELETON
           WRITE SKELETON.
           MOVE " "                                      
           TO SKELETON
           WRITE SKELETON.
           MOVE "               STOP RUN."                          
           TO SKELETON
           WRITE SKELETON.
