open Lexer;;
open Parser;;
open List;;
open Lexing;;
open ExpTree;;

	try
		let input = Lexing.from_channel stdin in
		let x =Parser.exp2 Lexer.tokens input in
		print_string(ExpTree.string_of_exp x);
	with
		| e -> print_string("bad");
