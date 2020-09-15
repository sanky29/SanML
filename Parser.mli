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

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
