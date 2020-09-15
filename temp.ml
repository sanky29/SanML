open Lexer;;
open Parser;;
open List;;
open Lexing;;
try
	let input = Lexing.from_channel stdin in
	let y = Lexer.tokens input in
	print_string("good");
with
| e -> print_string("bad");;
