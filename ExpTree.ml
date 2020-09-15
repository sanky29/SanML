(*define exp type*)

type exp =
	| Var of string							(*variable*)
	| Num of int							(*interger*)
	| Flt of float							(*floating point*)
	| T										(*true*)
	| F										(*false*)
	| Mul of (exp*exp)						(*1+2*)
	| Add of (exp*exp)						(*1*2*)
	| Sub of (exp*exp)						(*1-2*)
	| Div of (exp*exp)						(*1/2*)
	| Mod of (exp*exp)						(*1mod2*)
	| Eql of (exp*exp)						(*e1=e2*)
	| Neql of (exp*exp)						(*e1!=e2*)
	| Grt of (exp*exp)						(*e1>e2*)
	| Sml of (exp*exp)						(*e1<e2*)
	| Grteql of (exp*exp)					(*e1>=e2*)
	| Smleql of (exp*exp)					(*e1<=e2*)
	| Abs of (exp)							(*|2|*)
	| Or  of (exp*exp)						(*true || false*)
	| And of (exp*exp)						(*true && false*)
	| Not of (exp)							(*not true*)
	| If_Then_else of (exp*exp*exp)			(*if e1 then e2 else e3*)
	| Lam of (string*exp)					(*f x*)
	| RLam of (string*string*exp)			(*rec f x*)
	| App of (exp*exp)						(*f e*)
	| Locdef of (def*exp)					(*let d in e*)
	| Def of def 							(*the defination*)
	
	(*also need to define def*)
	and
	def =
	| Ass of (string*exp)					(*x=e*)
	| Seq of (def*def)						(*d1,d2*)
	| Par of (def*def)						(*d1||d2*)


(*string representation of rxp tree*)
let rec string_of_exp e =
	match e with
	| Var x -> x | Num n -> string_of_int n | Flt f -> string_of_float f |T -> "true" | F -> "false"
	| Mul (e1,e2) -> "("^(string_of_exp e1)^")*("^(string_of_exp e2)^")" 
	| Add (e1,e2) -> "("^(string_of_exp e1)^")+("^(string_of_exp e2)^")"
	| Sub (e1,e2) -> "("^(string_of_exp e1)^")-("^(string_of_exp e2)^")"
	| Div (e1,e2) -> "("^(string_of_exp e1)^")/("^(string_of_exp e2)^")"
	| Mod (e1,e2) -> "("^(string_of_exp e1)^") mod ("^(string_of_exp e2)^")"
	| Abs (e1) -> "|"^(string_of_exp e1)^"|"
	| Eql (e1,e2) -> "("^(string_of_exp e1)^")=("^(string_of_exp e2)^")"
	| Neql (e1,e2) -> "("^(string_of_exp e1)^")!=("^(string_of_exp e2)^")"
	| Sml (e1,e2) -> "("^(string_of_exp e1)^")<("^(string_of_exp e2)^")"
	| Grt (e1,e2) -> "("^(string_of_exp e1)^")>("^(string_of_exp e2)^")"
	| Smleql (e1,e2) -> "("^(string_of_exp e1)^")<=("^(string_of_exp e2)^")"
	| Grteql (e1,e2) -> "("^(string_of_exp e1)^")>=("^(string_of_exp e2)^")"
	| Or (e1,e2) -> "("^(string_of_exp e1)^")||("^(string_of_exp e2)^")"
	| And (e1,e2) -> "("^(string_of_exp e1)^")&&("^(string_of_exp e2)^")"
	| Not e -> "not ("^(string_of_exp e)^")"
	| If_Then_else (e1,e2,e3) -> "if ("^(string_of_exp e1)^") then ("^(string_of_exp e2)^") else ("^(string_of_exp e3)^")"
	| Lam (x,e) -> string_of_exp e
	| RLam (x,f,e) -> string_of_exp e
	| App (e1,e2) -> (string_of_exp e1)^" "^(string_of_exp e2)
	| Locdef (d,e) -> "let "^(string_of_exp (Def d))^" in "^(string_of_exp e)
	| Def d -> begin
					match d with
					| Ass (x,e) -> x^" = "^(string_of_exp e)
					| Seq (d1,d2) -> (string_of_exp (Def d1))^";"^(string_of_exp (Def d2))				
					| Par (d1,d2) -> (string_of_exp (Def d1))^"||"^(string_of_exp (Def d2))		
				end
	