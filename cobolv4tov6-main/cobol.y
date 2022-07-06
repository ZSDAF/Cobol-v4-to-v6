%{
#include<stdio.h>
#include<stdlib.h>
#include <ctype.h>
#include <string.h>
int yyerror(char *msg);
int yylex();
extern FILE *yyin;
extern int yylineno;
int parse = 0;
int result;
extern int pos_char;
%}

%token TOK_MY 
%token TOK_ACCEPT
%token TOK_ACCESS
%token TOK_ADD
%token TOK_ADVANCING
%token TOK_AFTER
%token TOK_ALL
%token TOK_ALPHABET
%token TOK_ALPHABETIC
%token TOK_ALPHABETIC_LOWER
%token TOK_ALPHABETIC_UPPER
%token TOK_ALPHANUMERIC
%token TOK_ALPHANUMERIC_EDITED
%token TOK_ALSO
%token TOK_ALTER
%token TOK_ALTERNATE
%token TOK_AND
%token TOK_ANY
%token TOK_ARE
%token TOK_AREA
%token TOK_AREAS
%token TOK_ASCENDING
%token TOK_ASSIGN
%token TOK_ASTERISK
%token TOK_AT
%token TOK_AUTHOR
%token TOK_BACKGROUND_COLOR
%token TOK_BEFORE
%token TOK_BINARY
%token TOK_BLANK
%token TOK_BLINK
%token TOK_BLOCK
%token TOK_BOTTOM
%token TOK_BY
%token TOK_CALL
%token TOK_CANCEL
%token TOK_CD
%token TOK_CF
%token TOK_CH
%token TOK_CHARACTER
%token TOK_CHARACTERS
%token TOK_CLASS
%token TOK_CLOCK_UNITS
%token TOK_CLOSE
%token TOK_COBOL
%token TOK_CODE
%token TOK_CODE_SET
%token TOK_COLLATING
%token TOK_COLUMN
%token TOK_COMMA

%token TOK_COMMON
%token TOK_COMMUNICATION
%token TOK_COMP
%token TOK_COMPUTATIONAL
%token TOK_COMPUTATIONAL_2
%token TOK_COMPUTE
%token TOK_CONFIGURATION
%token TOK_CONSOLE
%token TOK_CONTAINS
%token TOK_CONTENT
%token TOK_CONTINUE
%token TOK_CONTROL
%token TOK_CONTROLS
%token TOK_COPY
%token TOK_CORR
%token TOK_CORRESPONDING
%token TOK_COUNT
%token TOK_CURRENCY
%token TOK_DATA
%token TOK_DATE
%token TOK_DATE_COMPILED
%token TOK_DATE_WRITTEN
%token TOK_DAY
%token TOK_DAY_OF_WEEK
%token TOK_DE
%token TOK_DEBUGGING
%token TOK_DEBUG_CONTENTS
%token TOK_DEBUG_ITEM
%token TOK_DEBUG_LINE
%token TOK_DEBUG_NAME
%token TOK_DEBUG_SUB_1
%token TOK_DEBUG_SUB_2
%token TOK_DEBUG_SUB_3
%token TOK_DECIMAL_POINT
%token TOK_DECLARATIVES
%token TOK_DELETE
%token TOK_DELIMITED
%token TOK_DELIMITER
%token TOK_DEPENDING
%token TOK_DEPTH
%token TOK_DESCENDING
%token TOK_DESTINATION
%token TOK_DETAIL
%token TOK_DISABLE
%token TOK_DISPLAY
%token TOK_DIVIDE
%token TOK_DIVISION
%token TOK_DOLLAR
%token TOK_DOWN
%token TOK_DUPLICATES
%token TOK_DYNAMIC
%token TOK_EGI
%token TOK_ELSE
%token TOK_ELSIF
%token TOK_EMI
%token TOK_ENABLE
%token TOK_END
%token TOK_END_ADD
%token TOK_END_CALL
%token TOK_END_COMPUTE
%token TOK_END_DELETE
%token TOK_END_DIVIDE
%token TOK_END_EVALUATE
%token TOK_END_IF
%token TOK_END_MULTIPLY
%token TOK_END_OF_PAGE
%token TOK_END_PERFORM
%token TOK_END_READ
%token TOK_END_RECEIVE
%token TOK_END_RETURN
%token TOK_END_REWRITE
%token TOK_END_SEARCH
%token TOK_END_START
%token TOK_END_STRING
%token TOK_END_SUBTRACT
%token TOK_END_UNSTRING
%token TOK_END_WRITE
%token TOK_ENTER
%token TOK_ENVIRONMENT
%token TOK_EOP
%token TOK_EQUAL

