type token =
  | VAR of (string)
  | NUM of (int)
  | FLOAT of (float)
  | BOOL of (bool)
  | ASSIGN
  | MUL
  | DIV
  | ADD
  | SUB
  | DOT
  | MOD
  | ABS
  | OR
  | AND
  | NOT
  | COMMA
  | OP
  | CP
  | LET
  | IN
  | IF
  | ELSE
  | THEN
  | SEMI
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "Parser.mly"
	(*include the library*) 
	(*open ExpTree;;*)
# 34 "Parser.ml"
let yytransl_const = [|
  261 (* ASSIGN *);
  262 (* MUL *);
  263 (* DIV *);
  264 (* ADD *);
  265 (* SUB *);
  266 (* DOT *);
  267 (* MOD *);
  268 (* ABS *);
  269 (* OR *);
  270 (* AND *);
  271 (* NOT *);
  272 (* COMMA *);
  273 (* OP *);
  274 (* CP *);
  275 (* LET *);
  276 (* IN *);
  277 (* IF *);
  278 (* ELSE *);
  279 (* THEN *);
  280 (* SEMI *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* VAR *);
  258 (* NUM *);
  259 (* FLOAT *);
  260 (* BOOL *);
    0|]

let yylhs = "\255\255\
\001\000\000\000"

let yylen = "\002\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\002\000"

let yydgoto = "\002\000\
\004\000"

let yysindex = "\255\255\
\001\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000"

let yytablesize = 1
let yytable = "\001\000\
\003\000"

let yycheck = "\001\000\
\000\000"

let yynames_const = "\
  ASSIGN\000\
  MUL\000\
  DIV\000\
  ADD\000\
  SUB\000\
  DOT\000\
  MOD\000\
  ABS\000\
  OR\000\
  AND\000\
  NOT\000\
  COMMA\000\
  OP\000\
  CP\000\
  LET\000\
  IN\000\
  IF\000\
  ELSE\000\
  THEN\000\
  SEMI\000\
  EOF\000\
  "

let yynames_block = "\
  VAR\000\
  NUM\000\
  FLOAT\000\
  BOOL\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 36 "Parser.mly"
        (print_string "done";)
# 131 "Parser.ml"
               : unit))
(* Entry exp *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let exp (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
;;
# 38 "Parser.mly"


# 159 "Parser.ml"
