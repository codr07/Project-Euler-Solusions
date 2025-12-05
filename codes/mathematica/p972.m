N = 12;
pts = Select[
   Tuples[Range[-N, N], 2],
   Norm[#] < N &
];

det[{x1_, y1_}, {x2_, y2_}, {x3_, y3_}] :=
 x1*(y2*(x3^2 + y3^2) - y3*(x2^2 + y2^2)) -
 y1*(x2*(x3^2 + y3^2) - x3*(x2^2 + y2^2)) +
 (x1^2 + y1^2)*(x2*y3 - x3*y2);

T = Total[
   Boole[
     det @@@ # == 0
     ] &
   /@ Subsets[pts, {3}]
] * 6;

Print[T];
