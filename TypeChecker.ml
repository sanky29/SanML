type types =
		| Tint
		| Tbool
		| Tfloat
		| Arrow of (types list)
		| Prod of (types list)
		| Sig of ((string* types)list)
		| TypeVar of string