%token TOK_ERROR
%token TOK_ESI
%token TOK_EVALUATE
%token TOK_EVERY
%token TOK_EXCEPTION
%token TOK_EXIT
%token TOK_EXTEND
%token TOK_EXTERNAL
%token TOK_FALSE
%token TOK_FD
%token TOK_FILE
%token TOK_FILE_CONTROL
%token TOK_FILE_ID
%token TOK_FILLER
%token TOK_FINAL
%token TOK_FIRST
%token TOK_FLOAT
%token TOK_FOOTING
%token TOK_FOR
%token TOK_FOREGROUND_COLOR
%token TOK_FROM
%token TOK_GENERATE
%token TOK_GIVING
%token TOK_GLOBAL
%token TOK_GO
%token TOK_GREATER

%token TOK_GREATER_EQ
%token TOK_GROUP
%token TOK_HALF_STRING
%token TOK_HEADING
%token TOK_HIGHLIGHT
%token TOK_HIGH_VALUE
%token TOK_HYPHEN
%token TOK_IBM370
%token TOK_IDENTIFICATION
%token TOK_IDENTIFIER
%token TOK_IF
%token TOK_IN
%token TOK_INDEX
%token TOK_INDEXED
%token TOK_INDICATE
%token TOK_INITIAL
%token TOK_INITIALIZE
%token TOK_INITIATE
%token TOK_INPUT
%token TOK_INPUT_OUTPUT
%token TOK_INSPECT
%token TOK_INSTALLATION
%token TOK_INTEGER
%token TOK_INTO
%token TOK_INVALID
%token TOK_IS
%token TOK_I_O
%token TOK_I_O_CONTROL
%token TOK_JUST
%token TOK_JUSTIFIED
%token TOK_KEY
%token TOK_LABEL
%token TOK_LAST
%token TOK_LEADING
%token TOK_LEFT
%token TOK_LENGTH
%token TOK_LESS

%token TOK_LESS_EQ
%token TOK_LIMIT
%token TOK_LIMITS
%token TOK_LINAGE
%token TOK_LINAGE_COUNTER
%token TOK_LINE
%token TOK_LINES
%token TOK_LINE_COUNTER
%token TOK_LINKAGE
%token TOK_LOCK
%token TOK_LOW_VALUE
%token TOK_LPAREN
%token TOK_MEMORY
%token TOK_MERGE
%token TOK_MESSAGE
%token TOK_MINUS
%token TOK_MODE
%token TOK_MODULES
%token TOK_MOVE
%token TOK_MULTIPLE
%token TOK_MULTIPLY
%token TOK_NATIVE
%token TOK_NEGATIVE
%token TOK_NEXT
%token TOK_NO
%token TOK_NOT
%token TOK_NUMBER
%token TOK_NUMERIC
%token TOK_NUMERIC_EDITED
%token TOK_OBJECT_COMPUTER
%token TOK_OCCURS
%token TOK_OF
%token TOK_OFF
%token TOK_OMITTED
%token TOK_ON
%token TOK_OPEN
%token TOK_OPTIONAL
%token TOK_OR
%token TOK_ORDER
%token TOK_ORGANIZATION
%token TOK_OTHER
%token TOK_OUTPUT
%token TOK_OVERFLOW
%token TOK_PACKED_DECIMAL
%token TOK_PADDING
%token TOK_PAGE
%token TOK_PAGE_COUNTER
%token TOK_PERFORM
%token TOK_PERIOD
%token TOK_PF
%token TOK_PH
%token TOK_PIC
%token TOK_PICTURE
%token TOK_PIC_TEXT
%token TOK_PLUS
%token TOK_POINTER
%token TOK_POSITION
%token TOK_POSITIVE
%token TOK_PRINTING
%token TOK_PROCEDURE
%token TOK_PROCEDURES
%token TOK_PROCEED
%token TOK_PROGRAM
%token TOK_PROGRAM_ID
%token TOK_PURGE
%token TOK_QUEUE
%token TOK_QUOTE
%token TOK_RANDOM
%token TOK_RD
%token TOK_READ
%token TOK_RECEIVE
%token TOK_RECORD
%token TOK_RECORDS
%token TOK_REDEFINES
%token TOK_REEL
%token TOK_REFERENCE
%token TOK_REFERENCES
%token TOK_RELATIVE
%token TOK_RELEASE
%token TOK_REMAINDER
%token TOK_REMOVAL
%token TOK_RENAMES
%token TOK_REPLACE
%token TOK_REPLACING
%token TOK_REPORT
%token TOK_REPORTING
%token TOK_REPORTS
%token TOK_RERUN
%token TOK_RESERVE
%token TOK_RESET
%token TOK_RETURN
%token TOK_REVERSED
%token TOK_REVERSE_VIDEO
%token TOK_REWIND
%token TOK_REWRITE
%token TOK_RF
%token TOK_RH
%token TOK_RIGHT
%token TOK_ROUNDED
%token TOK_RPAREN

