1+2;;
(* - : int = 3 *)

(3,'a') = (3, 'a');;
(* - : bool = true *)

(3,'a') = (3, 'b');;
(* - : bool = false *)

(3,'a') < (3, 'b');;
(* - : bool = true *)

"abc" ^ "def";;
(* - : string = "abcdef" *)

[1,2] @ [3,4];;
(* - : (int * int) list = [(1, 2); (3, 4)] *)

[1;2] @ [3;4];;
(* - : int list = [1; 2; 3; 4] *)

List.hd['1';'2';'3'];;
(* - : char = '1' *)

List.tl['1';'2';'3'];;
(* - : char list = ['2'; '3'] *)

1::2::3::4::[];;
(* - : int list = [1; 2; 3; 4] *)

# [1 ; 2] = [1 ; 2];;
(* - : bool = true *)

# [1 ; 2] = [2 ; 3];;
(* - : bool = false *)

let x = 2 ;;
(* val x : int = 2 *)

x + 3;;
(* - : int = 5 *)

let x = 10 in x + 10;;
(* - : int = 20 *)

fun x -> x + 1;;
(* - : 'a -> int = <fun> *)

(fun x -> x + 1) 10;;
(* - : int = 11 *)

(fun x -> x +. 0.1) 0.5;;
(* - : float = 0.6 *)

let test = (fun x -> x +. 0.1);;
(* val test : float -> float = <fun> *)

test 0.5;;
(* - : float = 0.6 *)

let add = (fun x -> (fun y -> x + y));;
(* val add : int -> int -> int = <fun> *)

let succ = add 1;;
(* val succ : int -> int = <fun> *)

succ 41;;
(* - : int = 42 *)
