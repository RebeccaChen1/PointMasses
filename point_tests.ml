open Points ;;

let p = new point 6. 8. ;;
let p1 = new point 1. 3. ;;
let p2 = new point 7. 6. ;;
let p3 = new point 5.6 5.8 ;;
let p4 = new point 5. 5. ;;
let p5 = new point 4.55 4.45 ;;

(* to test equality for floating point values *)
let test_float (x : float) (y : float) (e : float) : bool =
  (x -. y) < e ;;

let test_x () =
  assert (p#x = 6.) ;
  assert (p4#x = 5.) ;
  assert (p3#x = 5.6) ;
() ;;

let test_y () =
  assert (p#y = 8.) ;
  assert (p4#y = 5.) ;
  assert (p3#y = 5.8) ;
() ;;

let test_pos () = 
  assert (p#pos = (6., 8.)) ;
  assert (p1#pos = (1., 3.)) ;
() ;;

let test_round () =
  assert (p#round = (6, 8)) ;
  assert (p3#round = (6, 6)) ;
  assert (p5#round = (5, 4)) ;
() ;;

let test_move () =
  p1#move p2 ;
  assert (p1#pos = (7., 6.)) ;
  p5#move p3 ;
  assert (p5#pos = (5.6, 5.8)) ;	

() ;;

let test_scale () =
  let pnew = p1#scale 2. in
  assert (pnew#pos = (14., 12.)) ;
  let pnew1 = p3#scale 3. in
  assert (test_float pnew1#x 16.8 0.0000000000001) ;
  assert (test_float pnew1#y 17.4 0.0000000000001) ;
() ;;

let test_plus () =
  let pnew = p2#plus p3 in
  assert (pnew#pos  = (12.6, 11.8)) ;
  let pnew1 = p3#plus p4 in
  assert (pnew1#pos = (10.6, 10.8)) ;
() ;;

let test_minus () =
  let pnew = p2#minus p4 in
  assert (pnew#pos = (2., 1.)) ;
  let pnew1 = p3#minus p4 in
  assert (test_float pnew1#x 0.6 0.0000000001) ;
  assert (test_float pnew1#y 0.8 0.0000000001) ;
() ;;

let test_norm () =
  assert (p#norm = 10.) ;
() ;;

let test_distance () =
  assert (test_float (p4#distance p3) 1. 0.0000000001) ;
() ;;

let test_unit_vector () =
  let p5 = p#unit_vector in
  assert (p5#pos = (0.6, 0.8)) ;
() ;;

test_x () ;;
test_y () ;;
test_pos () ;;
test_round () ;;
test_move () ;;
test_scale () ;;
test_plus () ;;
test_minus () ;;
test_norm () ;;
test_distance () ;;
test_unit_vector () ;;