%token TOK_RUN
%token TOK_SAME
%token TOK_SCREEN
%token TOK_SD
%token TOK_SEARCH
%token TOK_SECTION
%token TOK_SECURITY
%token TOK_SEGMENT
%token TOK_SEGMENT_LIMIT
%token TOK_SELECT
%token TOK_SEMICOLON
%token TOK_SEND
%token TOK_SENTENCE
%token TOK_SEPARATE
%token TOK_SEQUENCE
%token TOK_SEQUENTIAL
%token TOK_SET
%token TOK_SIGN
%token TOK_SIZE
%token TOK_SLASH
%token TOK_SORT
%token TOK_SORT_MERGE
%token TOK_SOURCE
%token TOK_SOURCE_COMPUTER
%token TOK_SPACE
%token TOK_SPACES
%token TOK_SPECIAL_NAMES
%token TOK_STANDARD
%token TOK_STANDARD_1
%token TOK_STANDARD_2
%token TOK_START
%token TOK_STATUS
%token TOK_STOP
%token TOK_STRING

%token TOK_SUBTRACT
%token TOK_SUB_QUEUE_1
%token TOK_SUB_QUEUE_2
%token TOK_SUB_QUEUE_3
%token TOK_SUM
%token TOK_SUPRESS
%token TOK_SYMBOLIC
%token TOK_SYNC
%token TOK_TABLE
%token TOK_TALLYING
%token TOK_TAPE
%token TOK_TERMINAL
%token TOK_TERMINATE
%token TOK_TEST
%token TOK_TEXT
%token TOK_THAN
%token TOK_THEN
%token TOK_THROUGH
%token TOK_THRU
%token TOK_TIME
%token TOK_TIMES
%token TOK_TO
%token TOK_TOP
%token TOK_TRAILING
%token TOK_TRUE
%token TOK_TYPE
%token TOK_UNDERLINE
%token TOK_UNIT
%token TOK_UNSTRING
%token TOK_UNTIL
%token TOK_UP
%token TOK_UPON
%token TOK_USAGE
%token TOK_USE
%token TOK_USING
%token TOK_VALUE
%token TOK_VALUES
%token TOK_VARYING
%token TOK_WHEN
%token TOK_WHILE
%token TOK_WITH
%token TOK_WORDS
%token TOK_WORKING_STORAGE
%token TOK_WRITE
%token TOK_ZERO

%token HEADER NL
%%
pgm: program  {printf(" THE PROGRAM IS VALID \n");exit(0);}
program
	: identification_division 
	  environment_division
	 
	  data_division 
	  procedure_division 
	  ;

