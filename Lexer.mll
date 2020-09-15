{
	(*take tokens from parser*)
	open Parser;;
}
let var = ['a'-'z'] ['a'-'z''A'-'Z''0'-'9']*
let integer = ['1'-'9']['0'-'9']*
let floating = ['1'-'9']['0'-'9']*['.']['0'-'9']*['1'-'9']

(*rules*)
rule tokens = parse
	| var as s 			{VAR s}
	| integer as s 		{NUM (int_of_string s)}
	| floating as s 	{FLOAT (float_of_string s)}
	| 't''r''u''e' 		{TRUE}
	| 'f''a''l''s''e'	{FALSE}
	| '='				{ASSIGN}
	| '>'				{GRT}
	| '<'				{LES}
	| '!''='			{NEQL}
	| '<''='			{LESEQL}
	| '>''='			{GRTEQL}
	| '*'				{MUL}
	| '/'				{DIV}
	| '+'				{ADD}
	| '-'				{SUB}
	| '.'				{DOT}
	| 'm''o''d'			{MOD}
	| 'a''b''s'			{ABS}
	| '|''|'			{OR}
	| '&''&'			{AND}
	| 'n''o''t'			{NOT}
	| ','				{COMMA}
	| '(' 	 			{OP}
	|  ')' 				{CP}
	| 'l''e''t' 		{LET}
	| 'i''n'			{IN}
	| 'i''f'			{IF}
	| 'e''l''s''e'  	{ELSE}
	| 't''h''e''n'  	{THEN}
	| ';'           	{SEMI}
	| eof				{EOF}