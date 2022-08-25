
%{
#include<stdio.h>
#include "cobol.tab.h"
 int pos_char = 0;

%}
pre #.*
%x comment
%%
[\+\-]?[0-9]+ {return(TOK_INTEGER);}

[\+\-]?[0-9]+\.[0-9]+ {return(TOK_FLOAT);}

\"[a-zA-Z0-9\t \-\{\}\[\]\+\-_\*|\\\/().,\:\';=><\!\$\@\#\%]*\"	{return(TOK_STRING);}

\"[a-zA-Z0-9\t \-\{\}\[\]\+\-_\*|\\\/().,\:\';=><\!\$\@\#\%]*	{return(TOK_HALF_STRING);}

==[a-zA-Z0-9\tfzer\-\{\}\[\]\+\-_\*|\\\/().,\:\';=><\!\$\@\#\%]*== {return(TOK_PREF);}

\'[a-zA-Z0-9\t \-\{\}\[\]\+\-_\*|\\\/().,\:\";=><\!\$\@\#\%]*\'	{return(TOK_STRING);}

"accept"		{ pos_char += yyleng; return (TOK_ACCEPT);	}
"access"			{ pos_char += yyleng; return (TOK_ACCESS);	}
"add"			    { pos_char += yyleng; return (TOK_ADD);	}
"advancing"		{ pos_char += yyleng; return (TOK_ADVANCING);	}
"after"			{ pos_char += yyleng; return (TOK_AFTER);	}
"all"			    { pos_char += yyleng; return (TOK_ALL);	}
"alphabet"		{ pos_char += yyleng; return (TOK_ALPHABET);	}
"alphabetic"		{ pos_char += yyleng; return (TOK_ALPHABETIC);	}
"alphabetic-lower"        { pos_char += yyleng; return (TOK_ALPHABETIC_LOWER); }
"alphabetic-upper"        { pos_char += yyleng; return (TOK_ALPHABETIC_UPPER); }
"alphanumeric"		{ pos_char += yyleng; return (TOK_ALPHANUMERIC);	}
"alphanumeric-edited"	{ pos_char += yyleng; return (TOK_ALPHANUMERIC_EDITED);	}
"also"			{ pos_char += yyleng; return (TOK_ALSO);	}
"alter"			{ pos_char += yyleng; return (TOK_ALTER);	}
"alternate"		{ pos_char += yyleng; return (TOK_ALTERNATE);	}
"and"			{ pos_char += yyleng; return (TOK_AND);	}
"any"			{ pos_char += yyleng; return (TOK_ANY);	}
"are"			{ pos_char += yyleng; return (TOK_ARE);	}
"area"			{ pos_char += yyleng; return (TOK_AREA);	}
"areas"			{ pos_char += yyleng; return (TOK_AREAS);	}
"ascending"		{ pos_char += yyleng; return (TOK_ASCENDING);	}
"assign"			{ pos_char += yyleng; return (TOK_ASSIGN);	}
"at"			{ pos_char += yyleng; return (TOK_AT);	}
"author"			{ pos_char += yyleng; return (TOK_AUTHOR);	}
"background-color"	{ pos_char += yyleng; return (TOK_BACKGROUND_COLOR);}
"before"			{ pos_char += yyleng; return (TOK_BEFORE);	}
"binary"			{ pos_char += yyleng; return (TOK_BINARY);  }
"blank"			{ pos_char += yyleng; return (TOK_BLANK);	}
"blink"			{ pos_char += yyleng; return (TOK_BLINK);	}
"block"			{ pos_char += yyleng; return (TOK_BLOCK);	}
"bottom"			{ pos_char += yyleng; return (TOK_BOTTOM);	}
"by"			{ pos_char += yyleng; return (TOK_BY);	}
"call"			{ pos_char += yyleng; return (TOK_CALL);	}
"cancel"			{ pos_char += yyleng; return (TOK_CANCEL);	}
"cd"			{ pos_char += yyleng; return (TOK_CD);	}
"cf"			{ pos_char += yyleng; return (TOK_CF);	}
"ch"			{ pos_char += yyleng; return (TOK_CH);	}
"character"		{ pos_char += yyleng; return (TOK_CHARACTER);	}
"characters"		{ pos_char += yyleng; return (TOK_CHARACTERS);	}
"class"			{ pos_char += yyleng; return (TOK_CLASS);		}
"clock-units"		{ pos_char += yyleng; return (TOK_CLOCK_UNITS);	}
"close"			{ pos_char += yyleng; return (TOK_CLOSE);	}
"cobol"			{ pos_char += yyleng; return (TOK_COBOL);	}
"code"			{ pos_char += yyleng; return (TOK_CODE);	}
"code-set"		{ pos_char += yyleng; return (TOK_CODE_SET);	}
"collating"		{ pos_char += yyleng; return (TOK_COLLATING);	}
"column"			{ pos_char += yyleng; return (TOK_COLUMN);	}
"comma"			{ pos_char += yyleng; return (TOK_COMMA);	}
"common"			{ pos_char += yyleng; return (TOK_COMMON);	}
"communication"		{ pos_char += yyleng; return (TOK_COMMUNICATION);	}
"comp"			{ pos_char += yyleng; return (TOK_COMP);	}
"comp\-"			{ pos_char += yyleng; return (TOK_COMP_2);	}
"computational"		{ pos_char += yyleng; return (TOK_COMPUTATIONAL);	}
"computational\-"		{ pos_char += yyleng; return (TOK_COMPUTATIONAL_2);	} /*ADD FOR COMPUTATIONAL-X*/
"compute"			{ pos_char += yyleng; return (TOK_COMPUTE);	}
"configuration"		{ pos_char += yyleng; return (TOK_CONFIGURATION);	}
"console"			{ pos_char += yyleng; return (TOK_CONSOLE);	}
"contains"		{ pos_char += yyleng; return (TOK_CONTAINS);	}
"content"                 { pos_char += yyleng; return (TOK_CONTENT);         }
"continue"		{ pos_char += yyleng; return (TOK_CONTINUE);	}
"control"			{ pos_char += yyleng; return (TOK_CONTROL);	}
"controls"		{ pos_char += yyleng; return (TOK_CONTROLS);	}
"copy"          { pos_char += yyleng; return (TOK_COPY);	}
"corr"			{ pos_char += yyleng; return (TOK_CORR);	}
"corresponding"		{ pos_char += yyleng; return (TOK_CORRESPONDING);	}
"count"			{ pos_char += yyleng; return (TOK_COUNT);	}
"currency"		{ pos_char += yyleng; return (TOK_CURRENCY);	}
"data"			{ pos_char += yyleng; return (TOK_DATA);	}
"date"			{ pos_char += yyleng; return (TOK_DATE);	}
"date-compiled"		{ pos_char += yyleng; return (TOK_DATE_COMPILED);	}
"date-written"		{ pos_char += yyleng; return (TOK_DATE_WRITTEN);	}
"day"			{ pos_char += yyleng; return (TOK_DAY);	}
"day-of-week"		{ pos_char += yyleng; return (TOK_DAY_OF_WEEK);	}
"de"			{ pos_char += yyleng; return (TOK_DE);	}
"debug-contents"		{ pos_char += yyleng; return (TOK_DEBUG_CONTENTS);	}
"debug-item"		{ pos_char += yyleng; return (TOK_DEBUG_ITEM);	}
"debug-line"		{ pos_char += yyleng; return (TOK_DEBUG_LINE);	}
"debug-name"		{ pos_char += yyleng; return (TOK_DEBUG_NAME);	}
"debug-sub-1"		{ pos_char += yyleng; return (TOK_DEBUG_SUB_1);	}
"debug-sub-2"		{ pos_char += yyleng; return (TOK_DEBUG_SUB_2);	}
"debug-sub-3"		{ pos_char += yyleng; return (TOK_DEBUG_SUB_3);	}
"debugging"		{ pos_char += yyleng; return (TOK_DEBUGGING);	}
"decimal-point"		{ pos_char += yyleng; return (TOK_DECIMAL_POINT);	}
"declaratives"		{ pos_char += yyleng; return (TOK_DECLARATIVES);	}
"delete"			{ pos_char += yyleng; return (TOK_DELETE);	}
"delimited"		{ pos_char += yyleng; return (TOK_DELIMITED);	}
"delimiter"		{ pos_char += yyleng; return (TOK_DELIMITER);	}
"depending"		{ pos_char += yyleng; return (TOK_DEPENDING);	}
"depth"			{ pos_char += yyleng; return (TOK_DEPTH);	}
"descending"		{ pos_char += yyleng; return (TOK_DESCENDING);	}
"destination"		{ pos_char += yyleng; return (TOK_DESTINATION);	}
"detail"			{ pos_char += yyleng; return (TOK_DETAIL);	}
"disable"			{ pos_char += yyleng; return (TOK_DISABLE);	}
"display"			{ pos_char += yyleng; return (TOK_DISPLAY);	}
"divide"			{ pos_char += yyleng; return (TOK_DIVIDE);	}
"division"		{ pos_char += yyleng; return (TOK_DIVISION);	}
"down"			{ pos_char += yyleng; return (TOK_DOWN);	}
"duplicates"		{ pos_char += yyleng; return (TOK_DUPLICATES);	}
"dynamic"			{ pos_char += yyleng; return (TOK_DYNAMIC);	}
"egi"			{ pos_char += yyleng; return (TOK_EGI);	}
"elsif"			{ pos_char += yyleng; return (TOK_ELSIF);	}
"else"			{ pos_char += yyleng; return (TOK_ELSE);	}
"emi"			{ pos_char += yyleng; return (TOK_EMI);	}
"enable"			{ pos_char += yyleng; return (TOK_ENABLE);	}
"end"			{ pos_char += yyleng; return (TOK_END);	}
"end-add"			{ pos_char += yyleng; return (TOK_END_ADD);	}
"end-call"		{ pos_char += yyleng; return (TOK_END_CALL); 	}
"end-compute"		{ pos_char += yyleng; return (TOK_END_COMPUTE);	}
"end-delete"		{ pos_char += yyleng; return (TOK_END_DELETE);	}
"end-divide"		{ pos_char += yyleng; return (TOK_END_DIVIDE);	}
"end-evaluate"		{ pos_char += yyleng; return (TOK_END_EVALUATE);	}
"end-if"			{ pos_char += yyleng; return (TOK_END_IF);		}
"end-multiply"		{ pos_char += yyleng; return (TOK_END_MULTIPLY);	}
"end-of-page"		{ pos_char += yyleng; return (TOK_END_OF_PAGE);	}
"end-perform"		{ pos_char += yyleng; return (TOK_END_PERFORM);	}
"end-read"		{ pos_char += yyleng; return (TOK_END_READ);	}
"end-receive"		{ pos_char += yyleng; return (TOK_END_RECEIVE);	}
"end-return"		{ pos_char += yyleng; return (TOK_END_RETURN);	}
"end-rewrite"		{ pos_char += yyleng; return (TOK_END_REWRITE);	}
"end-search"		{ pos_char += yyleng; return (TOK_END_SEARCH);	}
"end-start"		{ pos_char += yyleng; return (TOK_END_START);	}
"end-string"		{ pos_char += yyleng; return (TOK_END_STRING);	}
"end-subtract"		{ pos_char += yyleng; return (TOK_END_SUBTRACT);	}
"end-unstring"		{ pos_char += yyleng; return (TOK_END_UNSTRING);	}
"end-write"		{ pos_char += yyleng; return (TOK_END_WRITE);	}
"enter"			{ pos_char += yyleng; return (TOK_ENTER);	}
"environment"		{ pos_char += yyleng; return (TOK_ENVIRONMENT);	}
"eop"			{ pos_char += yyleng; return (TOK_EOP);	}
"equal"			{ pos_char += yyleng; return (TOK_EQUAL);	}
"error"			{ pos_char += yyleng; return (TOK_ERROR);	}
"esi"			{ pos_char += yyleng; return (TOK_ESI);	}
"evaluate"		{ pos_char += yyleng; return (TOK_EVALUATE);	}
"every"			{ pos_char += yyleng; return (TOK_EVERY);	}
"exception"		{ pos_char += yyleng; return (TOK_EXCEPTION);	}
"exit"			{ pos_char += yyleng; return (TOK_EXIT);	}
"extend"			{ pos_char += yyleng; return (TOK_EXTEND);	}
"external"		{ pos_char += yyleng; return (TOK_EXTERNAL);	}
"false"			{ pos_char += yyleng; return (TOK_FALSE);	}
"fd"			{ pos_char += yyleng; return (TOK_FD);	}
"file"			{ pos_char += yyleng; return (TOK_FILE);	}
"file-control"		{ pos_char += yyleng; return (TOK_FILE_CONTROL);	}
"file-id"			{ pos_char += yyleng; return (TOK_FILE_ID);	}
"filler"			{ pos_char += yyleng; return (TOK_FILLER);	}
"final"			{ pos_char += yyleng; return (TOK_FINAL);	}
"first"			{ pos_char += yyleng; return (TOK_FIRST);	}
"footing"			{ pos_char += yyleng; return (TOK_FOOTING);	}
"for"			{ pos_char += yyleng; return (TOK_FOR);	}
"foreground-color"	{ pos_char += yyleng; return (TOK_FOREGROUND_COLOR);}
"from"			{ pos_char += yyleng; return (TOK_FROM);	}
"generate"		{ pos_char += yyleng; return (TOK_GENERATE);	}
"giving"			{ pos_char += yyleng; return (TOK_GIVING);	}
"global"			{ pos_char += yyleng; return (TOK_GLOBAL);	}
"go"			{ pos_char += yyleng; return (TOK_GO);	}
"greater"			{ pos_char += yyleng; return (TOK_GREATER);	}
"group"			{ pos_char += yyleng; return (TOK_GROUP);	}
"heading"			{ pos_char += yyleng; return (TOK_HEADING);	}
"high-value"	|
"high-values"		{ pos_char += yyleng; return (TOK_HIGH_VALUE);	}
"highlight"		{ pos_char += yyleng; return (TOK_HIGHLIGHT);	}
"i-o"			{ pos_char += yyleng; return (TOK_I_O);	}
"i-o-control"		{ pos_char += yyleng; return (TOK_I_O_CONTROL);	}
"ibm-370"		{ pos_char += yyleng; return (TOK_IBM370);	}
"identification"  {pos_char += yyleng; return (TOK_IDENTIFICATION);	}
"if"			{ pos_char += yyleng; return (TOK_IF);	}
"in"			{ pos_char += yyleng; return (TOK_IN);	}
"index"			{ pos_char += yyleng; return (TOK_INDEX);	}
"indexed"			{ pos_char += yyleng; return (TOK_INDEXED);	}
"indicate"		{ pos_char += yyleng; return (TOK_INDICATE);	}
"initial"			{ pos_char += yyleng; return (TOK_INITIAL);	}
"initialize"		{ pos_char += yyleng; return (TOK_INITIALIZE);	}
"initiate"		{ pos_char += yyleng; return (TOK_INITIATE);	}
"input"			{ pos_char += yyleng; return (TOK_INPUT);	}
"input-output"		{ pos_char += yyleng; return (TOK_INPUT_OUTPUT);	}
"inspect"			{ pos_char += yyleng; return (TOK_INSPECT);	}
"installation"		{ pos_char += yyleng; return (TOK_INSTALLATION);	}
"into"			{ pos_char += yyleng; return (TOK_INTO);	}
"invalid"			{ pos_char += yyleng; return (TOK_INVALID);	}
"is"			{ pos_char += yyleng; return (TOK_IS);	}
"just"			{ pos_char += yyleng; return (TOK_JUST);	}
"justified"		{ pos_char += yyleng; return (TOK_JUSTIFIED);	}
"key"			{ pos_char += yyleng; return (TOK_KEY);	}
"label"			{ pos_char += yyleng; return (TOK_LABEL);	}
"last"			{ pos_char += yyleng; return (TOK_LAST);	}
"leading"			{ pos_char += yyleng; return (TOK_LEADING);	}
"left"			{ pos_char += yyleng; return (TOK_LEFT);	}
"length"			{ pos_char += yyleng; return (TOK_LENGTH);	}
"less"			{ pos_char += yyleng; return (TOK_LESS);	}
"limit"			{ pos_char += yyleng; return (TOK_LIMIT);	}
"limits"			{ pos_char += yyleng; return (TOK_LIMITS);	}
"linage"			{ pos_char += yyleng; return (TOK_LINAGE);	}
"linage-counter"		{ pos_char += yyleng; return (TOK_LINAGE_COUNTER);	}
"line"			{ pos_char += yyleng; return (TOK_LINE);	}
"line-counter"		{ pos_char += yyleng; return (TOK_LINE_COUNTER);	}
"lines"			{ pos_char += yyleng; return (TOK_LINES);	}
"linkage"			{ pos_char += yyleng; return (TOK_LINKAGE);	}
"lock"			{ pos_char += yyleng; return (TOK_LOCK);	}
"low-value"	|
"low-values"		{ pos_char += yyleng; return (TOK_LOW_VALUE);	}
"memory"			{ pos_char += yyleng; return (TOK_MEMORY);	}
"merge"			{ pos_char += yyleng; return (TOK_MERGE);	}
"message"			{ pos_char += yyleng; return (TOK_MESSAGE);	}
"mode"			{ pos_char += yyleng; return (TOK_MODE);	}
"modules"			{ pos_char += yyleng; return (TOK_MODULES);	}
"move"			{ pos_char += yyleng; return (TOK_MOVE);	}
"multiple"		{ pos_char += yyleng; return (TOK_MULTIPLE);	}
"multiply"		{ pos_char += yyleng; return (TOK_MULTIPLY);	}
"native"			{ pos_char += yyleng; return (TOK_NATIVE);	}
"negative"		{ pos_char += yyleng; return (TOK_NEGATIVE);	}
"next"			{ pos_char += yyleng; return (TOK_NEXT);	}
"no"			{ pos_char += yyleng; return (TOK_NO);	}
"not"			{ pos_char += yyleng; return (TOK_NOT);	}
"number"			{ pos_char += yyleng; return (TOK_NUMBER);	}
"numeric"			{ pos_char += yyleng; return (TOK_NUMERIC);	}
"numeric-edited"		{ pos_char += yyleng; return (TOK_NUMERIC_EDITED);	}
"object-computer"		{ pos_char += yyleng; return (TOK_OBJECT_COMPUTER);	}
"occurs"			{ pos_char += yyleng; return (TOK_OCCURS);	}
"of"			{ pos_char += yyleng; return (TOK_OF);	}
"off"			{ pos_char += yyleng; return (TOK_OFF);	}
"omitted"			{ pos_char += yyleng; return (TOK_OMITTED);	}
"on"			{ pos_char += yyleng; return (TOK_ON);	}
"open"			{ pos_char += yyleng; return (TOK_OPEN);	}
"optional"		{ pos_char += yyleng; return (TOK_OPTIONAL);	}
"or"			{ pos_char += yyleng; return (TOK_OR);	}
"order"			{ pos_char += yyleng; return (TOK_ORDER);	}
"organization"		{ pos_char += yyleng; return (TOK_ORGANIZATION);	}
"other"			{ pos_char += yyleng; return (TOK_OTHER);	}
"output"			{ pos_char += yyleng; return (TOK_OUTPUT);	}
"overflow"		{ pos_char += yyleng; return (TOK_OVERFLOW);	}
"packed-decimal"          { pos_char += yyleng; return (TOK_PACKED_DECIMAL);	}
"padding"			{ pos_char += yyleng; return (TOK_PADDING);	}
"page"			{ pos_char += yyleng; return (TOK_PAGE);	}
"page-counter"		{ pos_char += yyleng; return (TOK_PAGE_COUNTER);	}
"perform"			{ pos_char += yyleng; return (TOK_PERFORM);	}
"pf"			{ pos_char += yyleng; return (TOK_PF);	}
"ph"			{ pos_char += yyleng; return (TOK_PH);	}
"picture"       { pos_char += yyleng; return (TOK_PICTURE);	}
"pic"       { pos_char += yyleng; return (TOK_PICTURE);	}
"{pre}"		{ pos_char += yyleng; return HEADER; }
"[\n] "		{ pos_char += yyleng; return NL; }
"plus"			{ pos_char += yyleng; return (TOK_PLUS);	}
"pointer"			{ pos_char += yyleng; return (TOK_POINTER);	}
"position"		{ pos_char += yyleng; return (TOK_POSITION);	}
"positive"		{ pos_char += yyleng; return (TOK_POSITIVE);	}
"printing"		{ pos_char += yyleng; return (TOK_PRINTING);	}
"procedure"		{ pos_char += yyleng; return (TOK_PROCEDURE);	}
"procedures"		{ pos_char += yyleng; return (TOK_PROCEDURES);	}
"proceed"			{ pos_char += yyleng; return (TOK_PROCEED);	}
"program"			{ pos_char += yyleng; return (TOK_PROGRAM);	}


"program\-id"		{pos_char += yyleng; return (TOK_PROGRAM_ID);	}




"purge"			{ pos_char += yyleng; return (TOK_PURGE);	}
"queue"			{ pos_char += yyleng; return (TOK_QUEUE);	}
"quote"	|
"quotes"			{ pos_char += yyleng; return (TOK_QUOTE);	}
"random"			{ pos_char += yyleng; return (TOK_RANDOM);	}
"rd"			{ pos_char += yyleng; return (TOK_RD);	}
"read"			{ pos_char += yyleng; return (TOK_READ);	}
"receive"			{ pos_char += yyleng; return (TOK_RECEIVE);	}
"records"	|
"record"			{ pos_char += yyleng; return (TOK_RECORD);	}
"redefines"		{ pos_char += yyleng; return (TOK_REDEFINES);	}
"reel"			{ pos_char += yyleng; return (TOK_REEL);	}
"reference"               { pos_char += yyleng; return (TOK_REFERENCE); }
"references"		{ pos_char += yyleng; return (TOK_REFERENCES);	}
"relative"		{ pos_char += yyleng; return (TOK_RELATIVE);	}
"release"			{ pos_char += yyleng; return (TOK_RELEASE);	}
"remainder"		{ pos_char += yyleng; return (TOK_REMAINDER);	}
"removal"			{ pos_char += yyleng; return (TOK_REMOVAL);	}
"renames"			{ pos_char += yyleng; return (TOK_RENAMES);	}
"relace"			{ pos_char += yyleng; return (TOK_REPLACE); }
"replacing"		{ pos_char += yyleng; return (TOK_REPLACING);	}
"report"			{ pos_char += yyleng; return (TOK_REPORT);	}
"reporting"		{ pos_char += yyleng; return (TOK_REPORTING);	}
"reports"			{ pos_char += yyleng; return (TOK_REPORTS);	}
"rerun"			{ pos_char += yyleng; return (TOK_RERUN);	}
"reserve"			{ pos_char += yyleng; return (TOK_RESERVE);	}
"reset"			{ pos_char += yyleng; return (TOK_RESET);	}
"return"			{ pos_char += yyleng; return (TOK_RETURN);	}
"reverse-video"		{ pos_char += yyleng; return (TOK_REVERSE_VIDEO);	}
"reversed"		{ pos_char += yyleng; return (TOK_REVERSED);	}
"rewind"			{ pos_char += yyleng; return (TOK_REWIND);	}
"rewrite"			{ pos_char += yyleng; return (TOK_REWRITE);	}
"rf"			{ pos_char += yyleng; return (TOK_RF);	}
"rh"			{ pos_char += yyleng; return (TOK_RH);	}
"right"			{ pos_char += yyleng; return (TOK_RIGHT);	}
"rounded"			{ pos_char += yyleng; return (TOK_ROUNDED);	}
"run"			{ pos_char += yyleng; return (TOK_RUN);	}
"same"			{ pos_char += yyleng; return (TOK_SAME);	}
"screen"			{ pos_char += yyleng; return (TOK_SCREEN);	}
"sd"			{ pos_char += yyleng; return (TOK_SD);	}
"search"			{ pos_char += yyleng; return (TOK_SEARCH);	}
"section"			{ pos_char += yyleng; return (TOK_SECTION);	}
"security"		{ pos_char += yyleng; return (TOK_SECURITY);	}
"segment"			{ pos_char += yyleng; return (TOK_SEGMENT);	}
"segment-limit"		{ pos_char += yyleng; return (TOK_SEGMENT_LIMIT);	}
"select"			{ pos_char += yyleng; return (TOK_SELECT);	}
"send"			{ pos_char += yyleng; return (TOK_SEND);	}
"sentence"		{ pos_char += yyleng; return (TOK_SENTENCE);	}
"separate"		{ pos_char += yyleng; return (TOK_SEPARATE);	}
"sequence"		{ pos_char += yyleng; return (TOK_SEQUENCE);	}
"sequential"		{ pos_char += yyleng; return (TOK_SEQUENTIAL);	}
"set"			{ pos_char += yyleng; return (TOK_SET);	}
"sign"			{ pos_char += yyleng; return (TOK_SIGN);	}
"size"			{ pos_char += yyleng; return (TOK_SIZE);	}
"sort"			{ pos_char += yyleng; return (TOK_SORT);	}
"sort-merge"		{ pos_char += yyleng; return (TOK_SORT_MERGE);	}
"source"			{ pos_char += yyleng; return (TOK_SOURCE);	}
"source-computer"		{ pos_char += yyleng; return (TOK_SOURCE_COMPUTER);	}
"space"	|
"spaces"			{pos_char += yyleng; return (TOK_IDENTIFIER);}
"special-names"		{ pos_char += yyleng; return (TOK_SPECIAL_NAMES);	}
"standard"		{ pos_char += yyleng; return (TOK_STANDARD);	}
"standard-1"		{ pos_char += yyleng; return (TOK_STANDARD_1);	}
"standard-2"		{ pos_char += yyleng; return (TOK_STANDARD_2);	}
"start"			{ pos_char += yyleng; return (TOK_START);	}
"status"			{ pos_char += yyleng; return (TOK_STATUS);	}
"stop"			{ pos_char += yyleng; return (TOK_STOP);	}
"string"			{ pos_char += yyleng; return (TOK_STRING);	}
"sub-queue-1"		{ pos_char += yyleng; return (TOK_SUB_QUEUE_1);	}
"sub-queue-2"		{ pos_char += yyleng; return (TOK_SUB_QUEUE_2);	}
"sub-queue-3"		{ pos_char += yyleng; return (TOK_SUB_QUEUE_3);	}
"subtract"		{ pos_char += yyleng; return (TOK_SUBTRACT);	}
"sum"			{ pos_char += yyleng; return (TOK_SUM);	}
"supress"			{ pos_char += yyleng; return (TOK_SUPRESS);	}
"symbolic"		{ pos_char += yyleng; return (TOK_SYMBOLIC);	}
"sync"	|
"synchronized"		{ pos_char += yyleng; return (TOK_SYNC);	}
"table"			{ pos_char += yyleng; return (TOK_TABLE);	}
"tallying"		{ pos_char += yyleng; return (TOK_TALLYING);	}
"tape"			{ pos_char += yyleng; return (TOK_TAPE);	}
"terminal"		{ pos_char += yyleng; return (TOK_TERMINAL);	}
"terminate"		{ pos_char += yyleng; return (TOK_TERMINATE);	}
"test"			{ pos_char += yyleng; return (TOK_TEST);	}
"text"			{ pos_char += yyleng; return (TOK_TEXT);	}
"than"			{ pos_char += yyleng; return (TOK_THAN);	}
"then"			{ pos_char += yyleng; return (TOK_THEN);	}
"through"			{ pos_char += yyleng; return (TOK_THROUGH);	}
"thru"			{ pos_char += yyleng; return (TOK_THRU);	}
"time"			{ pos_char += yyleng; return (TOK_TIME);	}
"times"			{ pos_char += yyleng; return (TOK_TIMES);	}
"to"			{ pos_char += yyleng; return (TOK_TO);	}
"top"			{ pos_char += yyleng; return (TOK_TOP);	}
"trailing"		{ pos_char += yyleng; return (TOK_TRAILING);	}
"true"			{ pos_char += yyleng; return (TOK_TRUE);	}
"type"			{ pos_char += yyleng; return (TOK_TYPE);	}
"underline"		{ pos_char += yyleng; return (TOK_UNDERLINE);	}
"unit"			{ pos_char += yyleng; return (TOK_UNIT);	}
"unstring"		{ pos_char += yyleng; return (TOK_UNSTRING);	}
"until"			{ pos_char += yyleng; return (TOK_UNTIL);	}
"up"			{ pos_char += yyleng; return (TOK_UP);	}
"upon"			{ pos_char += yyleng; return (TOK_UPON);	}
"usage"			{ pos_char += yyleng; return (TOK_USAGE);	}
"use"			{ pos_char += yyleng; return (TOK_USE);	}
"using"			{ pos_char += yyleng; return (TOK_USING);	}
"value"	|       {pos_char += yyleng; return (TOK_VALUE);	}
"values"			{pos_char += yyleng; return (TOK_VALUE);	}
"varying"			{pos_char += yyleng; return (TOK_VARYING);	}
"when"		{pos_char += yyleng; return (TOK_WHEN);	}
"while"			{pos_char += yyleng; return (TOK_WHILE);	}
"with"			{pos_char += yyleng; return (TOK_WITH);	}
"words"			{pos_char += yyleng; return (TOK_WORDS);	}
"working-storage"		{ return (TOK_WORKING_STORAGE);	}
"write"			{pos_char += yyleng; return (TOK_WRITE);	}
"zero"	|
"zeroes"	|
"zeros" 			{pos_char += yyleng; return (TOK_IDENTIFIER);}
"calmemory"     {pos_char += yyleng; return (TOK_IDENTIFIER);}
[a-z]([a-z0-9\-]*[a-z0-9])?	{pos_char += yyleng; return (TOK_IDENTIFIER); }

"+"			{pos_char += 1; return(TOK_PLUS); }



"-"			{pos_char += 1; return(TOK_HYPHEN); }
\*.*\n 						{ pos_char = 1;}

"/"			{pos_char += 1; return(TOK_SLASH); }
"="			{pos_char += 1; return(TOK_EQUAL); }
"$"			{pos_char += 1; return(TOK_DOLLAR); }
","			{pos_char += 1; return(TOK_COMMA); }
";"			{pos_char += 1; return(TOK_SEMICOLON); }
"."			{pos_char += 1; return(TOK_PERIOD); }
"("			{pos_char += 1; return(TOK_LPAREN); }
")"			{pos_char += 1; return(TOK_RPAREN); }
"X"         {pos_char += 1; return(TOK_INTEGER);} /*ADD X EN TANT QU'INT*/
"S9"        {pos_char += 2; return(TOK_INTEGER);} /*ADD S9 EN TANT QU'INT*/
">="        {pos_char += 2; return(TOK_GREATER_EQ); }
"<="        {pos_char += 2; return(TOK_LESS_EQ); }
"greater than or equal to"        {pos_char += yyleng; return(TOK_GREATER_EQ); }
"less than or equal to"        {pos_char += yyleng; return(TOK_LESS_EQ); }
">"			{pos_char += 1; return(TOK_GREATER); }
"<"			{pos_char += 1; return(TOK_LESS); }

[\n]        {pos_char = 1; ++yylineno;}
\t 			{pos_char += 4;}	
" "			{pos_char += 1;}
.           { /* ignores bad characters */}

%%