identification_division
	: TOK_IDENTIFICATION TOK_DIVISION TOK_PERIOD program_info_list
	;
program_info_list
	: program_info_clause program_info_list
	| /* lambda */
	;
	program_info_clause
	: TOK_AUTHOR TOK_PERIOD word_list TOK_PERIOD
    | TOK_INSTALLATION TOK_PERIOD word_list TOK_PERIOD
    | TOK_DATE_WRITTEN TOK_PERIOD word_list TOK_PERIOD
    | TOK_DATE_COMPILED TOK_PERIOD word_list TOK_PERIOD
    | TOK_SECURITY TOK_PERIOD word_list TOK_PERIOD
	| TOK_PROGRAM_ID TOK_PERIOD word_list prg_name_option TOK_PERIOD
	;
	
	
	word_list
	: TOK_IDENTIFIER word_list_pl
	| TOK_INTEGER word_list_pl
	| TOK_FLOAT word_list_pl
	| TOK_STRING word_list_pl
	| TOK_SLASH word_list_pl
	;
	
word_list_pl
	: word_list
	| /* lambda */
	;
prg_name_option
	: optional_is common_initial optional_program
    | /* lambda */
    ;
optional_is
	: TOK_IS
	| TOK_ARE
	| /* lambda */
	;

common_initial
	: TOK_COMMON
	| TOK_INITIAL
	;
optional_program
	: TOK_PROGRAM
	| /* lambda */
	;

	
	
	/* ###############################################
	this is the end of identification_division 
################################################### 	*/
	
	
environment_division
	: TOK_ENVIRONMENT TOK_DIVISION TOK_PERIOD 
	;
	
	
	/*###############################################
	this is the end of environment_division 
###################################################	*/
	

/* JPC : add configuration_section */

configuration_section
	: TOK_CONFIGURATION TOK_SECTION TOK_PERIOD configuration_list
	;
	
	configuration_list
	: TOK_SOURCE_COMPUTER TOK_PERIOD TOK_IBM370 TOK_PERIOD
	  TOK_OBJECT_COMPUTER TOK_PERIOD TOK_IBM370 TOK_PERIOD
	;
	
	/*###############################################
	this is the end of configuration_section
###################################################	*/
	
special_names 
	: TOK_SPECIAL_NAMES TOK_PERIOD special_names_option
	;

	special_names_option
	: TOK_IDENTIFIER TOK_IS TOK_IDENTIFIER special_names_option
	| TOK_DECIMAL_POINT TOK_IS TOK_COMMA TOK_PERIOD
	;


	/*###############################################
	this is the end of special_names
###################################################	*/
	
data_division
	: TOK_DATA TOK_DIVISION TOK_PERIOD data_section_list
	;
	
	
	data_section_list
	: data_section_entry data_section_list
	| 
	;
	
	data_section_entry
	:  working_storage_section
    | linkage_section
    | communication_section
    | report_section
	| screen_section
	| file_section
	;
	
	
file_section
	: TOK_FILE TOK_SECTION TOK_PERIOD 
	;
	
working_storage_section
	: TOK_WORKING_STORAGE TOK_SECTION TOK_PERIOD
	|TOK_WORKING_STORAGE TOK_SECTION TOK_PERIOD record_entry_block
	| copy
	;

	
record_entry_block
    :record_level record_entry_block_pl
/* 
	JPC : remove possibility to unset value !

	|TOK_INTEGER TOK_IDENTIFIER TOK_PICTURE TOK_INTEGER TOK_PERIOD
*/
	|copy record_entry_block_pl
	|
	;

copy
	: TOK_COPY TOK_STRING TOK_PERIOD
	;

record_entry_block_pl
	: record_entry_block
	;

record_level
    :TOK_INTEGER TOK_IDENTIFIER TOK_PICTURE TOK_INTEGER TOK_VALUE inc TOK_PERIOD
