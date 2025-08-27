(* REF: https://mathematica.stackexchange.com/a/69428/82739 *)
(* FIG-1: x^2-4*y^2 *)
f[x_, y_] := x^2-4*y^2;
sl = ContourPlot[
  f[x, y] == Range[-1, 0.4, 0.2], {x, -3, 3}, {y, -1, 1}, 
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


(* FIG-2: 2/Sqrt[(x+1)^2+y^2] - 2/Sqrt[(x-1)^2+y^2] *)
f[x_, y_] := 2/Sqrt[(x+1)^2+y^2] - 2/Sqrt[(x-1)^2+y^2];
sl = ContourPlot[
  f[x, y] == Range[-1, 1, 0.2], 
  {x, -3, 3}, {y, -3, 3}, 
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