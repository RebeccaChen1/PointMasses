(*
                        A Sugar Glider's Phylogeny
         Inspired by my friends constantly shooting down my idea to adopt 
                and raise two sugar gliders while I'm at Harvard
                          CS51 Problem Set 7
                         -.-. ... ..... .----
 *)

open List ;;

open Points ;;
open Masses ;;
open Controls ;;
open Graphobj ;;
open Graphdraw ;;
open Testgraphs ;;

let phylogeny () =

  graph { labels = ["" ; "" ; "" ; "" ; "" ; 
                    "" ; "" ; "opossum" ; "dunnart" ; 
                    "sugar glider" ; "kangaroo" ; "" ; 
                    "" ; "" ; "" ; "" ; "" ; "" ; "chicken" ; "lizard"] ;

          positions = [ (50, 400) ; (50, 300) ; 
                        (100, 325) ; (100, 300) ; 
                        (100, 275) ; (150, 275) ; 
                        (150, 200) ; (150, 400) ; 
                        (200, 325) ; (200, 275) ;
                        (200, 100) ; (200, 350) ;
                        (0, 350) ; (0, 75) ; 
                        (200, 90) ;(200, 75) ; 
                        (200, 25) ; (50, 350) ; 
                        (250, 75) ; (250, 25)] ;

          edges = [ (12, 13) ; (0, 7) ; (1, 3) ; (2, 3) ; 
                    (3, 4) ; (2, 8) ; (4, 5) ; (11, 9) ; 
                    (11, 5) ; (6, 10) ; (5, 6) ; (12, 17) ;
                    (17, 0) ; (17, 1) ; (13, 15) ; (15, 14) ;
                    (15, 16) ; (16, 19) ; (14, 18)] } ;;


let _ = phylogeny () ;;