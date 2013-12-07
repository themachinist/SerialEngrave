O1000

T1
M6
G17 G90 G0 X.5 Y-.1 S5000 M3

#140 = 0
#150 = 80 (CHARACTER SPACING [PERCENTAGE])

G65 P9100 A1
G65 P9100 D10
G65 P9100 D1
G65 P9100 C2
G65 P9100 S3 U20
G65 P9100 C2
G65 P9100 D10

M30

(Engraving.nc)
O9100
 (SETUP WORK COORDINATE)
 G52 X[#140*[#150/1000]]
 G0 X0. Y0.

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
 (transfer to temporary varibale)
 #597 = #599

 (This loop uses arithmetic to find the digit we currently need to be engraving)
 (WHILE[FIX[#597]GT0]DO1)
 WHILE[#19GT0]DO1
  (Extract digit)
  N2 #598 = FIX[#597 MOD 10]
  (Move to next digit)
  #597 = #597 / 10
  (Move to start position:)
  G52 X[[[#140+[#19-1]]*[#150/1000]]]
  G0 X0  
  (Engrave the NUMBER)
  IF[#598EQ0]THEN#598=10
  M98 P[#598+9100]
  (decrement number of letters to engrave)
  #19= #19 - 1
 END1

 IF[#599LT#21]GOTO3
 #599=0 (start over)
 N3 #599=#599 + 1
M99;

O9201 (Letter A);
(Move to start position)
 G90 X.0813 Y-.1
 G1 Z-.01 F20.
 X.05 Y0 F10.
 X.0188 Y-.1
 Z.09 F20.
 G0 Z.1
 X.0688 Y-.0625
 G1 Z-.01
 X.0313 F10.
 Z.09 F20.
 G0 Z.1
M99


O9202 (Letter B);
(Move to start position)
 G90 X.0438 Y-.05
 G1 Z-.01
 X.05 F10.
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
 Z.09 F20.
 G0 Z.1
M99


O9203 (Letter C);
(Move to start position)
 G90 X.0813 Y-.1
 G1 Z-.01
 X.0438 F10.
 X.0313 Y-.0938
 X.025 Y-.0875
 X.0188 Y-.075
 Y-.025
 X.025 Y-.0125
 X.0313 Y-.0063
 X.0438 Y0
 X.0813
 Z.09 F20.
 G0 Z.1
M99


O9204 (Letter D);
(Move to start position)
 G90 X.0188 Y-.05
 G1 Z-.01
 Y-.1 F10.
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
 Z.09 F20.
 G0 Z.1
M99


O9205 (Letter E);
(Move to start position)
 G90 X.075 Y-.1
 G1 Z-.01
 X.025 F10.
 Y0
 X.075
 Z.09 F20.
 G0 Z.1
 X.0625 Y-.05
 G1 Z-.01
 X.025 F10.
 Z.09 F20.
 G0 Z.1
M99


O9206 (Letter F);
(Move to start position)
 G90 X.075 Y0
 G1 Z-.01
 X.025 F10.
 Y-.1
 Z.09 F20.
 G0 Z.1
 X.0625 Y-.05
 G1 Z-.01
 X.025 F10.
 Z.09 F20.
 G0 Z.1
M99


O9207 (Letter G);
(Move to start position)
 G90 X.0813 Y0
 G1 Z-.01
 X.0438 F10.
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
 Z.09 F20.
 G0 Z.1
M99;


O9208 (Letter H);
(Move to start position)
 G90 X.0188 Y-.1
 G1 Z-.01
 Y0 F10.
 Z.09 F20.
 G0 Z.1
 Y-.05
 G1 Z-.01
 X.0813 F10.
 Y0
 Z.09 F20.
 G0 Z.1
 Y-.1
 G1 Z-.01
 Y-.05 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9209 (Letter I);
(Move to start position)
 G90 X.05 Y0
 G1 Z-.01
 Y-.1 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9210 (Letter J);
(Move to start position)
 G90 X.025 Y0.
 G1 Z-.01
 X.05 F10.
 X.0625 Y-.0938
 X.0688 Y-.0875
 X.075 Y-.075
 Y0
 Z.09 F20.
 G0 Z.1
M99;


O9211 (Letter K);
(Move to start position)
 G90 X.0188 Y0
 G1 Z-.01
 Y-.1 F10.
 Z.09 F20.
 G0 Z.1
 X.0813 Y0
 G1 Z-.01
 X.0188 Y-.0625 F10.
 Z.09 F20.
 G0 Z.1
 X.0813 Y-.1
 G1 Z-.01
 X.0375 Y-.0438 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9212 (Letter L);
 X.025
 G1 Z-.01
 Y-.1 F10.
 X.075
 Z.09 F20.
 G0 Z.1
M99;


O9213 (Letter M);
(Move to start position)
 G90 X.0125 Y-.1
 G1 Z-.01
 Y0 F10.
 X.05 Y-.05
 X.0875 Y0
 Y-.1
 Z.09 F20.
 G0 Z.1
M99;


O9214 (Letter N);
(Move to start position)
 G90 X.0813 Y0
 G1 Z-.01
 Y-.1 F10.
 X.0188 Y0
 Y-.1
 Z.09 F20.
 G0 Z.1
M99;


O9215 (Letter O);
(Move to start position)
 G90 X.0813 Y-.05
 G1 Z-.01
 Y-.025 F10.
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
 Z.09 F20.
 G0 Z.1
M99;


O9216 (Letter P);
(Move to start position)
 G90 X.025 Y-.05
 G1 Z-.01
 X.05 F10.
 X.0625 Y-.0438
 X.0688 Y-.0375
 X.075 Y-.025
 X.0688 Y-.0125
 X.0625 Y-.0063
 X.05 Y0
 X.025
 Y-.1
 Z.09 F20.
 G0 Z.1
M99;


O9217 (Letter Q);
(Move to start position)
 G90 X.0813 Y-.05
 G1 Z-.01
 Y-.025 F10.
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
 Z.09 F20.
 G0 Z.1
 Y-.1
 G1 Z-.01
 X.0625 Y-.0813 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9218 (Letter R);
(Move to start position)
 G90 X.025 Y-.05
 G1 Z-.01
 X.05 F10.
 X.0625 Y-.0438
 X.0688 Y-.0375
 X.075 Y-.025
 X.0688 Y-.0125
 X.0625 Y-.0063
 X.05 Y0
 X.025
 Y-.1
 Z.09 F20.
 G0 Z.1
 X.075
 G1 Z-.01
 X.05 Y-.05 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9219 (Letter S);
(Move to start position)
 G90 X.025 Y-.0875
 G1 Z-.01
 X.0313 Y-.0938 F10.
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
 Z.09 F20.
 G0 Z.1
M99;


O9220 (Letter T);
 Y-.1
 G1 Z-.01
 Y0 F10.
 X.0188
 Z.09 F20.
 G0 Z.1
 X.0813
 G1 Z-.01
 X.05 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9221 (Letter U);
(Move to start position)
 G90 X.0813 Y0
 G1 Z-.01
 Y-.075 F10.
 X.075 Y-.0875
 X.0688 Y-.0938
 X.0563 Y-.1
 X.0438
 X.0313 Y-.0938
 X.025 Y-.0875
 X.0188 Y-.075
 Y0
 Z.09 F20.
 G0 Z.1
M99;


O9222 (Letter V);
(Move to start position)
 G90 X.0188 Y0
 G1 Z-.01
 X.05 Y-.1 F10.
 X.0813 Y0
 Z.09 F20.
 G0 Z.1
M99;


O9223 (Letter W);
(Move to start position)
 G90 X.0125 Y0
 G1 Z-.01
 X.0313 Y-.1 F10.
 X.05 Y0
 X.0688 Y-.1
 X.0875 Y0
 Z.09 F20.
 G0 Z.1
M99;


O9224 (Letter X);
(Move to start position)
 G90 X.0813 Y-.1
 G1 Z-.01
 X.0188 Y0 F10.
 Z.09 F20.
 G0 Z.1
 Y-.1
 G1 Z-.01
 X.0813 Y0 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9225 (Letter Y);
(Move to start position)
 G90 X.0188 Y0
 G1 Z-.01
 X.05 Y-.05 F10.
 X.0813 Y0
 Z.09 F20.
 G0 Z.1
 X.05 Y-.1
 G1 Z-.01
 Y-.05 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9226 (Letter Z);
(Move to start position)
 G90 X.075 Y-.1
 G1 Z-.01
 X.025 F10.
 X.075 Y0
 X.025
 Z.09 F20.
 G0 Z.1
M99;

O9110 (Number 0);
(Move to start position)
 G90 X.025 Y-.05
 G1 Z-.01 F20.
 Y-.075 F10.
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
 Z.09 F20.
 G0 Z.1
M99;


O9101 (Number 1);
(Move to start position)
 G90 X.0625 Y-.1
 G1 Z-.01
 Y0 F10.
 X.0375 Y-.025
 Z.09 F20.
 G0 Z.1
M99;


O9102 (Number 2);
(Move to start position)
 G90 X.0813 Y-.1
 G1 Z-.01
 X.0188 F10.
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
 Z.09 F20.
 G0 Z.1
M99;


O9103 (Number 3);
(Move to start position)
 G90 X.0438 Y-.0438
 G1 Z-.01 F20.
 X.075 F10.
 X.0813 Y-.0313
 Y-.025
 X.075 Y-.0063
 X.0688 Y0
 X.0188
 Z.09 F20.
 G0 Z.1
 Y-.1
 G1 Z-.01
 X.0688 F10.
 X.075 Y-.0938
 X.0813 Y-.075
 Y-.0563
 X.075 Y-.0438
 Z.09 F20.
 G0 Z.1
M99;


O9104 (Number 4);
(Move to start position)
 G90 X.0625 Y0
 G1 Z-.01 F20.
 X.0188 Y-.075 F10.
 X.0813
 Z.09 F20.
 G0 Z.1
 X.0625 Y-.1
 G1 Z-.01
 Y-.0563 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9105 (Number 5);
(Move to start position)
 G90 X.0188 Y-.1
 G1 Z-.01
 X.0688 F10.
 X.075 Y-.0938
 X.0813 Y-.075
 Y-.0625
 X.075 Y-.0438
 X.0688 Y-.0375
 X.0188
 Y0
 X.0813
 Z.09 F20.
 G0 Z.1
M99;


O9106 (Number 6);
(Move to start position)
 G90 X.0781 Y-.0625
 G1 Z-.01
 X.075 Y-.0563 F10.
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
 Z.09 F20.
 G0 Z.1
M99;


O9107 (Number 7);
(Move to start position)
 G90 X.075 Y0
 G1 Z-.01
 X.0313 Y-.0375 F10.
 X.0188 Y-.0563
 Y-.0688
 Z.09 F20.
 G0 Z.1
 X.025 Y-.0125
 G1 Z-.01
 Y0 F10.
 X.075
 X.0375 Y-.1
 Z.09 F20.
 G0 Z.1
M99;


O9108 (Number 8);
(Move to start position)
 G90 X.0781 Y-.0625
 G1 Z-.01 F20.
 X.075 Y-.0563 F10.
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
 Z.09 F20.
 G0 Z.1
 X.0563 Y-.0438
 G1 Z-.01
 X.0688 Y-.0375 F10.
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
 Z.09 F20.
 G0 Z.1
M99;


O9109 (Number 9);
(Move to start position)
 G90 X.05 Y-.05
 G1 Z-.01 F20.
 X.075 F10.
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
 Z.09 F20.
 G0 Z.1
 X.0188 Y-.1
 G1 Z-.01
 X.0625 Y-.075 F10.
 X.075 Y-.05
 Z.09 F20.
 G0 Z.1
M99;

O9301 (Space);
G0 Z.1
X.1 Y0.
M99;

O9302 (Dash);
(Move to start position)
 G90 X.075 Y-.0563
 G1 Z-.01 F20.
 X.025 F10.
 Z.09 F20.
 G0 Z.1
M99;

O9303 (Colon);
(Move to start position)
 G90 X.05 Y-.0813
 G1 Z-.01 F20.
 Y-.0875 F10.
 Z.09 F20.
 G0 Z.1
 Y-.0625
 G1 Z-.01
 Y-.0688 F10.
 Z.09 F20.
 G0 Z.1
M99;
