(*
                       Point masses with forces
                          CS51 Problem Set 7
                         -.-. ... ..... .----
 *)

open Points ;;
open Graphics ;;
     
(* Bound the locations of the masses within a frame of fixed size *)
let cFRAMESIZE = 500 ;;

class mass =
  let currid = ref 0 in
  fun (initx: float) (inity: float) (m: float) ->

  object (this)

    (* A mass is located at a point *)
    inherit point initx inity as super

    (* To store previous values of mass *)
    val mutable prevx = initx
    val mutable prevy = inity

    (* Unique identifier for the mass *)
    val id = currid := !currid + 1; !currid
    method get_id = id

    (* The mass itself *)
    val mass = m

    method !move (p : point) : unit =
      prevx <- super#x ; 
      prevy <- super#y ;
      let size = float_of_int cFRAMESIZE in
      (* checks if n is within range *)
      let check_val (n : float) : float =
        if n > size then size
        else if n < 0. then 0.
        else n
      in
      let p_checked = new point (check_val p#x) (check_val p#y) in
      super#move p_checked

    method restore_pos : unit =
      let p = new point prevx prevy in
      this#move p

    (* Forces on the mass *)
    val frc : point = new point 0. 0.    (* accumulator for forces *)

    method set_force (p: point) : unit =
      frc#move p
    method reset_force : unit = this#set_force (new point 0. 0.)
    method get_force = frc
    method add_force p =
      frc#move (frc#plus p)
    method apply_force =
      this#move (this#plus (this#get_force#scale (1. /. mass)));
      this#reset_force
    method scale_force factor =
      this#set_force (this#get_force#scale factor)

    (* I/O methods *)
    method reveal =
      let x, y = this#round in
      Graphics.draw_circle x y 3

    method describe =
      let x, y = this#pos in
      Printf.printf "Mass %d: %f, %f\n" this#get_id x y;
      flush stdout
  end
