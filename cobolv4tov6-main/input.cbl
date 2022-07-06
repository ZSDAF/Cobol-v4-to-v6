       IDENTIFICATION DIVISION.
       PROGRAM-ID.  SPGRYNRB.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01      WW00-CDBGD3.
          05   WW00-ZN002 PICTURE 9.
          05   WW00-CDBG1
                        PICTURE 999.
       01      WW00-DATCE PICTURE X.
       01      WW00-CLERIB1.
          05   WW00-CDETA0
                        PICTURE 9(5).
          05   WW00-CDGBD2
                        PICTURE 9(005).
       01      WW00-ZN010 REDEFINES WW00-CLERIB1
                        PICTURE 9(10).
       01      WW00-CLERIB2.
          05   WW00-ZN002A
                        PICTURE 9(2).
          05   WW00-NCPTEA
                        PICTURE 9(11).
          05   WW00-ZN002B
                        PICTURE 9(2).
       01      WW00-ZN015R REDEFINES WW00-CLERIB2
                        PICTURE 9(15).
       01      WW00-CLRIB0
                        PICTURE 9(2).
       01      WW00-CLRIB1
                        PICTURE 9(2).
       01      WW00-RESULTAT.
          05   WW00-ZN009
                        PICTURE 9(9).
          05   WW00-ZN014B
                        PICTURE 9(14).
       01                 ZP7Q.
            10            ZP7Q-ZG00A.
            11            ZP7Q-ZGENT.
            12            ZP7Q-CDETA5 PICTURE  X(05).
            12            ZP7Q-CDBGD3 PICTURE  X(05).
            12            ZP7Q-NCPTEI PICTURE  X(11).
            11            ZP7Q-ZGSOR.
            12            ZP7Q-CDETA8 PICTURE  X(5).
            12            ZP7Q-CDBGD4 PICTURE  X(05).
            12            ZP7Q-CLRIB0 PICTURE  9(2).
            11            ZP7Q-CDRET0 PICTURE  X.
            10            ZP7Q-ZQJLGH PICTURE  S9(4)
                          COMPUTATIONAL.
       01                 ZW00.
          05              ZW00-SUITE.
            15       FILLER         PICTURE  X(00038).
       01                 ZW05  REDEFINES      ZW00.
            10            ZW05-ZDAABS PICTURE  S9(15)
                          COMPUTATIONAL-3.
            10            ZW05-ZDADOM PICTURE  S9(8)
                          COMPUTATIONAL.
            10            ZW05-ZDAMOY PICTURE  S9(8)
                          COMPUTATIONAL.
            10            ZW05-ZDAYEA PICTURE  S9(8)
                          COMPUTATIONAL.
            10            ZW05-ZDAAFF.
            11            ZW05-ZDAJOU PICTURE  9(2).
            11            ZW05-FILLER PICTURE  X.
            11            ZW05-ZDAMOI PICTURE  9(2).
            11            ZW05-FILLER PICTURE  X.
            11            ZW05-ZDAANS PICTURE  9(4).
            10            ZW05-ZHEURE PICTURE  X(8).
       01   DEBUT-WSS.
            05   FILLER PICTURE X(7) VALUE 'WORKING'.
            05   IK     PICTURE X.
       01  CONSTANTES-PAC.
           05  FILLER  PICTURE X(60)   VALUE
                     '7142 DPR28/02/03SPYNRBE901606 13:30:08SPGRYNRBPB80
      -    '28/02/2003'.
       01  PAC-CONSTANTES REDEFINES CONSTANTES-PAC.
           05  NUGNA   PICTURE X(5).
           05  APPLI   PICTURE X(3).
           05  DATGN   PICTURE X(8).
           05  PROGR   PICTURE X(6).
           05  CODUTI  PICTURE X(8).
           05  TIMGN   PICTURE X(8).
           05  PROGE   PICTURE X(8).
           05  COBASE  PICTURE X(4).
           05  DATGNC  PICTURE X(10).
       01  DATCE.
         05  CENTUR   PICTURE XX   VALUE '19'.
         05  DATOR.
           10  DATOA  PICTURE XX.
           10  DATOM  PICTURE XX.
           10  DATOJ  PICTURE XX.
       01  DAT6.
            10 DAT61   PICTURE XX.
            10 DAT62   PICTURE XX.
            10 DAT63   PICTURE XX.
       01  DAT8.
            10 DAT81   PICTURE XX.
            10 DAT8S1  PICTURE X.
            10 DAT82   PICTURE XX.
            10 DAT8S2  PICTURE X.
            10 DAT83   PICTURE XX.
       01  DAT8E    REDEFINES    DAT8.
            10 DAT81E  PICTURE X(4).
            10 DAT82E  PICTURE XX.
            10 DAT83E  PICTURE XX.
       01  DAT6C.
            10  DAT61C PICTURE XX.
            10  DAT62C PICTURE XX.
            10  DAT63C.
             15 DAT63CC PICTURE XX.
             15 DAT64C  PICTURE XX.
       01  DAT8C.
            10  DAT81C  PICTURE XX.
            10  DAT8S1C PICTURE X   VALUE '/'.
            10  DAT82C  PICTURE XX.
            10  DAT8S2C PICTURE X   VALUE '/'.
            10  DAT83C.
             15 DAT83CC PICTURE XX.
             15 DAT84C  PICTURE XX.
       01  DAT7.
            10 DAT71  PICTURE XX.
            10 DAT72  PICTURE XX.
            10 DAT73  PICTURE XX.
       01  DATSEP     PICTURE X VALUE '/'.
       01  DATSET     PICTURE X VALUE '-'.
       01  DAT-TRANS.
         05  DAT-CTYD   PICTURE XX VALUE '61'.
         05  DAT-CTYT   PICTURE XX VALUE '61'.
         05  DAT-CTY    PICTURE XX VALUE '19'.
         05  DAT-ADO    PICTURE X  VALUE SPACE.
       01  DATCTY.
             05  DATCTY9  PICTURE 99.
       01  DAT7C.
         10  DAT71C   PICTURE XX.
         10  DAT72C   PICTURE XX.
         10  DAT73C   PICTURE XX.
         10  DAT74C   PICTURE XX.
       01  DAT8G.
         10  DAT81G   PICTURE XX.
         10  DAT82G   PICTURE XX.
         10  DAT8S1G  PICTURE X    VALUE '-'.
         10  DAT83G   PICTURE XX.
         10  DAT8S2G  PICTURE X    VALUE '-'.
         10  DAT84G   PICTURE XX.
       01   TT-DAT.
            05 T-DAT      PICTURE X OCCURS 5.
       01   VARIABLES-CONDITIONNELLES.
            05                  FT      PICTURE X VALUE '0'.
       01   INDICES  COMPUTATIONAL  SYNC.
            05          TALLI   PICTURE S9(4) VALUE  ZERO.
       01   ZONES-UTILISATEUR PICTURE X.
       LINKAGE SECTION.
       01               DFHCOMMAREA.
          05            FILLER PICTURE X(34).
       PROCEDURE DIVISION USING.
       F01.           EXIT.
       F01CA.
           EXEC CICS   PUSH HANDLE                           END-EXEC.
       F01CA-FN. EXIT.
       F01DA.
           EXEC CICS   HANDLE ABEND LABEL (F99ER)            END-EXEC.
       F01DA-FN. EXIT.
       F01FA.
           MOVE        DFHCOMMAREA TO ZP7Q.
       F01FA-FN. EXIT.
       F01GA.
           PERFORM     F99DA THRU F99DA-FN.
       F01GA-FN. EXIT.
       F01-FN.   EXIT.
      *          NOTE *  DEBUT ITERATION DU PROGRAMME     *.
       F05.           EXIT.
       F50BA.
           MOVE        '0' TO ZP7Q-CDRET0.
       F50BE.    IF    ZP7Q-CDETA5 = '00000'
                 OR    ZP7Q-CDETA5 NOT NUMERIC
                 NEXT SENTENCE ELSE GO TO     F50BE-FN.
           MOVE        '00000' TO ZP7Q-CDETA8
           MOVE        '1' TO ZP7Q-CDRET0.
       F50BE-FN. EXIT.
       F50BI.    IF    ZP7Q-CDBGD3 NOT NUMERIC
                 NEXT SENTENCE ELSE GO TO     F50BI-FN.
           MOVE        SPACE TO ZP7Q-CDBGD4.
                 IF    ZP7Q-CDRET0 = '0'
           MOVE        '2' TO ZP7Q-CDRET0
                 ELSE
           MOVE        '3' TO ZP7Q-CDRET0.
       F50BI-FN. EXIT.
       F50BO.    IF    ZP7Q-NCPTEI = '00000000000'
                 NEXT SENTENCE ELSE GO TO     F50BO-FN.
           MOVE        ZERO TO ZP7Q-CLRIB0
           MOVE        '4' TO ZP7Q-CDRET0.
       F50BO-FN. EXIT.
       F50BU.    IF    ZP7Q-CDRET0 NOT = '0'
                 NEXT SENTENCE ELSE GO TO     F50BU-FN.
           PERFORM     F90 THRU F90-FN.
       F50BU-FN. EXIT.
       F50BA-FN. EXIT.
       F60AA.
           MOVE '2'    TO DAT-ADO
           MOVE        ZW05-ZDAAFF
           TO     DAT8C
           PERFORM  F9520-M  THRU   F9520-Z
           MOVE   DAT6C TO  WW00-DATCE.
       F60BA.    IF    ZP7Q-CDRET0 = '0'
                 NEXT SENTENCE ELSE GO TO     F60BA-FN.
       F60BE.    IF    ZP7Q-CDETA5 = '12106'
                 NEXT SENTENCE ELSE GO TO     F60BE-FN.
           MOVE        '11006' TO ZP7Q-CDETA8
           MOVE        ZP7Q-CDBGD3 TO WW00-CDBGD3.
                 IF    WW00-ZN002 NOT = 99
           MOVE        21 TO WW00-ZN002.
           MOVE        WW00-CDBGD3 TO ZP7Q-CDBGD4
           MOVE        '0' TO ZP7Q-CDRET0
           PERFORM     F92CL THRU F92CL-FN
           PERFORM     F90 THRU F90-FN.
       F60BE-900. GO TO F60BI-FN.
       F60BE-FN. EXIT.
       F60BI.
           MOVE        ZP7Q-CDETA5 TO ZP7Q-CDETA8
           MOVE        ZP7Q-CDBGD3 TO ZP7Q-CDBGD4
           MOVE        '0' TO ZP7Q-CDRET0
           PERFORM     F92CL THRU F92CL-FN
           PERFORM     F90 THRU F90-FN.
       F60BI-FN. EXIT.
       F60BA-FN. EXIT.
       F60AA-FN. EXIT.
       F90.           EXIT.
       F90ZF.
           MOVE        ZP7Q TO DFHCOMMAREA.
       F90ZF-FN. EXIT.
       F90ZT.
           EXEC CICS   POP HANDLE                            END-EXEC.
       F90ZT-FN. EXIT.
       F90ZZ.
           EXEC CICS   RETURN                                END-EXEC.
           GOBACK.
       F90ZZ-FN. EXIT.
       F90-FN.   EXIT.
       F92CL.    IF    ZP7Q-NCPTEI NUMERIC
                 NEXT SENTENCE ELSE GO TO     F92CL-FN.
       F92CP.    IF    ZP7Q-NCPTEI NOT = ZERO
                 NEXT SENTENCE ELSE GO TO     F92CP-FN.
           MOVE        ZP7Q-CDETA8 TO WW00-CDETA0
           MOVE        ZP7Q-CDBGD4 TO WW00-CDGBD2
           MOVE        ZP7Q-NCPTEI TO WW00-NCPTEA
           MOVE        ZERO TO WW00-ZN002B
           DIVIDE      97 INTO WW00-ZN010
           GIVING WW00-ZN009 ROUNDED
           REMAINDER WW00-ZN002A
           DIVIDE      97 INTO WW00-ZN015R
           GIVING WW00-ZN014B ROUNDED
           REMAINDER WW00-CLRIB0
           SUBTRACT    WW00-CLRIB0 FROM 97
           GIVING WW00-CLRIB1.
       F92CP-900. GO TO F92CS-FN.
       F92CP-FN. EXIT.
       F92CS.
           MOVE        ZERO TO WW00-CLRIB1.
       F92CS-FN. EXIT.
       F92CZ.
           MOVE        WW00-CLRIB1 TO ZP7Q-CLRIB0.
       F92CZ-FN. EXIT.
       F92CL-FN. EXIT.
       F9520.   EXIT.
       F9520-C. MOVE DAT73C TO DATCTY.
                MOVE DAT71C TO DAT71.
                MOVE DAT72C TO DAT72.
                MOVE DAT74C TO DAT73.
                MOVE '00111' TO TT-DAT GO TO F9520-T.
       F9520-D. MOVE DAT-CTY TO DATCTY DAT73C.
            IF DAT-ADO < '1'           GO TO F9520-DT.
            IF DAT-ADO = '2'           GO TO F9520-D2.
            IF DAT73 < DAT-CTYT MOVE '19' TO DATCTY DAT73C
                           ELSE MOVE '20' TO DATCTY DAT73C.
                                       GO TO F9520-DT.
       F9520-D2.
            IF DAT73 < DAT-CTYT MOVE '20' TO DATCTY DAT73C
                           ELSE MOVE '19' TO DATCTY DAT73C.
       F9520-DT. MOVE DAT71 TO DAT71C.
                MOVE DAT72 TO DAT72C.
                MOVE DAT73 TO DAT74C.
                MOVE '00111' TO TT-DAT GO TO F9520-T.
       F9520-E. MOVE DAT-CTY TO DATCTY DAT83CC.
            IF DAT-ADO < '1'           GO TO F9520-ET.
            IF DAT-ADO = '2'           GO TO F9520-E2.
           IF DAT83 < DAT-CTYT MOVE '19' TO DATCTY DAT83CC
                          ELSE MOVE '20' TO DATCTY DAT83CC.
                                       GO TO F9520-ET.
       F9520-E2.
           IF DAT83 < DAT-CTYT MOVE '20' TO DATCTY DAT83CC
                          ELSE MOVE '19' TO DATCTY DAT83CC.
       F9520-ET. MOVE DAT81 TO DAT81C.
                MOVE DAT82 TO DAT82C.
                MOVE DAT83 TO DAT84C.
                MOVE DATSEP TO DAT8S1C DAT8S2C.
                MOVE '01011' TO TT-DAT GO TO F9520-T.
       F9520-G. MOVE DAT81G TO DATCTY.
                MOVE DAT82G TO DAT61.
                MOVE DAT83G TO DAT62.
                MOVE DAT84G TO DAT63.
                MOVE '10110' TO TT-DAT GO TO F9520-T.
       F9520-I. MOVE DAT-CTY TO DATCTY DAT61C.
            IF DAT-ADO < '1'           GO TO F9520-IT.
            IF DAT-ADO = '2'           GO TO F9520-I2.
            IF DAT61 < DAT-CTYT MOVE '19' TO DATCTY DAT61C
                           ELSE MOVE '20' TO DATCTY DAT61C.
                                       GO TO F9520-IT.
       F9520-I2.
            IF DAT61 < DAT-CTYT MOVE '20' TO DATCTY DAT61C
                           ELSE MOVE '19' TO DATCTY DAT61C.
       F9520-IT. MOVE DAT61 TO DAT62C.
                MOVE DAT62 TO DAT63CC.
                MOVE DAT63 TO DAT64C.
                MOVE '10101' TO TT-DAT GO TO F9520-T.
       F9520-M. MOVE DAT83CC TO DATCTY.
                MOVE DAT81C TO DAT81.
                MOVE DAT82C TO DAT82.
                MOVE DAT84C TO DAT83.
                MOVE DATSEP TO DAT8S1 DAT8S2.
                MOVE '01011' TO TT-DAT GO TO F9520-T.
       F9520-S. MOVE DAT61C TO DATCTY.
                MOVE DAT62C TO DAT61.
                MOVE DAT63CC TO DAT62.
                MOVE DAT64C TO DAT63.
                MOVE '10101' TO TT-DAT.
       F9520-T. IF T-DAT (1) = '1'
                    MOVE DAT61 TO DAT73 DAT74C
                    MOVE DAT62 TO DAT72 DAT72C
                    MOVE DAT63 TO DAT71 DAT71C
                    MOVE DATCTY TO DAT73C.
                 IF T-DAT (2) = '1'
                    MOVE DAT81 TO DAT71 DAT71C
                    MOVE DAT82 TO DAT72 DAT72C
                    MOVE DAT83 TO DAT73 DAT74C
                    MOVE DATCTY TO  DAT73C.
                 IF T-DAT (3) = '1'
                    MOVE DAT71 TO DAT81 DAT81C
                    MOVE DAT72 TO DAT82 DAT82C
                    MOVE DAT73 TO DAT83 DAT84C
                    MOVE DATSEP TO DAT8S1 DAT8S2
                         DAT8S1C DAT8S2C
                    MOVE DATCTY TO DAT83CC.
                 IF T-DAT (4) = '1'
                    MOVE DAT71 TO DAT63 DAT64C
                    MOVE DAT72 TO DAT62 DAT63CC
                    MOVE DAT73 TO DAT61 DAT62C
                    MOVE DATCTY TO DAT61C.
                 IF T-DAT (5) = '1'
                    MOVE DAT61 TO DAT82G
                    MOVE DAT62 TO DAT83G
                    MOVE DAT63 TO DAT84G
                    MOVE DATSET TO DAT8S1G DAT8S2G
                    MOVE DATCTY TO DAT81G.
       F9520-Z. EXIT.
       F9520-FN. EXIT.
       F99DA.
           EXEC CICS   ASKTIME ABSTIME (ZW05-ZDAABS)         END-EXEC.
           EXEC CICS   FORMATTIME ABSTIME (ZW05-ZDAABS)
                       DAYOFMONTH (ZW05-ZDADOM)
                       MONTHOFYEAR (ZW05-ZDAMOY)
                       YEAR (ZW05-ZDAYEA)
                       TIME (ZW05-ZHEURE)
                       TIMESEP (':')                         END-EXEC.
           MOVE        ZW05-ZDADOM TO ZW05-ZDAJOU
           MOVE        ZW05-ZDAMOY TO ZW05-ZDAMOI
           MOVE        ZW05-ZDAYEA TO ZW05-ZDAANS.
       F99DA-FN. EXIT.
       F99ER.
           PERFORM     F90 THRU F90-FN.
       F99ER-FN. EXIT.
