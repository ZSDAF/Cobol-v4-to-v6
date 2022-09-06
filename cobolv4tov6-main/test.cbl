        *<cartouche>_02                                                           
      * IMPORTANT : afin d'assurer la maintenance du programme via     *        
      * la fonctionnalit{ d'import, hormis la zone commentaires,       *        
      * le contenu du cartouche ne doit en aucun cas être alt{r{.      *        
      ******************************************************************        
      **************** CARACTERISTIQUES DU PROGRAMME *******************        
      ******************************************************************        
      * Programme    : AE521A   g{n{r{ le 18/05/2021 @  16:08:28       *        
      * Par          : ETP9789                                         *        
      * Libell{ prog : ADE : Conditions d'assurance                    *        
      * Cin{matique  : MO - Sous-programme type moniteur               *        
      * DOM / APPLI  : D5  / M2  / ZCPB                                *        
      ******************************************************************        
      ****************** COMMENTAIRES DU PROGRAMME *********************        
      ******************************************************************        
      ******************************************************************        
      *CODE MARCHE IM                                                  *        
      *09/11/2018 E904490 - L LASNIER - BF0232 - E33 Report            *        
      *Cr{ation du programme.                                          *        
      *Cet {cran remonte les conditions d'assurance des assur{s        *        
      *d'un prêt donn{ en entr{e.                                      *        
      *On y acc}de via le menu en gestion "Consultationç               *        
      *Informations PrêtçADE : Conditions d'assurance"                 *        
      *Vue en r{ception WG4A                                           *        
      *Vue en {mission 9G4A                                            *        
      *                                                                *        
      *04/12/2018 E904490 - L LASNIER - BF0232 - E33                   *        
      *Modification de l'alimentation de la rubrique LIRPCN.           *        
      *Appel @ la rubrique ADI018 au lieu d'alimenter avec le          *        
      *libelle du segment X58H. Modification fonction F50CF.           *        
      *                                                                *        
      *27/03/2019 - P.SALLOIGNON E906952 (Alteca) - E33                *        
      * Projet PEGASE H2 BF023206 - RTC 367823                         *        
      * On remplace le libell{ "DC" par "DECES" en F92ED et F92FG.     *        
      *                                                                *        
      *10/04/2019 - B.Delbano M903438                                  *        
      *BF039806 AMADEUS LOT 6  -  RTC 382134                           *        
      *Traitmeent des contrat V avec code march{ CS comme              *        
      *code march{ IM                                                  *        
      *modif sur P92EG P92EI P92EM P92EO                               *        
      *                                                                *        
      *18/04/2019 - B.Delbano M902438                                  *        
      *BF039806 AMADEUS LOT 6 - INC000005001324                        *        
      *Inversion des tests sur les codes                               *        
      *"garantie retenue" = 1 devient > 0 et NOT = 1 devient = 0       *        
      *modif sur P92FF et P92FR                                        *        
      *                                                                *        
      *17/02/2020 E961035 7513T INC000005901673                        *        
      *      En F92FK,le taux test{ pour l'affichage de la garantie    *        
      *      ITD est incorrect : il s'agit de QQGTIE et non pas        *        
      *      QQGTIT.                                                   *        
      *      Les taux correspondent @                                  *        
      *      QQGTIE : DC - PTIA - ITD                                  *        
      *      QQGTIT : ITT                                              *        
      *      QQPEMP : Perte emploi                                     *        
      *------------------------------                                  *        
      *24/04/2020 - C.PELLETIER E907064                                *        
      *PKE000000150398                                                 *        
      *Suppression de la condition en F92JB qui affichait un           *        
      *message d'erreur lors de la consultation ADE pour un payeur     *        
      *externe.                                                        *        
      *                                                                *        
      *DATE (jj/mm/ssaa).: 21/04/2021                                  *        
      *AUTEUR MAINTENANCE: J. BORNE (E909789)                          *        
      *REFERENCE ........: BMA00755                                    *        
      *DETAIL :                                                        *        
      *1-CAGIPINC0311545 - Gestion de sortie d'age et ajout d'assur{.  *        
      *  D{placement de la fonction 50CZ dans la fonction 006-F92CJ.   *        
      *  Ajout du conditionnement d'alimentaiton du X58B-MTPA15 en     *        
      *  099-F92CN.                                                    *        
      *2-CAGIPINC0281457 - Correction alim CDMAAS en cas d'horizon MIxt*        
      *  en fonction 007-F50DD au cas o¦ le H2 n'est pas le 1ier       *        
      *  r{cup{r{.                                                     *        
      *3-CAGIPINC0252943 - Prise en compte du remboursement partiel en *        
      *  le retirant (DF01-MKRAPR) de X58B-MTPA15 en 099-F92CN.        *        
      *                                                                *        
      *=================================================               *        
      *Historique des modifications                                    *        
      *=================================================               *        
      *Date       User              Commentaire/Ref Syn/Vers           *        
      *../../.... ....... .... ..... ...................               *        
      ******************************************************************        
      ******************************************************************        
      ******************** FONCTIONS UTILISEES *************************        
      ******************************************************************        
      * +AAACD        : R{cup{ration date syst}me UNIX sur 8C.        ¨*        
      *  > WW00-X0016¨                                           0019  *        
      * +AACA3        : Appel Sous-programme                          ¨*        
      *  > 91CG¨510600¨X601¨¨¨¨                                  0024  *        
      * +AACAL        : Appel sous-programme                          ¨*        
      *  > F91CC¨51058A¨X58A¨                                    0020  *        
      *  > F91CD¨51058B¨X58B¨                                    0021  *        
      *  > F91CE¨51058E¨X58E¨                                    0022  *        
      *  > F91CF¨51058H¨X58H¨                                    0023  *        
      * +AAMES        : Encapsulation Message d'erreur                ¨*        
      *  > 10DB13¨"# - 10DB 130 - "¨"PB ACCES VERSION ADI : "¨   0011  *        
      *    X601-LMRETO¨                                                *        
      *  > 50BJ16¨"# - 50BJ 160 - "¨"PB ACCES DF01 IDELCO :"¨    0012  *        
      *    TX00-IDELC0¨                                                *        
      *  > 50BJ25¨"# - 50BJ 250 - "¨"PB ACCES DF11 IDELCO :"¨    0013  *        
      *    DF01-IDELCO¨                                                *        
      *  > 50BN16¨"# - 50BN 160 - "¨"PB ACCES DC03 IDPART :"¨    0014  *        
      *    DF01-IDPART¨                                                *        
      *  > 50CF28¨"# - 50CF 280 - "¨"RETOUR 51058B KO POUR "¨    0015  *        
      *    "ASSURE : "¨                                                *        
      *  > 92CJ12¨"# - 92CJ 120 - "¨"RETOUR 51058A KO POUR "¨    0016  *        
      *    "ASSURE : "¨                                                *        
      *  > 50DB19¨"# - 50DB 190 - "¨"RETOUR 51058A KO POUR "¨    0017  *        
      *    "ASSURE : "¨                                                *        
      *  > 50DM03¨"# - 50DM 030 - "¨"PAS D'ASSURE POUR "¨        0018  *        
      *    "IDELCO : "¨                                                *        
      *  > 92JF17¨"# - 92JF 170 - "¨"DC05 NON TROUVE POUR "¨     0025  *        
      *    "IDELCO : "¨                                                *        
      *  > 92JF27¨"# - 92JF 270 - "¨"DC23 NON TROUVE POUR "¨     0026  *        
      *    "IDELCO : "¨                                                *        
      *  > 92KF17¨"# - 92KF 170 - "¨"PB ACCES DF81 IDELCO :"¨    0027  *        
      *    DF02-IDELCO¨                                                *        
      *  > 92KH10¨"# - 92KH 100 - "¨"DF02 NON TROUVE POUR "¨     0028  *        
      *    "IDELCO : "¨                                                *        
      * +AASPR        : ENVIR MVS SOUS-PROG ACCES                0003 ¨*        
      * +AASTA        : ENVIR. START REDUIT GREEN                0004 ¨*        
      * +ABIN2        : Initialisation SPL en TP - 2                  ¨*        
      *  > DF01¨                                                 0007  *        
      *  > DF11¨                                                 0008  *        
      *  > DE04¨                                                 0009  *        
      *  > DF02¨                                                 0010  *        
      *  > AC70¨                                                 0064  *        
      * +ABINI        : Initialisation des SPL en TP             0006 ¨*        
      * +ABLCL        : REQUETE LECTURE PAR CLE GREEN                 ¨*        
      *  > F95DC¨DC03¨N¨                                         0059  *        
      *  > F95DD¨DC05¨N¨                                         0060  *        
      *  > F95DE¨DC23¨N¨                                         0061  *        
      * +ABLF1        : Requête d{but de balayage par cl{ et fil      ¨*        
      *  > DC02¨O¨                                               0062  *        
      * +ABLFS        : Requête suite balayage par cl{ et filtre      ¨*        
      *  > DC02¨ ¨                                               0063  *        
      * +ABOCC        : Acc}s objet cl{ logique compl}te              ¨*        
      *  > F95BB¨DF01¨IDTF¨                                      0053  *        
      *  > F95BC¨DF11¨IDTF¨                                      0054  *        
      *  > F95BE¨DE04¨IDTF¨                                      0056  *        
      * +ABOCI        : Acc}s objet par cl{ incompl}te                ¨*        
      *  > F95BF¨DF02¨IDTF¨                                      0057  *        
      *  > F95BH¨AC70¨IDTF¨                                      0065  *        
      * +ABOCS        : Acc}s objet suivant par cl{                   ¨*        
      *  > F95BG¨DF02¨IDTF¨                                      0058  *        
      *  > F95BI¨AC70¨IDTF¨                                      0066  *        
      * +ABRE1        : Acc}s premi}re relation                       ¨*        
      *  > F95BD¨DF81¨1¨DF02¨DF29¨¨¨¨                            0055  *        
      * +ABSDE        : START UNIX FCT "DE"                           ¨*        
      *  > F93BC¨TA¨0990¨NM262¨" "¨8210¨TF73¨TF73¨CD¨            0029  *        
      *  > F93BD¨RB¨0990¨ADI242¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0030  *        
      *  > F93BE¨RB¨0990¨0010¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨           0031  *        
      *  > F93BF¨RB¨8210¨CDSUPR¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0032  *        
      *  > F93BG¨RB¨0990¨BA102¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨          0033  *        
      *  > F93BH¨RB¨0AMT¨ADI002¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0034  *        
      *  > F93BI¨RB¨8210¨CDCAPR¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0035  *        
      *  > F93BJ¨RB¨0990¨ADI022¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0036  *        
      *  > F93BK¨RB¨0990¨ADI012¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0037  *        
      *  > F93BL¨RB¨0990¨ADI221¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0038  *        
      *  > F93BM¨RB¨0990¨ADI244¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0039  *        
      *  > F93BN¨RB¨0990¨ADI262¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0040  *        
      *  > F93BO¨RB¨0990¨ADI243¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0041  *        
      *  > F93BP¨RB¨0990¨ADI240¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0042  *        
      *  > F93BQ¨RB¨0990¨ADI018¨TD15-ZVAMIN¨ ¨ ¨TD15¨CD¨         0043  *        
      *  > F93BR¨TA¨8210¨PG1057¨" "¨8210¨TF81¨TF81¨CD¨           0067  *        
      * AAAREQ        : Environnement Requêtes GREEN - VRP       0005 ¨*        
      * AABPA3        : Lecture param}tre DE04 (optim.)               ¨*        
      *  > 01¨01¨A¨PA¨ZCJC01AU¨`¨L¨B¨                            0002  *        
      *  > 99¨99¨A¨PA¨D5JC99AU¨`¨L¨B¨                            0068  *        
      * AATME3        : Encapsulation message d'erreur variable       ¨*        
      *  > 01¨"LE NUMERO DE PRET"¨"EST OBLIGATOIRE"¨¨¨           0044  *        
      *  > 02¨"ACCES DF01 KO"¨"- IDELCO :"¨TX00-IDELC0¨¨         0045  *        
      *  > 03¨"ACCES DF11 KO"¨"- IDELCO :"¨DF01-IDELCO¨¨         0046  *        
      *  > 04¨"ACCES DF81 KO"¨"- IDELCO :"¨DF02-IDELCO¨¨         0047  *        
      *  > 05¨"ACCES DC03 KO"¨"- IDPART :"¨DF01-IDPART¨¨         0048  *        
      *  > 06¨"DF02 NON TROUVE"¨"- IDELCO :"¨DF02-IDELCO¨¨       0049  *        
      *  > 07¨"DC02 NON TROUVE"¨"- IDELCO :"¨DC02-IDELCO¨¨       0050  *        
      *  > 08¨"DC05 NON TROUVE"¨"- IDELCO :"¨DC02-IDELCO¨¨       0051  *        
      *  > 09¨"DC23 NON TROUVE"¨"- IDELCO :"¨DC02-IDELCO¨¨       0052  *        
      * AXIMOD        : Fonction standard Module                      ¨*        
      *  > O¨3¨                                                  0001  *        
      ******************************************************************        
      *</cartouche>                  
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  AE521A.                                                     
       AUTHOR.         "ADE : Conditions d'assurance".
       DATE-COMPILED.   12/03/21.                                               
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       SOURCE-COMPUTER. IBM-370.                                                
       OBJECT-COMPUTER. IBM-370.                                                
       SPECIAL-NAMES.                                                           
              C01 IS SAUTP                                                      
              CSP IS SAUT0                                                      
              DECIMAL-POINT IS COMMA.                                           
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.   
      
      *<debut_working�>                                                         
      *                                                                         
      * Working - Gestion des d{branchements (GO TO)                            
      *                                                                         
        COPY 'GENWGNIV'.
      *Zone de composition des Libell{s d'erreur Composite                      
       01                    EREC-ERREUR.                                       
           05                EREC-X0001A           PIC X.                       
           05                EREC-ZLIERT           PIC X(120).                  
      *-----------------------------------------------------------------        
      *Table des libell{s d'erreur non composite (en Majuscule)                 
       01                    ER00-TABLIB.                                       
           05                ER00-ZLIERT           PIC X(120) VALUE             
           " Exemple @ Reproduire ==> NE PAS ECRASER CETTE FAUSSE ANO           
      -    " elle n'est pas prise en compte lors de l'affichage       "         
             .                                                                  
       01                    LIBELLE               REDEFINES                    
                                                   ER00-TABLIB.                 
           05                ER99-ZLIERT           PIC X(120).                  
           05                EREU                  OCCURS 01.                   
                10           EREU-ZLIERT           PIC X(120).                  
      *-----------------------------------------------------------------        
      *-->  Pour affichage d'une anomalie non composite : Erreur NN ==>         
      *Alimenter IEREUR de la valeur NN et Perform de F97-SORTIE-ER95 si        
      *erreur fonctionnelle,F97-SORTIE-ER96 si erreur Format Start              
      *--> Pour des messages d'erreur composites, utiliser la Msp AATME3        
      *-----------------------------------------------------------------        
      *GESTION DES ERREURS CENTRALISEE                                          
       01                    ER00-ZTERMR           IS EXTERNAL PIC              
                                                   X(4000).                     
       01                    ER00-ZTYENT           IS EXTERNAL PIC X.           
       01                    ER00-ZNMPR2           IS EXTERNAL PIC X(8).        
       01                    ER00-ZNMMOD           IS EXTERNAL PIC X(8).        
      *                                                                         
      *GESTION DES APPELS DYNAMIQUES                                            
       01                    CALL-ZNMPR2           PIC X(8).                    
      *TABLE POUR CONCATENATION LIBELLE                                         
       01                    WWPO-LIBEL.                                        
           05                WWPO-LIBELX           PIC X OCCURS 1000.           
       01                    WWPO-POSI1            PIC 9(3) VALUE 0.            
      *Zones de buffers Acc}s Bases                                             
      *                                                                         
      *  SEGMENT  : ELEMENT DE CONTRAT  CREDIT                                  
      *                                                                         
       COPY 'ZCDF01AR' REPLACING ==(PREF)== BY ==DF01==.                        
      *                                                                         
      *  SEGMENT  : ELEMENT DE CONVENTION CREDIT                                
      *                                                                         
       COPY 'ZCDF02AR' REPLACING ==(PREF)== BY ==DF02==.                        
      *                                                                         
      *  SEGMENT  : COMPLEMENT DF01                                             
      *                                                                         
       COPY 'ZCDF11AR' REPLACING ==(PREF)== BY ==DF11==.                        
      *                                                                         
      *  SEGMENT  : PAYEURS                                                     
      *                                                                         
       COPY 'ZCDF29AR' REPLACING ==(PREF)== BY ==DF29==.                        
      *                                                                         
      *  SEGMENT  : RELATION DF29 DF02 "UTILISE"                                
      *                                                                         
       COPY 'ZCDF81AR' REPLACING ==(PREF)== BY ==DF81==.                        
      *                                                                         
      *  SEGMENT  : PARAMETRES                                                  
      *                                                                         
       COPY 'ZCDE04AR' REPLACING ==(PREF)== BY ==DE04==.                        
      *RETOUR ACCES BASE                                                        
       01                    DF01-IK               PIC X VALUE ZERO.            
       01                    DF11-IK               PIC X VALUE ZERO.            
       01                    DF81-IK               PIC X VALUE ZERO.            
       01                    DF02-IK               PIC X VALUE ZERO.            
      *Zones de buffers Echanges avec Sous-Programmes                           
      *ACCES SOUS PROGRAMME X51058A, X51058B, X51058E, X51058H                  
      *                                                                         
      *  SEGMENT  : INTERFACE ADI ACCES ADHESION ET AD11                        
      *                                                                         
       COPY 'D5X58AAR' REPLACING ==(PREF)== BY ==X58A==.                        
      *                                                                         
      *  SEGMENT  : INTERFACE ADI AUTOMATE COTISATIONS                          
      *                                                                         
       COPY 'D5X58BAR' REPLACING ==(PREF)== BY ==X58B==.                        
      *                                                                         
      *  SEGMENT  : INTERFACE ADI ACCES ASSURE                                  
      *                                                                         
       COPY 'D5X58EAR' REPLACING ==(PREF)== BY ==X58E==.                        
      *                                                                         
      *  SEGMENT  : INTERFACE ADI 530001 ADI M25228                             
      *                                                                         
       COPY 'D5X58HAR' REPLACING ==(PREF)== BY ==X58H==.                        
      *ACCES SOUS PROGRAMME X510600, RECUPERATION VERSION ADI                   
      *                                                                         
      *  SEGMENT  : ZONE DE COM. SP X510600                                     
      *                                                                         
       COPY 'D5X601AR' REPLACING ==(PREF)== BY ==X601==.                        
      *Structure de donn{es Requ�te                                             
      *REQUETES DONNEES PARTENAIRE                                              
      *                                                                         
      *  SEGMENT  : REQUETE LIAISON INTER ELEM CONTRAT                          
      *                                                                         
       COPY 'ZCDC02AR' REPLACING ==(PREF)== BY ==DC02==.                        
      *                                                                         
      *  SEGMENT  : REQUETE DONNEES CLIENT BANCAIRE                             
      *                                                                         
       COPY 'ZCDC03AR' REPLACING ==(PREF)== BY ==DC03==.                        
      *                                                                         
      *  SEGMENT  : REQUETE MANIP. REFERENCE CONTRAT                            
      *                                                                         
       COPY 'ZCDC05AR' REPLACING ==(PREF)== BY ==DC05==.                        
      *                                                                         
      *  SEGMENT  : ACQUISITION DONNEES RIB                                     
      *                                                                         
       COPY 'ZCDC23AR' REPLACING ==(PREF)== BY ==DC23==.                        
      *                                                                         
      *  SEGMENT  : SITUATION PARTICULIERE ELT. CONTRAT                         
      *                                                                         
       COPY 'ZCAC70AR' REPLACING ==(PREF)== BY ==AC70==.                        
      *                                                                         
      *INDICATEUR D'ACCES                                                       
       01                    DC03-IK               PIC X VALUE ZERO.            
       01                    DC02-IK               PIC X VALUE ZERO.            
       01                    DC05-IK               PIC X VALUE ZERO.            
       01                    DC23-IK               PIC X VALUE ZERO.            
       01                    AC70-IK               PIC X VALUE ZERO.            
      *Structure de donn{es Acc}s Start                                         
      *ACCES RUBRIQUE START TD15                                                
      *                                                                         
      *  SEGMENT  : ACCES RUBRIQUE START SANS SDT                               
      *                                                                         
       COPY 'ZCTD15AR' REPLACING ==(PREF)== BY ==TD15==.                        
      *ACCES TABLE START DEVISE                                                 
      *                                                                         
      *  SEGMENT  : SDT DEVISES "IN"                                            
      *                                                                         
       COPY 'D5TF73AR' REPLACING ==(PREF)== BY ==TF73==.                        
      *ACCES TABLE START TRAITEMENT SPECIFIQUE                                  
      *                                                                         
      *  SEGMENT  : PARAMETRES TRAITEMENT GREEN                                 
      *                                                                         
       COPY 'D5TF81AR' REPLACING ==(PREF)== BY ==TF81==.                        
      *                                                                         
      *INDICATEUR D'ACCES                                                       
       01                    TD15-IK               PIC X VALUE ZERO.            
       01                    TF73-IK               PIC X VALUE ZERO.            
       01                    TF81-IK               PIC X VALUE ZERO.            
      *                                                                         
      *Zone de travail pour suppression des blancs non significatifs            
       01                    SW00-X4000            PIC X(4000).                 
       01                    FILLER                REDEFINES SW00-X4000.        
           05                SW00-X0001A           OCCURS 4000 PIC X.           
       01                    SW10-X4000.                                        
           05                SW10-X0001A           OCCURS 4000 PIC X.           
       01                    SW20-X0001A           PIC X.                       
       01                    SW25-X0001A           PIC X.                       
      *DESCRIPTION OCCURS ZZLASS DE LA ZONE DE COMM                             
      *DESCRIPTION OCCURS ZLGARA DE LA ZONE DE GARANTIE                         
      *D{finition des zones de communication :                                  
      *-----------------------------------------------------------------        
      *R{ception : Param}tre 8 de +ABSQP = TX00                                 
       01                    TX99.                                              
        02                   TX00.                                              
         03                  TX00-00.                                           
       COPY 'M2WG00AF' REPLACING ==(PREF)== BY ==TX00==.                        
         03                  TX4A.                                              
       COPY 'M2WG4AAF' REPLACING ==(PREF)== BY ==TX4A==.                        
         03                  TX99-ZZFILL           PIC X(20000).                
      *-----------------------------------------------------------------        
      *Emission Service central : Param}tre 9 de +ABSQP = TX00                  
      *  = R{ception TX00 (WG00) + Zone sp{cifique ZC ()                        
       01                    ZCZZ.                                              
         03                  ZCZZ-ZZFILL           PIC X(20000).                
      *-----------------------------------------------------------------        
      *Emission Serveur m{tier : Param}tre 10 de +ABSQP = ME00                  
       01                    ME00.                                              
           05                ME00-00.                                           
       COPY 'M29G00AF' REPLACING ==(PREF)== BY ==ME00==.                        
           05                ME00-SUITE.                                        
                     15      FILLER                PIC X(10165).                
       01                    ME4A                  REDEFINES ME00.              
                10           FILLER                PIC X(00356).                
       COPY 'M29G4AAF' REPLACING ==(PREF)== BY ==ME4A==.                        
       01                    ME95                  REDEFINES ME00.              
                10           FILLER                PIC X(00356).                
       COPY 'M29G95AF' REPLACING ==(PREF)== BY ==ME95==.                        
                10           FILLER                PIC X(10045).                
       01                    ME96                  REDEFINES ME00.              
                10           FILLER                PIC X(00356).                
       COPY 'M29G96AF' REPLACING ==(PREF)== BY ==ME96==.                        
                10           FILLER                PIC X(09737).                
      *-----------------------------------------------------------------        
      *Zones de workings standard                                               
       01                    WW4A-WORKING.                                      
           05                WW4A-DTJOUP           PIC X(8).                    
           05                WW4A-XNXTSV           PIC X(7) VALUE               
                                                   'PC5100'.                    
           05                WW4A-NPHASE           PIC 9 VALUE 1.               
           05                WW4A-ZCVULO           PIC X(4) VALUE               
                                                   '9G4A'.                      
      *Zone banalis{e pour Log F204                                             
       01                    TXLG-X4000            PIC X(4000).                 
      *D{finition du stade de traitement                                        
       01                    WW4A-ADNTCH           PIC 9(01).                   
                          88 RECEPTION             VALUE 1.                     
                          88 EMISSION              VALUE 0.                     
                          88 SERV-CENTRAL          VALUE 9.                     
       01                    WW4A-CDTENS           PIC X.                       
                          88 RETOUR-IMBRICATION    VALUE "R".                   
                          88 APPEL-SRV-IMBRIQUE    VALUE "I".                   
      *                                                                         
      *  SEGMENT  : LINKAGE X722049: Nom externe service                        
      *                                                                         
       COPY 'ZCXT44AU' REPLACING ==(PREF)== BY ==XT44==.                        
      *Linkage X722049 (Multi-Versions)                                         
      *                                                                         
       01                    CICS-SRVNAM           PIC X(8).                    
       01                    CICS-LENGTH           PIC S9(4) COMP.              
      *                                                                         
      *ECRITURE DANS LE LOG CICS                                                
       01                    S-LOGM.                                            
           05                S-LOGM-MESS           PIC X(60).                   
           05                S-LOGM-LTH            PIC S9(4) COMP.              
           05                S-LOGM-ZTRNID         PIC X(4).                    
           05                S-LOGM-ZTASKN         PIC 9(7).                    
      *                                                                         
      *DATE ET HEURE SYSTEME                                                    
       01                    WW00-X0016.                                        
           05                WW00-ZDATE1           PIC X(8).                    
           05                WW00-ZHEURE           PIC X(8).                    
      *                                                                         
      *CODE MISE A JOUR DU SERVEUR                                              
       01                    WC01-CDMAJO           PIC X VALUE " ".             
      *                                                                         
      *REPRISE APPL-CODE POUR ABEND                                             
       01                    APPL.                                              
                10           APPL-CODE             PIC S9(9).                   
                10           APPL-PSSNC2           PIC 9(2).                    
                10           APPL-PSSNC1           PIC S9(9).                   
                10           APPL-PSSNC0           PIC 9(2).                    
                10           APPL-RMNDER           PIC S9(9).                   
                10           APPL-NWORK            PIC 9(2).                    
                10           APPL-CWORK            PIC X(1).                    
                10           APPL-ABEND.                                        
                          20 FILLER                PIC X(1) VALUE "G".          
                          20 APPL-CHAR1            PIC X(1).                    
                          20 APPL-CHAR2            PIC X(1).                    
                          20 APPL-CHAR3            PIC X(1).                    
      *                                                                         
       01                    WW00-ABND             PIC 9.                       
       01                    F200.                                              
           05                F200-SUITE.                                        
                     15      FILLER                PIC X(00056).                
       01                    F203                  REDEFINES F200.              
       COPY 'ZCF203AF' REPLACING ==(PREF)== BY ==F203==.                        
      *WORKING POUR APPEL X58B                                                  
       01                    WW00-PDECHM           PIC 9(3).                    
       01                    WW00-PDUR18           PIC 999.                     
       01                    WW00-ZTOP01           PIC X.                       
      *TOP COMPTE PAYEUR                                                        
       01                    WW00-9N01A            PIC 9.                       
      *FLAG RA trouv{                                                           
       01                    WW00-CPFLAG           PIC 9.                       
      *                                                                         
       01                    DEBUT-WSS.                                         
           05                FILLER                PIC X(7) VALUE               
                                                   "WORKING".                   
           05                IK                    PIC X.                       
       01                    CONSTANTES-PAC.                                    
           05                FILLER                PIC X(60) VALUE              
                     "8619TM5212/03/21AE521AE909537 14:29:24AE521A  PB35        
      -    "12/03/2021".                                                        
       01                    PAC-CONSTANTES        REDEFINES                    
                                                   CONSTANTES-PAC.              
           05                NUGNA                 PIC X(5).                    
           05                APPLI                 PIC X(3).                    
           05                DATGN                 PIC X(8).                    
           05                PROGR                 PIC X(6).                    
           05                CODUTI                PIC X(8).                    
           05                TIMGN                 PIC X(8).                    
           05                PROGE                 PIC X(8).                    
           05                COBASE                PIC X(4).                    
           05                DATGNC                PIC X(10).                   
      *                                                                         
      * Copy working g{n{rale Pacbase pour les programmes                       
      *                                                                         
       COPY 'GENWPACP'.                                                         
       01                    VARIABLES-CONDITIONNELLES.                         
           05                FT                    PIC X VALUE "0".             
                          88 FIN-DE-PROGRAMME      VALUE ALL '1'.               
       01                    INDICES               COMP SYNC.                   
           05                TALLI                 PIC S9(4) VALUE ZERO.        
           05                IEREUL                PIC S9(4) VALUE ZERO.        
           05                IEREUR                PIC S9(4) VALUE ZERO.        
           05                IEREUM                PIC S9(4) VALUE              
                                                   +0001.                       
           05                ILIBEL                PIC S9(4) VALUE ZERO.        
           05                ILIBER                PIC S9(4) VALUE ZERO.        
           05                ILIBEM                PIC S9(4) VALUE              
                                                   +1000.                       
           05                ISW00L                PIC S9(4) VALUE ZERO.        
           05                ISW00R                PIC S9(4) VALUE ZERO.        
           05                ISW00M                PIC S9(4) VALUE              
                                                   +4000.                       
           05                ISW10L                PIC S9(4) VALUE ZERO.        
           05                ISW10R                PIC S9(4) VALUE ZERO.        
           05                ISW10M                PIC S9(4) VALUE              
                                                   +4000.                       
           05                IZLGAL                PIC S9(4) VALUE ZERO.        
           05                IZLGAR                PIC S9(4) VALUE ZERO.        
           05                IZLGAM                PIC S9(4) VALUE              
                                                   +0020.                       
           05                IZZLAL                PIC S9(4) VALUE ZERO.        
           05                IZZLAR                PIC S9(4) VALUE ZERO.        
           05                IZZLAM                PIC S9(4) VALUE              
                                                   +0010.                       
           05                J50CFR                PIC S9(4) VALUE ZERO.        
           05                J50DBR                PIC S9(4) VALUE ZERO.        
           05                J92BDR                PIC S9(4) VALUE ZERO.        
           05                J92BFR                PIC S9(4) VALUE ZERO.        
           05                J92CDR                PIC S9(4) VALUE ZERO.        
           05                J92CLR                PIC S9(4) VALUE ZERO.        
           05                J92EER                PIC S9(4) VALUE ZERO.        
           05                J92EVR                PIC S9(4) VALUE ZERO.        
           05                J92FFR                PIC S9(4) VALUE ZERO.        
           05                J92FRR                PIC S9(4) VALUE ZERO.        
           05                J92GPR                PIC S9(4) VALUE ZERO.        
           05                J92GSR                PIC S9(4) VALUE ZERO.        
           05                J99MDR                PIC S9(4) VALUE ZERO.        
       01                    ZONES-UTILISATEUR     PIC X.                       
      *<fin_working>_01                                                         
      *  SEGMENT  : LINKAGE ACCES BATCH TABLES START                            
      *                                                                         
       COPY 'ZCX308AR' REPLACING ==(PREF)== BY ==X308==.                        
      *                                                                         
      *ENVIRONNEMENT LOGIQUE                                                    
       01                    BLOCLG                IS EXTERNAL.                 
           05                LG-ORDRE              PIC X(20).                   
           05                LG-ZCMAJ              PIC X.                       
           05                LG-STATUS             PIC 9(7).                    
           05                LG-STATUS-INFO        PIC 9(7).                    
           05                LG-ZCLREF             PIC X(100).                  
           05                LG-ZCSQL1             PIC S9(9) SIGN IS            
                                                   TRAILING SEPARATE            
                                                   CHARACTER.                   
           05                LG-ZCSQLC             PIC S9(9) SIGN IS            
                                                   TRAILING SEPARATE            
                                                   CHARACTER.                   
           05                LG-ZCDBUG             PIC X(14).                   
       01                    W-LO99-STATUS         PIC 9(5).                    
                          88 OK                    VALUE 00000.                 
                          88 PAS-TROUVE            VALUE 00004 10004            
                                                   20004 30004 40004            
                                                   50004 17000.                 
                          88 FIN-DOMAINE           VALUE 00001 10001            
                                                   20001 30001 40001            
                                                   50001.                       
                          88 TROUVE-SUP            VALUE 00006.                 
                          88 TROUVE-INF            VALUE 00007.                 
                          88 CREAT-EXIST           VALUE 00040.                 
                          88 ETAB-EXIST            VALUE 00560.                 
                          88 DEFA-INEX             VALUE 00570.                 
                          88 DEJA-CONNEC           VALUE 00660.                 
                          88 MODIF-INEX            VALUE 00100.                 
                          88 SUPP-INEX             VALUE 00120.                 
                          88 DEJA-OUV              VALUE 00400.                 
      *                                                                         
      *ACCES TABLES - X301                                                      
      *                                                                         
      *  SEGMENT  : BLOC COMMUN POUR ACCES TABLES                               
      *                                                                         
       COPY 'ZCX301AR' REPLACING ==(PREF)== BY ==X301==.                        
      *                                                                         
      *INDICATEURS DE MISE A JOUR DB2                                           
      *                                                                         
      *  SEGMENT  : ZONE COMM GESTION INDIC. ACCES BDD                          
      *                                                                         
       COPY 'ZCXT29AU' REPLACING ==(PREF)== BY ==XT29==.                        
      *                                                                         
      *ZONES POUR GESTION LECTURE PARAM}TRE                                     
       01                    PASA-PA01-CPABTD      PIC X(01)                    
                                                          VALUE "A".            
       01                    PASA-PA01-ZCMAJ       PIC X                        
                                                          VALUE "L".            
                                                                                
       01                    PASE-PA01        IS EXTERNAL.                      
           05                PASE-PA01-CTPARA      PIC 99.                      
           05                PASE-PA01-FILLER      PIC X(1000).                 
       01                    PASE-PA01-BALISE IS EXTERNAL.                      
           05                PASE-PA01-CPFLA9      PIC X.                       
      *Zone descriptive utilisable des param}tres 01                            
      *                                                                         
       COPY 'ZCJC01AU' REPLACING ==(PREF)== BY ==PA01==.                        
      *                                                                         
      *ZONES POUR GESTION LECTURE PARAM}TRE                                     
       01                    PASA-PA99-CPABTD      PIC X(01)                    
                                                          VALUE "A".            
       01                    PASA-PA99-ZCMAJ       PIC X                        
                                                          VALUE "L".            
                                                                                
       01                    PASE-PA99        IS EXTERNAL.                      
           05                PASE-PA99-CTPARA      PIC 99.                      
           05                PASE-PA99-FILLER      PIC X(1000).                 
       01                    PASE-PA99-BALISE IS EXTERNAL.                      
           05                PASE-PA99-CPFLA9      PIC X.                       
      *Zone descriptive utilisable des param}tres 99                            
      *                                                                         
       COPY 'D5JC99AU' REPLACING ==(PREF)== BY ==PA99==.                        
      *                                                                         
      *PARAMETRE BIDON POUR L'INITIALISATION DES SPL                            
       01                    W-ZCSGLG              PIC X(1100).                 
      *                                                                         
      *CODES RETOUR REQUETES (10 A 98 SPECIFIQUES A CHAQUE REQUETE)             
       01                    RQEX-CPCLNI           IS EXTERNAL                  
                                                   PIC X.                       
       01                    RQ00-ZRSTAT           PIC 9(2).                    
                          88 R-OK                  VALUE 00.                    
                          88 R-NTROUV              VALUE 01.                    
                          88 R-FINBAL              VALUE 02.                    
                          88 R-PASOUV              VALUE 03.                    
                          88 R-MAJNOK              VALUE 04.                    
                          88 R-ABORT               VALUE 13.                    
                          88 R-CPCLNI              VALUE 15.                    
                          88 R-ORDRFO              VALUE 99.                    
                          88 R-SPECIF              VALUE 61 THRU 98.            
      *ZONE TECHNIQUE POUR REQUETES                                             
      *                                                                         
       COPY 'ZCXE10AR' REPLACING ==(PREF)== BY ==XE10==.                        
      *                                                                         
      *ZONE TECHNIQUE POUR REPOSITIONNEMENT                                     
      *                                                                         
       COPY 'ZCXE11AR' REPLACING ==(PREF)== BY ==XE11==.                        
      *                                                                         
      *</fin_working>                                                           
       LINKAGE SECTION.                                                         
       01                    DFHCOMMAREA.                                       
      *<dfhcommarea�>                                                           
           05                SERV-TECMVS.                                       
                10           SERV-MVSPFX           PIC X(1).                    
                10           SERV-MVSSZE           PIC 9(5).                    
           05                SERV-TECHNC.                                       
                10           SERV-XPRVSV           PIC X(7).                    
                10           SERV-XNXTSV           PIC X(7).                    
                10           SERV-CPSMAJ           PIC X.                       
           05                SERV-DATA             PIC X(20000).                
       PROCEDURE DIVISION USING DFHCOMMAREA.                                    
      *                                                                         
      * -------------> NIVEAU 001                                               
      *                                                                         
      *<debut_procedure�>                                                       
       ENTREE-PROGRAMME.                                                        
           PERFORM DEBUT-PROGRAMME       THRU DEBUT-PROGRAMME-FIN               
           PERFORM TRT-COMMUNS-AVANT     THRU TRT-COMMUNS-AVANT-FIN             
           PERFORM TRT-RECEPTION         THRU TRT-RECEPTION-FIN                 
           PERFORM TRT-AVANT-EMISSION    THRU TRT-AVANT-EMISSION-FIN            
           PERFORM TRT-EMISSION          THRU TRT-EMISSION-FIN                  
           PERFORM TRT-RETOUR-EMISSION   THRU TRT-RETOUR-EMISSION-FIN           
           PERFORM TRT-COMMUNS-APRES     THRU TRT-COMMUNS-APRES-FIN.            
      *                                                                         
       FIN-PROGRAMME.                                                           
           PERFORM ENCHAINEMENTS         THRU ENCHAINEMENTS-FIN                 
           PERFORM SORTIE-ERREUR         THRU SORTIE-ERREUR-FIN.                
      *                                                                         
       DEBUT-PROGRAMME.                                                         
      *               INITIALISATION SERVICE                                    
           PERFORM 002-F0D               THRU 002-F0D-FIN                       
      *               INIT TYPE LECTURE TABLES DB2                              
           PERFORM 100-INITLECT-TABDB2   THRU 100-INITLECT-TABDB2-FIN           
           PERFORM 100-F0J               THRU 100-F0J-FIN                       
      *               Traitements communs / Init.                               
           PERFORM 002-F10               THRU 002-F10-FIN.                      
       DEBUT-PROGRAMME-FIN.                                                     
           EXIT.                                                                
      *                                                                         
       TRT-COMMUNS-AVANT.                                                       
      *               Traitements applicatifs communs                           
      *               AVANT Emission / R{ception                                
           IF EMISSION OR RECEPTION OR SERV-CENTRAL                             
              CONTINUE                                                          
           END-IF.                                                              
       TRT-COMMUNS-AVANT-FIN.                                                   
           EXIT.                                                                
      *                                                                         
       TRT-RECEPTION.                                                           
      *               Traitements R{ception                                     
      *                                                                         
           IF RECEPTION                                                         
              CONTINUE                                                          
           END-IF.                                                              
       TRT-RECEPTION-FIN.                                                       
           EXIT.                                                                
      *                                                                         
       TRT-AVANT-EMISSION.                                                      
      *               Traitements Sp{cifique dans le                            
      *               cas d'un retour suite appel                               
      *               Service imbriqu{ Pr{-{mission                             
      *                                                                         
           IF RETOUR-IMBRICATION                                                
              CONTINUE                                                          
           END-IF.                                                              
       TRT-AVANT-EMISSION-FIN.                                                  
           EXIT.                                                                
      *                                                                         
       TRT-EMISSION.                                                            
      *               Traitements Emission                                      
           IF EMISSION                                                          
              PERFORM 002-F50            THRU 002-F50-FIN                       
           END-IF.                                                              
       TRT-EMISSION-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       TRT-RETOUR-EMISSION.                                                     
      *               Traitements Sp{cifique dans le                            
      *               cas d'un retour suite appel                               
      *               Service imbriqu{ Post {mission                            
      *               Remise en place zones saisies                             
      *               @ partir de la zone TX4A dans                             
      *               ME4A pour r{afficher les valeurs                          
      *               saisies avant d{part sur                                  
      *               le service imbriqu{                                       
      *                                                                         
           IF EMISSION AND RETOUR-IMBRICATION                                   
              CONTINUE                                                          
           END-IF.                                                              
       TRT-RETOUR-EMISSION-FIN.                                                 
           EXIT.                                                                
      *                                                                         
       TRT-COMMUNS-APRES.                                                       
      *               Traitements applicatifs communs                           
      *               APRES Emission / R{ception                                
      *                                                                         
           IF EMISSION OR RECEPTION OR SERV-CENTRAL                             
              CONTINUE                                                          
           END-IF.                                                              
       TRT-COMMUNS-APRES-FIN.                                                   
           EXIT.                                                                
      *                                                                         
       ENCHAINEMENTS.                                                           
      *               Encha�nements                                             
           PERFORM 002-F70               THRU 002-F70-FIN.                      
       ENCHAINEMENTS-FIN.                                                       
           EXIT.                                                                
      *                                                                         
       SORTIE-ERREUR.                                                           
      *               On aurait du sortir dans la                               
      *               fonction pr{c{dente ...                                   
      *               => plantage pour {viter de                                
      *               partir n'importe o� dans les                              
      *               fonctions perform{es                                      
      *               (diagnostic d{licat).                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "71   MAUVAISE GESTION DE LA "                                
                  "SORTIE DU SERVICE EN F70."                                   
                  " => ABORT AVANT DE PARTIR "                                  
                  "DANS LES FONCTIONS DU SERVICE."                              
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       SORTIE-ERREUR-FIN.                                                       
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 002                                               
      *                                                                         
       002-F0D.                                                                 
      *               INITIALISATIONS MESSAGES                                  
           INITIALIZE                         TX00                              
                                              TX00                              
                                              ME00                              
      *               GESTION CENTRALISEE DES MESSAGES                          
           MOVE "T"                        TO ER00-ZTYENT                       
           MOVE PROGE                      TO ER00-ZNMPR2                       
      *               ACQUISITION DATE SYSTEME                                  
           PERFORM 100-ACC-CUR-DATE      THRU 100-ACC-CUR-DATE-FIN              
           MOVE WW00-ZDATE1                TO DATCE                             
      *               RECEPTION DU MESSAGE                                      
           PERFORM LIT-MSG               THRU LIT-MSG-FIN.                      
       002-F0D-FIN.                                                             
           EXIT.                                                                
      *                                                                         
       002-F10.                                                                 
      *               Traitement Initialisation Commun                          
           PERFORM 003-F10BB             THRU 003-F10BB-FIN                     
      *               Initialisation zone {change                               
           PERFORM 003-F10CB             THRU 003-F10CB-FIN                     
      *               RECHERCHE NO VERSION ADI                                  
      *               ------------------------                                  
           INITIALIZE                         X601                              
           PERFORM P-510600              THRU P-510600-FIN                      
      *               PROBLEME RECHERCHE VERSION ADI                            
           IF X601-CPRETO NOT = ZERO                                            
              PERFORM 100-ALIM-ERR-10DB13                                       
                                         THRU 100-ALIM-ERR-10DB13-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              GO TO FIN-PROGRAMME                                               
           END-IF                                                               
      *               Lecture Param}tre PA01 Mode L                             
           PERFORM 100-LECT-PARAM-PA01   THRU 100-LECT-PARAM-PA01-FIN           
      *               Lecture Param}tre PA99 Mode L                             
           PERFORM 100-LECT-PARAM-PA99   THRU 100-LECT-PARAM-PA99-FIN           
      *               Insertion possible                                        
           CONTINUE.                                                            
       002-F10-FIN.                                                             
           EXIT.                                                                
      *                                                                         
       002-F50.                                                                 
      *               CONTROLES                                                 
      *               ---------                                                 
           IF TX00-IDELC0 = SPACES OR TX00-IDELC0 = ZEROES OR                   
              TX00-IDELC0 = LOW-VALUES                                          
      *               PRESENCE IDELCO                                           
              PERFORM 100-ERREUR01       THRU 100-ERREUR01-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN               
           END-IF                                                               
      *               INITIALISATIONS                                           
      *               ---------------                                           
           PERFORM 003-F50BF             THRU 003-F50BF-FIN                     
      *               ALIMENTATION BANDEAU PR�T                                 
      *               -------------------------                                 
      *               ACCES DF01                                                
           PERFORM 003-F50BJ             THRU 003-F50BJ-FIN                     
      *               RECHERCHE ASSURES                                         
      *               -----------------                                         
      *               INITIALISATIONS                                           
           PERFORM 003-F50CB             THRU 003-F50CB-FIN.                    
       002-F50-FIN.                                                             
           EXIT.                                                                
      *                                                                         
       002-F70.                                                                 
      *               Encha�nements                                             
           MOVE PROGE                      TO TX4A-ZNMPR1                       
                                              ME4A-ZNMPR1                       
      *               Affichage : Emission                                      
      *               Appel serveur M{tier                                      
           IF EMISSION                                                          
              PERFORM 003-F70BB          THRU 003-F70BB-FIN                     
           END-IF                                                               
      *               R{cept. : Fin trt et Aiguillage                           
           IF RECEPTION OR SERV-CENTRAL                                         
              PERFORM 003-F70CB          THRU 003-F70CB-FIN                     
           END-IF.                                                              
       002-F70-FIN.                                                             
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 003                                               
      *                                                                         
       003-F10BB.                                                               
      *               Traitement Initialisation Commun                          
           INITIALIZE                         ME00                              
                                              ME4A                              
                                              WW4A-ADNTCH                       
                                              TXLG-X4000                        
                                              EREC-X0001A                       
           MOVE 01                         TO IEREUM                            
           MOVE SPACES                     TO RQEX-CPCLNI                       
      *               Param{trage Date du jour                                  
           MOVE TX4A-DTJOUP                TO WW4A-DTJOUP.                      
       003-F10BB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       003-F10CB.                                                               
      *               Initialisation zone {change                               
           PERFORM 099-F10CB             THRU 099-F10CB-FIN                     
      *               Sp{cifique Serveur-Serveur                                
           IF TX4A-ZQLCOD NUMERIC AND TX4A-ZQLCOD > ZEROES                      
              MOVE TX00 (TX4A-ZQLCOD:)     TO ZCZZ                              
           END-IF.                                                              
       003-F10CB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       003-F50BF.                                                               
      *               INITIALISATIONS                                           
      *               ---------------                                           
           MOVE "0"                        TO WW00-ZTOP01                       
      *               RUBRIQUES INFO PRET                                       
           INITIALIZE                         ME4A-ZZINFP                       
      *               INITIALISATION ZONES OCCURS{ES                            
      *               ------------------------------                            
           PERFORM 004-F92BB             THRU 004-F92BB-FIN.                    
       003-F50BF-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       003-F50BJ.                                                               
      *               ALIMENTATION BANDEAU PR�T                                 
      *               -------------------------                                 
      *               ACCES DF01                                                
           PERFORM 099-F50BJ             THRU 099-F50BJ-FIN                     
      *               RECHERCHE COMPTE PAYEUR                                   
      *               -----------------------                                   
      *               APPEL DC02                                                
           PERFORM 004-F92JB             THRU 004-F92JB-FIN                     
      *               SI NON TROUVE                                             
      *               RECHERCHE COMPTE PAYEUR                                   
      *               -----------------------                                   
      *               ACCES DF02                                                
           IF WW00-9N01A = 0                                                    
              PERFORM 004-F92KB          THRU 004-F92KB-FIN                     
           END-IF                                                               
      *               ALIMENTATION DES RUBRIQUES                                
      *               --------------------------                                
           MOVE TX00-IDELC0                TO ME4A-IDELCO                       
           MOVE DF01-NOOPPR                TO ME4A-NOOPPR                       
           MOVE DF01-NOPRPR                TO ME4A-NOPRPR                       
           MOVE DF01-MTPACR                TO ME4A-MTPA1A                       
           MOVE DF01-MKDURE                TO ME4A-MKDURC                       
           MOVE DF01-DHDNPR                TO ME4A-DHDNPR                       
           MOVE DF01-IDPART                TO ME4A-IDPART                       
      *               ALIMENTATION DES LIBELLES                                 
      *               -------------------------                                 
      *               LIBELLE PARTENAIRE                                        
           PERFORM 099-F50BN             THRU 099-F50BN-FIN.                    
       003-F50BJ-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       003-F50CB.                                                               
           PERFORM 100-INIT-SAUTNIV      THRU 100-INIT-SAUTNIV-FIN              
      *               RECHERCHE ASSURES                                         
      *               -----------------                                         
      *               INITIALISATIONS                                           
           MOVE "ZZ"                       TO ME4A-CDHRZ1                       
           INITIALIZE                         X58H                              
      *               ALIMENATION X58H POUR APPEL                               
      *               ---------------------------                               
           PERFORM 004-F92CB             THRU 004-F92CB-FIN                     
      *               APPEL X51058H                                             
           PERFORM P-51058H              THRU P-51058H-FIN                      
      *               ASSURES TROUVES                                           
      *               ---------------                                           
           IF X58H-QTASSU NOT= ZEROES                                           
              PERFORM 004-F50CD          THRU 004-F50CD-FIN                     
           END-IF                                                               
      *               ASSURES NON TROUVES                                       
      *               -------------------                                       
           IF TRT-NIV04                                                         
              PERFORM 100-INIT-SAUTNIV   THRU 100-INIT-SAUTNIV-FIN              
              IF X58H-QTASSU = ZEROES                                           
                 PERFORM 100-ALIM-ERR-50DM03                                    
                                         THRU 100-ALIM-ERR-50DM03-FIN           
                 PERFORM P-722020        THRU P-722020-FIN                      
              END-IF                                                            
           END-IF.                                                              
       003-F50CB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       003-F70BB.                                                               
      *               Affichage : Emission                                      
      *               Appel serveur M{tier                                      
           MOVE PROGE                      TO SERV-XNXTSV                       
           MOVE SPACES                     TO ME00-CDTFCT                       
           MOVE WW4A-NPHASE                TO ME00-NPHASE                       
                                              ME4A-NPHASE                       
           MOVE WW4A-ZCVULO                TO ME00-ZCVULO                       
                                              ME4A-ZCVULO                       
      *               Sauvegarde de la PU en cours                              
      *               du dernier {cran affich{                                  
           MOVE TX00-CDPUGW                TO ME4A-CDPUG4                       
      *               Passer la main au Serveur M{tier                          
           MOVE ME00                       TO SERV-DATA                         
           PERFORM SORTIE-OK             THRU SORTIE-OK-FIN.                    
       003-F70BB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       003-F70CB.                                                               
      *               R{cept. : Fin trt et Aiguillage                           
           MOVE WW4A-XNXTSV                TO SERV-XNXTSV                       
           MOVE WW4A-ZCVULO                TO TX00-ZCVULO                       
           MOVE ZERO                       TO TX00-NPHASE                       
           COMPUTE TX4A-ZQLCOD = LENGTH OF TX00-00 + LENGTH OF TX4A + 1         
           MOVE ZCZZ                       TO TX99-ZZFILL                       
      *               D{part ou Retour vers le futur                            
           PERFORM FWD-SERVICE           THRU FWD-SERVICE-FIN.                  
       003-F70CB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 004                                               
      *                                                                         
       004-F92BB.                                                               
      *               INITIALISATION ZLGARA                                     
      *               ---------------------                                     
           PERFORM VARYING J92BDR FROM 1 BY 1                                   
                                        UNTIL J92BDR > IZLGAM                   
              PERFORM 005-F92BD          THRU 005-F92BD-FIN                     
           END-PERFORM                                                          
      *               INITIALISATION ZZLASS                                     
      *               ---------------------                                     
           PERFORM VARYING J92BFR FROM 1 BY 1                                   
                                        UNTIL J92BFR > IZZLAM                   
              PERFORM 005-F92BF          THRU 005-F92BF-FIN                     
           END-PERFORM.                                                         
       004-F92BB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       004-F92JB.                                                               
      *               RECHERCHE COMPTE PAYEUR                                   
      *               -----------------------                                   
      *               APPEL DC02                                                
           INITIALIZE                         DC02                              
                                              DC02-IK                           
           MOVE 0                          TO WW00-9N01A                        
           MOVE DF01-IDELCO                TO DC02-IDELCO                       
           MOVE "PR"                       TO DC02-CDDOPR                       
           PERFORM 100-F95-LF1-DC02      THRU 100-F95-LF1-DC02-FIN              
           MOVE IK                         TO DC02-IK                           
      *               BOUCLE DC02                                               
      *               ------------                                              
           PERFORM 100-INIT-BOUCLE       THRU 100-INIT-BOUCLE-FIN               
           PERFORM 005-F92JD             THRU 005-F92JD-FIN                     
                                        UNTIL (NOT BOUCLE-NIV05) OR             
                                              DC02-IK NOT = ZERO                
           PERFORM 100-INIT-SAUTNIV      THRU 100-INIT-SAUTNIV-FIN              
      *               RECHERCHE COMPTE                                          
      *               ----------------                                          
      *               ACCES DC05 REF CONTRAT                                    
           IF WW00-9N01A = 1                                                    
              PERFORM 099-F92JF          THRU 099-F92JF-FIN                     
           END-IF.                                                              
       004-F92JB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       004-F92KB.                                                               
      *               RECHERCHE COMPTE PAYEUR                                   
      *               -----------------------                                   
      *               ACCES DF02                                                
           INITIALIZE                         DF02                              
                                              DF02-IK                           
           MOVE DF01-IDELCO                TO DF02-IDELCO                       
           MOVE ZERO                       TO DF02-NUELCV                       
           PERFORM 100-ACCES-OCI-DF02    THRU 100-ACCES-OCI-DF02-FIN            
           MOVE IK                         TO DF02-IK                           
      *               BOUCLE DF02                                               
      *               ------------                                              
           PERFORM 005-F92KD             THRU 005-F92KD-FIN                     
                                        UNTIL NOT (DF02-IK = ZERO AND           
                                              (DF02-CTROCV NOT= 2 OR            
                                              DF02-DEELCV > PA01-DTJOUP         
                                              OR                                
                                              DF02-DFELCV <                     
                                              PA01-DTJOUP))                     
      *               TROUVE                                                    
      *               -------                                                   
      *               ACCES DF81                                                
           IF DF02-CTROCV = 2                                                   
              PERFORM 099-F92KF          THRU 099-F92KF-FIN                     
           END-IF                                                               
      *               PAS TROUVE                                                
      *               ----------                                                
           IF DF02-IK NOT= ZERO                                                 
              PERFORM 100-ALIM-ERR-92KH10                                       
                                         THRU 100-ALIM-ERR-92KH10-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM 100-ERREUR06       THRU 100-ERREUR06-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN               
           END-IF.                                                              
       004-F92KB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       004-F92CB.                                                               
      *               INITIALISATION ZONE OCCURSEE                              
      *               ----------------------------                              
           PERFORM VARYING J92CDR FROM 1 BY 1                                   
                                        UNTIL J92CDR > 10                       
              PERFORM 005-F92CD          THRU 005-F92CD-FIN                     
           END-PERFORM                                                          
      *               ALIMENTATION APPEL                                        
      *               ------------------                                        
           MOVE X601-NOVADI                TO X58H-NOVADI                       
           MOVE DF01-IDELCO                TO X58H-IDPRAS.                      
       004-F92CB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       004-F50CD.                                                               
      *               BOUCLE / ASSURE POUR ALIM DONNES                          
      *               --------------------------------                          
           PERFORM 100-INIT-BOUCLE       THRU 100-INIT-BOUCLE-FIN               
           PERFORM VARYING J50CFR FROM 1 BY 1                                   
                                        UNTIL (NOT BOUCLE-NIV05) OR             
                                              J50CFR > X58H-QTASSU              
              PERFORM 005-F50CF          THRU 005-F50CF-FIN                     
           END-PERFORM                                                          
      *               CODE HORIZON GENERAL                                      
      *               --------------------                                      
      *               APPEL 51058A                                              
           IF TRT-NIV05                                                         
              PERFORM 100-INIT-SAUTNIV   THRU 100-INIT-SAUTNIV-FIN              
                                                                                
      *               RECHERCHE DONNEES ADHESION                                
      *               --------------------------                                
              PERFORM 005-F50DA          THRU 005-F50DA-FIN                     
           END-IF.                                                              
       004-F50CD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 005                                               
      *                                                                         
       005-F92BD.                                                               
      *               INITIALISATION ZLGARA                                     
      *               ---------------------                                     
           INITIALIZE                         ME4A-LIGADE (J92BDR)              
                                              ME4A-CDGADE (J92BDR).             
       005-F92BD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       005-F92BF.                                                               
      *               INITIALISATION ZZLASS                                     
      *               ---------------------                                     
           INITIALIZE                         ME4A-ZZLASS (J92BFR).             
       005-F92BF-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       005-F92ID.                                                               
      *               BOUCLE AC70                                               
      *               ------------                                              
           PERFORM 100-INIT-SAUTNIV      THRU 100-INIT-SAUTNIV-FIN              
           PERFORM 099-F92ID             THRU 099-F92ID-FIN.                    
       005-F92ID-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       005-F92JD.                                                               
           PERFORM 100-INIT-SAUTNIV      THRU 100-INIT-SAUTNIV-FIN              
      *               BOUCLE DC02                                               
      *               ------------                                              
           PERFORM 099-F92JD             THRU 099-F92JD-FIN.                    
       005-F92JD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       005-F92KD.                                                               
      *               BOUCLE DF02                                               
      *               ------------                                              
           PERFORM 100-ACCES-OCS-DF02    THRU 100-ACCES-OCS-DF02-FIN            
           MOVE IK                         TO DF02-IK.                          
       005-F92KD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       005-F92CD.                                                               
      *               INITIALISATION ZONE OCCURSEE                              
      *               ----------------------------                              
           INITIALIZE                         X58H-ZZASSU (J92CDR).             
       005-F92CD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       005-F50CF.                                                               
      *               BOUCLE / ASSURE POUR ALIM DONNES                          
      *               --------------------------------                          
           MOVE X58H-LINOA1 (J50CFR)       TO ME4A-LINOAS (J50CFR)              
           MOVE X58H-DANAIS (J50CFR)       TO ME4A-DANAIS (J50CFR)              
           MOVE X58H-IDASCN (J50CFR)       TO ME4A-IDASCN (J50CFR)              
           MOVE X58H-CQRPCN (J50CFR)       TO ME4A-CQRPCN (J50CFR)              
      *               LIBELLE FRANCHISE CDC                                     
      *               ---------------------                                     
           INITIALIZE                         TD15                              
           MOVE X58H-CQRPCN (J50CFR)       TO TD15-ZVAMIN                       
           PERFORM DE-RB0990ADI018-B     THRU DE-RB0990ADI018-B-FIN             
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIRPCN (J50CFR)              
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LIRPCN (J50CFR)              
           END-IF                                                               
           INITIALIZE                         X58B                              
      *               ALIMENATION X58B POUR APPEL                               
      *               ---------------------------                               
           PERFORM 006-F92CJ             THRU 006-F92CJ-FIN                     
           PERFORM P-51058B              THRU P-51058B-FIN                      
      *               PB LECTURE ASSURES ADI                                    
           IF X58B-ZCDRET = SPACE OR                                            
              (X58B-ZCDRET NOT = "99" AND X58B-ZCDRET NOT = ZERO)               
              PERFORM 100-ALIM-ERR-50CF28                                       
                                         THRU 100-ALIM-ERR-50CF28-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              SUBTRACT 1                 FROM J50CFR                            
              MOVE 'O'                     TO SAUT-NIV04                        
              MOVE 'O'                     TO FIN-BOUCLE-NIV03                  
           END-IF                                                               
      *               RETOUR 51058B OK                                          
      *               ----------------                                          
      *               CALCUL TAUX + MONTANT                                     
           IF TRT-NIV06                                                         
              PERFORM 100-INIT-SAUTNIV   THRU 100-INIT-SAUTNIV-FIN              
              PERFORM 006-F50CH          THRU 006-F50CH-FIN                     
           END-IF.                                                              
       005-F50CF-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       005-F50DA.                                                               
           PERFORM 100-INIT-SAUTNIV      THRU 100-INIT-SAUTNIV-FIN              
      *               RECHERCHE DONNEES ADHESION                                
      *               --------------------------                                
           IF ME4A-CDHRZ1 = SPACES OR ME4A-CDHRZ1 = ZEROES                      
              MOVE "H0"                    TO ME4A-CDHRZ1                       
           END-IF                                                               
      *               DONNEES ADHESION ASSURES                                  
      *               ------------------------                                  
      *               APPEL 51058A                                              
           PERFORM VARYING J50DBR FROM 1 BY 1                                   
                                        UNTIL J50DBR > X58H-QTASSU              
              PERFORM 006-F50DB          THRU 006-F50DB-FIN                     
           END-PERFORM.                                                         
       005-F50DA-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 006                                               
      *                                                                         
       006-F92CJ.                                                               
      *               ALIMENATION X58B POUR APPEL                               
      *               ---------------------------                               
           INITIALIZE                         X58B                              
      *               INITIALISATION ZONE OCCURSEE                              
      *               ----------------------------                              
           PERFORM VARYING J92CLR FROM 1 BY 1                                   
                                        UNTIL J92CLR > 660                      
              PERFORM 007-F92CL          THRU 007-F92CL-FIN                     
           END-PERFORM                                                          
      *               ACCES AD10-AD11 - CODE HORIZON GENERAL                    
      *               --------------------------------------                    
      *               ALIMENTATION X58A                                         
           PERFORM 099-F92DK             THRU 099-F92DK-FIN                     
           MOVE ME4A-IDASCN (J50CFR)       TO X58A-IDASCN                       
      *               APPEL 51058A                                              
           PERFORM P-51058A              THRU P-51058A-FIN                      
      *               SI PROBLEME RETOUR X51058A                                
           IF X58A-CESADI NOT = ZEROES AND X58A-CESADI NOT = "0 " AND           
              X58A-CESADI NOT = " 0" AND X58A-CESADI NOT = SPACES               
              PERFORM 100-ALIM-ERR-92CJ20                                       
                                         THRU 100-ALIM-ERR-92CJ20-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
           END-IF                                                               
      *               DEFINITION HORIZON GENERAL                                
           IF ME4A-CDHRZ1 = "ZZ"                                                
              MOVE X58A-CDHRZ              TO ME4A-CDHRZ1                       
           END-IF                                                               
           IF ME4A-CDHRZ1 NOT = "ZZ" AND ME4A-CDHRZ1 NOT = "H2" AND             
              X58A-CDHRZ = "H2"                                                 
              MOVE "MI"                    TO ME4A-CDHRZ1                       
           END-IF                                                               
           IF ME4A-CDHRZ1 = "H2" AND X58A-CDHRZ NOT = "H2"                      
              MOVE "MI"                    TO ME4A-CDHRZ1                       
           END-IF.                                                              
                                                                                
      *               ALIMENTATION X58B                                         
      *               -----------------                                         
      *               DETERMINATION DUREE                                       
           PERFORM 007-F92CN             THRU 007-F92CN-FIN.                    
       006-F92CJ-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       006-F50CH.                                                               
      *               CALCUL TAUX ET MONTANT                                    
      *               ----------------------                                    
      *               CACUL TAUX                                                
           COMPUTE ME4A-TXMAD1 (J50CFR) = X58B-TCAMDC + X58B-TCAMIT +           
                                          X58B-TCAMI3 + X58B-TCAMCH +           
                                          X58B-TCAMCD + X58B-TCAMMN +           
                                          X58B-TCAMTP + X58B-TCAMA0 +           
                                          X58B-TCAMMR + X58B-TCAMIP +           
                                          X58B-TCAMIC + X58B-TCOCHO             
      *               CALCUL MONTANT                                            
           COMPUTE ME4A-MCCOMA (J50CFR) = X58B-MCCOMF (1) + X58B-MCCOMG         
                                          (1)                                   
      *               RETOUR 51058B OK                                          
      *               ----------------                                          
      *               CALCUL TAUX + MONTANT                                     
           PERFORM 099-F50CH             THRU 099-F50CH-FIN.                    
       006-F50CH-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       006-F50DB.                                                               
      *               ALIMENTATION X58A POUR APPEL                              
      *               ----------------------------                              
           PERFORM 099-F92DK             THRU 099-F92DK-FIN                     
      *               DONNEES ADHESION ASSURES                                  
      *               ------------------------                                  
      *               APPEL 51058A                                              
           MOVE ME4A-IDASCN (J50DBR)       TO X58A-IDASCN                       
           PERFORM P-51058A              THRU P-51058A-FIN                      
      *               PROBLEME RETOUR X51058A                                   
           IF X58A-CESADI NOT = ZEROES AND X58A-CESADI NOT = "0 " AND           
              X58A-CESADI NOT = " 0" AND X58A-CESADI NOT = SPACES               
              PERFORM 100-ALIM-ERR-50DB19                                       
                                         THRU 100-ALIM-ERR-50DB19-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
           END-IF                                                               
      *               RETOUR X51058A OK                                         
      *               -----------------                                         
           IF X58A-CESADI = ZEROES OR X58A-CESADI = "0 " OR                     
              X58A-CESADI = " 0" OR X58A-CESADI = SPACES                        
              PERFORM 007-F50DD          THRU 007-F50DD-FIN                     
           END-IF                                                               
      *               RECHERCHE SINISTRE EN COURS                               
      *               ---------------------------                               
      *               RECHERCHE SINISTRE EN COURS                               
      *               ---------------------------                               
           PERFORM 007-F92HB             THRU 007-F92HB-FIN.                    
       006-F50DB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 007                                               
      *                                                                         
       007-F92CL.                                                               
      *               INITIALISATION ZONE OCCURSEE                              
      *               ----------------------------                              
           MOVE ZEROES                     TO X58B-MKDUT8 (J92CLR)              
           MOVE ZEROES                     TO X58B-MCCOMF (J92CLR)              
           MOVE ZEROES                     TO X58B-MCCOMG (J92CLR).             
       007-F92CL-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       007-F92CN.                                                               
      *               CALCUL PDUR18                                             
      *               -------------                                             
           PERFORM 099-F92DB             THRU 099-F92DB-FIN                     
      *               ALIMENTATION X58B                                         
      *               -----------------                                         
      *               DETERMINATION DUREE                                       
           PERFORM 099-F92CN             THRU 099-F92CN-FIN.                    
       007-F92CN-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       007-F50DD.                                                               
      *               SI LIBELLES GARANTIES NON ALIM                            
           IF WW00-ZTOP01 = "0"                                                 
           OR (ME4A-CDHRZ1 = "MI"                                               
               AND X58A-CDMAAS NOT= "  " AND ME4A-CDMAAS = "  ")                
      *               SI LIBELLES GARANTIES NON ALIM                            
              MOVE X58A-CDMAAS             TO ME4A-CDMAAS                       
      *               ALIMENTATION LIBELLE GARANTIES                            
      *               ------------------------------                            
      *               HORIZON DIFFERENT DE MIXTE ET H2                          
      *               --------------------------------                          
              IF ME4A-CDHRZ1 NOT= "MI" AND ME4A-CDHRZ1 NOT= "H2"                
                 MOVE "DECES"              TO ME4A-LIGADE (1)                   
                 MOVE "PTIA"               TO ME4A-LIGADE (2)                   
                 MOVE "ITD"                TO ME4A-LIGADE (3)                   
                 MOVE "ITT IPT"            TO ME4A-LIGADE (4)                   
                 MOVE "PE"                 TO ME4A-LIGADE (5)                   
                 MOVE 5                    TO IZLGAL                            
      *               ALIMENTATION CODE GARANTIE                                
      *               --------------------------                                
                 PERFORM VARYING J92EER FROM 1 BY 1                             
                                        UNTIL J92EER > IZLGAL                   
                    PERFORM 100-INIT-SAUTNIV                                    
                                         THRU 100-INIT-SAUTNIV-FIN              
                    MOVE "00"              TO ME4A-CDGADE (J92EER)              
                 END-PERFORM                                                    
              END-IF                                                            
      *               HORIZON MIXTE ET MARCHE CS                                
      *               --------------------------                                
              IF ME4A-CDHRZ1 = "MI" AND ME4A-CDMAAS = "CS" AND                  
                 ME4A-CDCAPR(J50DBR) NOT = "V"                                  
                 MOVE "01"                 TO ME4A-CDGADE (1)                   
                 MOVE "02"                 TO ME4A-CDGADE (2)                   
                 MOVE "05"                 TO ME4A-CDGADE (3)                   
                 MOVE "03"                 TO ME4A-CDGADE (4)                   
                 MOVE "04"                 TO ME4A-CDGADE (5)                   
                 MOVE 5                    TO IZLGAL                            
      *               RECHERCHE LIBELLES                                        
      *               ------------------                                        
                 PERFORM VARYING J92EVR FROM 1 BY 1                             
                                        UNTIL J92EVR > IZLGAL                   
                    PERFORM 008-F92EV    THRU 008-F92EV-FIN                     
                 END-PERFORM                                                    
              END-IF                                                            
      *               HORIZON MIXTE ET MARCHE IM                                
      *               --------------------------                                
              IF ME4A-CDHRZ1 = "MI" AND                                         
                 (ME4A-CDMAAS = "IM" OR                                         
                  (ME4A-CDMAAS = "CS" AND ME4A-CDCAPR(J50DBR) = "V" ))          
                 PERFORM 099-F92EI       THRU 099-F92EI-FIN                     
      *               RECHERCHE LIBELLES                                        
      *               ------------------                                        
                 PERFORM VARYING J92EVR FROM 1 BY 1                             
                                        UNTIL J92EVR > IZLGAL                   
                    PERFORM 008-F92EV    THRU 008-F92EV-FIN                     
                 END-PERFORM                                                    
              END-IF                                                            
      *               HORIZON MIXTE ET MARCHE PA                                
      *               --------------------------                                
              IF ME4A-CDHRZ1 = "MI" AND ME4A-CDMAAS = "PA"                      
                 PERFORM 099-F92EK       THRU 099-F92EK-FIN                     
      *               RECHERCHE LIBELLES                                        
      *               ------------------                                        
                 PERFORM VARYING J92EVR FROM 1 BY 1                             
                                        UNTIL J92EVR > IZLGAL                   
                    PERFORM 008-F92EV    THRU 008-F92EV-FIN                     
                 END-PERFORM                                                    
              END-IF                                                            
      *               HORIZON H2 MARCHE CS                                      
      *               --------------------------                                
              IF ME4A-CDHRZ1 = "H2" AND ME4A-CDMAAS = "CS" AND                  
                 ME4A-CDCAPR(J50DBR) NOT = "V"                                  
                 MOVE "01"                 TO ME4A-CDGADE (1)                   
                 MOVE "02"                 TO ME4A-CDGADE (2)                   
                 MOVE "03"                 TO ME4A-CDGADE (3)                   
                 MOVE "04"                 TO ME4A-CDGADE (4)                   
                 MOVE 4                    TO IZLGAL                            
      *               RECHERCHE LIBELLES                                        
      *               ------------------                                        
                 PERFORM VARYING J92EVR FROM 1 BY 1                             
                                        UNTIL J92EVR > IZLGAL                   
                    PERFORM 008-F92EV    THRU 008-F92EV-FIN                     
                 END-PERFORM                                                    
              END-IF                                                            
      *               HORIZON H2 ET MARCHE IM                                   
      *               -----------------------                                   
              IF ME4A-CDHRZ1 = "H2" AND                                         
                 (ME4A-CDMAAS = "IM" OR                                         
                  (ME4A-CDMAAS = "CS" AND ME4A-CDCAPR(J50DBR) = "V" ))          
                 MOVE "01"                 TO ME4A-CDGADE (1)                   
                 MOVE "02"                 TO ME4A-CDGADE (2)                   
                 MOVE "03"                 TO ME4A-CDGADE (3)                   
                 MOVE "04"                 TO ME4A-CDGADE (4)                   
                 MOVE "06"                 TO ME4A-CDGADE (5)                   
                 MOVE "08"                 TO ME4A-CDGADE (6)                   
                 MOVE "09"                 TO ME4A-CDGADE (7)                   
                 MOVE "07"                 TO ME4A-CDGADE (8)                   
                 MOVE "10"                 TO ME4A-CDGADE (9)                   
                 MOVE 9                    TO IZLGAL                            
      *               RECHERCHE LIBELLES                                        
      *               ------------------                                        
                 PERFORM VARYING J92EVR FROM 1 BY 1                             
                                        UNTIL J92EVR > IZLGAL                   
                    PERFORM 008-F92EV    THRU 008-F92EV-FIN                     
                 END-PERFORM                                                    
              END-IF                                                            
      *               HORIZON H2 ET MARCHE PA                                   
      *               -----------------------                                   
              IF ME4A-CDHRZ1 = "H2" AND ME4A-CDMAAS = "PA"                      
                 MOVE "01"                 TO ME4A-CDGADE (1)                   
                 MOVE "02"                 TO ME4A-CDGADE (2)                   
                 MOVE "03"                 TO ME4A-CDGADE (3)                   
                 MOVE "06"                 TO ME4A-CDGADE (4)                   
                 MOVE "11"                 TO ME4A-CDGADE (5)                   
                 MOVE "09"                 TO ME4A-CDGADE (6)                   
                 MOVE "07"                 TO ME4A-CDGADE (7)                   
                 MOVE "10"                 TO ME4A-CDGADE (8)                   
                 MOVE 8                    TO IZLGAL                            
      *               RECHERCHE LIBELLES                                        
      *               ------------------                                        
                 PERFORM VARYING J92EVR FROM 1 BY 1                             
                                        UNTIL J92EVR > IZLGAL                   
                    PERFORM 008-F92EV    THRU 008-F92EV-FIN                     
                 END-PERFORM                                                    
              END-IF                                                            
              MOVE "1"                     TO WW00-ZTOP01                       
           END-IF                                                               
      *               ALIMENTATION DES GARANTIES                                
      *               --------------------------                                
      *               HORIZON GENERAL SIMPLE H0 OU H1                           
      *               ALIMENTATION GARANTIES H0-H1                              
      *               ----------------------------                              
           IF ME4A-CDHRZ1 = "H0" OR ME4A-CDHRZ1 = "H1"                          
              PERFORM VARYING J92FFR FROM 1 BY 1                                
                                        UNTIL J92FFR > IZLGAL                   
                 PERFORM 100-INIT-SAUTNIV                                       
                                         THRU 100-INIT-SAUTNIV-FIN              
      *               GARANTIE DC                                               
      *               -----------                                               
                 IF ME4A-LIGADE(J92FFR) = "DECES"                               
                    PERFORM 099-F92FG    THRU 099-F92FG-FIN                     
                 END-IF                                                         
      *               GARANTIE PTIA                                             
      *               -------------                                             
                 IF ME4A-LIGADE(J92FFR) = "PTIA"                                
                    PERFORM 099-F92FI    THRU 099-F92FI-FIN                     
                 END-IF                                                         
      *               GARANTIE ITD                                              
      *               ------------                                              
                 IF ME4A-LIGADE(J92FFR) = "ITD"                                 
                    PERFORM 099-F92FK    THRU 099-F92FK-FIN                     
                 END-IF                                                         
      *               GARANTIE ITT/IPT                                          
      *               ----------------                                          
                 IF ME4A-LIGADE(J92FFR) = "ITT IPT"                             
                    PERFORM 099-F92FM    THRU 099-F92FM-FIN                     
                 END-IF                                                         
      *               GARANTIE PE                                               
      *               -----------                                               
                 IF ME4A-LIGADE(J92FFR) = "PE"                                  
                    PERFORM 099-F92FO    THRU 099-F92FO-FIN                     
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF                                                               
      *               HORIZON GENERAL SIMPLE H2                                 
      *               ALIMENTATION GARANTIES H2                                 
      *               -------------------------                                 
           IF ME4A-CDHRZ1 = "H2"                                                
              PERFORM VARYING J92FRR FROM 1 BY 1                                
                                        UNTIL J92FRR > IZLGAL                   
                 PERFORM 100-INIT-SAUTNIV                                       
                                         THRU 100-INIT-SAUTNIV-FIN              
      *               GARANTIE DC                                               
      *               -----------                                               
                 IF ME4A-CDGADE(J92FRR) = "01"                                  
                    PERFORM 099-F92FS    THRU 099-F92FS-FIN                     
                 END-IF                                                         
      *               GARANTIE PTIA                                             
      *               -------------                                             
                 IF ME4A-CDGADE(J92FRR) = "02"                                  
                    PERFORM 099-F92FU    THRU 099-F92FU-FIN                     
                 END-IF                                                         
      *               GARANTIE ITT/IPT                                          
      *               ----------------                                          
                 IF ME4A-CDGADE(J92FRR) = "03"                                  
                    PERFORM 099-F92FW-1  THRU 099-F92FW-1-FIN                   
                    IF X58A-CPITTC > 0 AND X58A-QQGTIT NOT= ZERO                
                       PERFORM 099-F92FW-2                                      
                                         THRU 099-F92FW-2-FIN                   
      *               LIBELLE FRANCHISE ITT/IPT                                 
      *               -------------------------                                 
                       PERFORM 099-F92LB THRU 099-F92LB-FIN                     
                    END-IF                                                      
                 END-IF                                                         
      *               GARANTIE IPP                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "06"                                  
                    PERFORM 099-F92FY    THRU 099-F92FY-FIN                     
                 END-IF                                                         
      *               GARANTIE TPT                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "08"                                  
                    PERFORM 099-F92GA-1  THRU 099-F92GA-1-FIN                   
                    IF X58A-CDTPTC > 0                                          
                       PERFORM 099-F92GA-2                                      
                                         THRU 099-F92GA-2-FIN                   
      *               LIBELLE FRANCHISE TPT                                     
      *               ---------------------                                     
                       PERFORM 099-F92LD THRU 099-F92LD-FIN                     
                    END-IF                                                      
                 END-IF                                                         
      *               GARANTIE F0J                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "09"                                  
                    PERFORM 099-F92GC    THRU 099-F92GC-FIN                     
                 END-IF                                                         
      *               GARANTIE MNO                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "07"                                  
                    PERFORM 099-F92GE    THRU 099-F92GE-FIN                     
                 END-IF                                                         
      *               GARANTIE IPC                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "11"                                  
                    PERFORM 099-F92GG    THRU 099-F92GG-FIN                     
                 END-IF                                                         
      *               GARANTIE PE                                               
      *               -----------                                               
                 IF ME4A-CDGADE(J92FRR) = "04"                                  
                    PERFORM 099-F92GI-1  THRU 099-F92GI-1-FIN                   
                    IF X58A-CPCHOC > 0                                          
                       PERFORM 099-F92GI-2                                      
                                         THRU 099-F92GI-2-FIN                   
      *               LIBELLE FRANCHISE PE                                      
      *               --------------------                                      
                       PERFORM 099-F92LF THRU 099-F92LF-FIN                     
                    END-IF                                                      
                 END-IF                                                         
      *               GARANTIE CDC                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "10"                                  
                    PERFORM 099-F92GK-1  THRU 099-F92GK-1-FIN                   
                    IF X58A-CDCDCC > 0                                          
                       PERFORM 099-F92GK-2                                      
                                         THRU 099-F92GK-2-FIN                   
      *               LIBELLE FRANCHISE CDC                                     
      *               ---------------------                                     
                       PERFORM 099-F92LH THRU 099-F92LH-FIN                     
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF                                                               
      *               HORIZON GENERAL MIXTE, ASSU H0/1                          
      *               ALIMENTATION GARANTIES H0-H1                              
      *               ----------------------------                              
           IF ME4A-CDHRZ1 = "MI" AND X58A-CDHRZ NOT= "H2"                       
              PERFORM VARYING J92FFR FROM 1 BY 1                                
                                        UNTIL J92FFR > IZLGAL                   
                 PERFORM 100-INIT-SAUTNIV                                       
                                         THRU 100-INIT-SAUTNIV-FIN              
      *               GARANTIE DC                                               
      *               -----------                                               
                 IF ME4A-LIGADE(J92FFR) = "DECES"                               
                    PERFORM 099-F92FG    THRU 099-F92FG-FIN                     
                 END-IF                                                         
      *               GARANTIE PTIA                                             
      *               -------------                                             
                 IF ME4A-LIGADE(J92FFR) = "PTIA"                                
                    PERFORM 099-F92FI    THRU 099-F92FI-FIN                     
                 END-IF                                                         
      *               GARANTIE ITD                                              
      *               ------------                                              
                 IF ME4A-LIGADE(J92FFR) = "ITD"                                 
                    PERFORM 099-F92FK    THRU 099-F92FK-FIN                     
                 END-IF                                                         
      *               GARANTIE ITT/IPT                                          
      *               ----------------                                          
                 IF ME4A-LIGADE(J92FFR) = "ITT IPT"                             
                    PERFORM 099-F92FM    THRU 099-F92FM-FIN                     
                 END-IF                                                         
      *               GARANTIE PE                                               
      *               -----------                                               
                 IF ME4A-LIGADE(J92FFR) = "PE"                                  
                    PERFORM 099-F92FO    THRU 099-F92FO-FIN                     
                 END-IF                                                         
              END-PERFORM                                                       
      *               GRISER GARANTIES H2                                       
      *               -------------------                                       
              PERFORM VARYING J92GSR FROM 1 BY 1                                
                                        UNTIL J92GSR > IZLGAL                   
                 PERFORM 100-INIT-SAUTNIV                                       
                                         THRU 100-INIT-SAUTNIV-FIN              
                 IF ME4A-CDGADE (J92GSR) = "06" OR                              
                    ME4A-CDGADE (J92GSR) = "08" OR                              
                    ME4A-CDGADE (J92GSR) = "09" OR                              
                    ME4A-CDGADE (J92GSR) = "07" OR                              
                    ME4A-CDGADE (J92GSR) = "11" OR                              
                    ME4A-CDGADE (J92GSR) = "10"                                 
                    MOVE "1"               TO ME4A-CPOUIN (J50DBR               
                                              J92GSR)                           
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF                                                               
      *               HORIZON GENERAL MIXTE ET ASSU H2                          
      *               ALIMENTATION GARANTIES H2                                 
      *               -------------------------                                 
           IF ME4A-CDHRZ1 = "MI" AND X58A-CDHRZ = "H2"                          
              PERFORM VARYING J92FRR FROM 1 BY 1                                
                                        UNTIL J92FRR > IZLGAL                   
                 PERFORM 100-INIT-SAUTNIV                                       
                                         THRU 100-INIT-SAUTNIV-FIN              
      *               GARANTIE DC                                               
      *               -----------                                               
                 IF ME4A-CDGADE(J92FRR) = "01"                                  
                    PERFORM 099-F92FS    THRU 099-F92FS-FIN                     
                 END-IF                                                         
      *               GARANTIE PTIA                                             
      *               -------------                                             
                 IF ME4A-CDGADE(J92FRR) = "02"                                  
                    PERFORM 099-F92FU    THRU 099-F92FU-FIN                     
                 END-IF                                                         
      *               GARANTIE ITT/IPT                                          
      *               ----------------                                          
                 IF ME4A-CDGADE(J92FRR) = "03"                                  
                    PERFORM 099-F92FW-1  THRU 099-F92FW-1-FIN                   
                    IF X58A-CPITTC > 0 AND X58A-QQGTIT NOT= ZERO                
                       PERFORM 099-F92FW-2                                      
                                         THRU 099-F92FW-2-FIN                   
      *               LIBELLE FRANCHISE ITT/IPT                                 
      *               -------------------------                                 
                       PERFORM 099-F92LB THRU 099-F92LB-FIN                     
                    END-IF                                                      
                 END-IF                                                         
      *               GARANTIE IPP                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "06"                                  
                    PERFORM 099-F92FY    THRU 099-F92FY-FIN                     
                 END-IF                                                         
      *               GARANTIE TPT                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "08"                                  
                    PERFORM 099-F92GA-1  THRU 099-F92GA-1-FIN                   
                    IF X58A-CDTPTC > 0                                          
                       PERFORM 099-F92GA-2                                      
                                         THRU 099-F92GA-2-FIN                   
      *               LIBELLE FRANCHISE TPT                                     
      *               ---------------------                                     
                       PERFORM 099-F92LD THRU 099-F92LD-FIN                     
                    END-IF                                                      
                 END-IF                                                         
      *               GARANTIE F0J                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "09"                                  
                    PERFORM 099-F92GC    THRU 099-F92GC-FIN                     
                 END-IF                                                         
      *               GARANTIE MNO                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "07"                                  
                    PERFORM 099-F92GE    THRU 099-F92GE-FIN                     
                 END-IF                                                         
      *               GARANTIE IPC                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "11"                                  
                    PERFORM 099-F92GG    THRU 099-F92GG-FIN                     
                 END-IF                                                         
      *               GARANTIE PE                                               
      *               -----------                                               
                 IF ME4A-CDGADE(J92FRR) = "04"                                  
                    PERFORM 099-F92GI-1  THRU 099-F92GI-1-FIN                   
                    IF X58A-CPCHOC > 0                                          
                       PERFORM 099-F92GI-2                                      
                                         THRU 099-F92GI-2-FIN                   
      *               LIBELLE FRANCHISE PE                                      
      *               --------------------                                      
                       PERFORM 099-F92LF THRU 099-F92LF-FIN                     
                    END-IF                                                      
                 END-IF                                                         
      *               GARANTIE CDC                                              
      *               ------------                                              
                 IF ME4A-CDGADE(J92FRR) = "10"                                  
                    PERFORM 099-F92GK-1  THRU 099-F92GK-1-FIN                   
                    IF X58A-CDCDCC > 0                                          
                       PERFORM 099-F92GK-2                                      
                                         THRU 099-F92GK-2-FIN                   
      *               LIBELLE FRANCHISE CDC                                     
      *               ---------------------                                     
                       PERFORM 099-F92LH THRU 099-F92LH-FIN                     
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
      *               GRISER GARANTIE H0-H1                                     
      *               ---------------------                                     
              PERFORM VARYING J92GPR FROM 1 BY 1                                
                                        UNTIL J92GPR > IZLGAL                   
                 PERFORM 100-INIT-SAUTNIV                                       
                                         THRU 100-INIT-SAUTNIV-FIN              
                 IF (ME4A-CDGADE (J92GPR) = "05" ) OR                           
                    (ME4A-CDGADE (J92GPR) = "04" AND                            
                     X58A-CDMAAS = "PA" )                                       
                    MOVE "1"               TO ME4A-CPOUIN (J50DBR               
                                              J92GPR)                           
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF                                                               
           PERFORM 099-F92FB             THRU 099-F92FB-FIN.                    
       007-F50DD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
       007-F92HB.                                                               
      *               RECHERCHE SINISTRE EN COURS                               
      *               ---------------------------                               
           INITIALIZE                         X58E                              
      *               ALIMENTATION POUR APPEL X51058E                           
           MOVE X601-NOVADI                TO X58E-NOVADI                       
           MOVE "10"                       TO X58E-IDENRE                       
           MOVE X58A-IDASCN                TO X58E-IDASCN                       
           MOVE ZERO                       TO X58E-CESADI                       
           MOVE "RE"                       TO X58E-ZCDFO3                       
           MOVE "AE521A"                   TO X58E-ZNMPR2                       
           MOVE ZEROES                     TO X58E-ZTRADI                       
           PERFORM P-51058E              THRU P-51058E-FIN                      
      *               RETOUR 51058E OK                                          
      *               ----------------                                          
           IF X58E-CESADI = SPACES OR X58E-CESADI = ZEROES OR                   
              X58E-CESADI = "0 " OR X58E-CESADI = " 0"                          
              MOVE "NON"                   TO ME4A-LISINI (J50DBR)              
              IF X58E-CPADEC NOT = ZEROES OR                                    
                 X58E-CPAITT NOT = ZEROES OR                                    
                 X58E-CPAIPA NOT = ZEROES OR                                    
                 X58E-CPACHO NOT = ZEROES OR X58E-CPAITD NOT = ZEROES           
      *               SI UN SINISTRE EN COURS                                   
                 MOVE "OUI"                TO ME4A-LISINI (J50DBR)              
              END-IF                                                            
           END-IF.                                                              
       007-F92HB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 008                                               
      *                                                                         
       008-F92EV.                                                               
           INITIALIZE                         TD15                              
           MOVE ME4A-CDGADE (J92EVR)       TO TD15-ZVAMIN                       
           PERFORM DE-RB0990ADI221-B     THRU DE-RB0990ADI221-B-FIN             
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIGADE (J92EVR)              
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LIGADE (J92EVR)              
           END-IF.                                                              
       008-F92EV-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 099                                               
      *                                                                         
      *               Initialisation zone {change                               
      *                                                                         
       099-F10CB.                                                               
           IF TX00-CPPGAM = LOW-VALUES                                          
              MOVE SPACES                  TO TX00-CPPGAM.                      
           IF TX00-CPBNP1 = LOW-VALUES                                          
              MOVE SPACES                  TO TX00-CPBNP1.                      
           IF TX00-CPBNP2 = LOW-VALUES                                          
              MOVE SPACES                  TO TX00-CPBNP2.                      
           IF TX00-CPBNP3 = LOW-VALUES                                          
              MOVE SPACES                  TO TX00-CPBNP3.                      
           IF TX00-CPBNP4 = LOW-VALUES                                          
              MOVE SPACES                  TO TX00-CPBNP4.                      
           IF TX00-CPBNP5 = LOW-VALUES                                          
              MOVE SPACES                  TO TX00-CPBNP5.                      
           IF TX00-CDELS = LOW-VALUES                                           
              MOVE SPACE                   TO TX00-CDELS.                       
           MOVE TX00-NPHASE                TO WW4A-ADNTCH                       
           MOVE PROGE                      TO TX4A-ZNMPR1                       
                                              ME4A-ZNMPR1                       
           MOVE "X"                        TO TX00-CPPUE1                       
           MOVE TX00-00 (1:87)             TO ME00-00 (1:87)                    
           MOVE TX00-00 (88:89)            TO ME00-00 (90:89)                   
           MOVE TX00-00 (177:)             TO ME00-00 (180:)                    
           MOVE TX4A-WE10                  TO ME4A-9L10                         
           MOVE TX4A-CDTENS                TO WW4A-CDTENS.                      
           IF RETOUR-IMBRICATION                                                
              MOVE SPACES                  TO TX4A-CDTENS                       
                                              ME4A-CDTENS                       
              MOVE ZEROES                  TO TX4A-ZNIAV2                       
                                              ME4A-ZNIAV2.                      
       099-F10CB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               ALIMENTATION BANDEAU PR�T                                 
      *               ACCES DF01                                                
      *                                                                         
       099-F50BJ.                                                               
           INITIALIZE                         DF01                              
                                              DF01-IK                           
           MOVE TX00-IDELC0                TO DF01-IDELCO                       
           PERFORM 100-ACCES-OCC-DF01    THRU 100-ACCES-OCC-DF01-FIN            
           MOVE IK                         TO DF01-IK.                          
      *               ACCES DF01 KO                                             
           IF DF01-IK NOT = ZERO                                                
              PERFORM 100-ALIM-ERR-50BJ16                                       
                                         THRU 100-ALIM-ERR-50BJ16-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM 100-ERREUR02       THRU 100-ERREUR02-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN.              
      *               DF01 OK. ACCES DF11                                       
           INITIALIZE                         DF11                              
                                              DF11-IK                           
           MOVE DF01-IDELCO                TO DF11-IDELCO                       
           PERFORM 100-ACCES-OCC-DF11    THRU 100-ACCES-OCC-DF11-FIN            
           MOVE IK                         TO DF11-IK.                          
      *               ACCES DF11 KO                                             
           IF DF11-IK NOT = ZERO                                                
              PERFORM 100-ALIM-ERR-50BJ25                                       
                                         THRU 100-ALIM-ERR-50BJ25-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM 100-ERREUR03       THRU 100-ERREUR03-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN.              
       099-F50BJ-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               BOUCLE AC70                                               
      *                                                                         
       099-F92ID.                                                               
           IF AC70-CTSPEC = 36                                                  
           AND AC70-DDSPEC NOT > PA01-DTJOUP                                    
           AND AC70-DFSPEC NOT < PA01-DTJOUP                                    
      *S'il y a une montant RA @ d{duire actif                                  
              MOVE 1                       TO WW00-CPFLAG                       
              MOVE 'O'                     TO SAUT-NIV06                        
              MOVE 'O'                     TO FIN-BOUCLE-NIV05                  
              GO TO 099-F92ID-FIN.                                              
      *Sinon Lecture suivante                                                   
           PERFORM 100-ACCES-OCS-AC70    THRU 100-ACCES-OCS-AC70-FIN            
           MOVE IK                         TO AC70-IK.                          
       099-F92ID-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               BOUCLE DC02                                               
      *                                                                         
       099-F92JD.                                                               
           IF DC02-CTFOE1 = 104                                                 
              MOVE 1                       TO WW00-9N01A                        
              MOVE 'O'                     TO SAUT-NIV06                        
              MOVE 'O'                     TO FIN-BOUCLE-NIV05                  
              GO TO 099-F92JD-FIN.                                              
           PERFORM 100-ACCES-LFS-DC02    THRU 100-ACCES-LFS-DC02-FIN            
           MOVE IK                         TO DC02-IK.                          
       099-F92JD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               RECHERCHE COMPTE                                          
      *               ACCES DC05 REF CONTRAT                                    
      *                                                                         
       099-F92JF.                                                               
           INITIALIZE                         DC05                              
                                              DC05-IK                           
           MOVE DC02-IDEL02                TO DC05-IDELCO                       
           MOVE "DE"                       TO DC05-CDDOPR                       
           PERFORM 100-ACCES-LCL-DC05    THRU 100-ACCES-LCL-DC05-FIN            
           MOVE IK                         TO DC05-IK.                          
      *               ACCES KO                                                  
           IF DC05-IK NOT = ZERO                                                
              PERFORM 100-ALIM-ERR-92JF17                                       
                                         THRU 100-ALIM-ERR-92JF17-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM 100-ERREUR08       THRU 100-ERREUR08-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN.              
      *               ACCES OK - ACCES DC23 RIB                                 
           INITIALIZE                         DC23                              
                                              DC23-IK                           
           MOVE DC02-IDEL02                TO DC23-IDELCO                       
           MOVE "DE"                       TO DC23-CDDOPR                       
           PERFORM 100-ACCES-LCL-DC23    THRU 100-ACCES-LCL-DC23-FIN            
           MOVE IK                         TO DC23-IK.                          
      *               ACCES KO                                                  
           IF DC23-IK NOT = ZERO                                                
              PERFORM 100-ALIM-ERR-92JF27                                       
                                         THRU 100-ALIM-ERR-92JF27-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM 100-ERREUR09       THRU 100-ERREUR09-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN.              
      *               ACCES OK                                                  
           MOVE DC23-NCPRIB                TO ME4A-NCPRIB.                      
       099-F92JF-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               TROUVE                                                    
      *               ACCES DF81                                                
      *                                                                         
       099-F92KF.                                                               
           INITIALIZE                         DF81                              
                                              DF29                              
                                              DF81-IK                           
           MOVE DF02-IDELCO                TO DF81-IDELCO                       
           MOVE DF02-NUELCV                TO DF81-NUELCV                       
           PERFORM 100-ACCES-RE1-DF81    THRU 100-ACCES-RE1-DF81-FIN            
           MOVE IK                         TO DF81-IK.                          
      *               PAS TROUVE                                                
           IF DF81-IK NOT = ZERO                                                
              PERFORM 100-ALIM-ERR-92KF17                                       
                                         THRU 100-ALIM-ERR-92KF17-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM 100-ERREUR04       THRU 100-ERREUR04-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN.              
      *               TROUVE                                                    
           MOVE DF81-NCPRIB                TO ME4A-NCPRIB.                      
       099-F92KF-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               ALIMENTATION DES LIBELLES                                 
      *               LIBELLE PARTENAIRE                                        
      *                                                                         
       099-F50BN.                                                               
           INITIALIZE                         DC03                              
                                              DC03-IK                           
           MOVE DF01-IDPART                TO DC03-IDPART                       
           PERFORM 100-ACCES-LCL-DC03    THRU 100-ACCES-LCL-DC03-FIN            
           MOVE IK                         TO DC03-IK.                          
      *               ACCES DC03 KO                                             
           IF DC03-IK NOT = ZERO                                                
              PERFORM 100-ALIM-ERR-50BN16                                       
                                         THRU 100-ALIM-ERR-50BN16-FIN           
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM 100-ERREUR05       THRU 100-ERREUR05-FIN                  
              PERFORM F97-SORTIE-ER95    THRU F97-SORTIE-ER95-FIN.              
      *               ACCES OK                                                  
           MOVE DC03-LIQURI                TO ME4A-LIQURI                       
           PERFORM 100-F93DA             THRU 100-F93DA-FIN                     
      *               LIBELLE DEVISE                                            
           INITIALIZE                         TF73                              
           MOVE DF01-CDDEPR                TO TF73-CDDEPR                       
           PERFORM DE-TA0990NM262-B      THRU DE-TA0990NM262-B-FIN.             
           IF IK = ZEROS                                                        
              MOVE TF73-CDDEAI             TO ME4A-CDDEAI                       
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-CDDEAI.                      
      *               LIBELLE CATEGORIE PRET                                    
           INITIALIZE                         TD15                              
           MOVE DF01-CCATPR                TO TD15-ZVAMIN                       
           PERFORM DE-RB09900010-B       THRU DE-RB09900010-B-FIN.              
           IF IK = ZEROS                                                        
              MOVE TD15-LI1VRB             TO ME4A-LICAP3                       
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LICAP3.                      
      *               LIBELLE STATUT PRET                                       
           INITIALIZE                         TD15                              
           MOVE DF01-CDSUPR                TO TD15-ZVAMIN                       
           PERFORM DE-RB8210CDSUPR-B     THRU DE-RB8210CDSUPR-B-FIN.            
           IF IK = ZEROS                                                        
              MOVE TD15-LI1VRB             TO ME4A-LISUPR                       
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LISUPR.                      
      *               LIBELLE TYPE RESTRUCTURATION                              
           INITIALIZE                         TD15                              
           MOVE DF11-CTCRST                TO TD15-ZVAMIN                       
           PERFORM DE-RB0990BA102-B      THRU DE-RB0990BA102-B-FIN.             
           IF IK = ZEROS                                                        
              MOVE TD15-LI1VRB             TO ME4A-LICRST                       
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LICRST.                      
       099-F50BN-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               CALCUL PDUR18                                             
      *                                                                         
       099-F92DB.                                                               
           INITIALIZE                         WW00-PDECHM                       
                                              WW00-PDUR18.                      
           IF DF01-CFPEPR = 5                                                   
              MOVE 1                       TO WW00-PDECHM.                      
           IF DF01-CFPEPR = 6                                                   
              MOVE 3                       TO WW00-PDECHM.                      
           IF DF01-CFPEPR = 7                                                   
              MOVE 6                       TO WW00-PDECHM.                      
           IF DF01-CFPEPR = 8                                                   
              MOVE 12                      TO WW00-PDECHM.                      
           IF DF01-CFPEPR = 0                                                   
              MOVE 1                       TO WW00-PDECHM.                      
           COMPUTE WW00-PDUR18 = DF01-PDURPR - ((DF01-NUPEPR - 1) *             
                                 WW00-PDECHM).                                  
       099-F92DB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               ALIMENTATION X58B                                         
      *               DETERMINATION DUREE                                       
      *                                                                         
       099-F92CN.                                                               
           MOVE ZEROES                     TO X58B-ZZRESU                       
           MOVE X601-NOVADI                TO X58B-NOVADI                       
           MOVE "O"                        TO X58B-CPADAC                       
           MOVE "O"                        TO X58B-CTRCNP                       
           MOVE ME4A-IDASCN (J50CFR)       TO X58B-IDASCN                       
           MOVE DF01-IDELCO                TO X58B-IDPRET                       
           MOVE DF01-CCATPR                TO X58B-CCATP1                       
      *                                                                         
           IF X58A-CDHRZ = 'H2'                                                 
           AND (X58A-CDCNTX = '1' OR X58A-CDCNTX = '2')                         
      *Si code horizon H2 et contexte = sortie d'age ou ajout d'assur{          
      *alors on prend le montant initial.                                       
               MOVE X58A-MTPA15            TO X58B-MTPA15                       
           ELSE                                                                 
               MOVE DF01-MTPACR            TO X58B-MTPA15                       
      *V{rification dans PG1057 sur le NUCRIT 71 pour la caisse                 
               INITIALIZE TF81                                                  
               MOVE       PA99-CDSCCR      TO TF81-CDSCCR                       
               MOVE       71               TO TF81-NUCRIT                       
               PERFORM DE-TA8210PG1057-B   THRU DE-TA8210PG1057-B-FIN           
               MOVE       IK               TO TF81-IK                           
               IF TF81-IK = '0'                                                 
      *Si activif sur la caisse, acc}s A470 via le segment AC70                 
                 INITIALIZE AC70                                                
                 INITIALIZE WW00-CPFLAG                                         
                 MOVE       DF01-IDELCO     TO AC70-IDELCO                      
                 PERFORM 100-ACCES-OCI-AC70 THRU 100-ACCES-OCI-AC70-FIN         
                 MOVE       IK              TO AC70-IK                          
                 IF AC70-IK = '0'                                               
      *Si on trouve au moins un enregistrement pour le pr�t, on boucle          
      *en v{rifiant les conditions.                                             
                   PERFORM 100-INIT-BOUCLE  THRU 100-INIT-BOUCLE-FIN            
                   PERFORM 005-F92ID        THRU 005-F92ID-FIN                  
                                           UNTIL AC70-IK NOT = ZERO             
                                              OR WW00-CPFLAG = 1                
                   PERFORM 100-INIT-SAUTNIV THRU 100-INIT-SAUTNIV-FIN           
                 END-IF                                                         
                 IF WW00-CPFLAG = 1                                             
      * si on a trouv{ un montant RA @ d{duire actif                            
                     SUBTRACT AC70-MKRAAD FROM X58B-MTPA15                      
                 END-IF                                                         
                 IF WW00-CPFLAG = 0 AND DF01-CDTECR NOT = 38                    
      *sinon mais que l'on n'est pas sur un pr�t r{am{nag{ sp{ Lorraine         
                     SUBTRACT DF01-MKRAPR FROM X58B-MTPA15                      
                 END-IF                                                         
               ELSE                                                             
      *Si inactif sur la caisse...                                              
                   IF DF01-CDTECR NOT = 38                                      
      *... et que l'on n'est pas sur un pr�t r{am{nag{ sp{ Lorraine             
                       SUBTRACT DF01-MKRAPR FROM X58B-MTPA15                    
                   END-IF                                                       
               END-IF                                                           
           END-IF                                                               
      *                                                                         
           MOVE DF01-MKDURE                TO X58B-MKDUT8 (1)                   
           MOVE WW00-PDUR18                TO X58B-QTMOAD                       
           MOVE DF01-DHDNPR                TO X58B-DHDNPR                       
           MOVE PA01-DTJOUP                TO X58B-ZDVALI                       
           MOVE DF01-CDTECR                TO X58B-CDTEC1                       
           MOVE ZEROES                     TO X58B-CPCPAP                       
           MOVE DF01-CDOMIN                TO X58B-CDOMIN                       
           MOVE SPACES                     TO X58B-IDRUBC                       
           MOVE DF01-CDLAPR                TO X58B-CDLAPR                       
           MOVE DF01-CDSOPR                TO X58B-CDSOPR.                      
           IF DF01-CDANPR = 1                                                   
              MOVE DF11-PDANMX             TO X58B-PDANPR                       
           ELSE                                                                 
              MOVE ZEROES                  TO X58B-PDANPR.                      
       099-F92CN-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               RETOUR 51058B OK                                          
      *               CALCUL TAUX + MONTANT                                     
      *                                                                         
       099-F50CH.                                                               
           MOVE X58B-TVREMC                TO ME4A-TVREMC (J50CFR)              
           MOVE X58B-PDRCMC                TO ME4A-PDRCMC (J50CFR)              
           MOVE X58B-CDCAPR                TO ME4A-CDCAPR (J50CFR)              
           MOVE X58B-CDASSR                TO ME4A-CDASSR (J50CFR)              
      *               LIBELLES                                                  
           INITIALIZE                         TD15                              
           MOVE X58B-CDCAPR                TO TD15-ZVAMIN                       
           PERFORM DE-RB8210CDCAPR-B     THRU DE-RB8210CDCAPR-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LICAP6 (J50CFR)              
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LICAP6 (J50CFR).             
           INITIALIZE                         TD15                              
           MOVE X58B-CDASSR                TO TD15-ZVAMIN                       
           PERFORM DE-RB0AMTADI002-B     THRU DE-RB0AMTADI002-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIASSU (J50CFR)              
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LIASSU (J50CFR).             
       099-F50CH-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               ALIMENTATION X58A POUR APPEL                              
      *                                                                         
       099-F92DK.                                                               
           INITIALIZE                         X58A                              
           MOVE X601-NOVADI                TO X58A-NOVADI                       
           MOVE ME4A-IDELCO                TO X58A-IDPRAS                       
           MOVE "10"                       TO X58A-IDENRE                       
           MOVE ZEROES                     TO X58A-CESADI                       
           MOVE "RE"                       TO X58A-ZCDFO3.                      
       099-F92DK-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               HORIZON MIXTE ET MARCHE IM                                
      *                                                                         
       099-F92EI.                                                               
           MOVE "01"                       TO ME4A-CDGADE (1)                   
           MOVE "02"                       TO ME4A-CDGADE (2)                   
           MOVE "05"                       TO ME4A-CDGADE (3)                   
           MOVE "03"                       TO ME4A-CDGADE (4)                   
           MOVE "04"                       TO ME4A-CDGADE (5)                   
           MOVE "06"                       TO ME4A-CDGADE (6)                   
           MOVE "08"                       TO ME4A-CDGADE (7)                   
           MOVE "09"                       TO ME4A-CDGADE (8)                   
           MOVE "07"                       TO ME4A-CDGADE (9)                   
           MOVE "10"                       TO ME4A-CDGADE (10)                  
           MOVE 10                         TO IZLGAL.                           
       099-F92EI-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               HORIZON MIXTE ET MARCHE PA                                
      *                                                                         
       099-F92EK.                                                               
           MOVE "01"                       TO ME4A-CDGADE (1)                   
           MOVE "02"                       TO ME4A-CDGADE (2)                   
           MOVE "05"                       TO ME4A-CDGADE (3)                   
           MOVE "03"                       TO ME4A-CDGADE (4)                   
           MOVE "04"                       TO ME4A-CDGADE (5)                   
           MOVE "06"                       TO ME4A-CDGADE (6)                   
           MOVE "11"                       TO ME4A-CDGADE (7)                   
           MOVE "09"                       TO ME4A-CDGADE (8)                   
           MOVE "07"                       TO ME4A-CDGADE (9)                   
           MOVE "10"                       TO ME4A-CDGADE (10)                  
           MOVE 10                         TO IZLGAL.                           
       099-F92EK-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE DC                                               
      *                                                                         
       099-F92FG.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FFR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CPDECC > 0 AND X58A-QQGTIE NOT = ZERO                        
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR)                           
              MOVE X58A-QQGTIE             TO ME4A-QQRIG (J50DBR                
                                              J92FFR).                          
       099-F92FG-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE PTIA                                             
      *                                                                         
       099-F92FI.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FFR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CPIPAC > 0 AND X58A-QQGTIE NOT = ZERO                        
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR)                           
              MOVE X58A-QQGTIE             TO ME4A-QQRIG (J50DBR                
                                              J92FFR).                          
       099-F92FI-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE ITD                                              
      *                                                                         
       099-F92FK.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FFR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CPITCO > 0 AND X58A-QQGTIE NOT = ZERO                        
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR)                           
              MOVE X58A-QQGTIT             TO ME4A-QQRIG (J50DBR                
                                              J92FFR).                          
       099-F92FK-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE ITT/IPT                                          
      *                                                                         
       099-F92FM.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FFR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CPITTC > 0 AND X58A-QQGTIT NOT = ZERO                        
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR)                           
              MOVE X58A-QQGTIT             TO ME4A-QQRIG (J50DBR                
                                              J92FFR).                          
       099-F92FM-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE PE                                               
      *                                                                         
       099-F92FO.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FFR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CPCHOC > 0 AND X58A-QQPEMP NOT = ZERO                        
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FFR)                           
              MOVE X58A-QQPEMP             TO ME4A-QQRIG (J50DBR                
                                              J92FFR).                          
       099-F92FO-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE DC                                               
      *                                                                         
       099-F92FS.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CPDECC > 0 AND X58A-QQGTIE NOT = ZERO                        
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR)                           
              MOVE X58A-QQGTIE             TO ME4A-QQRIG (J50DBR                
                                              J92FRR).                          
       099-F92FS-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE PTIA                                             
      *                                                                         
       099-F92FU.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CPIPAC > 0 AND X58A-QQGTIE NOT = ZERO                        
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR)                           
              MOVE X58A-QQGTIE             TO ME4A-QQRIG (J50DBR                
                                              J92FRR).                          
       099-F92FU-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE ITT/IPT                                          
      *                                                                         
       099-F92FW-1.                                                             
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92FW-1-FIN.                                                         
           EXIT.                                                                
      *                                                                         
       099-F92FW-2.                                                             
      *               GARANTIE CHOISIE                                          
           MOVE "1"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR)                           
           MOVE X58A-QQGTIT                TO ME4A-QQRIG (J50DBR                
                                              J92FRR).                          
       099-F92FW-2-FIN.                                                         
           EXIT.                                                                
      *                                                                         
      *               LIBELLE FRANCHISE ITT/IPT                                 
      *                                                                         
       099-F92LB.                                                               
           INITIALIZE                         TD15                              
           MOVE X58A-CDOITT                TO TD15-ZVAMIN                       
           PERFORM DE-RB0990ADI240-B     THRU DE-RB0990ADI240-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIFRAN (J50DBR               
                                              J92FRR)                           
           ELSE                                                                 
              MOVE "INCONNU"               TO ME4A-LIFRAN (J50DBR               
                                              J92FRR).                          
       099-F92LB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE IPP                                              
      *                                                                         
       099-F92FY.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CDCIPP > 0                                                   
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92FY-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE TPT                                              
      *                                                                         
       099-F92GA-1.                                                             
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92GA-1-FIN.                                                         
           EXIT.                                                                
      *                                                                         
       099-F92GA-2.                                                             
      *               GARANTIE CHOISIE                                          
           MOVE "1"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92GA-2-FIN.                                                         
           EXIT.                                                                
      *                                                                         
      *               LIBELLE FRANCHISE TPT                                     
      *                                                                         
       099-F92LD.                                                               
           INITIALIZE                         TD15                              
           MOVE X58A-CDOTPT                TO TD15-ZVAMIN                       
           PERFORM DE-RB0990ADI243-B     THRU DE-RB0990ADI243-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIFRAN (J50DBR               
                                              J92FRR)                           
           ELSE                                                                 
              MOVE "INCONNU"               TO ME4A-LIFRAN (J50DBR               
                                              J92FRR).                          
       099-F92LD-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE F0J                                              
      *                                                                         
       099-F92GC.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CDAC0C > 0 OR X58A-CDMR0C > 0                                
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
      *               LIBELLE FRANCHISE                                         
           IF X58A-CDAC0C > 0 AND X58A-CDMR0C > 0                               
              MOVE "ACCIDENTS & MR"        TO ME4A-LIFRAN (J50DBR               
                                              J92FRR).                          
           IF X58A-CDAC0C > 0 AND X58A-CDMR0C = 0                               
              MOVE "ACCIDENTS"             TO ME4A-LIFRAN (J50DBR               
                                              J92FRR).                          
           IF X58A-CDAC0C = 0 AND X58A-CDMR0C > 0                               
              MOVE "MR"                    TO ME4A-LIFRAN (J50DBR               
                                              J92FRR).                          
       099-F92GC-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE MNO                                              
      *                                                                         
       099-F92GE.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CDMNOC > 0                                                   
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92GE-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE IPC                                              
      *                                                                         
       099-F92GG.                                                               
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
      *               GARANTIE CHOISIE                                          
           IF X58A-CDIPCC > 0                                                   
              MOVE "1"                     TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92GG-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE PE                                               
      *                                                                         
       099-F92GI-1.                                                             
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92GI-1-FIN.                                                         
           EXIT.                                                                
      *                                                                         
       099-F92GI-2.                                                             
      *               GARANTIE CHOISIE                                          
           MOVE "1"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR)                           
           MOVE X58A-QQPEMP                TO ME4A-QQRIG (J50DBR                
                                              J92FRR).                          
       099-F92GI-2-FIN.                                                         
           EXIT.                                                                
      *                                                                         
      *               LIBELLE FRANCHISE PE                                      
      *                                                                         
       099-F92LF.                                                               
           INITIALIZE                         TD15                              
           MOVE X58A-CDOFPE                TO TD15-ZVAMIN                       
           PERFORM DE-RB0990ADI242-B     THRU DE-RB0990ADI242-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIFRAN (J50DBR               
                                              J92FRR)                           
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LIFRAN (J50DBR               
                                              J92FRR).                          
       099-F92LF-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               GARANTIE CDC                                              
      *                                                                         
       099-F92GK-1.                                                             
           MOVE "0"                        TO ME4A-CPOUIN (J50DBR               
                                              J92FRR)                           
           MOVE "0"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92GK-1-FIN.                                                         
           EXIT.                                                                
      *                                                                         
       099-F92GK-2.                                                             
      *               GARANTIE CHOISIE                                          
           MOVE "1"                        TO ME4A-CPRIG2 (J50DBR               
                                              J92FRR).                          
       099-F92GK-2-FIN.                                                         
           EXIT.                                                                
      *                                                                         
      *               LIBELLE FRANCHISE CDC                                     
      *                                                                         
       099-F92LH.                                                               
           INITIALIZE                         TD15                              
           MOVE X58A-CDOCDC                TO TD15-ZVAMIN.                      
           IF X58A-CDMAAS NOT = "PA"                                            
              PERFORM DE-RB0990ADI244-B  THRU DE-RB0990ADI244-B-FIN.            
           IF X58A-CDMAAS = "PA"                                                
              PERFORM DE-RB0990ADI262-B  THRU DE-RB0990ADI262-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIFRAN (J50DBR               
                                              J92FRR)                           
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LIFRAN (J50DBR               
                                              J92FRR).                          
       099-F92LH-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               ALIMENTATION DES GARANTIES                                
      *                                                                         
       099-F92FB.                                                               
      *               ALIMENTATION AUTRES DONNEES ADH                           
           MOVE X58A-DASIGN                TO ME4A-DASIGN (J50DBR)              
           MOVE X58A-DEGTIE                TO ME4A-DDEFGA (J50DBR)              
           MOVE X58A-DAACAE                TO ME4A-DAACAE (J50DBR)              
           MOVE X58A-CDHRZ                 TO ME4A-CDHRZ (J50DBR)               
           MOVE X58A-CPPREL                TO ME4A-CPPREL (J50DBR)              
      *               RECHERCHE LIBELLES                                        
           INITIALIZE                         TD15                              
           MOVE X58A-CPPREL                TO TD15-ZVAMIN                       
           PERFORM DE-RB0990ADI022-B     THRU DE-RB0990ADI022-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIPREL (J50DBR)              
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LIPREL (J50DBR).             
           INITIALIZE                         TD15                              
           MOVE X58A-CDMEDI                TO TD15-ZVAMIN                       
           PERFORM DE-RB0990ADI012-B     THRU DE-RB0990ADI012-B-FIN.            
           IF IK = ZERO                                                         
              MOVE TD15-LI1VRB             TO ME4A-LIMEDI (J50DBR)              
           ELSE                                                                 
              MOVE "INCONNU "              TO ME4A-LIMEDI (J50DBR).             
       099-F92FB-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      * -------------> NIVEAU 100                                               
      *                                                                         
      *               FONCTION                                                  
       100-F0J.                                                                 
      *               INITIALISATION SPL EN TP                                  
       100-F0JAB.                                                               
           EXIT.                                                                
       100-INIT-SPL.                                                            
           MOVE "INIT"                     TO LG-ORDRE.                         
      *               INITIALISATION DE DF01                                    
       100-F0JAC.                                                               
           PERFORM 100-INIT-DF01         THRU 100-INIT-DF01-FIN.                
       100-F0JAC-FIN.                                                           
           EXIT.                                                                
      *               INITIALISATION DE DF11                                    
       100-F0JAD.                                                               
           PERFORM 100-INIT-DF11         THRU 100-INIT-DF11-FIN.                
       100-F0JAD-FIN.                                                           
           EXIT.                                                                
      *               INITIALISATION DE DF81                                    
       100-F0JAE.                                                               
           MOVE "LRDF81"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING W-ZCSGLG.                         
           IF RETURN-CODE > 0                                                   
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       100-F0JAE-FIN.                                                           
           EXIT.                                                                
      *               INITIALISATION DE DE04                                    
       100-F0JAF.                                                               
           PERFORM 100-INIT-DE04         THRU 100-INIT-DE04-FIN.                
       100-F0JAF-FIN.                                                           
           EXIT.                                                                
      *               INITIALISATION DE DF02                                    
       100-F0JAG.                                                               
           PERFORM 100-INIT-DF02         THRU 100-INIT-DF02-FIN.                
       100-F0JAG-FIN.                                                           
           EXIT.                                                                
       100-F0JAB-FIN.                                                           
           EXIT.                                                                
      *               FIN D'INITIALISATION DES SPL                              
       100-F0JZY.                                                               
           EXIT.                                                                
       100-INIT-SPL-FIN.                                                        
           EXIT.                                                                
       100-F0JZY-FIN.                                                           
           EXIT.                                                                
      *          NOTE *  DEBUT ITERATION DU PROGRAMME     *.                    
       100-F0J-FIN.                                                             
           EXIT.                                                                
      *                                                                         
      *               GESTION DES ERREURS CENTRALISEE                           
       100-F9EER.                                                               
           EXIT.                                                                
       P-722020.                                                                
           MOVE PROGE                      TO ER00-ZNMPR2                       
           MOVE PROGE                      TO ER00-ZNMMOD                       
           MOVE "T"                        TO ER00-ZTYENT                       
           MOVE "X722020"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             .                                       
           IF RETURN-CODE NOT = ZEROES                                          
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       P-722020-FIN.                                                            
       100-F9EER-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               CONCATENE 1 AUTRE LIBELLE                                 
       100-F93DA.                                                               
      *-------------------------                                                
           MOVE DC03-LNDCB1                TO WWPO-LIBEL                        
           MOVE LENGTH OF DC03-LNDCB1      TO ILIBER                            
           PERFORM VARYING ILIBER FROM ILIBER BY -1                             
                                        UNTIL WWPO-LIBELX(ILIBER) NOT =         
                                              SPACE OR                          
                                              ILIBER = 1                        
           END-PERFORM                                                          
           MOVE ILIBER                     TO WWPO-POSI1                        
           MOVE DC03-LNDCBZ                TO WWPO-LIBEL                        
           MOVE LENGTH OF DC03-LNDCBZ      TO ILIBER                            
           PERFORM VARYING ILIBER FROM ILIBER BY -1                             
                                        UNTIL WWPO-LIBELX(ILIBER) NOT =         
                                              SPACE OR                          
                                              ILIBER = 1                        
           END-PERFORM                                                          
           STRING DC03-LNDCB1                                                   
                  (1:WWPO-POSI1)                                                
                  ' '                                                           
                  DC03-LNDCBZ                                                   
                  (1:ILIBER)                                                    
                  DELIMITED BY SIZE      INTO ME4A-LNMARI.                      
       100-F93DA-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               TRANSFORMATION APPL-CODE/ABEND                            
       100-F9EHH.                                                               
           EXIT.                                                                
       APPL2ABND.                                                               
           DIVIDE 1296                   INTO APPL-CODE                         
                                       GIVING APPL-PSSNC2                       
                                    REMAINDER APPL-RMNDER                       
           DIVIDE 36                     INTO APPL-RMNDER                       
                                       GIVING APPL-PSSNC1                       
                                    REMAINDER APPL-PSSNC0.                      
           IF APPL-PSSNC2 > 9                                                   
              MOVE APPL-PSSNC2             TO APPL-NWORK                        
              PERFORM 100-CONV-BASE-36   THRU 100-CONV-BASE-36-FIN              
              MOVE APPL-CWORK              TO APPL-CHAR1                        
           ELSE                                                                 
              MOVE APPL-PSSNC2             TO WW00-ABND                         
              MOVE WW00-ABND               TO APPL-CHAR1.                       
           IF APPL-PSSNC1 > 9                                                   
              MOVE APPL-PSSNC1             TO APPL-NWORK                        
              PERFORM 100-CONV-BASE-36   THRU 100-CONV-BASE-36-FIN              
              MOVE APPL-CWORK              TO APPL-CHAR2                        
           ELSE                                                                 
              MOVE APPL-PSSNC1             TO WW00-ABND                         
              MOVE WW00-ABND               TO APPL-CHAR2.                       
           IF APPL-PSSNC0 > 9                                                   
              MOVE APPL-PSSNC0             TO APPL-NWORK                        
              PERFORM 100-CONV-BASE-36   THRU 100-CONV-BASE-36-FIN              
              MOVE APPL-CWORK              TO APPL-CHAR3                        
           ELSE                                                                 
              MOVE APPL-PSSNC0             TO WW00-ABND                         
              MOVE WW00-ABND               TO APPL-CHAR3.                       
       APPL2ABND-FIN.                                                           
       100-F9EHH-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               CODE NUM->ALPHA EN BASE 36                                
       100-CONV-BASE-36.                                                        
           EXIT.                                                                
      *               TEST DES 26 VALEURS POSSIBLES                             
       100-F9EHJ.                                                               
           IF APPL-NWORK = 10                                                   
              MOVE "A"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 11                                                   
              MOVE "B"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 12                                                   
              MOVE "C"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 13                                                   
              MOVE "D"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 14                                                   
              MOVE "E"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 15                                                   
              MOVE "F"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 16                                                   
              MOVE "G"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 17                                                   
              MOVE "H"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 18                                                   
              MOVE "I"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 19                                                   
              MOVE "J"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 20                                                   
              MOVE "K"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 21                                                   
              MOVE "L"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 22                                                   
              MOVE "M"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 23                                                   
              MOVE "N"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 24                                                   
              MOVE "O"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 25                                                   
              MOVE "P"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 26                                                   
              MOVE "Q"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 27                                                   
              MOVE "R"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 28                                                   
              MOVE "S"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 29                                                   
              MOVE "T"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 30                                                   
              MOVE "U"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 31                                                   
              MOVE "V"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 32                                                   
              MOVE "W"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 33                                                   
              MOVE "X"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 34                                                   
              MOVE "Y"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
           IF APPL-NWORK = 35                                                   
              MOVE "Z"                     TO APPL-CWORK                        
              GO TO 100-F9EHJ-FIN.                                              
       100-F9EHJ-FIN.                                                           
           EXIT.                                                                
       100-CONV-BASE-36-FIN.                                                    
           EXIT.                                                                
      *                                                                         
      *               RECUPERATION DATE SYSTEME                                 
       100-F90CA.                                                               
      *-------------------------                                                
           PERFORM 100-ACC-CUR-DATE      THRU 100-ACC-CUR-DATE-FIN.             
       100-F90CA-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *               ***********************************                       
      *               *                                   *                     
      *               *Fonctions Technique    appel{es    *                     
      *               *                                   *                     
      *               *************************************.                    
       100-F97.                                                                 
           EXIT.                                                                
      *               Sortie erreur vue logique 9L95                            
       100-F97BB.                                                               
           EXIT.                                                                
       F97-SORTIE-ER95.                                                         
      *               Anomalie standard                                         
       100-F97BD.                                                               
           IF EREC-X0001A = SPACES AND IEREUM > ZEROES                          
              NEXT SENTENCE                                                     
           ELSE                                                                 
              GO TO 100-F97BD-FIN.                                              
           IF IEREUR NOT > IEREUM                                               
              MOVE EREU-ZLIERT (IEREUR)    TO ME95-ZLIER1                       
           ELSE                                                                 
              MOVE "ANOMALIE INCONNUE"     TO ME95-ZLIER1.                      
           MOVE SPACES                     TO EREC-X0001A.                      
       100-F97BD-FIN.                                                           
           EXIT.                                                                
      *               Anomalie composite (AATME3)                               
       100-F97BF.                                                               
           IF EREC-X0001A = "C"                                                 
              NEXT SENTENCE                                                     
           ELSE                                                                 
              GO TO 100-F97BF-FIN.                                              
           MOVE EREC-ZLIERT                TO ME95-ZLIER1                       
           MOVE SPACES                     TO EREC-X0001A.                      
       100-F97BF-FIN.                                                           
           EXIT.                                                                
      *               Mise en forme Anomalie                                    
       100-F97BH.                                                               
           MOVE ME95-ZLIER1                TO SW00-X4000                        
           MOVE LENGTH OF ME95-ZLIER1      TO ISW00L                            
           PERFORM F99-SUPBLANC          THRU F99-SUPBLANC-FIN                  
           MOVE SW00-X4000 (1:ISW00L)      TO ME95-ZLIER1.                      
           IF TXLG-X4000 (1:10) NOT = SPACE                                     
      *Inscription Message en Log F204                                          
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING ME95-ZLIER1                                                
                     TXLG-X4000                                                 
                     DELIMITED BY "&"    INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN.                     
       100-F97BH-FIN.                                                           
           EXIT.                                                                
      *               Fonction r{serv{e traitements                             
       100-F97BI.                                                               
      *sp{cifiques                                                              
       100-F97BI-FIN.                                                           
           EXIT.                                                                
      *               Retour vers le futur                                      
       100-F97BK.                                                               
           MOVE 1                          TO ME00-CERREU                       
           MOVE 1                          TO ME00-CEREA5.                      
      *Emission Anomalie standard                                               
           MOVE "9L95"                     TO ME00-ZCVULO.                      
      *Emission physique                                                        
           MOVE ME00                       TO SERV-DATA                         
           PERFORM SORTIE-OK             THRU SORTIE-OK-FIN.                    
       100-F97BK-FIN.                                                           
           EXIT.                                                                
      *               Fin de mission                                            
       100-F97BX.                                                               
           EXIT.                                                                
       F97-SORTIE-ER95-FIN.                                                     
       100-F97BX-FIN.                                                           
           EXIT.                                                                
       100-F97BB-FIN.                                                           
           EXIT.                                                                
      *               Sortie erreur vue logique 9E96                            
       100-F97CB.                                                               
           EXIT.                                                                
       F97-SORTIE-ER96.                                                         
      *Ecriture anomalie dans F204                                              
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING ME00-ZCVULO                                                   
                  "/"                                                           
                  ME00-IDPART                                                   
                  "/"                                                           
                  ME00-IDPRJT                                                   
                  "/"                                                           
                  ME00-IDELC0                                                   
                  "/"                                                           
                  ME00-NOOPPR                                                   
                  "/"                                                           
                  ME00-NOPRPR                                                   
                  "/"                                                           
                  ME00-CDPUGW                                                   
                  "/"                                                           
                  ME00-ZLIER1                                                   
                  "/"                                                           
                  ME00-SUITE                                                    
                  (1:428)                                                       
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN.                     
      *Sortie du service                                                        
       F97-SORTIE-ER96-01.                                                      
           MOVE 2                          TO ME00-CEREA5                       
           MOVE 2                          TO ME00-CERREU                       
           MOVE "9L96"                     TO ME00-ZCVULO                       
           MOVE ME00                       TO SERV-DATA                         
           PERFORM SORTIE-OK             THRU SORTIE-OK-FIN.                    
       F97-SORTIE-ER96-FIN.                                                     
       100-F97CB-FIN.                                                           
           EXIT.                                                                
       100-F97-FIN.                                                             
           EXIT.                                                                
      *                                                                         
      *               ***********************************                       
      *               *                                   *                     
      *               *Fonctions Techniques   appel{es    *                     
      *               *                                   *                     
      *               *************************************.                    
       100-F99.                                                                 
           EXIT.                                                                
      *               FONCTIONS CICS PERFORMEES                                 
       100-F99BB.                                                               
           EXIT.                                                                
      *               ECRITURE DANS JOURNAL CICS                                
       100-F99CC.                                                               
           EXIT.                                                                
       ECRIT-LOG.                                                               
      *ECRITURE D'UN MESSAGE DANS LE                                            
      *JOURNAL CICS.                                                            
           MOVE LENGTH OF S-LOGM-MESS      TO S-LOGM-LTH                        
           EXEC CICS                                                            
              WRITEQ TD                                                         
              QUEUE ("CSMT")                                                    
              FROM (S-LOGM-MESS)                                                
              LENGTH (S-LOGM-LTH)                                               
           END-EXEC.                                                            
       ECRIT-LOG-FIN.                                                           
       100-F99CC-FIN.                                                           
           EXIT.                                                                
      *               TRAITEMENTS DEBUT SERVICE                                 
       100-F99DD.                                                               
           EXIT.                                                                
       LIT-MSG.                                                                 
           INITIALIZE                         APPL-CODE                         
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "AE521A "                                                     
                  WW00-ZDATE1                                                   
                  " "                                                           
                  WW00-ZHEURE                                                   
                  "."                                                           
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "MESSAGE ENTREE : "                                           
                  DFHCOMMAREA                                                   
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           MOVE SERV-DATA                  TO TX00.                             
      *CONTROLE INDIC. MAJ                                                      
           INITIALIZE                         F203                              
           MOVE "TPMAJ"                    TO F203-ZNENVN                       
           MOVE "X722034"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING F203.                             
           IF RETURN-CODE NOT = ZEROES                                          
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ERREUR LECTURE CONTEXTE CICS |"                           
                     DELIMITED BY "&"    INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
           MOVE F203-ZNENVV                TO SERV-CPSMAJ.                      
           IF NOT (SERV-CPSMAJ = "O" OR SERV-CPSMAJ = "N" )                     
      *ABORT SI VALEUR INCORRECTE                                               
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "VALEUR DE TPMAJ INCORRECTE |"                             
                     " TPMAJ = "                                                
                     SERV-CPSMAJ                                                
                     DELIMITED BY "&"    INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
           IF SERV-CPSMAJ = "N" AND WC01-CDMAJO = SPACES                        
      *SORTIE SI TP DEGRADE                                                     
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "MAJ INTERDITE - TP DEGRADE |||"                           
                     DELIMITED BY "&"    INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
      *INSERER LES TRAITEMENTS DE                                               
      *REPRISE DE L'ERREUR EN                                                   
      *LIGNES 500-980.                                                          
      *ERREUR FATALE SI PAS DE REPRISE                                          
              MOVE 2                       TO APPL-CODE                         
              MOVE "X"                     TO SERV-CPSMAJ                       
              PERFORM SORTIE-KO          THRU SORTIE-KO-FIN.                    
       LIT-MSG-FIN.                                                             
       100-F99DD-FIN.                                                           
           EXIT.                                                                
      *               TRAITEMENTS FIN SERVICE NORMAL                            
       100-F99EE.                                                               
           EXIT.                                                                
       SORTIE-OK.                                                               
      *SORTIE REUSSIE D'UN SERVICE.                                             
      *A APPELER A LA FIN NORMALE DU                                            
      *SERVICE.                                                                 
           MOVE ME00                       TO SERV-DATA                         
           MOVE "AE521A"                   TO SERV-XPRVSV                       
           MOVE SPACES                     TO SERV-XNXTSV                       
           MOVE LENGTH OF DFHCOMMAREA      TO SERV-MVSSZE                       
           PERFORM MSG-OUT               THRU MSG-OUT-FIN                       
      *LIBERATION MESSAGES EN MEMOIRE                                           
           MOVE "X722037"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2                                                     
      *ULTIME POINT D'INSERTION                                                 
           PERFORM 100-US-EXIT-OK        THRU 100-US-EXIT-OK-FIN                
           EXEC CICS                                                            
              RETURN                                                            
           END-EXEC.                                                            
           GOBACK.                                                              
       SORTIE-OK-FIN.                                                           
       100-F99EE-FIN.                                                           
           EXIT.                                                                
      *               TRAITEMENTS FIN SERVICE ECHEC                             
       100-F99FF.                                                               
           EXIT.                                                                
       SORTIE-KO.                                                               
      *SORTIE D'UN SERVICE EN CAS D'                                            
      *ECHEC.                                                                   
      *A APPELER DES QU'UNE CONDITION                                           
      *D'ECHEC EST DETECTEE.                                                    
      *RETOUR MESSAGES AU CLIENT                                                
           MOVE "X722036"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING APPL-ABEND                        
      *LIBERATION MESSAGES EN MEMOIRE                                           
           MOVE "X722037"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2                                                     
      *FABRICATION DU CODE ABEND                                                
           PERFORM APPL2ABND             THRU APPL2ABND-FIN                     
      *ECRITURE LOG CICS                                                        
           MOVE EIBTRNID                   TO S-LOGM-ZTRNID                     
           MOVE EIBTASKN                   TO S-LOGM-ZTASKN                     
           STRING "GREEN TRANS. "                                               
                  S-LOGM-ZTRNID                                                 
                  " TACHE "                                                     
                  S-LOGM-ZTASKN                                                 
                  " ABEND "                                                     
                  APPL-ABEND                                                    
                  " ECHEC "                                                     
                  ER00-ZNMPR2                                                   
                  DELIMITED BY SIZE      INTO S-LOGM-MESS                       
           PERFORM ECRIT-LOG             THRU ECRIT-LOG-FIN                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "GREEN TRANS. "                                               
                  S-LOGM-ZTRNID                                                 
                  " TACHE "                                                     
                  S-LOGM-ZTASKN                                                 
                  " ABEND "                                                     
                  APPL-ABEND                                                    
                  " ECHEC "                                                     
                  ER00-ZNMPR2                                                   
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
      *ULTIME POINT D'INSERTION                                                 
           PERFORM 100-UT-EXIT-KO        THRU 100-UT-EXIT-KO-FIN                
      *ABEND                                                                    
           EXEC CICS                                                            
              ABEND                                                             
              ABCODE (APPL-ABEND) NODUMP                                        
           END-EXEC.                                                            
       SORTIE-KO-FIN.                                                           
       100-F99FF-FIN.                                                           
           EXIT.                                                                
      *               ERREUR FATALE                                             
       100-F99GG.                                                               
           EXIT.                                                                
       ERR-ABORT.                                                               
      *GESTION DES ERREURS FATALES                                              
           PERFORM SORTIE-KO             THRU SORTIE-KO-FIN.                    
       ERR-ABORT-FIN.                                                           
       100-F99GG-FIN.                                                           
           EXIT.                                                                
      *               DEBRANCHEMENT SUR AUTRE SERVICE                           
       100-F99HH.                                                               
      *APPEL SERVICE NIVEAU 2                                                   
       FWD-SERVICE.                                                             
           MOVE TX00                       TO SERV-DATA                         
           MOVE "AE521A"                   TO SERV-XPRVSV                       
           MOVE SERV-XNXTSV                TO CICS-SRVNAM                       
           MOVE LENGTH OF DFHCOMMAREA      TO SERV-MVSSZE                       
                                              CICS-LENGTH                       
           PERFORM MSG-OUT               THRU MSG-OUT-FIN                       
      *-------------------------------                                          
      *APPEL X722049 (MULTI-VERSION)                                            
      * =RECHERCHE NOM EXTERNE/VERSION                                          
      *-------------------------------                                          
           MOVE PROGE                      TO XT44-ZNMPR4                       
           MOVE CICS-SRVNAM                TO XT44-ZCSVFC                       
           MOVE "0"                        TO XT44-ZTDBSV                       
           PERFORM P-722049              THRU P-722049-FIN                      
      *--------                                                                 
           MOVE XT44-ZNMPR2                TO CICS-SRVNAM.                      
           IF CICS-SRVNAM = "GREXIT"                                            
              EXEC CICS                                                         
              RETURN                                                            
              END-EXEC.                                                         
           EXEC CICS                                                            
              LINK                                                              
              PROGRAM (CICS-SRVNAM)                                             
              COMMAREA (DFHCOMMAREA)                                            
              LENGTH (CICS-LENGTH)                                              
           END-EXEC.                                                            
      *----------------------------                                             
           MOVE XT44-ZCSVFC                TO CICS-SRVNAM                       
      *----------------------------                                             
      *POINT D'INSERTION APRES LINK                                             
           PERFORM AFTER-SERVICE         THRU AFTER-SERVICE-FIN                 
           EXEC CICS                                                            
              RETURN                                                            
           END-EXEC.                                                            
           GOBACK.                                                              
       FWD-SERVICE-FIN.                                                         
       100-F99HH-FIN.                                                           
           EXIT.                                                                
      *               RECHERCHE NOM EXTERNE / VERSION                           
       100-F99HI.                                                               
           EXIT.                                                                
       P-722049.                                                                
           MOVE "X722049"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XT44                              
           IF XT44-ZCDRET NOT = ZERO OR RETURN-CODE NOT = ZERO                  
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ERREUR RETOUR X722049"                                    
                     " RECHERCHE SERVICE : "                                    
                     XT44-ZCSVFC                                                
                     " CODE ERREUR : "                                          
                     XT44-ZCDRET                                                
                     DELIMITED BY "&"    INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       P-722049-FIN.                                                            
       100-F99HI-FIN.                                                           
           EXIT.                                                                
      *               AFFICHAGE FIN SERVICE                                     
       100-F99JJ.                                                               
           EXIT.                                                                
       MSG-OUT.                                                                 
           PERFORM 100-ACC-CUR-DATE      THRU 100-ACC-CUR-DATE-FIN              
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "AE521A "                                                     
                  WW00-ZDATE1                                                   
                  " "                                                           
                  WW00-ZHEURE                                                   
                  "."                                                           
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "MESSAGE SORTIE : "                                           
                  DFHCOMMAREA                                                   
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN.                     
       MSG-OUT-FIN.                                                             
       100-F99JJ-FIN.                                                           
           EXIT.                                                                
      *               INSERTION APRES LINK SERVICE                              
       100-ABSQP-FLL.                                                           
           EXIT.                                                                
       AFTER-SERVICE.                                                           
      *INSERER LIGNE 100-900 LES                                                
      *TRAITEMENTS APRES DEBRANCHEMENT                                          
      *SUR UN SERVICE                                                           
       AFTER-SERVICE-FIN.                                                       
       100-ABSQP-FLL-FIN.                                                       
           EXIT.                                                                
      *               Supp Blanc non significatifs                              
       100-F99MB.                                                               
      *Mettre la zone @ traiter dans :                                          
      * ==>   SW00-X4000                                                        
      * - la longueur de la zone dans :                                         
      * ==>   ISW00L                                                            
      *Faire un Perform F99-SUPBLANC                                            
       F99-SUPBLANC.                                                            
           INITIALIZE                         SW10-X4000                        
                                              ISW10L.                           
           IF SW25-X0001A = SPACES                                              
      *Conservation Blancs de t�te                                              
              MOVE 'N'                     TO SW25-X0001A.                      
           IF ISW00L = ZEROES                                                   
      *Si pas de longueur, la totale                                            
              MOVE ISW00M                  TO ISW00L.                           
      *               Supp Blanc non significatifs                              
       100-F99MD.                                                               
           MOVE 1                          TO J99MDR.                           
           GO TO 100-F99MD-B.                                                   
       100-F99MD-A.                                                             
           ADD 1                           TO J99MDR.                           
       100-F99MD-B.                                                             
           IF ISW00L < J99MDR                                                   
              GO TO 100-F99MD-FIN.                                              
           MOVE 'N'                        TO SW20-X0001A.                      
           IF SW00-X0001A (J99MDR) NOT = SPACES                                 
              MOVE 'O'                     TO SW20-X0001A                       
              MOVE 'O'                     TO SW25-X0001A.                      
           IF SW00-X0001A (J99MDR) = SPACE AND SW25-X0001A = 'O'                
              MOVE 'O'                     TO SW20-X0001A                       
              MOVE 'N'                     TO SW25-X0001A.                      
           IF SW20-X0001A = 'O'                                                 
              ADD 1                        TO ISW10L.                           
           IF SW20-X0001A = 'O' AND ISW10L NOT > ISW10M                         
              MOVE SW00-X0001A (J99MDR)    TO SW10-X0001A (ISW10L).             
       100-F99MD-900.                                                           
           GO TO 100-F99MD-A.                                                   
       100-F99MD-FIN.                                                           
           EXIT.                                                                
       100-F99MB-FIN.                                                           
           EXIT.                                                                
      *               Fin de sous-fonction                                      
       100-F99MF.                                                               
           MOVE SW10-X4000                 TO SW00-X4000.                       
       F99-SUPBLANC-FIN.                                                        
           EXIT.                                                                
       100-F99MF-FIN.                                                           
           EXIT.                                                                
      *               TRAITEMENTS SPECIF. SORTIE OK                             
       100-ABSQP-FUS.                                                           
           EXIT.                                                                
       100-US-EXIT-OK.                                                          
       100-US-EXIT-OK-FIN.                                                      
       100-ABSQP-FUS-FIN.                                                       
           EXIT.                                                                
      *               TRAITEMENTS SPECIF. SORTIE KO                             
       100-ABSQP-FUT.                                                           
           EXIT.                                                                
       100-UT-EXIT-KO.                                                          
       100-UT-EXIT-KO-FIN.                                                      
       100-ABSQP-FUT-FIN.                                                       
           EXIT.                                                                
       100-F99BB-FIN.                                                           
           EXIT.                                                                
       100-F99-FIN.                                                             
           EXIT.                                                                
      *                                                                         
      * Proc{dure - Gestion des d{branchements (GO TO)                          
      *                                                                         
       COPY 'GENAGNIV'.                                                         
      *<fin_procedure>_01                                                       
       100-ERREUR01.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "LE NUMERO DE PRET" " " "EST OBLIGATOIRE" " "                 
                   " "                                                          
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR01-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR02.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "ACCES DF01 KO" " " "- IDELCO :" " "                          
                  TX00-IDELC0 " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR02-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR03.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "ACCES DF11 KO" " " "- IDELCO :" " "                          
                  DF01-IDELCO " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR03-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR04.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "ACCES DF81 KO" " " "- IDELCO :" " "                          
                  DF02-IDELCO " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR04-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR05.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "ACCES DC03 KO" " " "- IDPART :" " "                          
                  DF01-IDPART " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR05-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR06.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "DF02 NON TROUVE" " " "- IDELCO :" " "                        
                  DF02-IDELCO " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR06-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR07.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "DC02 NON TROUVE" " " "- IDELCO :" " "                        
                  DC02-IDELCO " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR07-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR08.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "DC05 NON TROUVE" " " "- IDELCO :" " "                        
                  DC02-IDELCO " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR08-FIN.                                                        
           EXIT.                                                                
      *                                                                         
       100-ERREUR09.                                                            
           INITIALIZE                         EREC-ZLIERT                       
           STRING "DC23 NON TROUVE" " " "- IDELCO :" " "                        
                  DC02-IDELCO " "                                               
                  DELIMITED  BY SIZE     INTO EREC-ZLIERT                       
           MOVE "C"                        TO EREC-X0001A.                      
       100-ERREUR09-FIN.                                                        
           EXIT.                                                                
      *                                                                         
      *  ACCES DF01 CLE COMPLETE                                                
      *                                                                         
       100-ACCES-F95BB.                                                         
           EXIT.                                                                
       100-ACCES-OCC-DF01.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "CLEFDIRCIDTF"             TO LG-ORDRE                          
           MOVE "LGDF01"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING DF01                              
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF OK                                                                
              GO TO 100-ACCES-OCC-DF01-FIN.                                     
           IF PAS-TROUVE                                                        
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-OCC-DF01-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES CLE COMPLETE "                                      
                  "STATUS " LG-STATUS                                           
                  "SQLCODE PRECEDENT " LG-ZCSQL1                                
                  "SQLCODE COURANT   " LG-ZCSQLC                                
                  "DEBUG             " LG-ZCDBUG                                
                  "DF01 " DF01                                                  
                  DELIMITED                BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-OCC-DF01-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95BB-FIN.                                                     
           EXIT.                                                                
      *  ACCES DF11 CLE COMPLETE                                                
      *                                                                         
       100-ACCES-F95BC.                                                         
           EXIT.                                                                
       100-ACCES-OCC-DF11.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "CLEFDIRCIDTF"             TO LG-ORDRE                          
           MOVE "LGDF11"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING DF11                              
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF OK                                                                
              GO TO 100-ACCES-OCC-DF11-FIN.                                     
           IF PAS-TROUVE                                                        
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-OCC-DF11-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES CLE COMPLETE "                                      
                  "STATUS " LG-STATUS                                           
                  "SQLCODE PRECEDENT " LG-ZCSQL1                                
                  "SQLCODE COURANT   " LG-ZCSQLC                                
                  "DEBUG             " LG-ZCDBUG                                
                  "DF11 " DF11                                                  
                  DELIMITED                BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-OCC-DF11-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95BC-FIN.                                                     
           EXIT.                                                                
      *  ACCES DE04 CLE COMPLETE                                                
      *                                                                         
       100-ACCES-F95BE.                                                         
           EXIT.                                                                
       100-ACCES-OCC-DE04.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "CLEFDIRCIDTF"             TO LG-ORDRE                          
           MOVE "LGDE04"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING DE04                              
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF OK                                                                
              GO TO 100-ACCES-OCC-DE04-FIN.                                     
           IF PAS-TROUVE                                                        
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-OCC-DE04-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES CLE COMPLETE "                                      
                  "STATUS " LG-STATUS                                           
                  "SQLCODE PRECEDENT " LG-ZCSQL1                                
                  "SQLCODE COURANT   " LG-ZCSQLC                                
                  "DEBUG             " LG-ZCDBUG                                
                  "DE04 " DE04                                                  
                  DELIMITED                BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-OCC-DE04-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95BE-FIN.                                                     
           EXIT.                                                                
      *  ACCES DF02 CLE INCOMPLETE                                              
      *                                                                         
       100-ACCES-F95BF.                                                         
           EXIT.                                                                
       100-ACCES-OCI-DF02.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "CLEFDIRCIDTF"             TO LG-ORDRE                          
           MOVE "LGDF02"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING DF02                              
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF TROUVE-SUP OR                                                     
              TROUVE-INF OR                                                     
              OK                                                                
              GO TO 100-ACCES-OCI-DF02-FIN.                                     
           IF PAS-TROUVE                                                        
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-OCI-DF02-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES CLE INCOMPLETE "                                    
                  "STATUS " LG-STATUS                                           
                  "SQLCODE PRECEDENT " LG-ZCSQL1                                
                  "SQLCODE COURANT   " LG-ZCSQLC                                
                  "DEBUG             " LG-ZCDBUG                                
                  "DF02 " DF02                                                  
                  DELIMITED                BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-OCI-DF02-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95BF-FIN.                                                     
           EXIT.                                                                
      *  ACCES AC70 CLE INCOMPLETE                                              
      *                                                                         
       100-ACCES-F95BH.                                                         
           EXIT.                                                                
       100-ACCES-OCI-AC70.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "CLEFDIRCIDTF"             TO LG-ORDRE                          
           MOVE "LGAC70"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING AC70                              
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF TROUVE-SUP OR                                                     
              TROUVE-INF OR                                                     
              OK                                                                
              GO TO 100-ACCES-OCI-AC70-FIN.                                     
           IF PAS-TROUVE                                                        
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-OCI-AC70-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES CLE INCOMPLETE "                                    
                  "STATUS " LG-STATUS                                           
                  "SQLCODE PRECEDENT " LG-ZCSQL1                                
                  "SQLCODE COURANT   " LG-ZCSQLC                                
                  "DEBUG             " LG-ZCDBUG                                
                  "AC70 " AC70                                                  
                  DELIMITED                BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-OCI-AC70-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95BH-FIN.                                                     
           EXIT.                                                                
      *  ACCES DF02 SUIVANT PAR CLE                                             
      *                                                                         
       100-ACCSUIVANT-F95BG.                                                    
           EXIT.                                                                
       100-ACCES-OCS-DF02.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "CLEFSUIVIDTF"             TO LG-ORDRE                          
           MOVE "LGDF02"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING DF02                              
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF OK                                                                
              GO TO 100-ACCES-OCS-DF02-FIN.                                     
           IF FIN-DOMAINE                                                       
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-OCS-DF02-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES SUIVANT PAR CLE "                                   
                  "STATUS " LG-STATUS                                           
                  "SQLCODE PRECEDENT " LG-ZCSQL1                                
                  "SQLCODE COURANT   " LG-ZCSQLC                                
                  "DEBUG             " LG-ZCDBUG                                
                  "DF02 " DF02                                                  
                  DELIMITED                BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-OCS-DF02-FIN.                                                  
           EXIT.                                                                
       100-ACCSUIVANT-F95BG-FIN.                                                
           EXIT.                                                                
      *  ACCES AC70 SUIVANT PAR CLE                                             
      *                                                                         
       100-ACCSUIVANT-F95BI.                                                    
           EXIT.                                                                
       100-ACCES-OCS-AC70.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "CLEFSUIVIDTF"             TO LG-ORDRE                          
           MOVE "LGAC70"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING AC70                              
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF OK                                                                
              GO TO 100-ACCES-OCS-AC70-FIN.                                     
           IF FIN-DOMAINE                                                       
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-OCS-AC70-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES SUIVANT PAR CLE "                                   
                  "STATUS " LG-STATUS                                           
                  "SQLCODE PRECEDENT " LG-ZCSQL1                                
                  "SQLCODE COURANT   " LG-ZCSQLC                                
                  "DEBUG             " LG-ZCDBUG                                
                  "AC70 " AC70                                                  
                  DELIMITED                BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-OCS-AC70-FIN.                                                  
           EXIT.                                                                
       100-ACCSUIVANT-F95BI-FIN.                                                
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-10DB13.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 10DB 130 - "                                          
                     "PB ACCES VERSION ADI : "                                  
                     X601-LMRETO                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-10DB13-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-50BJ16.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 50BJ 160 - "                                          
                     "PB ACCES DF01 IDELCO :"                                   
                     TX00-IDELC0                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-50BJ16-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-50BJ25.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 50BJ 250 - "                                          
                     "PB ACCES DF11 IDELCO :"                                   
                     DF01-IDELCO                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-50BJ25-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-50BN16.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 50BN 160 - "                                          
                     "PB ACCES DC03 IDPART :"                                   
                     DF01-IDPART                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-50BN16-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-50CF28.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 50CF 280 - "                                          
                     "RETOUR 51058B KO POUR "                                   
                     "ASSURE : "                                                
                     X58B-IDASCN                                                
                     " CODE "                                                   
                     "RETOUR : "                                                
                     X58B-ZCDRET                                                
                     " ANO : "                                                  
                     X58B-NUANOM                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-50CF28-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-92CJ20.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 92CJ l20 - "                                          
                     "RETOUR 51058A KO POUR "                                   
                     "ASSURE : "                                                
                     X58A-IDASCN                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-92CJ20-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-50DB19.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 50DB 190 - "                                          
                     "RETOUR 51058A KO POUR "                                   
                     "ASSURE : "                                                
                     ME4A-IDASCN                                                
                     (J50DBR)                                                   
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-50DB19-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-50DM03.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
                 STRING "# - 50DM 030 - "                                       
                        "PAS D'ASSURE POUR "                                    
                        "IDELCO : "                                             
                        DF01-IDELCO                                             
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-50DM03-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-92JF17.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 92JF 170 - "                                          
                     "DC05 NON TROUVE POUR "                                    
                     "IDELCO : "                                                
                     DC02-IDEL02                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-92JF17-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-92JF27.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 92JF 270 - "                                          
                     "DC23 NON TROUVE POUR "                                    
                     "IDELCO : "                                                
                     DC02-IDEL02                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-92JF27-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-92KF17.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 92KF 170 - "                                          
                     "PB ACCES DF81 IDELCO :"                                   
                     DF02-IDELCO                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-92KF17-FIN.                                                 
           EXIT.                                                                
      *  GESTION MESSAGE D'ERREUR                                               
      *                                                                         
       100-ALIM-ERR-92KH10.                                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
              STRING "# - 92KH 100 - "                                          
                     "DF02 NON TROUVE POUR "                                    
                     "IDELCO : "                                                
                     DF02-IDELCO                                                
                  DELIMITED BY "&"                                              
                                         INTO ER00-ZTERMR.                      
       100-ALIM-ERR-92KH10-FIN.                                                 
           EXIT.                                                                
      *               FONCTIONS PERFORMEES START                                
       100-FCT-START.                                                           
      *   APPEL INTERFACE START                                                 
       CAL-START.                                                               
           MOVE "X722048"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING X308.                             
       CAL-START-FIN.                                                           
           EXIT.                                                                
      *                                                                         
      *   SORTIE ANOMALIES                                                      
       ERR-START.                                                               
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "START : FONCTION '" X308-ZCDFON                              
                  "'  MODE TRAIT. '" X308-ZMODTR                                
                  "'  SUR " X308-ZZIDOB                                         
                  "  CODE RETOUR " X308-ZCDRET                                  
                                 DELIMITED BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       ERR-START-FIN.                                                           
           EXIT.                                                                
       100-FCT-START-FIN.                                                       
           EXIT.                                                                
      *                                                                         
      *               INIT TYPE LECTURE TABLES DB2                              
       100-INITLECT-TABDB2.                                                     
           INITIALIZE                         XT29                              
           MOVE "INI"                      TO XT29-ZCDFO8                       
           PERFORM P-722097              THRU P-722097-FIN.                     
       100-INITLECT-TABDB2-FIN.                                                 
           EXIT.                                                                
      *                                                                         
      *               APPEL 722097/722096                                       
       100-APPEL-72209X.                                                        
           EXIT.                                                                
      *                                                                         
       P-722097.                                                                
           MOVE "X722097"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XT29.                             
       P-722097-FIN.                                                            
           EXIT.                                                                
      *                                                                         
       P-722096.                                                                
           MOVE "X722096"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XT29.                             
       P-722096-FIN.                                                            
           EXIT.                                                                
      *                                                                         
       100-APPEL-72209X-FIN.                                                    
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BC.                                                    
           EXIT.                                                                
       DE-TA0990NM262-B.                                                        
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "TA"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "NM262"                    TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE "8210"                     TO X308-ZCDSI1                       
           MOVE "TF73"                     TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE " "                     TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TF73                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-TA0990NM262-B-FIN.                                       
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-TA0990NM262-B-FIN.                                       
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-TA0990NM262-B-FIN.                                       
           MOVE X308-X7744                 TO TF73.                             
       DE-TA0990NM262-B-FIN.                                                    
       100-DERIVATION-F93BC-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BD.                                                    
           EXIT.                                                                
       DE-RB0990ADI242-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI242"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI242-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI242-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI242-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI242-B-FIN.                                                   
       100-DERIVATION-F93BD-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BE.                                                    
           EXIT.                                                                
       DE-RB09900010-B.                                                         
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "0010"                     TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB09900010-B-FIN.                                        
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB09900010-B-FIN.                                        
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB09900010-B-FIN.                                        
           MOVE X308-X7744                 TO TD15.                             
       DE-RB09900010-B-FIN.                                                     
       100-DERIVATION-F93BE-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BF.                                                    
           EXIT.                                                                
       DE-RB8210CDSUPR-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "8210"                     TO X308-ZCDSIT                       
           MOVE "CDSUPR"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB8210CDSUPR-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB8210CDSUPR-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB8210CDSUPR-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB8210CDSUPR-B-FIN.                                                   
       100-DERIVATION-F93BF-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BG.                                                    
           EXIT.                                                                
       DE-RB0990BA102-B.                                                        
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "BA102"                    TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990BA102-B-FIN.                                       
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990BA102-B-FIN.                                       
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990BA102-B-FIN.                                       
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990BA102-B-FIN.                                                    
       100-DERIVATION-F93BG-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BH.                                                    
           EXIT.                                                                
       DE-RB0AMTADI002-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0AMT"                     TO X308-ZCDSIT                       
           MOVE "ADI002"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0AMTADI002-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0AMTADI002-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0AMTADI002-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0AMTADI002-B-FIN.                                                   
       100-DERIVATION-F93BH-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BI.                                                    
           EXIT.                                                                
       DE-RB8210CDCAPR-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "8210"                     TO X308-ZCDSIT                       
           MOVE "CDCAPR"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB8210CDCAPR-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB8210CDCAPR-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB8210CDCAPR-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB8210CDCAPR-B-FIN.                                                   
       100-DERIVATION-F93BI-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BJ.                                                    
           EXIT.                                                                
       DE-RB0990ADI022-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI022"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI022-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI022-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI022-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI022-B-FIN.                                                   
       100-DERIVATION-F93BJ-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BK.                                                    
           EXIT.                                                                
       DE-RB0990ADI012-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI012"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI012-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI012-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI012-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI012-B-FIN.                                                   
       100-DERIVATION-F93BK-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BL.                                                    
           EXIT.                                                                
       DE-RB0990ADI221-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI221"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI221-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI221-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI221-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI221-B-FIN.                                                   
       100-DERIVATION-F93BL-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BM.                                                    
           EXIT.                                                                
       DE-RB0990ADI244-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI244"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI244-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI244-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI244-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI244-B-FIN.                                                   
       100-DERIVATION-F93BM-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BN.                                                    
           EXIT.                                                                
       DE-RB0990ADI262-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI262"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI262-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI262-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI262-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI262-B-FIN.                                                   
       100-DERIVATION-F93BN-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BO.                                                    
           EXIT.                                                                
       DE-RB0990ADI243-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI243"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI243-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI243-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI243-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI243-B-FIN.                                                   
       100-DERIVATION-F93BO-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BP.                                                    
           EXIT.                                                                
       DE-RB0990ADI240-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI240"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI240-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI240-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI240-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI240-B-FIN.                                                   
       100-DERIVATION-F93BP-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BQ.                                                    
           EXIT.                                                                
       DE-RB0990ADI018-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "RB"                       TO X308-ZTYOBJ                       
           MOVE "0990"                     TO X308-ZCDSIT                       
           MOVE "ADI018"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE " "                        TO X308-ZCDSI1                       
           MOVE " "                        TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE TD15-ZVAMIN             TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TD15                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI018-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-RB0990ADI018-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-RB0990ADI018-B-FIN.                                      
           MOVE X308-X7744                 TO TD15.                             
       DE-RB0990ADI018-B-FIN.                                                   
       100-DERIVATION-F93BQ-FIN.                                                
           EXIT.                                                                
      *                                                                         
      *               DERIVATION                                                
       100-DERIVATION-F93BR.                                                    
           EXIT.                                                                
       DE-TA8210PG1057-B.                                                       
           MOVE ZERO                       TO IK                                
           MOVE SPACE                      TO X308-ZZINIT                       
           MOVE "TA"                       TO X308-ZTYOBJ                       
           MOVE "8210"                     TO X308-ZCDSIT                       
           MOVE "PG1057"                   TO X308-ZCOBJS                       
           MOVE "0"                        TO X308-ZNUVER                       
           MOVE "DE"                       TO X308-ZCDFON                       
           MOVE "CD"                       TO X308-ZMODTR                       
           MOVE "8210"                     TO X308-ZCDSI1                       
           MOVE "TF81"                     TO X308-ZCOBJ1.                      
           IF X308-ZCOBJ1 = SPACE                                               
              MOVE " "                     TO X308-ZVAMIN                       
           ELSE                                                                 
              MOVE TF81                    TO X308-X7744.                       
           IF X308-ZCOBJ1 = SPACE AND X308-ZVAMIN = SPACE                       
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "ZVAMIN SPACE " X308-ZZIDOB DELIMITED                      
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              MOVE 1                       TO IK                                
              GO TO DE-TA8210PG1057-B-FIN.                                      
      *VALORISATIONS PAR DEFAUT                                                 
           MOVE SPACE                      TO X308-ZCDSI2                       
           MOVE SPACE                      TO X308-ZCOBJ2                       
           PERFORM CAL-START             THRU CAL-START-FIN                     
           IF X308-ZCDRET NOT = "00"                                            
              MOVE 1                       TO IK                                
              PERFORM ERR-START          THRU ERR-START-FIN                     
              GO TO DE-TA8210PG1057-B-FIN.                                      
           IF X308-ZCDCTR NOT = "1"                                             
              MOVE 1                       TO IK                                
              GO TO DE-TA8210PG1057-B-FIN.                                      
           MOVE X308-X7744                 TO TF81.                             
       DE-TA8210PG1057-B-FIN.                                                   
       100-DERIVATION-F93BR-FIN.                                                
           EXIT.                                                                
      *                                                                         
      * APPEL 51058A                                                            
       100-APPEL-SPGM-F91CC.                                                    
           EXIT.                                                                
       P-51058A.                                                                
           MOVE "X51058A"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2           USING X58A.                               
           IF RETURN-CODE > ZERO                                                
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "100-APPEL-SPGM-F91CC "                                    
                     "ERREUR FATALE SPG "                                       
                     "X51058A, X58A=" X58A                                      
                     DELIMITED             BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       P-51058A-FIN.                                                            
           EXIT.                                                                
       100-APPEL-SPGM-F91CC-FIN.                                                
           EXIT.                                                                
      *                                                                         
      * APPEL 51058B                                                            
       100-APPEL-SPGM-F91CD.                                                    
           EXIT.                                                                
       P-51058B.                                                                
           MOVE "X51058B"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2           USING X58B.                               
           IF RETURN-CODE > ZERO                                                
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "100-APPEL-SPGM-F91CD "                                    
                     "ERREUR FATALE SPG "                                       
                     "X51058B, X58B=" X58B                                      
                     DELIMITED             BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       P-51058B-FIN.                                                            
           EXIT.                                                                
       100-APPEL-SPGM-F91CD-FIN.                                                
           EXIT.                                                                
      *                                                                         
      * APPEL 51058E                                                            
       100-APPEL-SPGM-F91CE.                                                    
           EXIT.                                                                
       P-51058E.                                                                
           MOVE "X51058E"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2           USING X58E.                               
           IF RETURN-CODE > ZERO                                                
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "100-APPEL-SPGM-F91CE "                                    
                     "ERREUR FATALE SPG "                                       
                     "X51058E, X58E=" X58E                                      
                     DELIMITED             BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       P-51058E-FIN.                                                            
           EXIT.                                                                
       100-APPEL-SPGM-F91CE-FIN.                                                
           EXIT.                                                                
      *                                                                         
      * APPEL 51058H                                                            
       100-APPEL-SPGM-F91CF.                                                    
           EXIT.                                                                
       P-51058H.                                                                
           MOVE "X51058H"                  TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2           USING X58H.                               
           IF RETURN-CODE > ZERO                                                
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "100-APPEL-SPGM-F91CF "                                    
                     "ERREUR FATALE SPG "                                       
                     "X51058H, X58H=" X58H                                      
                     DELIMITED             BY "&"                               
                                         INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       P-51058H-FIN.                                                            
           EXIT.                                                                
       100-APPEL-SPGM-F91CF-FIN.                                                
           EXIT.                                                                
      *                                                                         
      * Appel 510600                                                            
       100-APPEL-SPGM-91CG.                                                     
           EXIT.                                                                
       P-510600.                                                                
           MOVE SPACES                     TO CALL-ZNMPR2                       
           STRING "X" "510600" DELIMITED   BY SIZE                              
                                         INTO CALL-ZNMPR2.                      
           IF CALL-ZNMPR2 (1:2) = "X"                                           
      *Le Spgm appel{ n'est pas X510600                                         
      *mais 510600 ==> For\age Nom Spgm                                         
              MOVE "510600"                TO CALL-ZNMPR2.                      
      *Appel Spgm X510600 ou 510600                                             
           CALL CALL-ZNMPR2             USING X601                              
                                                                                
      *                                                                         
           IF RETURN-CODE > ZERO                                                
              MOVE ALL "&"                 TO ER00-ZTERMR                       
              STRING "91CG Erreur fatale Spg " CALL-ZNMPR2                      
                     ", X601=" X601                                             
                     " / "                                                      
                     DELIMITED  BY "&"   INTO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN                      
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       P-510600-FIN.                                                            
           EXIT.                                                                
       100-APPEL-SPGM-91CG-FIN.                                                 
           EXIT.                                                                
      *                                                                         
      *               DC03 : LECTURE PAR CLE                                    
       100-ACCES-F95DC.                                                         
           EXIT.                                                                
       100-ACCES-LCL-DC03.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "LC"                       TO XE10-ZRORDR                       
           MOVE "REDC03"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XE10                              
                                              DC03                              
           MOVE XE10-ZRSTAT                TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI = "I" AND R-CPCLNI                                    
      *Client incomplet accept{                                                 
              MOVE ZEROES                  TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI NOT = "I" AND R-CPCLNI                                
      *Client incomplet non accept{                                             
              MOVE 01                      TO RQ00-ZRSTAT.                      
           IF R-OK                                                              
              MOVE ZERO                    TO IK                                
              GO TO 100-ACCES-LCL-DC03-FIN.                                     
           IF R-NTROUV OR R-SPECIF                                              
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-LCL-DC03-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "LCL DC03 ZRSTAT " XE10-ZRSTAT " " XE10-ZRLERR                
                  " CLES " DC03-ZZCLES DELIMITED                                
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-LCL-DC03-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95DC-FIN.                                                     
           EXIT.                                                                
      *                                                                         
      *               DC05 : LECTURE PAR CLE                                    
       100-ACCES-F95DD.                                                         
           EXIT.                                                                
       100-ACCES-LCL-DC05.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "LC"                       TO XE10-ZRORDR                       
           MOVE "REDC05"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XE10                              
                                              DC05                              
           MOVE XE10-ZRSTAT                TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI = "I" AND R-CPCLNI                                    
      *Client incomplet accept{                                                 
              MOVE ZEROES                  TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI NOT = "I" AND R-CPCLNI                                
      *Client incomplet non accept{                                             
              MOVE 01                      TO RQ00-ZRSTAT.                      
           IF R-OK                                                              
              MOVE ZERO                    TO IK                                
              GO TO 100-ACCES-LCL-DC05-FIN.                                     
           IF R-NTROUV OR R-SPECIF                                              
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-LCL-DC05-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "LCL DC05 ZRSTAT " XE10-ZRSTAT " " XE10-ZRLERR                
                  " CLES " DC05-ZZCLES DELIMITED                                
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-LCL-DC05-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95DD-FIN.                                                     
           EXIT.                                                                
      *                                                                         
      *               DC23 : LECTURE PAR CLE                                    
       100-ACCES-F95DE.                                                         
           EXIT.                                                                
       100-ACCES-LCL-DC23.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "LC"                       TO XE10-ZRORDR                       
           MOVE "REDC23"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XE10                              
                                              DC23                              
           MOVE XE10-ZRSTAT                TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI = "I" AND R-CPCLNI                                    
      *Client incomplet accept{                                                 
              MOVE ZEROES                  TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI NOT = "I" AND R-CPCLNI                                
      *Client incomplet non accept{                                             
              MOVE 01                      TO RQ00-ZRSTAT.                      
           IF R-OK                                                              
              MOVE ZERO                    TO IK                                
              GO TO 100-ACCES-LCL-DC23-FIN.                                     
           IF R-NTROUV OR R-SPECIF                                              
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-LCL-DC23-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "LCL DC23 ZRSTAT " XE10-ZRSTAT " " XE10-ZRLERR                
                  " CLES " DC23-ZZCLES DELIMITED                                
                                           BY "&"                               
                                         INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-LCL-DC23-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95DE-FIN.                                                     
           EXIT.                                                                
      *                                                                         
      *               Lecture Param}tre PA01 Mode L                             
      *                                                                         
       100-LECT-PARAM-PA01.                                                     
           IF PROGE (1:2) NOT = "X5" AND PROGE (1:2) NOT = "AL"                 
      *Init Balise : Si pas Spgm                                                
              MOVE SPACES                  TO PASE-PA01-CPFLA9.                 
           IF PASA-PA01-ZCMAJ = "U"                                             
      *Init Balise : Si Besoin de Maj                                           
              MOVE SPACES                  TO PASE-PA01-CPFLA9.                 
           IF PASE-PA01-CPFLA9 = "`"                                            
      *Param}tre d{j@ lu pr{c{demment                                           
              MOVE PASE-PA01               TO DE04                              
              MOVE ZERO                    TO IK                                
           ELSE                                                                 
      *Lecture physique dans A204/DE04                                          
              INITIALIZE                      DE04                              
                                              PA01                              
                                              PASE-PA01                         
              MOVE PASA-PA01-ZCMAJ         TO LG-ZCMAJ                          
              MOVE 01                      TO DE04-CTPARA                       
              PERFORM 100-ACCES-OCC-DE04 THRU 100-ACCES-OCC-DE04-FIN.           
           IF IK = ZEROES                                                       
      *Lecture param}tre OK                                                     
              MOVE DE04                    TO PA01                              
                                              PASE-PA01                         
              MOVE "`"                     TO PASE-PA01-CPFLA9                  
           ELSE                                                                 
      *Probl}me Lecture Param}tres                                              
              MOVE "SEGMENT PARAMETRE PA01 NON LU"                              
                                           TO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN.                     
           IF IK NOT = ZEROES AND PASA-PA01-CPABTD NOT = "N"                    
      *Abend demand{ si Pb Lecture                                              
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
           IF PASA-PA01-ZCMAJ = "U"                                             
      *Forcage relecture suivant si Maj                                         
              MOVE SPACES                  TO PASE-PA01-CPFLA9.                 
       100-LECT-PARAM-PA01-FIN.                                                 
           EXIT.                                                                
      *               Lecture Param}tre PA99 Mode L                             
      *                                                                         
       100-LECT-PARAM-PA99.                                                     
           IF PROGE (1:2) NOT = "X5" AND PROGE (1:2) NOT = "AL"                 
      *Init Balise : Si pas Spgm                                                
              MOVE SPACES                  TO PASE-PA99-CPFLA9.                 
           IF PASA-PA99-ZCMAJ = "U"                                             
      *Init Balise : Si Besoin de Maj                                           
              MOVE SPACES                  TO PASE-PA99-CPFLA9.                 
           IF PASE-PA99-CPFLA9 = "`"                                            
      *Param}tre d{j@ lu pr{c{demment                                           
              MOVE PASE-PA99               TO DE04                              
              MOVE ZERO                    TO IK                                
           ELSE                                                                 
      *Lecture physique dans A204/DE04                                          
              INITIALIZE                      DE04                              
                                              PA99                              
                                              PASE-PA99                         
              MOVE PASA-PA99-ZCMAJ         TO LG-ZCMAJ                          
              MOVE 99                      TO DE04-CTPARA                       
              PERFORM 100-ACCES-OCC-DE04 THRU 100-ACCES-OCC-DE04-FIN.           
           IF IK = ZEROES                                                       
      *Lecture param}tre OK                                                     
              MOVE DE04                    TO PA99                              
                                              PASE-PA99                         
              MOVE "`"                     TO PASE-PA99-CPFLA9                  
           ELSE                                                                 
      *Probl}me Lecture Param}tres                                              
              MOVE "SEGMENT PARAMETRE PA99 NON LU"                              
                                           TO ER00-ZTERMR                       
              PERFORM P-722020           THRU P-722020-FIN.                     
           IF IK NOT = ZEROES AND PASA-PA99-CPABTD NOT = "N"                    
      *Abend demand{ si Pb Lecture                                              
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
           IF PASA-PA99-ZCMAJ = "U"                                             
      *Forcage relecture suivant si Maj                                         
              MOVE SPACES                  TO PASE-PA99-CPFLA9.                 
       100-LECT-PARAM-PA99-FIN.                                                 
           EXIT.                                                                
      *               INITIALISATION DE DF01                                    
      *                                                                         
       100-INIT-DF01.                                                           
           MOVE "LGDF01"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING W-ZCSGLG.                         
           IF RETURN-CODE > 0                                                   
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       100-INIT-DF01-FIN.                                                       
           EXIT.                                                                
      *               INITIALISATION DE DF11                                    
      *                                                                         
       100-INIT-DF11.                                                           
           MOVE "LGDF11"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING W-ZCSGLG.                         
           IF RETURN-CODE > 0                                                   
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       100-INIT-DF11-FIN.                                                       
           EXIT.                                                                
      *               INITIALISATION DE DE04                                    
      *                                                                         
       100-INIT-DE04.                                                           
           MOVE "LGDE04"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING W-ZCSGLG.                         
           IF RETURN-CODE > 0                                                   
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       100-INIT-DE04-FIN.                                                       
           EXIT.                                                                
      *               INITIALISATION DE DF02                                    
      *                                                                         
       100-INIT-DF02.                                                           
           MOVE "LGDF02"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING W-ZCSGLG.                         
           IF RETURN-CODE > 0                                                   
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       100-INIT-DF02-FIN.                                                       
           EXIT.                                                                
      *               INITIALISATION DE AC70                                    
      *                                                                         
       100-INIT-AC70.                                                           
           MOVE "LGAC70"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING W-ZCSGLG.                         
           IF RETURN-CODE > 0                                                   
              PERFORM ERR-ABORT          THRU ERR-ABORT-FIN.                    
       100-INIT-AC70-FIN.                                                       
           EXIT.                                                                
      *               RECUPERATION DATE SYSTEME                                 
      *                                                                         
       100-ACC-CUR-DATE.                                                        
           MOVE FUNCTION CURRENT-DATE      TO WW00-X0016.                       
       100-ACC-CUR-DATE-FIN.                                                    
           EXIT.                                                                
      *               DC02 : DEBUT BAL PAR CLE/FILTRE                           
      *                                                                         
       100-F95-LF1-DC02.                                                        
           MOVE ZERO                       TO IK                                
           MOVE "LCF1"                     TO XE10-ZRORDR                       
           MOVE "REDC02"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XE10                              
                                              XE11                              
                                              DC02                              
           MOVE XE10-ZRSTAT                TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI = "I" AND R-CPCLNI                                    
      *Client incomplet accept{                                                 
              MOVE ZEROES                  TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI NOT = "I" AND R-CPCLNI                                
      *Client incomplet non accept{                                             
              MOVE 02                      TO RQ00-ZRSTAT.                      
           IF R-OK                                                              
              MOVE ZERO                    TO IK                                
              GO TO 100-F95-LF1-DC02-FIN.                                       
           IF R-FINBAL OR R-SPECIF                                              
              MOVE 1                       TO IK                                
              GO TO 100-F95-LF1-DC02-FIN.                                       
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "LF1 DC02 ZRSTAT "                                            
                  XE10-ZRSTAT                                                   
                  " "                                                           
                  XE10-ZRLERR                                                   
                  " CLES "                                                      
                  DC02-ZZCLES                                                   
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-F95-LF1-DC02-FIN.                                                    
           EXIT.                                                                
      *               ACCES 1ERE RELATION DF81                                  
      *                                                                         
       100-ACCES-F95BD.                                                         
           EXIT.                                                                
       100-ACCES-RE1-DF81.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "RELAPREM1"                TO LG-ORDRE                          
           MOVE "LRDF81"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING DF81                              
                                              DF02                              
                                              DF29                              
                                                                                
                                                                                
                                                                                
           MOVE LG-STATUS                  TO W-LO99-STATUS.                    
           IF OK                                                                
              GO TO 100-ACCES-RE1-DF81-FIN.                                     
           IF FIN-DOMAINE OR PAS-TROUVE                                         
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-RE1-DF81-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "PB ACCES 1ERE RELATION "                                     
                  "STATUS "                                                     
                  LG-STATUS                                                     
                  "STATUS INFO "                                                
                  LG-STATUS-INFO                                                
                  "SQLCODE PRECEDENT "                                          
                  LG-ZCSQL1                                                     
                  "SQLCODE COURANT   "                                          
                  LG-ZCSQLC                                                     
                  "DEBUG             "                                          
                  LG-ZCDBUG                                                     
                  "DF81 "                                                       
                  DF81                                                          
                  "RANG DE DEPART 1"                                            
                  "DF02 "                                                       
                  DF02                                                          
                  "DF29 "                                                       
                  DF29                                                          
                  " "                                                           
                                                                                
                  " "                                                           
                                                                                
                  " "                                                           
                                                                                
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-RE1-DF81-FIN.                                                  
           EXIT.                                                                
       100-ACCES-F95BD-FIN.                                                     
           EXIT.                                                                
      *                                                                         
      *     LECTURE SUITE BALAY PAR CLE/FILTRE SEGMENT DC02                     
      *                                                                         
       100-ACCES-LFS-DC02.                                                      
           MOVE ZERO                       TO IK                                
           MOVE "LCFS"                     TO XE10-ZRORDR                       
           MOVE "REDC02"                   TO CALL-ZNMPR2                       
           CALL CALL-ZNMPR2             USING XE10                              
                                               XE11                             
                                              DC02                              
           MOVE XE10-ZRSTAT                TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI = "I" AND R-CPCLNI                                    
      *Client incomplet accept{                                                 
              MOVE ZEROES                  TO RQ00-ZRSTAT.                      
           IF RQEX-CPCLNI NOT = "I" AND R-CPCLNI                                
      *Client incomplet non accept{                                             
              MOVE 02                      TO RQ00-ZRSTAT.                      
           IF R-OK                                                              
              MOVE ZERO                    TO IK                                
              GO TO 100-ACCES-LFS-DC02-FIN.                                     
           IF R-FINBAL OR R-SPECIF                                              
              MOVE 1                       TO IK                                
              GO TO 100-ACCES-LFS-DC02-FIN.                                     
           MOVE ALL "&"                    TO ER00-ZTERMR                       
           STRING "LFS DC02 ZRSTAT "                                            
                  XE10-ZRSTAT                                                   
                  " "                                                           
                  XE10-ZRLERR                                                   
                  " CLES "                                                      
                  DC02-ZZCLES                                                   
                  DELIMITED BY "&"       INTO ER00-ZTERMR                       
           PERFORM P-722020              THRU P-722020-FIN                      
           PERFORM ERR-ABORT             THRU ERR-ABORT-FIN.                    
       100-ACCES-LFS-DC02-FIN.                                                  
           EXIT.                                                                
      *</fin_procedure>                                                         
