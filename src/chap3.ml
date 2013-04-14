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
