(each number needs to return to the start position [X0.Y0.] after)
(machining to facilitate incrementing the letter position using)
(incremental moves)

(Engraving.nc)
O9100
 (number)
 IF[#7LT1]GOTO100 (skip this branch)
 M98 P[#7+9100]
 IF[#7GE1]GOTO400 (break)
 
 N100
 (letter)
 IF[#1LT1]GOTO200
 M98 P[#1+9200] L1
 IF[#1GE1]GOTO400 
 
 N200
 (character)
 IF[#3LT1]GOTO300
 M98 P[#3+9300] L1
 IF[#3GE1]GOTO400 
 
 N300
 (series)
 IF[#19LT1]GOTO400
 M98 P9400 L1
 
 N400
 G91 X.1
 #140 = #140 + 1
M99

O9400 (Series);
 (If the counter has not been set reset it to zero)
 IF [#599NE0]GOTO1
 #599=1
 N1

 (Transfer counter to temporary variable)
 (so we can perform operations on it without)
 (modifying the original value)
 #597 = #599

 (Calculate the number of zeros we need to engrave ahead of the serial number)
 (#19 is the S parameter we provided with the macro call)
 #141 = [#19-1]
 
 (This loop uses arithmetic to find the digit we currently need to be engraving)
 WHILE[#19GT0]DO1
  (Extract digit)
  N2 #598 = FIX[[[#597*10] MOD 100]/10]
  (Move to next digit)
  #597 = #597 / 10
  IF[#598GT[#597*10]]THEN#598=[#598-1]
  IF[[#598EQ0]AND[#597GT0.01]]THEN#598=9

  (Move to start position)
  G91 G0 X[[#140+[#19-1]]*[#135/1000]]

  (Engrave the number)
  IF[#598EQ0]THEN#598=10
  M98 P[ABS[#598]+9100]
  (decrement number of letters to engrave)
  #19= #19 - 1
 END1
 (Add quantity of digits engraved to counter)
 #140 = #140 + #141 
 N3 #599=#599 + 1
M99;

O9201 (Letter A);
(Move to start position)
 G91 X0.0813 Y-0.1
 G1 Z[-[ABS[#130]]] F20. G90
 X-0.0313 Y0.1 
 X-0.0312 Y-0.1
 G0 Z[ABS[#130]]
 X0.0500 Y0.0375
 G1 Z[-[ABS[#130]]]
 X-0.0375 
 G0 Z[ABS[#130]]
M99


O9202 (Letter B);
(Move to start position)
 G91 X0.0125 Y0.0125
 G1 Z[-[ABS[#130]]]
 X0.0062 
 X0.0125 Y-0.0063
 X0.0063 Y-0.0062
 X0.0062 Y-0.0125
 X-0.0062 Y-0.0125
 X-0.0063 Y-0.0063
 X-0.0125 Y-0.0062
 X-0.0250
 Y0.1000
 X0.0188
 X0.0125 Y-0.0063
 X0.0062 Y-0.0062
 X0.0063 Y-0.0125
 X-0.0063 Y-0.0125
 X-0.0062 Y-0.0063
 X-0.0125 Y-0.0062
 X-0.0188
 G0 Z[ABS[#130]]
M99


O9203 (Letter C);
(Move to start position)
 G91 X0.0563 Y-0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0375 
 X-0.0125 Y0.0062
 X-0.0063 Y0.0063
 X-0.0062 Y0.0125
 Y0.0500
 X0.0062 Y0.0125
 X0.0063 Y0.0062
 X0.0125 Y0.0063
 X0.0375
 G0 Z[ABS[#130]]
M99


O9204 (Letter D);
(Move to start position)
 G91 X-0.0625 Y-0.0500
 G1 Z[-[ABS[#130]]]
 Y-0.0500 
 X0.0312
 X0.0125 Y0.0062
 X0.0063 Y0.0063
 X0.0062 Y0.0125
 Y0.0500
 X-0.0062 Y0.0125
 X-0.0063 Y0.0062
 X-0.0125 Y0.0063
 X-0.0312
 Y-0.0500
 G0 Z[ABS[#130]]
M99


O9205 (Letter E);
(Move to start position)
 G91 X0.0562 Y-0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0500 
 Y0.1000
 X0.0500
 G0 Z[ABS[#130]]
 X-0.0125 Y-0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0375 
 G0 Z[ABS[#130]]
M99


O9206 (Letter F);
(Move to start position)
 G91 X0.0500 Y0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0500 
 Y-0.1000
 G0 Z[ABS[#130]]
 X0.0375 Y0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0375 
 G0 Z[ABS[#130]]
M99


O9207 (Letter G);
(Move to start position)
 G91 X0.0563 Y0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0375 
 X-0.0125 Y-0.0063
 X-0.0063 Y-0.0062
 X-0.0062 Y-0.0125
 Y-0.0500
 X0.0062 Y-0.0125
 X0.0063 Y-0.0063
 X0.0125 Y-0.0062
 X0.0375
 Y0.0500
 X-0.0250
 G0 Z[ABS[#130]]
M99;


O9208 (Letter H);
(Move to start position)
 G91 X-0.0375 Y-0.0500
 G1 Z[-[ABS[#130]]]
 Y0.1000 
 G0 Z[ABS[#130]]
 Y-0.0500
 G1 Z[-[ABS[#130]]]
 X0.0625 
 Y0.0500
 G0 Z[ABS[#130]]
 Y-0.1000
 G1 Z[-[ABS[#130]]]
 Y0.0500 
 G0 Z[ABS[#130]]
M99;


O9209 (Letter I);
(Move to start position)
 G91 X-0.0313 Y0.0500
 G1 Z[-[ABS[#130]]]
 Y-0.1000 
 G0 Z[ABS[#130]]
M99;


O9210 (Letter J);
(Move to start position)
 G91 X-0.0250 Y0.0000 
 G1 Z[-[ABS[#130]]]
 X0.0250 
 X0.0125 Y0.0062
 X0.0063 Y0.0063
 X0.0062 Y0.0125
 Y0.0750
 G0 Z[ABS[#130]]
M99;


O9211 (Letter K);
(Move to start position)
 G91 X-0.0562 Y0.0000
 G1 Z[-[ABS[#130]]]
 Y-0.1000 
 G0 Z[ABS[#130]]
 X0.0625 Y0.1000
 G1 Z[-[ABS[#130]]]
 X-0.0625 Y-0.0625 
 G0 Z[ABS[#130]]
 X0.0625 Y-0.0375
 G1 Z[-[ABS[#130]]]
 X-0.0438 Y0.0562 
 G0 Z[ABS[#130]]
M99;


O9212 (Letter L);
 X-0.0125 Y0.0000
 G1 Z[-[ABS[#130]]]
 Y-0.0562 
 X0.0500
 G0 Z[ABS[#130]]
M99;


O9213 (Letter M);
(Move to start position)
 G91 X-0.0625 Y0.0000
 G1 Z[-[ABS[#130]]]
 Y0.1000 
 X0.0375 Y-0.0500
 X0.0375 Y0.0500
 Y-0.1000
 G0 Z[ABS[#130]]
M99;


O9214 (Letter N);
(Move to start position)
 G91 X-0.0062 Y0.1000
 G1 Z[-[ABS[#130]]]
 Y-0.1000 
 X-0.0625 Y0.1000
 Y-0.1000
 G0 Z[ABS[#130]]
M99;


O9215 (Letter O);
(Move to start position)
 G91 X0.0625 Y0.0500
 G1 Z[-[ABS[#130]]]
 Y0.0250 
 X-0.0063 Y0.0125
 X-0.0062 Y0.0062
 X-0.0125 Y0.0063
 X-0.0125
 X-0.0125 Y-0.0063
 X-0.0063 Y-0.0062
 X-0.0062 Y-0.0125
 Y-0.0500
 X0.0062 Y-0.0125
 X0.0063 Y-0.0063
 X0.0125 Y-0.0062
 X0.0125
 X0.0125 Y0.0062
 X0.0062 Y0.0063
 X0.0063 Y0.0125
 Y0.0250
 G0 Z[ABS[#130]]
M99;


O9216 (Letter P);
(Move to start position)
 G91 X-0.0563 Y0.0000
 G1 Z[-[ABS[#130]]]
 X0.0250 
 X0.0125 Y0.0062
 X0.0063 Y0.0063
 X0.0062 Y0.0125
 X-0.0062 Y0.0125
 X-0.0063 Y0.0062
 X-0.0125 Y0.0063
 X-0.0250
 Y-0.1000
 G0 Z[ABS[#130]]
M99;


O9217 (Letter Q);
(Move to start position)
 G91 X0.0563 Y0.0500
 G1 Z[-[ABS[#130]]]
 Y0.0250 
 X-0.0063 Y0.0125
 X-0.0062 Y0.0062
 X-0.0125 Y0.0063
 X-0.0125
 X-0.0125 Y-0.0063
 X-0.0063 Y-0.0062
 X-0.0062 Y-0.0125
 Y-0.0500
 X0.0062 Y-0.0125
 X0.0063 Y-0.0063
 X0.0125 Y-0.0062
 X0.0125
 X0.0125 Y0.0062
 X0.0062 Y0.0063
 X0.0063 Y0.0125
 Y0.0250
 G0 Z[ABS[#130]]
 Y-0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0188 Y0.0187 
 G0 Z[ABS[#130]]
M99;


O9218 (Letter R);
(Move to start position)
 G91 X-0.0375 Y0.0313
 G1 Z[-[ABS[#130]]]
 X0.0250 
 X0.0125 Y0.0062
 X0.0063 Y0.0063
 X0.0062 Y0.0125
 X-0.0062 Y0.0125
 X-0.0063 Y0.0062
 X-0.0125 Y0.0063
 X-0.0250
 Y-0.1000
 G0 Z[ABS[#130]]
 X0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0250 Y0.0500 
 G0 Z[ABS[#130]]
M99;


O9219 (Letter S);
(Move to start position)
 G91 X-0.0250 Y-0.0375
 G1 Z[-[ABS[#130]]]
 X0.0063 Y-0.0063 
 X0.0125 Y-0.0062
 X0.0062
 X0.0125 Y0.0062
 X0.0063 Y0.0063
 X0.0062 Y0.0125
 X-0.0062 Y0.0125
 X-0.0063 Y0.0062
 X-0.0250 Y0.0125
 X-0.0062 Y0.0063
 X-0.0063 Y0.0125
 X0.0063 Y0.0125
 X0.0062 Y0.0062
 X0.0125 Y0.0063
 X0.0063
 X0.0125 Y-0.0063
 X0.0062 Y-0.0062
 G0 Z[ABS[#130]]
M99;


O9220 (Letter T);
 G91 X0.0000 Y-0.0875
 G1 Z[-[ABS[#130]]]
 Y0.1000 
 X-0.0562
 G0 Z[ABS[#130]]
 X0.0625
 G1 Z[-[ABS[#130]]]
 X-0.0313 
 G0 Z[ABS[#130]]
M99;


O9221 (Letter U);
(Move to start position)
 G91 X0.0313 Y0.0000
 G1 Z[-[ABS[#130]]]
 Y-0.0750 
 X-0.0063 Y-0.0125
 X-0.0062 Y-0.0063
 X-0.0125 Y-0.0062
 X-0.0125
 X-0.0125 Y0.0062
 X-0.0063 Y0.0063
 X-0.0062 Y0.0125
 Y0.0750
 G0 Z[ABS[#130]]
M99;


O9222 (Letter V);
(Move to start position)
 G91 X0.0000 Y0.0000
 G1 Z[-[ABS[#130]]]
 X0.0312 Y-0.1000 
 X0.0313 Y0.1000
 G0 Z[ABS[#130]]
M99;


O9223 (Letter W);
(Move to start position)
 G91 X-0.0688 Y0.0000
 G1 Z[-[ABS[#130]]]
 X0.0188 Y-0.1000 
 X0.0187 Y0.1000
 X0.0188 Y-0.1000
 X0.0187 Y0.1000
 G0 Z[ABS[#130]]
M99;


O9224 (Letter X);
(Move to start position)
 G91 X-0.0062 Y-0.1000
 G1 Z[-[ABS[#130]]]
 X-0.0625 Y0.1000 
 G0 Z[ABS[#130]]
 Y-0.1000
 G1 Z[-[ABS[#130]]]
 X0.0625 Y0.1000 
 G0 Z[ABS[#130]]
M99;


O9225 (Letter Y);
(Move to start position)
 G91 X-0.0625 Y0.0000
 G1 Z[-[ABS[#130]]]
 X0.0312 Y-0.0500 
 X0.0313 Y0.0500
 G0 Z[ABS[#130]]
 X-0.0313 Y-0.1000
 G1 Z[-[ABS[#130]]]
 Y0.0500 
 G0 Z[ABS[#130]]
M99;


O9226 (Letter Z);
(Move to start position)
 G91 X0.0250 Y-0.0500
 G1 Z[-[ABS[#130]]]
 X-0.0500 
 X0.0500 Y0.1000
 X-0.0500
 G0 Z[ABS[#130]]
M99;

O9110 (Number 0);
(Move to start position)
 G91 X0.0000 Y-0.0500
 G1 Z[-[ABS[#130]]] F20. 
 Y-0.0250 
 X0.0063 Y-0.0125
 X0.0062 Y-0.0063
 X0.0125 Y-0.0062
 X0.0125 Y0.0062
 X0.0063 Y0.0063
 X0.0062 Y0.0125
 Y0.0500
 X-0.0062 Y0.0125
 X-0.0063 Y0.0062
 X-0.0125 Y0.0063
 X-0.0125 Y-0.0063
 X-0.0062 Y-0.0062
 X-0.0063 Y-0.0125
 Y-0.0250
 G0 Z[ABS[#130]]
M99;


O9101 (Number 1);
(Move to start position)
 G91 X0.0375 Y-0.0500
 G1 Z[-[ABS[#130]]]
 Y0.1000 
 X-0.0250 Y-0.0250
 G0 Z[ABS[#130]]
M99;


O9102 (Number 2);
(Move to start position)
 G91 X0.0438 Y-0.0750
 G1 Z[-[ABS[#130]]]
 X-0.0625 
 X0.0562 Y0.0562
 X0.0063 Y0.0125
 Y0.0063
 X-0.0063 Y0.0125
 X-0.0062 Y0.0062
 X-0.0125 Y0.0063
 X-0.0125
 X-0.0125 Y-0.0063
 X-0.0063 Y-0.0062
 X-0.0062 Y-0.0125
 G0 Z[ABS[#130]]
M99;


O9103 (Number 3);
(Move to start position)
 G91 X0.0250 Y-0.0188
 G1 Z[-[ABS[#130]]] F20. 
 X0.0312 
 X0.0063 Y0.0125
 Y0.0063
 X-0.0063 Y0.0187
 X-0.0062 Y0.0063
 X-0.0500
 G0 Z[ABS[#130]]
 Y-0.1000
 G1 Z[-[ABS[#130]]]
 X0.0500 
 X0.0062 Y0.0062
 X0.0063 Y0.0188
 Y0.0187
 X-0.0063 Y0.0125
 G0 Z[ABS[#130]]
M99;


O9104 (Number 4);
(Move to start position)
 G91 X-0.0125 Y0.0438
 G1 Z[-[ABS[#130]]] F20. 
 X-0.0437 Y-0.0750 
 X0.0625
 G0 Z[ABS[#130]]
 X-0.0188 Y-0.0250
 G1 Z[-[ABS[#130]]]
 Y0.0437 
 G0 Z[ABS[#130]]
M99;


O9105 (Number 5);
(Move to start position)
 G91 X-0.0437 Y-0.0437
 G1 Z[-[ABS[#130]]]
 X0.0500 
 X0.0062 Y0.0062
 X0.0063 Y0.0188
 Y0.0125
 X-0.0063 Y0.0187
 X-0.0062 Y0.0063
 X-0.0500
 Y0.0375
 X0.0625
 G0 Z[ABS[#130]]
M99;


O9106 (Number 6);
(Move to start position)
 G91 X-0.0032 Y-0.0625
 G1 Z[-[ABS[#130]]]
 X-0.0031 Y0.0062 
 X-0.0062 Y0.0063
 X-0.0125 Y0.0062
 X-0.0125
 X-0.0125 Y-0.0062
 X-0.0063 Y-0.0063
 X-0.0062 Y-0.0125
 Y-0.0062
 X0.0062 Y-0.0125
 X0.0063 Y-0.0063
 X0.0125 Y-0.0062
 X0.0125
 X0.0125 Y0.0062
 X0.0062 Y0.0063
 X0.0063 Y0.0125
 Y0.0062
 X-0.0032 Y0.0063
 G0 Z[ABS[#130]]
 X-0.0031 Y0.0625
 G1 Z[-[ABS[#130]]]
 X-0.0437 Y-0.0375 
 X-0.0125 Y-0.0188
 Y-0.0125
 G0 Z[ABS[#130]]
M99;


O9107 (Number 7);
(Move to start position)
 G91 X0.0062 Y0.0563
 G1 Z[-[ABS[#130]]]
 Y0.0125 
 X0.0500
 X-0.0375 Y-0.1000
 G0 Z[ABS[#130]]
M99;


O9108 (Number 8);
(Move to start position)
 G91 X0.0406 Y0.0375
 G1 Z[-[ABS[#130]]] F20. 
 X-0.0031 Y0.0062 
 X-0.0062 Y0.0063
 X-0.0125 Y0.0062
 X-0.0125
 X-0.0125 Y-0.0062
 X-0.0063 Y-0.0063
 X-0.0062 Y-0.0125
 Y-0.0062
 X0.0062 Y-0.0125
 X0.0063 Y-0.0063
 X0.0125 Y-0.0062
 X0.0125
 X0.0125 Y0.0062
 X0.0062 Y0.0063
 X0.0063 Y0.0125
 Y0.0062
 X-0.0032 Y0.0063
 G0 Z[ABS[#130]]
 X-0.0218 Y0.0187
 G1 Z[-[ABS[#130]]]
 X0.0125 Y0.0063 
 X0.0062 Y0.0125
 Y0.0062
 X-0.0062 Y0.0125
 X-0.0125 Y0.0063
 X-0.0125
 X-0.0125 Y-0.0063
 X-0.0063 Y-0.0125
 Y-0.0062
 X0.0063 Y-0.0125
 X0.0125 Y-0.0063
 G0 Z[ABS[#130]]
M99;


O9109 (Number 9);
(Move to start position)
 G91 X0.0062 Y-0.0062
 G1 Z[-[ABS[#130]]] F20. 
 X0.0250 
 X0.0063 Y0.0187
 Y0.0063
 X-0.0063 Y0.0187
 X-0.0125 Y0.0063
 X-0.0250
 X-0.0125 Y-0.0063
 X-0.0062 Y-0.0187
 Y-0.0063
 X0.0062 Y-0.0187
 X0.0250
 G0 Z[ABS[#130]]
 X-0.0312 Y-0.0500
 G1 Z[-[ABS[#130]]]
 X0.0437 Y0.0250 
 X0.0125 Y0.0250
 G0 Z[ABS[#130]]
M99;

O9301 (Space);

M99;

O9302 (Dash);
(Move to start position)
 G91 X0.0000 Y-0.0063
 G1 Z[-[ABS[#130]]] F20. 
 X-0.0500 
 G0 Z[ABS[#130]]
M99;

O9303 (Colon);
(Move to start position)
 G91 X0.0250 Y-0.0250
 G1 Z[-[ABS[#130]]] F20. 
 Y-0.0062 
 G0 Z[ABS[#130]]
 Y0.0250
 G1 Z[-[ABS[#130]]]
 Y-0.0063 
 G0 Z[ABS[#130]]
M99;
