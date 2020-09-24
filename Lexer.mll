{
	(*take tokens from parser*)
	open Parser;;
}
let var = ['a'-'z'] ['a'-'z''A'-'Z''0'-'9']*
let integer =  ['0'-'9']+
let floating = (""|'-') ['0'-'9']+['.'] ['0'-'9']* 

(*rules*)
rule tokens = parse
	| 't''r''u''e' 		{TRUE}
	| 'f''a''l''s''e'	{FALSE}
	| '='				{ASSIGN}
	| '-''>'			{ARROW}
	| '>'				{GRT}
	| '<'				{LES}
	| '!''='			{NEQL}
	| '<''='			{LESEQL}
	| '>''='			{GRTEQL}
	| '*''.'			{FMUL}
	| '/''.'			{FDIV}
	| '+''.'			{FADD}
	| '-''.'			{FSUB}
	| '*'				{MUL}
	| '/'				{DIV}
	| '+'				{ADD}
	| '-'				{SUB}
	| 'f''u''n'			{FUN}
	| 'r''e''c'			{REC}
	| 'm''o''d'			{MOD}
	| 'a''b''s'			{ABS}
	| '|''|'			{OR}
	| '&''&'			{AND}
	| 'n''o''t'			{NOT}
	| ','				{COMMA}
	| '(' 	 			{OP}
	|  ')' 				{CP}
	| '|'				{PARD}
	| 'l''e''t' 		{LET}
	| 'i''n'			{IN}
	| 'i''f'			{IF}
	| 'e''l''s''e'  	{ELSE}
	| 't''h''e''n'  	{THEN}
	| ';'           	{SEMI}
	| var as s 			{VAR s}
	| integer as s 		{NUM (int_of_string s)}
	| floating as s 	{FLOAT (float_of_string s)}
	| ['\n' '\r' '\t' ' '] {tokens lexbuf}
	| eof				{EOF}