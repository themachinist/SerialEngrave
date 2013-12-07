O1000

T1
M6
(Move to start position)
G17 G90 G0 X.5 Y-.1 S5000 M3
G43 H1 Z.1
F50.

#130 = -.1 (Depth from start position)
#140 = 0   (Counter)
#150 = 80  (Character Spacing [Percentage])

G65 P9100 A1
G65 P9100 A2
G65 P9100 A3
G65 P9100 A4
G65 P9100 A5
G65 P9100 A6
G65 P9100 A7
G65 P9100 A8
G65 P9100 A9
G65 P9100 A10
G65 P9100 A11
G65 P9100 A12
G65 P9100 A13
G65 P9100 A14
G65 P9100 A15
G65 P9100 A16
G65 P9100 A17
G65 P9100 A18
G65 P9100 A19
G65 P9100 A20
G65 P9100 A21
G65 P9100 A22
G65 P9100 A23
G65 P9100 A24
G65 P9100 A25
G65 P9100 A26
G65 P9100 D1
G65 P9100 D2
G65 P9100 D3
G65 P9100 D4
G65 P9100 D5
G65 P9100 D6
G65 P9100 D7
G65 P9100 D8
G65 P9100 D9
G65 P9100 D10

M30

(Engraving.nc)
O9100
 (Setup Work Coordinate)
 G52 X[#140*[#150/1000]]
 G90 G0 X0. Y0.

 (number)
 IF[#7LT1]GOTO100 (skip this branch)
 M98 P[#7+9100]
 IF[#7GE1]GOTO500 (break)
 N100

 (letter)
 IF[#1LT1]GOTO200
 M98 P[#1+9200] L1
 IF[#1GE1]GOTO500 
 N200

 (character)
 IF[#3LT1]GOTO300
 M98 P[#3+9300] L1
 IF[#3GE1]GOTO500 
 N300

 (series)
 IF[#19LT1]GOTO400
 M98 P9400 L1
 IF[[#7GE1]OR[#1GT1]OR[#3GT1]OR[#19GT1]OR[#21GT1]]GOTO500

 N400
 #3000 = 100 (No parameters entered);
 N500
 #140 = #140 + 1
M99

O9400 (Series);
 IF [#599NE0]GOTO1
 #599=1
 N1
 (Transfer to temporary varibale)
 #597 = #599
 
 (Save the quantity of digits to engrave)
 #141 = [#19-1]

 (This loop uses arithmetic to find the digit we currently need to be engraving)
 WHILE[#19GT0]DO1
  
  (Extract digit)
  N2 #598 = FIX[#597 MOD 10]
  
  (Move to next digit)
  #597 = #597 / 10

  (Move to start position:)
  G52 X[[#140+[#19-1]]*[#150/1000]]
  G90 G0 X0

  (Engrave the number)
  IF[#598EQ0]THEN#598=10
  M98 P[#598+9100]
  (decrement number of letters to engrave)
  #19= #19 - 1
 END1
 
 (Add quantity of digits engraved to counter)
 #140 = #140 + #141 

 IF[#599LT#21]GOTO3
 #599=0 (start over)
 N3 #599=#599 + 1
M99;

O9201 (Letter A);
(Move to start position)
 G90 X.0813 Y-.1
 G91 G1 Z[-[ABS[#130]]] F20. G90
 G90 X.05 Y0 
 X.0188 Y-.1
 G91 G0 Z[ABS[#130]]
 G90 X.0688 Y-.0625
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0313 
 G91 G0 Z[ABS[#130]]
M99


O9202 (Letter B);
(Move to start position)
 G90 X.0438 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 
 X.0625 Y-.0563
 X.0688 Y-.0625
 X.075 Y-.075
 X.0688 Y-.0875
 X.0625 Y-.0938
 X.05 Y-.1
 X.025
 Y0
 X.0438
 X.0563 Y-.0063
 X.0625 Y-.0125
 X.0688 Y-.025
 X.0625 Y-.0375
 X.0563 Y-.0438
 X.0438 Y-.05
 X.025
 G91 G0 Z[ABS[#130]]
M99


O9203 (Letter C);
(Move to start position)
 G90 X.0813 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0438 
 X.0313 Y-.0938
 X.025 Y-.0875
 X.0188 Y-.075
 Y-.025
 X.025 Y-.0125
 X.0313 Y-.0063
 X.0438 Y0
 X.0813
 G91 G0 Z[ABS[#130]]
M99


O9204 (Letter D);
(Move to start position)
 G90 X.0188 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.1 
 X.05
 X.0625 Y-.0938
 X.0688 Y-.0875
 X.075 Y-.075
 Y-.025
 X.0688 Y-.0125
 X.0625 Y-.0063
 X.05 Y0
 X.0188
 Y-.05
 G91 G0 Z[ABS[#130]]
M99


O9205 (Letter E);
(Move to start position)
 G90 X.075 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.025 
 Y0
 X.075
 G91 G0 Z[ABS[#130]]
 G90 X.0625 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 X.025 
 G91 G0 Z[ABS[#130]]
M99


O9206 (Letter F);
(Move to start position)
 G90 X.075 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 X.025 
 Y-.1
 G91 G0 Z[ABS[#130]]
 G90 X.0625 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 X.025 
 G91 G0 Z[ABS[#130]]
M99


O9207 (Letter G);
(Move to start position)
 G90 X.0813 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0438 
 X.0313 Y-.0063
 X.025 Y-.0125
 X.0188 Y-.025
 Y-.075
 X.025 Y-.0875
 X.0313 Y-.0938
 X.0438 Y-.1
 X.0813
 Y-.05
 X.0563
 G91 G0 Z[ABS[#130]]
M99;


O9208 (Letter H);
(Move to start position)
 G90 X.0188 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 Y0 
 G91 G0 Z[ABS[#130]]
 G90 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0813 
 Y0
 G91 G0 Z[ABS[#130]]
 G90 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.05 
 G91 G0 Z[ABS[#130]]
M99;


O9209 (Letter I);
(Move to start position)
 G90 X.05 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.1 
 G91 G0 Z[ABS[#130]]
M99;


O9210 (Letter J);
(Move to start position)
 G90 X.025 Y-.1 
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 
 X.0625 Y-.0938
 X.0688 Y-.0875
 X.075 Y-.075
 Y0
 G91 G0 Z[ABS[#130]]
M99;


O9211 (Letter K);
(Move to start position)
 G90 X.0188 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.1 
 G91 G0 Z[ABS[#130]]
 G90 X.0813 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0188 Y-.0625 
 G91 G0 Z[ABS[#130]]
 G90 X.0813 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0375 Y-.0438 
 G91 G0 Z[ABS[#130]]
M99;


O9212 (Letter L);
 G90 X.025 Y0.
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.1 
 X.075
 G91 G0 Z[ABS[#130]]
M99;


O9213 (Letter M);
(Move to start position)
 G90 X.0125 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 Y0 
 X.05 Y-.05
 X.0875 Y0
 Y-.1
 G91 G0 Z[ABS[#130]]
M99;


O9214 (Letter N);
(Move to start position)
 G90 X.0813 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.1 
 X.0188 Y0
 Y-.1
 G91 G0 Z[ABS[#130]]
M99;


O9215 (Letter O);
(Move to start position)
 G90 X.0813 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.025 
 X.075 Y-.0125
 X.0688 Y-.0063
 X.0563 Y0
 X.0438
 X.0313 Y-.0063
 X.025 Y-.0125
 X.0188 Y-.025
 Y-.075
 X.025 Y-.0875
 X.0313 Y-.0938
 X.0438 Y-.1
 X.0563
 X.0688 Y-.0938
 X.075 Y-.0875
 X.0813 Y-.075
 Y-.05
 G91 G0 Z[ABS[#130]]
M99;


O9216 (Letter P);
(Move to start position)
 G90 X.025 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 
 X.0625 Y-.0438
 X.0688 Y-.0375
 X.075 Y-.025
 X.0688 Y-.0125
 X.0625 Y-.0063
 X.05 Y0
 X.025
 Y-.1
 G91 G0 Z[ABS[#130]]
M99;


O9217 (Letter Q);
(Move to start position)
 G90 X.0813 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.025 
 X.075 Y-.0125
 X.0688 Y-.0063
 X.0563 Y0
 X.0438
 X.0313 Y-.0063
 X.025 Y-.0125
 X.0188 Y-.025
 Y-.075
 X.025 Y-.0875
 X.0313 Y-.0938
 X.0438 Y-.1
 X.0563
 X.0688 Y-.0938
 X.075 Y-.0875
 X.0813 Y-.075
 Y-.05
 G91 G0 Z[ABS[#130]]
 G90 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0625 Y-.0813 
 G91 G0 Z[ABS[#130]]
M99;


O9218 (Letter R);
(Move to start position)
 G90 X.025 Y-.05
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 
 X.0625 Y-.0438
 X.0688 Y-.0375
 X.075 Y-.025
 X.0688 Y-.0125
 X.0625 Y-.0063
 X.05 Y0
 X.025
 Y-.1
 G91 G0 Z[ABS[#130]]
 G90 X.075
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 Y-.05 
 G91 G0 Z[ABS[#130]]
M99;


O9219 (Letter S);
(Move to start position)
 G90 X.025 Y-.0875
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0313 Y-.0938 
 X.0438 Y-.1
 X.05
 X.0625 Y-.0938
 X.0688 Y-.0875
 X.075 Y-.075
 X.0688 Y-.0625
 X.0625 Y-.0563
 X.0375 Y-.0438
 X.0313 Y-.0375
 X.025 Y-.025
 X.0313 Y-.0125
 X.0375 Y-.0063
 X.05 Y0
 X.0563
 X.0688 Y-.0063
 X.075 Y-.0125
 G91 G0 Z[ABS[#130]]
M99;


O9220 (Letter T);
 G90 X.075 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 Y0 
 X.0188
 G91 G0 Z[ABS[#130]]
 G90 X.0813
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 
 G91 G0 Z[ABS[#130]]
M99;


O9221 (Letter U);
(Move to start position)
 G90 X.0813 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.075 
 X.075 Y-.0875
 X.0688 Y-.0938
 X.0563 Y-.1
 X.0438
 X.0313 Y-.0938
 X.025 Y-.0875
 X.0188 Y-.075
 Y0
 G91 G0 Z[ABS[#130]]
M99;


O9222 (Letter V);
(Move to start position)
 G90 X.0188 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 Y-.1 
 X.0813 Y0
 G91 G0 Z[ABS[#130]]
M99;


O9223 (Letter W);
(Move to start position)
 G90 X.0125 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0313 Y-.1 
 X.05 Y0
 X.0688 Y-.1
 X.0875 Y0
 G91 G0 Z[ABS[#130]]
M99;


O9224 (Letter X);
(Move to start position)
 G90 X.0813 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0188 Y0 
 G91 G0 Z[ABS[#130]]
 G90 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0813 Y0 
 G91 G0 Z[ABS[#130]]
M99;


O9225 (Letter Y);
(Move to start position)
 G90 X.0188 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 X.05 Y-.05 
 X.0813 Y0
 G91 G0 Z[ABS[#130]]
 G90 X.05 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.05 
 G91 G0 Z[ABS[#130]]
M99;


O9226 (Letter Z);
(Move to start position)
 G90 X.075 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.025 
 X.075 Y0
 X.025
 G91 G0 Z[ABS[#130]]
M99;

O9110 (Number 0);
(Move to start position)
 G90 X.025 Y-.05
 G91 G1 Z[-[ABS[#130]]] F20. 
 G90 Y-.075 
 X.0313 Y-.0875
 X.0375 Y-.0938
 X.05 Y-.1
 X.0625 Y-.0938
 X.0688 Y-.0875
 X.075 Y-.075
 Y-.025
 X.0688 Y-.0125
 X.0625 Y-.0063
 X.05 Y0
 X.0375 Y-.0063
 X.0313 Y-.0125
 X.025 Y-.025
 Y-.05
 G91 G0 Z[ABS[#130]]
M99;


O9101 (Number 1);
(Move to start position)
 G90 X.0625 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 Y0 
 X.0375 Y-.025
 G91 G0 Z[ABS[#130]]
M99;


O9102 (Number 2);
(Move to start position)
 G90 X.0813 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0188 
 X.075 Y-.0438
 X.0813 Y-.0313
 Y-.025
 X.075 Y-.0125
 X.0688 Y-.0063
 X.0563 Y0
 X.0438
 X.0313 Y-.0063
 X.025 Y-.0125
 X.0188 Y-.025
 G91 G0 Z[ABS[#130]]
M99;


O9103 (Number 3);
(Move to start position)
 G90 X.0438 Y-.0438
 G91 G1 Z[-[ABS[#130]]] F20. 
 G90 X.075 
 X.0813 Y-.0313
 Y-.025
 X.075 Y-.0063
 X.0688 Y0
 X.0188
 G91 G0 Z[ABS[#130]]
 G90 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0688 
 X.075 Y-.0938
 X.0813 Y-.075
 Y-.0563
 X.075 Y-.0438
 G91 G0 Z[ABS[#130]]
M99;


O9104 (Number 4);
(Move to start position)
 G90 X.0625 Y0
 G91 G1 Z[-[ABS[#130]]] F20. 
 G90 X.0188 Y-.075 
 X.0813
 G91 G0 Z[ABS[#130]]
 G90 X.0625 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.0563 
 G91 G0 Z[ABS[#130]]
M99;


O9105 (Number 5);
(Move to start position)
 G90 X.0188 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0688 
 X.075 Y-.0938
 X.0813 Y-.075
 Y-.0625
 X.075 Y-.0438
 X.0688 Y-.0375
 X.0188
 Y0
 X.0813
 G91 G0 Z[ABS[#130]]
M99;


O9106 (Number 6);
(Move to start position)
 G90 X.0781 Y-.0625
 G91 G1 Z[-[ABS[#130]]]
 G90 X.075 Y-.0563 
 X.0688 Y-.05
 X.0563 Y-.0438
 X.0438
 X.0313 Y-.05
 X.025 Y-.0563
 X.0188 Y-.0688
 Y-.075
 X.025 Y-.0875
 X.0313 Y-.0938
 X.0438 Y-.1
 X.0563
 X.0688 Y-.0938
 X.075 Y-.0875
 X.0813 Y-.075
 Y-.0688
 X.0781 Y-.0625
 G91 G0 Z[ABS[#130]]
 G90 X.075 Y0
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0313 Y-.0375 
 X.0188 Y-.0563
 Y-.0688
 G91 G0 Z[ABS[#130]]
M99;


O9107 (Number 7);
(Move to start position)
 G90 X.025 Y-.0125
 G91 G1 Z[-[ABS[#130]]]
 G90 Y0 
 X.075
 X.0375 Y-.1
 G91 G0 Z[ABS[#130]]
M99;


O9108 (Number 8);
(Move to start position)
 G90 X.0781 Y-.0625
 G91 G1 Z[-[ABS[#130]]] F20. 
 G90 X.075 Y-.0563 
 X.0688 Y-.05
 X.0563 Y-.0438
 X.0438
 X.0313 Y-.05
 X.025 Y-.0563
 X.0188 Y-.0688
 Y-.075
 X.025 Y-.0875
 X.0313 Y-.0938
 X.0438 Y-.1
 X.0563
 X.0688 Y-.0938
 X.075 Y-.0875
 X.0813 Y-.075
 Y-.0688
 X.0781 Y-.0625
 G91 G0 Z[ABS[#130]]
 G90 X.0563 Y-.0438
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0688 Y-.0375 
 X.075 Y-.025
 Y-.0188
 X.0688 Y-.0063
 X.0563 Y0
 X.0438
 X.0313 Y-.0063
 X.025 Y-.0188
 Y-.025
 X.0313 Y-.0375
 X.0438 Y-.0438
 G91 G0 Z[ABS[#130]]
M99;


O9109 (Number 9);
(Move to start position)
 G90 X.05 Y-.05
 G91 G1 Z[-[ABS[#130]]] F20. 
 G90 X.075 
 X.0813 Y-.0313
 Y-.025
 X.075 Y-.0063
 X.0625 Y0
 X.0375
 X.025 Y-.0063
 X.0188 Y-.025
 Y-.0313
 X.025 Y-.05
 X.05
 G91 G0 Z[ABS[#130]]
 G90 X.0188 Y-.1
 G91 G1 Z[-[ABS[#130]]]
 G90 X.0625 Y-.075 
 X.075 Y-.05
 G91 G0 Z[ABS[#130]]
M99;

O9301 (Space);

M99;

O9302 (Dash);
(Move to start position)
 G90 X.075 Y-.0563
 G91 G1 Z[-[ABS[#130]]] F20. 
 G90 X.025 
 G91 G0 Z[ABS[#130]]
M99;

O9303 (Colon);
(Move to start position)
 G90 X.05 Y-.0813
 G91 G1 Z[-[ABS[#130]]] F20. 
 G90 Y-.0875 
 G91 G0 Z[ABS[#130]]
 G90 Y-.0625
 G91 G1 Z[-[ABS[#130]]]
 G90 Y-.0688 
 G91 G0 Z[ABS[#130]]
M99;
