include Base
include Stdio

let print_endline_int i = print_endline (Int.to_string i)

module String = struct
  include String

  let iteri ~f str = ignore (fold ~init:0 ~f:(fun i x -> f i x ; i + 1) str)
end

module List = struct
  include List

  let product = List.fold ~init:1 ~f:( * )

  let fold1 ~f = function
    | [] -> assert false
    | hd :: tl -> List.fold ~init:hd ~f tl
end

let time f =
  let before = Unix.gettimeofday () in
  let result = f () in
  let after = Unix.gettimeofday () in
  print_endline (Printf.sprintf "%f" (after -. before)) ;
  result
