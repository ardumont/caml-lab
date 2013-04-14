(** stack **)

let empty = [];;
(* val empty : 'a list = [] *)

let is_empty p = p = [];;
(* val is_empty : 'a list -> bool = <fun> *)

let push x p = x :: p;;
(* val push : 'a -> 'a list -> 'a list = <fun> *)

let pop p = match p with
    (h::t) -> (h, t);;
(* val pop : 'a list -> 'a * 'a list = <fun> *)

pop [1;2;3];;
(* - : int * int list = (1, [2; 3]) *)

(** String **)

String.length "123";;
(* - : int = 3 *)

String.get "123" 0;;
(* - : char = '1' *)

String.sub "this is a string" 5 2;;
(* - : string = "is" *)

(** problem - good parenthesis **)

type token = PL | PR | CL | CR;;
(* type token = PL | PR | CL | CR *)

let rec explode s =
  if s = "" then [] else
    (String.get s 0) ::
      explode (String.sub s 1 ((String.length s) - 1));;
(* val explode : string -> char list = <fun> *)

explode "123";;
(* - : char list = ['1'; '2'; '3'] *)

let rec tokenize l = match l with
    []     -> []
  | '('::t -> PL :: tokenize t
  | ')'::t -> PR :: tokenize t
  | '{'::t -> CL :: tokenize t
  | '}'::t -> CR :: tokenize t
  | _  ::t -> tokenize t;;
(* val tokenize : char list -> token list = <fun> *)

tokenize (explode "{a(is)ignored}");;
(* - : token list = [CL; PL; PR; CR] *)