/*
	|TOK_INTEGER TOK_IDENTIFIER TOK_PICTURE TOK_INTEGER TOK_PERIOD
*/
	/*ADD  picture 9(5)*/
	|TOK_INTEGER TOK_IDENTIFIER TOK_PICTURE TOK_INTEGER TOK_LPAREN TOK_INTEGER TOK_RPAREN TOK_PERIOD

	/*PEUT MIEUX FAIRE CAR REPETITION AVEC RULES AU DESSUS*/
	|TOK_INTEGER level_name TOK_PICTURE TOK_INTEGER TOK_LPAREN TOK_INTEGER TOK_RPAREN TOK_PERIOD

	/*CONDITION FINIE DANS LE RECORD_NEW_OR_REDEF*/
	|TOK_INTEGER TOK_IDENTIFIER TOK_PICTURE TOK_INTEGER TOK_LPAREN TOK_INTEGER TOK_RPAREN record_new_or_redef

	|TOK_INTEGER TOK_IDENTIFIER picture TOK_PERIOD 
	|TOK_INTEGER identifier TOK_PERIOD
	|TOK_INTEGER identifier TOK_PICTURE TOK_STRING TOK_COMP TOK_VALUE TOK_INTEGER TOK_PERIOD
	|TOK_INTEGER identifier record_new_or_redef TOK_PERIOD
	|TOK_INTEGER 

	|TOK_INTEGER identifier optional_is TOK_EXTERNAL picture TOK_PERIOD
	;
inc:
	TOK_INTEGER
	|TOK_STRING
	;

	/*ne veut pas fonctionner*/
integer
	: TOK_INTEGER
	;

level_name
	: identifier
	| TOK_FILLER	
	;

identifier
	: TOK_IDENTIFIER
	;
	
	
record_new_or_redef
	: array_options picture TOK_COMP TOK_INTEGER value_entry reclev_option_list

	/*ADD COMPUTATIONAL.*/
	| pict_usage_args TOK_PERIOD
	/*ADD COMPU-X.*/
	| pict_usage_args TOK_INTEGER TOK_PERIOD

	/*ADD REDEFINES WW00 PICTURE 9(10)*/
	| TOK_REDEFINES identifier picture  

	|array_options picture TOK_COMP  value_entry

	/*ADD REDEFINES      ZW00*/
	| TOK_REDEFINES identifier

	/*VALUE             
           " Exemple @ Reproduire ==> NE PAS ECRASER CETTE FAUSSE ANO           
      -    " elle n'est pas prise en compte lors de l'affichage       "         
             .*/
	| TOK_VALUE value TOK_PERIOD

	| array_options
	;
	
array_options
	: TOK_OCCURS integer optional_times TOK_INDEXED optional_by identifier
	/*05                EREU                  OCCURS 01.  */
	| TOK_OCCURS TOK_INTEGER  
	| 
	;



reclev_option_list
	: record_level_option
	| /* lambda */
	;
	
record_level_option
	: usage_option 
	| sign_option 
	| sync_option 
	| justified_option 
	;
	
usage_option
	: TOK_USAGE optional_is pict_usage_args
    ;
    
sign_option
	: optional_sign optional_is sign_args sep_char_option
    ;
    
sign_args
	: TOK_LEADING
    | TOK_TRAILING
	;
	
sep_char_option
	: TOK_SEPARATE optional_character
    | /* lambda */
    ;

justified_option
	: justified_just optional_right
	;

justified_just
	: TOK_JUSTIFIED
	| TOK_JUST
	;

sync_option
	: TOK_SYNC left_right_option 
	;

left_right_option
	: TOK_LEFT
	| TOK_RIGHT
	| /* lambda */
	;
	
picture
	: TOK_PICTURE optional_is value
	| TOK_PICTURE value
	| picture optional_lparen value optional_rparen
	| picture array_options 
	| /* lambda */
	;

pict_usage_args
	: TOK_BINARY
    | TOK_COMPUTATIONAL
	| TOK_COMPUTATIONAL_2
    | TOK_COMP
    | TOK_DISPLAY
    | TOK_INDEX
    | TOK_PACKED_DECIMAL
    ;

value_entry
	: TOK_VALUE optional_is value
	| /* lambda */
	;
	
