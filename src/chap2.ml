let rec fact n =
  if n <= 1
  then 1
  else n * fact (n-1);;
(* val fact : int -> int = <fun> *)

fact 5;;
(* - : int = 120 *)

let rec sum l =
  match l with
    []   -> 0
  | h::t -> h + sum t;;
(* val sum : int list -> int = <fun> *)

sum [1;2;3;4;5];;
(* - : int = 15 *)

type tree = Empty | Node of int * tree * tree;;
(* type tree = Empty | Node of int * tree * tree *)

let n = Node(9,
             Node(8, Empty, Empty),
             Node(5,
                  Node(3, Empty, Empty),
                  Node(2, Empty, Empty)));;
(* val n : tree = *)
(*   Node (9, Node (8, Empty, Empty), *)
(*    Node (5, Node (3, Empty, Empty), Node (2, Empty, Empty))) *)

let lnode t = match t with
    Node(_, l, _) -> l;;
  Characters 14-49:
(*   ..............match t with *)
(*       Node(_, l, _) -> l.. *)
(* Warning 8: this pattern-matching is not exhaustive. *)
(* Here is an example of a value that is not matched: *)
(* Empty *)
(* val lnode : tree -> tree = <fun> *)

lnode n;;
(* - : tree = Node (8, Empty, Empty) *)

let rnode t = match t with
    Node(_, _, r) -> r;;
(* Characters 14-49: *)
(*   ..............match t with *)
(*       Node(_, _, r) -> r.. *)
(* Warning 8: this pattern-matching is not exhaustive. *)
(* Here is an example of a value that is not matched: *)
(* Empty *)
(* val rnode : tree -> tree = <fun> *)

rnode n;;
(* - : tree = Node (5, Node (3, Empty, Empty), Node (2, Empty, Empty)) *)

let lnode t = match t with
    Node(_, l, _) -> l;;
let rnode t = match t with
    Node(_, _, r) -> r;;
let vnode t = match t with
    Node(v, _, _) -> v;;
(*   Characters 14-49: *)
(*   ..............match t with *)
(*       Node(v, _, _) -> v.. *)
(* Warning 8: this pattern-matching is not exhaustive. *)
(* Here is an example of a value that is not matched: *)
(* Empty *)
(* val vnode : tree -> int = <fun> *)

vnode n;;
(* - : int = 9 *)

n;;
(* - : tree = *)
(* Node (9, Node (8, Empty, Empty), *)
(*  Node (5, Node (3, Empty, Empty), Node (2, Empty, Empty))) *)

let rec labels t = match t with
    Empty         -> []
  | Node(v, l, r) -> v :: (labels l) @ (labels r);;
(* val labels : tree -> int list = <fun> *)

labels n;;
(* - : int list = [9; 8; 5; 3; 2] *)

type point = {abs : int ; ord : int; nom : char};;
(* type point = { abs : int; ord : int; nom : char; } *)

let p = {abs = 2; ord = 3; nom = 'c'};;
(* val p : point = {abs = 2; ord = 3; nom = 'c'} *)

# p.abs;;
(* - : int = 2 *)

# p.ord;;
(* - : int = 3 *)

# p.nom;;
(* - : char = 'c' *)

type 'a tree = Empty | Node of 'a * 'a tree * 'a tree;;
(* type 'a tree = Empty | Node of 'a * 'a tree * 'a tree;; *)

let n = Node(9,
             Node(8, Empty, Empty),
             Node(5,
                  Node(3, Empty, Empty),
                  Node(2, Empty, Empty)));;
(*       val n : int tree = *)
(* Node (9, Node (8, Empty, Empty), *)
(*  Node (5, Node (3, Empty, Empty), Node (2, Empty, Empty))) *)

let m = Node("9",
             Node("hello", Empty, Empty),
             Empty);;
(* val m : string tree = Node ("9", Node ("hello", Empty, Empty), Empty) *)

let lnode t = match t with
    Node(_, l, _) -> l;;
(* val lnode : 'a tree -> 'a tree = <fun> *)

let rnode t = match t with
    Node(_, _, r) -> r;;
(* val rnode : 'a tree -> 'a tree = <fun> *)

let vnode t = match t with
    Node(v, _, _) -> v;;
(* val vnode : 'a tree -> 'a = <fun> *)

let rec labels t = match t with
    Empty         -> []
  | Node(v, l, r) -> v :: (labels l) @ (labels r);;
(* val labels : 'a tree -> 'a list = <fun> *)

labels n;;
(* - : int list = [9; 8; 5; 3; 2] *)

labels m;;
(* - : string list = ["9"; "hello"] *)
