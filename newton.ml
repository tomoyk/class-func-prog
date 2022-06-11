let rec newton f a =
  let delta = 0.0001 in
  let h = 0.0001 in
  let f' = ((f (a +. h)) -. (f a)) /. h in
  let b = a -. (f a) /. f' in
  Printf.printf "b=%.20f\n" b;
  if abs_float ( b -. a ) < delta then b else newton f b ;;
let g = fun x -> x *. x -. 2.0;;

newton g, 1 ;;