value
	: integer
	| float
	| string
	| identifier
	;
	

string
	: TOK_STRING
	| TOK_HALF_STRING TOK_HYPHEN TOK_STRING
	;
	
float
	:TOK_FLOAT
	
	
optional_times
	: TOK_TIMES
	| /* lambda */
    ;	
optional_by
	: TOK_BY
    | /* lambda */
	;
optional_character
	: TOK_CHARACTER
	| /* lambda */
    ;
	
optional_right
	: TOK_RIGHT
	| /* lambda */
	;	
optional_sign
	: TOK_SIGN
	| /* lambda */
	;
	
linkage_section
	: TOK_LINKAGE TOK_SECTION TOK_PERIOD 
	;

communication_section
	: TOK_COMMUNICATION TOK_SECTION TOK_PERIOD
    ;

report_section
	: TOK_REPORT TOK_SECTION TOK_PERIOD
    ;

screen_section
	: TOK_SCREEN TOK_SECTION TOK_PERIOD	
	;

	/*###############################################
	this is the end of data_division 
###################################################	*/
	
procedure_division
	: TOK_PROCEDURE TOK_DIVISION  TOK_PERIOD statement_list
	;
statement_list
	: statement statement_list
	| /* lambda */
	;
	
statement
	:TOK_DISPLAY TOK_STRING TOK_COMMA TOK_IDENTIFIER TOK_PERIOD
	|word_list prg_name_option TOK_PERIOD TOK_DISPLAY TOK_STRING  TOK_PERIOD
	|TOK_DISPLAY TOK_STRING  TOK_PERIOD
	|TOK_MOVE TOK_INTEGER TOK_TO TOK_IDENTIFIER TOK_PERIOD
    |clause TOK_PERIOD
	| if_clause TOK_PERIOD
	
	| TOK_PROCEDURE identifier TOK_PERIOD
	| TOK_INITIALIZE initialize_args TOK_PERIOD
    | TOK_REPLACE TOK_OFF TOK_PERIOD
	| TOK_READ identifier optional_word_record optional_at_end_clause
	  TOK_PERIOD
	| identifier id_statement 
	|TOK_STOP TOK_RUN TOK_PERIOD
	;

	id_statement
	: TOK_PERIOD
	| TOK_SECTION TOK_PERIOD
	;
boolean_list
	: boolean boolean_list_pl
	;

boolean_list_pl
	: logic_connector  boolean_list
	| /* lambda */
	;

boolean
	: optional_lparen expression optional_is boolean2 optional_rparen
    ;

boolean2
	: TOK_ALPHABETIC
    | TOK_ALPHABETIC_UPPER
    | TOK_ALPHABETIC_LOWER
    | relational expression
	| /* lambda */
    ;
	
not_boolean_list
	: not_boolean not_boolean_list_pl
	;

not_boolean_list_pl
	: logic_connector not_boolean_list
	| /* lambda */
	;

not_boolean
	: optional_lparen expression optional_is not_boolean2 optional_rparen
    ;

not_boolean2
	: reverse_relational expression
	| /* lambda */
    ;
                    
logic_connector
	: TOK_AND
	| TOK_OR
	;

relational
	: TOK_GREATER optional_than
	| TOK_LESS optional_than	
	| TOK_EQUAL optional_to
	| TOK_GREATER_EQ
    | TOK_LESS_EQ 
	| TOK_NOT reverse_relational
	;

reverse_relational
	: TOK_GREATER optional_than
	| TOK_LESS optional_than
	| TOK_EQUAL optional_to
    | TOK_GREATER_EQ 
    | TOK_LESS_EQ 
	;

