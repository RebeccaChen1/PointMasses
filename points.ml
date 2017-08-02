(* 
                Mutable points with vector arithmetic
                          CS51 Problem Set 7
                         -.-. ... ..... .----
 *)

class point (x0 : float) (y0 : float) =   
object (this)
  val mutable x1 = x0
  val mutable y1 = y0

  method x : float = x1

  method y : float = y1

  method pos : float * float = x1, y1

  method round : int * int = 
    int_of_float (floor (this#x +. 0.5)), int_of_float (floor (this#y +. 0.5))

  method move (p : point) : unit =
    x1 <- p#x ;
	y1 <- p#y 

  method scale (k : float) : point =
	let newx, newy = k *. x1, k *. y1 in
	new point newx newy

  method plus (p : point) : point =	
  	let newx, newy = x1 +. p#x, y1 +. p#y in
  	new point newx newy

  method minus (p : point) : point = 
  	let newx, newy = x1 -. p#x, y1 -. p#y in
  	new point newx newy
 	
  method norm : float = 
  	sqrt((x1 ** 2.) +. (y1 ** 2.))

  method distance (p : point) : float =
  	let diffx, diffy = this#x -. p#x, this#y -. p#y in
  	sqrt((diffx ** 2.) +. (diffy ** 2.))

  method unit_vector : point =
  	new point (this#x /. this#norm) (this#y /. this#norm)  

end

(*======================================================================
Time estimate

Please give us an honest (if approximate) estimate of how long (in
minutes) each part of the problem set took you to complete.  We care
about your responses and will use them to help guide us in creating
future assignments.
......................................................................*)

let minutes_spent_on_part () : int = 120 ;;
