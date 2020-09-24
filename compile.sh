ocamlc ExpTree.ml
ocamlyacc -v Parser.mly
ocamlc -c Parser.mli
ocamlc -c Parser.ml
ocamllex Lexer.mll
ocamlc -c Lexer.ml
ocamlc ExpTree.cmo Parser.cmo Lexer.cmo -o a.exe temp.ml
./a.exe
rm parser.ml
rm a.*
rm Parser.mli
rm Parser.c*
rm lexer.ml
rm Lexer.c*
rm ExpTree.cm*
rm temp.cm*
