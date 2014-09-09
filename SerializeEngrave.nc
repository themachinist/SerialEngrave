(Engraving.nc)
:9100
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
G91 G0 X[ABS[#132]]
M99

:O9400 (SERIES)

(If the counter is not set reset it to one)
IF[#529NE0]GOTO1  
#529=1 
N1  

(Transfer counter to temporary variable) 
(so we can perform operations on it without) 
(modifying the original value) 
#527=#529
 
(Calculate the number of zeros we need to engrave ahead of the serial number)
(#19 is the S parameter we provided with the macro call) 
#141=[#19-1] 
 
(Move to first digit start position) 
G91 G0 X[[#19]*[#132]] 
 
WHILE[#19GT0]DO1
  (Find digit to engrave)
  N2 #528=FIX[[#527]MOD10]

  (NEXT)
  #527=FIX[#527/10]

  (Move to start position)
  G91 G0 X[-[ABS[#132]]] 

  (If the digit is a zero run program 9110)
  IF[#528EQ0]THEN#528=10 

  (Engrave Digit) 
  M98 P[ABS[#528]+9100] 

  (Decrement number of letters to engrave)
  #19=#19-1
END1

 (Increment Counter)
#529=#529+1

M99

:9201 (Letter A);
(Move to start position)
G91 G0 X0.0813 Y-0.1
G1 Z[-[ABS[#130]]]
X-0.0313 Y0.1 
X-0.0312 Y-0.1
G0 Z[ABS[#130]]
X0.0500 Y0.0375
G1 Z[-[ABS[#130]]]
X-0.0375 
G0 Z[ABS[#130]]
X-0.0313 Y0.0625
M99

:9202 (Letter B);
(Move to start position)
G91 G0 X0.0438 Y-0.05
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
X-0.025 Y0.05
M99

:9203 (Letter C);
(Move to start position)
G91 G0 X0.0875 Y-0.100
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
X-0.0875
M99

:9204 (Letter D);
(Move to start position)
G91 G0 X0.025 Y-0.0500
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
X-0.0250 Y0.0500
M99

:9205 (Letter E);
(Move to start position)
G91 G0 X0.075 Y-0.100
G1 Z[-[ABS[#130]]]
X-0.0500 
Y0.1000
X0.0500
G0 Z[ABS[#130]]
X-0.0125 Y-0.0500
G1 Z[-[ABS[#130]]]
X-0.0375 
G0 Z[ABS[#130]]
X-0.0250 Y0.0500
M99

:9206 (Letter F);
(Move to start position)
G91 G0 X0.075 Y0.0000
G1 Z[-[ABS[#130]]]
X-0.0500 
Y-0.1000
G0 Z[ABS[#130]]
X0.0375 Y0.0500
G1 Z[-[ABS[#130]]]
X-0.0375 
G0 Z[ABS[#130]]
X-0.025 Y0.05
M99

:9207 (Letter G);
(Move to start position)
G91 G0 X0.075 Y0.0000
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
X-0.0500 Y0.0500
M99;

:9208 (Letter H);
(Move to start position)
G91 G0 X0.0250 Y-0.100
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
X-0.0875 Y0.05
M99;

:9209 (Letter I);
(Move to start position)
G91 G0 X0.0500 Y0.0000
G1 Z[-[ABS[#130]]]
Y-0.1000 
G0 Z[ABS[#130]]
X-0.05 Y0.1000
M99;

:9210 (Letter J);
(Move to start position)
G91 G0 X.025 Y-0.1000 
G1 Z[-[ABS[#130]]]
X0.0250 
X0.0125 Y0.0062
X0.0063 Y0.0063
X0.0062 Y0.0125
Y0.0750
G0 Z[ABS[#130]]
X-0.075
M99;

:9211 (Letter K);
(Move to start position)
G91 G0 X0.0250 Y0.0000
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
X-0.0437 Y0.0438
M99;

:9212 (Letter L);
G91 G0 X0.025 Y0.0000
G1 Z[-[ABS[#130]]]
Y-0.1 
X0.0500
G0 Z[ABS[#130]]
X-0.0750 Y0.1000
M99;

:9213 (Letter M);
(Move to start position)
G91 G0 X0.0125 Y-0.1000
G1 Z[-[ABS[#130]]]
Y0.1000 
X0.0375 Y-0.0500
X0.0375 Y0.0500
Y-0.1000
G0 Z[ABS[#130]]
X-0.0875 Y0.1000
M99;

:9214 (Letter N);
(Move to start position)
G91 G0 X0.075 Y0.0000
G1 Z[-[ABS[#130]]]
Y-0.1000 
X-0.0625 Y0.1000
Y-0.1000
G0 Z[ABS[#130]]
G0 X-0.0125 Y0.1000
M99;

:9215 (Letter O);
(Move to start position)
G91 G0 X0.075 Y-0.0500
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
X-0.075 Y0.05
M99;

:9216 (Letter P);
(Move to start position)
G91 G0 X0.0250 Y-0.0500
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
X-0.0250 Y0.1000
M99;

:9217 (Letter Q);
(Move to start position)
G91 G0 X0.075 Y-0.0500
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
X-0.0562 Y0.0813
M99;

:9218 (Letter R);
(Move to start position)
G91 G0 X0.0125 Y-0.0500
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
X-0.0375 Y0.05
M99;

:9219 (Letter S);
(Move to start position)
G91 G0 X0.0187 Y-.0875
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
X-0.0687 Y0.0125
M99;

:9220 (Letter T);
G91 G0 X0.0500 Y-0.1000
G1 Z[-[ABS[#130]]]
Y0.1000 
G0 Z[ABS[#130]]
X0.025
G1 Z[-[ABS[#130]]]
X-0.0625 
G0 Z[ABS[#130]]
X-0.0125
M99;

:9221 (Letter U);
(Move to start position)
G91 X0.08125 Y0.0000
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
X-0.0188
M99;

:9222 (Letter V);
(Move to start position)
G91 G0 X0.0125 Y0.0000
G1 Z[-[ABS[#130]]]
X0.0312 Y-0.1000 
X0.0313 Y0.1000
G0 Z[ABS[#130]]
X-0.075
M99;

:9223 (Letter W);
(Move to start position)
G91 G0 X0.0125 Y0.0000
G1 Z[-[ABS[#130]]]
X0.0188 Y-0.1000 
X0.0187 Y0.1000
X0.0188 Y-0.1000
X0.0187 Y0.1000
G0 Z[ABS[#130]]
M99;

:9224 (Letter X);
(Move to start position)
G91 G0 X0.0625 Y-0.1000
G1 Z[-[ABS[#130]]]
X-0.0625 Y0.1000 
G0 Z[ABS[#130]]
Y-0.1000
G1 Z[-[ABS[#130]]]
X0.0625 Y0.1000 
G0 Z[ABS[#130]]
X-0.0625
M99;

:9225 (Letter Y);
(Move to start position)
G91 G0 X0.0000 Y0.0000
G1 Z[-[ABS[#130]]]
X0.0312 Y-0.0500 
X0.0313 Y0.0500
G0 Z[ABS[#130]]
X-0.0313 Y-0.1000
G1 Z[-[ABS[#130]]]
Y0.0500 
G0 Z[ABS[#130]]
G0 X-0.0312 Y0.0500
M99;


:9226 (Letter Z);
(Move to start position)
G91 G0 X0.050 Y-0.100
G1 Z[-[ABS[#130]]]
X-0.0500 
X0.0500 Y0.1000
X-0.0500
G0 Z[ABS[#130]]
M99;

:9110 (Number 0);
(Move to start position)
G91 G0 X0.0250 Y-0.0500
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
X-0.0250 Y0.0500
M99;

:9101 (Number 1);
(Move to start position)
G91 G0 X0.0500 Y-0.1000
G1 Z[-[ABS[#130]]]
Y0.1000 
X-0.0250 Y-0.0250
G0 Z[ABS[#130]]
X-0.0250 Y0.0250
M99;

:9102 (Number 2);
(Move to start position)
G91 G0 X0.075 Y-0.1000
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
X-0.0125 Y0.025
M99;

:9103 (Number 3);
(Move to start position)
G91 G0 X0.0375 Y-0.0438
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
X-0.0687 Y0.0438
M99;

:9104 (Number 4);
(Move to start position)
G91 G0 X0.0500 Y0.0000
G1 Z[-[ABS[#130]]] F20. 
X-0.0437 Y-0.0750 
X0.0625
G0 Z[ABS[#130]]
X-0.0188 Y-0.0250
G1 Z[-[ABS[#130]]]
Y0.0437 
G0 Z[ABS[#130]]
X-0.05 Y0.0563
M99;

:9105 (Number 5);
(Move to start position)
G91 G0 X0.0187 Y-0.1000
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
X-0.0813
M99;

:9106 (Number 6);
(Move to start position)
G91 G0 X0.075 Y-0.0625
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
X-0.0157 Y0.0688
M99;

:9107 (Number 7);
(Move to start position)
G91 G0 X0.0125 Y-0.0125
G1 Z[-[ABS[#130]]]
Y0.0125 
X0.0500
X-0.0375 Y-0.1000
G0 Z[ABS[#130]]
X-0.025 Y0.1
M99;

:9108 (Number 8);
(Move to start position)
G91 G0 X0.0718 Y-0.0625
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
X-0.0375 Y0.0438
M99;

:9109 (Number 9);
(Move to start position)
G91 G0 X0.0437 Y-0.0500
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
X-0.0687 Y0.0500
M99;

:9301 (Space);

M99;

O9302 (Dash)
(Move to start position) 
G91 G0 X0.0625 Y-0.05  
G1 Z[-[ABS[#130]]]F20. 
X-0.05  
G0 Z[ABS[#130]] 
X-0.025 Y0.0500  
M99 

:9303 (Colon);
(Move to start position)
G91 G0 X0.0250 Y-0.0375
G1 Z[-[ABS[#130]]] F20. 
Y-0.0062 
G0 Z[ABS[#130]]
Y0.0250
G1 Z[-[ABS[#130]]]
Y-0.0063 
G0 Z[ABS[#130]]
X-0.025 Y0.025
M99;

