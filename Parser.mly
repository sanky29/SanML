%{
	(*include the library*) 
	open ExpTree;;
%}

	/*define tokens as*/
	%token <string> VAR  		/*variable*/
	%token <int> NUM			/*constant number*/
	%token <float> FLOAT  		/*constant float*/
	%token <bool> BOOL 			/*constant boolean*/
	%token ASSIGN 				/*=*/
	%token MUL 					/***/
	%token DIV 					/* / */
	%token ADD 					/*+*/
	%token SUB 					/*-*/
	%token DOT 					/* . */
	%token GRTEQL				/*>=*/
	%token GRT 					/*>*/
	%token LES 					/*<*/
	%token NEQL					/*!-*/
	%token LESEQL 				/*<=*/
	%token GRTEQL				/*>=*/
	%token MOD					/*mod*/
	%token ABS					/*abs*/
	%token OR					/* || */
	%token AND					/* && */
	%token NOT					/* not */
	%token COMMA				/* , */
	%token OP 					/*open parenthesis*/
	%token CP 					/*colsed paranthesis*/
	%token LET					/*let*/
	%token IN 					/* in */
	%token IF					/*if*/
	%token ELSE					/*else*/
	%token THEN 				/*then*/
	%token SEMI					/*;*/
	%token EOF					/*eof*/
	%start exp
	%type <ExpTree.exp> exp
%%	
	exp:
		| EOF {print_string "done";}
%%