clause
	:identifier
	|TOK_ACCEPT accept_args accept_option 
	| TOK_DISPLAY display_args upon_option
	| TOK_MOVE expression TOK_TO id_list
	| TOK_ADD expression TOK_TO id_list giving_option
	| TOK_SUBTRACT expression TOK_FROM id_list giving_option
	| TOK_MULTIPLY id_list TOK_BY expression giving_option
	| TOK_COMPUTE identifier round_option TOK_EQUAL compute_expr_list
	| TOK_GO TOK_TO identifier
	| TOK_PERFORM identifier perform_options end_perform
	
	| TOK_PERFORM identifier TOK_UNTIL TOK_COUNT relational inc 
	
	| TOK_OPEN open_list
	| TOK_CLOSE id_list close_options
	| TOK_WRITE identifier write_from_clause write_options
	| TOK_REWRITE identifier write_from_clause
    | TOK_CALL call_list using_options 
	| TOK_STOP TOK_RUN
    | TOK_EXIT TOK_PROGRAM
	| TOK_DIVIDE id_list divide_action_word expression giving_option 
	  round_option size_error_option
	;
	
if_clause
	: TOK_IF boolean_list if_args
	;
	
	
if_args
	: optional_then compound_clause if_args_end
	;
	
if_args_end
	: TOK_ELSE optional_then compound_clause
	| TOK_ELSIF elsif_clause if_args_end
	| /* lambda */
	;
	
elsif_clause
	: boolean_list optional_then compound_clause
	;

		
	
	
/*###############################################
	this is the end of procedure_division 
###################################################	*/

optional_at_end_clause
	: TOK_AT TOK_END compound_clause
	| /* lambda */
	;

compound_clause
	: clause_list
	;
	
clause_list
	: clause clause_list_pl
	| if_clause TOK_END_IF clause_list_pl
	| if_clause
	;
	
clause_list_pl
	: clause_list
	| /* lambda */
	;

expression
	: identifier
	| integer
	| float
	| string
	;

accept_args
	: optional_at id_list
	;

accept_option
	: TOK_FROM from_arg
    | /* lambda */
    ;

from_arg
	: TOK_DATE ; 
	| TOK_DAY 
	| TOK_DAY_OF_WEEK
	| TOK_TIME 
	| TOK_CONSOLE 
	;

display_args
	: optional_at optional_all display_args_marked
	;
	
optional_at
	: TOK_LPAREN integer TOK_COMMA integer TOK_RPAREN
	| /* lambda */
	;
	
display_args_marked
	: display_arg display_args_pl
	;
	
display_args_pl
	: optional_comma	display_args_marked
	| /* lambda */
	;
	
display_arg
	: identifier
	| string
	| integer
	| float
    | TOK_QUOTE
	;

upon_option
	: TOK_UPON identifier
	| /* lambda */
	;

giving_option
	: TOK_GIVING identifier
	| /* lambda */
	;

round_option
	: TOK_ROUNDED
	| /* lambda */
	;

size_error_option
	: TOK_ON TOK_SIZE TOK_ERROR compound_clause TOK_PERIOD
	| /* lambda */
	;

perform_options
	: thru_option times_option varying_option
	;
	
thru_option
	: TOK_THRU identifier
	| /* lambda */
	;
	
end_perform
	: TOK_UNTIL not_boolean_list
	| /* lambda */
	;
	
times_option
	: integer TOK_TIMES
	|/* lambda */
	;
	
varying_option
	: TOK_VARYING loop_condition after_list
	| /* lambda */
	;
	
after_list
	: TOK_AFTER loop_condition after_list
	| /* lambda */
	;
	
loop_condition
	: identifier TOK_FROM loop_iterator loop_condition_part2
	;
	
loop_condition_part2
	: TOK_TO loop_iterator by_option
	| by_option loop_condition_part3
	;
	
loop_condition_part3
	: TOK_WHILE boolean_list
	| TOK_UNTIL not_boolean_list
	;
	
by_option
	: TOK_BY loop_iterator
	|  /* lambda */
	;
loop_iterator
	: identifier
	| integer
	;

compute_expr_list
	: compute_expr compute_expr_list_pl
	| compute_term
	;
compute_expr_list_pl
	: compute_expr_list
	| /* lambda */
	;
	
compute_expr
	: compute_term compute_operator
	| compute_operator
	;
	
compute_term
	: identifier
	| integer
	| float
	;
	
