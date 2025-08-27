(* REF: https://mathematica.stackexchange.com/a/69428/82739 *)
(* FIG-1: (y-Sqrt[3]*x)*(y+Sqrt[3]*x)*y *)
f[x_, y_] := (y-Sqrt[3]*x)*(y+Sqrt[3]*x)*y;
sl = ContourPlot[
  f[x, y] == Range[-1, 1, 0.2], 
  {x, -2, 2}, {y, -2, 2}, 
  ImageSize -> 400, ContourStyle -> Directive[Black,Thickness[0.001]],
  Frame -> False (*,
  PerformanceGoal\[Rule]"Speed"*)]; (*plot seven streamlines*)

scale = 0.1; (* controls how far to step to the side *)
asl = sl /. 
  gc : GraphicsComplex[p_, __] :> (gc /. 
     Line[ll_] :> {Arrowheads[{{0.02, 0.2}, {0.02, 0.4}, {0.02, 0.6}, {0.02, 0.85}}],
       Arrow[If[
         Less @@ (f[x, y] /. {Thread[{x, y} -> p[[ll[[2]]]]],
             Thread[{x, y} -> 
               p[[First@ll]] + scale Cross[First@Differences[p[[ll[[;; 2]]]]]]
              ]}),
         Reverse[ll], ll]]})

(* FIG-2: *)
(* NO expression, use inkscape to modify chap11-5_I.svg *)