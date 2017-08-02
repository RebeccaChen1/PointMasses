open Masses ;;
open Points ;;

let mass0 = new mass 250. 250. 10. ;;
let p0 = new point 501. 501. ;;
let p1 = new point (-1.) (-1.) ;;
let p2 = new point 275. 275. ;;
let p3 = new point 499. 501. ;;
let p4 = new point 502. 498. ;;
let p5 = new point (-1.) 501. ;;


let test_move () =
  mass0#move p2 ;
  assert (mass0#x = 275.) ;
  assert (mass0#y = 275.) ;
  mass0#move p0 ;
  assert (mass0#x = 500.) ;
  assert (mass0#y = 500.) ;
  mass0#move p1 ;
  assert (mass0#x = 0.) ;
  assert (mass0#y = 0.) ;
  mass0#move p3 ;
  assert (mass0#x = 499.) ;
  assert (mass0#y = 500.) ;
  mass0#move p4 ;
  assert (mass0#x = 500.) ;
  assert (mass0#y = 498.) ;
  mass0#move p5 ;
  assert (mass0#x = 0.) ;
  assert (mass0#y = 500.) ;
() ;;

let test_restore_pos () = 
  mass0#move p2 ;
  mass0#restore_pos ;
  assert (mass0#x = 0.) ;
  assert (mass0#y = 500.) ;
  mass0#restore_pos ;
  assert (mass0#x = 275.) ;
  assert (mass0#y = 275.) ;
() ;;

test_move () ;;
test_restore_pos () ;;