compute_operator
	: TOK_PLUS
	| TOK_MINUS
	| TOK_ASTERISK
	| TOK_SLASH
	| TOK_LPAREN
	| TOK_RPAREN
	;

open_list
	: open_entry open_list_pl
	;
	
open_list_pl
	: open_list
	| /* lambda */
	;
	
open_entry
	: TOK_INPUT id_list open_options 
	| TOK_OUTPUT id_list open_options
	| TOK_EXTEND id_list open_options
	| TOK_I_O id_list open_options 
	;

open_options
	: TOK_REVERSED
	| TOK_WITH TOK_NO TOK_REWIND
	| /* lambda */
	;

close_options
	: TOK_UNIT close_method
	| TOK_REEL close_method
	| TOK_WITH TOK_LOCK
	| /* lambda */
	;

close_method
	: TOK_FOR TOK_REMOVAL
	| TOK_WITH TOK_NO TOK_REWIND
	;

write_from_clause
	: TOK_FROM identifier
	| /* lambda */
	;
	
write_options
	: TOK_AFTER TOK_ADVANCING loop_iterator TOK_LINES
	| /* lambda */
	;

call_list
	: string
    | identifier
    ;

using_options
	: TOK_USING using_id_list
    | /* lambda */ 
    ;
    
using_id_list
	: identifier using_id_list_pl
	| TOK_BY TOK_REFERENCE using_id_list
    | TOK_BY TOK_CONTENT using_id_list
	;
	
using_id_list_pl
	: TOK_COMMA using_id_list
	| using_id_list
    | /* lambda */
    ;

initialize_args
	: using_id_list replace_option
	;

replace_option
	: TOK_REPLACING replace_next
	| /* lambda */
	;

replace_next
	: replace_what optional_data TOK_BY value replace_next_pl
 	;

replace_next_pl
	: optional_comma replace_next	
    | /* lambda */
	;

replace_what
	: TOK_ALPHABETIC
	| TOK_ALPHANUMERIC
	| TOK_NUMERIC
	| TOK_ALPHANUMERIC_EDITED
	| TOK_NUMERIC_EDITED
	;

id_list
	: id_list_marked
	;
	
id_list_marked
	: identifier id_list_pl
	;
	
id_list_pl
	: optional_comma id_list_marked
	| /* lambda */
	;

divide_action_word
	: TOK_BY
	| TOK_INTO
	;

optional_comma
	: TOK_COMMA
	| /* lambda */
	;
	
optional_word_record
	: TOK_RECORD
	| /* lambda */
	;
	
optional_to
	: TOK_TO
    | /* lambda */
    ;
    
optional_all
	: TOK_ALL
    | /* lambda */
    ;
    
optional_than
	: TOK_THAN
	|/* lambda */
    ;
    
optional_then
	: TOK_THEN
    | /* lambda */
    ;

optional_data
	: TOK_DATA
	| /* lambda */
	;
	
optional_lparen
	: TOK_LPAREN
	| /* lambda */
	;
	
optional_rparen
	: TOK_RPAREN
	| /* lambda */
	;
		
	%%
void main()
{
printf("IBM Cobol v4 to v6 preprocessor\n");

FILE* file = fopen("test.cbl", "r");
if (file == NULL){
	printf("Error file");
	return;
}

char str[300] = "";
FILE* new = fopen("inputV6.cbl", "w");
if(new == NULL){
	return;
}

while(fgets(str, 300, file) != NULL){
		
		for(int i = 0; str[i]; i++){
			if(str[i] == 'X' && str[i-1] == ' ' ){
				continue;
			}
			else if (str[i] == 'S' && str[i+1] == '9'){
				continue;
			}

			
			str[i] = tolower(str[i]);
		}
		fputs(str, new);
	}
fclose(new);
fclose(file);
yyin = fopen("input_ori.cbl", "r");
yyparse();
}

int yyerror(char *msg)
{
int m=yylineno;
printf("\nError found at line number \033[1;31m%d\033[m : \033[1;31m%s\033[m in character \033[1;31m%d \033[m\n\n", m, msg, pos_char);
return 0;
}
int yywrap()
{
return 1;
}