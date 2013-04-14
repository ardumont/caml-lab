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

let test_par l =
  let rec test_aux l p = match l, p with
      (PL::l', _)      -> test_aux l' (PL::p)
    | (CL::l', _)      -> test_aux l' (CL::p)
    | (PR::l', PL::p') -> test_aux l' p'
    | (CR::l', CL::p') -> test_aux l' p'
    | ([], [])         -> true
    | (_, _)           -> false
  in test_aux l [];;
(* val test_par : token list -> bool = <fun> *)

test_par [];;
(* - : bool = true *)

test_par (tokenize (explode "{(){}}"));;
(* - : bool = true *)

test_par (tokenize (explode "{()({}}"));;
(* - : bool = false *)

(** fifo **)

let add x fifo = fifo @ [x];;
(* val add : 'a -> 'a list -> 'a list = <fun> *)

add 1 [2;3];;
(* - : int list = [2; 3; 1] *)

let remove fifo = match fifo with
    [] -> []
  | (h::t) -> t;;
(* val remove : 'a list -> 'a list = <fun> *)

remove [2;3;1];;
(* - : int list = [3; 1] *)

(** List manipulation **)

List.map fst [(1,2); (3,4); (5,6)];;
(* - : int list = [1; 3; 5] *)

List.mem 1 [1;2;4];;
- : bool = true
List.mem 3 [1;2;4];;
(* - : bool = false *)

List.assoc 'a' [('a', 1); ('b', 2)];;
(* - : int = 1 *)
List.assoc 'b' [('a', 1); ('b', 2)];;
(* - : int = 2 *)
List.assoc 'c' [('a', 1); ('b', 2)];;
(* Exception: Not_found. *)
