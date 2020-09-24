%{
	(*include the library*) 
	open ExpTree;;
	open List;;
%}

	/*define tokens as*/
	%token <string> VAR  		/*variable*/
	%token <int> NUM			/*constant number*/
	%token <float> FLOAT  		/*constant float*/
	%token TRUE 				/*constant boolean*/
	%token FALSE 				/*constant boolean*/
	%token ASSIGN 				/*=*/
	%token MUL 					/***/
	%token DIV 					/* / */
	%token ADD 					/*+*/
	%token SUB 					/*-*/
	%token FMUL 				/***/
	%token FDIV 				/* / */
	%token FADD 				/*+*/
	%token FSUB 				/*-*/
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
	%token FUN                  /*fun*/
	%token REC 					/*rec*/
	%token LET					/*let*/
	%token IN 					/* in */
	%token IF					/*if*/
	%token ELSE					/*else*/
	%token THEN 				/*then*/
	%token SEMI					/*;*/
	%token ARROW				/*->*/
	%token PARD					/*|*/
	%token EOF					/*eof*/
	%left ADD SUB
	%left MUL DIV MOD 
	%left ABS
	%start exp2
	%type <ExpTree.exp> exp2
%%	
	constants:
		| NUM {Num $1}
		| FLOAT {Flt $1} 
		| TRUE {T}
		| FALSE {F}
		| VAR {Var $1}
		| OP SUB NUM CP {Num (-1*$3)}

	exp2:
		| exp4 {$1}
		| def {Def $1}
		| def IN exp4 {Locdef($1,$3)}

	exp4:
		| comparison {$1}
		| OP comparison CP {$2}

	exp3:
		| comparison {$1}
		| OP comparison CP {$2}

	comparison:
		| addition {$1}
		| comparison GRT addition {Grt ($1,$3)}
		| comparison GRTEQL addition {Grteql ($1,$3)}
		| comparison LES addition {Sml ($1,$3)}
		| comparison LESEQL addition {Smleql ($1,$3)}
		| comparison ASSIGN addition {Eql ($1,$3)}


	addition: 
		| substraction {$1}
		| addition ADD substraction {Add ($1,$3)}
		| OP addition CP {$2}

	substraction:
		| multiplication {$1}
		| substraction SUB multiplication {Sub ($1,$3)}
		| OP substraction CP {$2}

	multiplication:
		| division {$1}
		| multiplication MUL division {Mul ($1,$3)}
		| OP multiplication CP {$2}

	division:
		| faddition {$1}
		| division DIV faddition {Div ($1,$3)}
		| OP division CP {$2}

	faddition: 
		| fsubstraction {$1}
		| faddition FADD fsubstraction {FAdd ($1,$3)}
		| OP faddition CP {$2}

	fsubstraction:
		| fmultiplication {$1}
		| fsubstraction FSUB fmultiplication {FSub ($1,$3)}
		| OP fsubstraction CP {$2}

	fmultiplication:
		| fdivision {$1}
		| fmultiplication FMUL fdivision {FMul ($1,$3)}
		| OP fmultiplication CP {$2}

	fdivision:
		| mode {$1}
		| fdivision FDIV mode {FDiv ($1,$3)}
		| OP fdivision CP {$2}

	mode:
		| abse {$1}
		| mode MOD abse {Mod ($1,$3)}
		| OP mode CP {$2}

	abse:
		| funapp {$1}
		| ABS funapp {Abs $2}
		| OP abse CP {$2}

	funapp:
		| ifelse {$1}
		| OP funapp CP {$2}
		| funapp ifelse {App($1,$2)}
	    | funapp OP exp3 CP {App($1,$3)}
	    | FUN VAR ARROW exp3 {Lam($2,$4)}

	ifelse:
		| tuple {$1}
		| IF exp3 THEN exp3 ELSE exp3 {If_Then_else ($2,$4,$6)}

	tuple:
		| constants {$1}
		| OP tuple_list CP {$2}

	tuple_list:
		| exp3 COMMA exp3 {Tuple(2,[$1;$3])}
		| exp3 COMMA tuple_list {match $3 with
								| Tuple(n,l) -> Tuple(n+1,$1::l)
								| _ -> Tuple(2,[$1;$3])}

	def:
		| LET VAR ASSIGN exp4 {(Ass ($2,$4))}
		| def SEMI def {(Seq ($1,$3))}
		| def PARD def {(Seq ($1,$3))}
		| LET varlist ASSIGN exp4 {let rec f l =
									match l with
									| [] -> $4
									| h::t -> Lam(h, f t) in
									Ass(List.hd $2, f (List.tl $2))}
		| LET REC varlist ASSIGN exp4 {let rec f l =
									match l with
									| [] -> $5
									| h::t -> Lam(h, f t) in
									Ass(List.hd $3, RLam (List.hd $3,List.hd (List.tl $3),f (List.tl (List.tl $3))))}

	varlist:
		| VAR VAR {[$1;$2]}
		| VAR varlist {$1::$2}
%%