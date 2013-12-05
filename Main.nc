(Setup.nc)
O9110 

M99;


(Engraving.nc)
O9100

 (Modal Function Parameters)
 #100 = 1.0; (Character Height xMultiplier)
 #110 = 0.0; (X Offset Distance)
 #111 = 0.0; (Y Offset Distance)
 #112 = 0.0; (Z Offset Distance)

 (Scaling)
 G51 X0. Y0. Z0. I[#100*1000] J[#110*1000]

 M97 P9150
M99;

(Character selection routine)
O9150
 (If we are engraving a number or character skip to that section)
 IF [#4GE1]GOTON200
 IF [#3GE1]GOTON200
 IF [#19GE1]GOTON200

 N100
 (Letter A)
 IF [#1EQ1]GOTO9201
 N9201 M97 P9201
 GOTO500
 (Letter B)
 IF [#1EQ2]GOTO9202
 N9202 M97 P9202
 GOTO500
 (Letter C)
 IF [#1EQ3]GOTO9203
 N9203 M97 P9203
 GOTO500
 (Letter D)
 IF [#1EQ4]GOTO9204
 N9204 M97 P9204
 GOTO500
 (Letter E)
 IF [#1EQ5]GOTO9205
 N9205 M97 P9205
 GOTO500
 (Letter F)
 IF [#1EQ6]GOTO9206
 N9206 M97 P9206
 GOTO500
 (Letter G)
 IF [#1EQ7]GOTO9207
 N9207 M97 P9207
 GOTO500
 (Letter H)
 IF [#1EQ8]GOTO9208
 N9208 M97 P9208
 GOTO500
 (Letter I)
 IF [#1EQ9]GOTO9209
 N9209 M97 P9209
 GOTO500
 (Letter J)
 IF [#1EQ10]GOTO9210
 N9210 M97 P9210
 GOTO500
 (Letter K)
 IF [#1EQ11]GOTO9211
 N9211 M97 P9211
 GOTO500
 (Letter L)
 IF [#1EQ12]GOTO9212
 N9212 M97 P9212
 GOTO500
 (Letter M)
 IF [#1EQ13]GOTO9213
 N9213 M97 P9213
 GOTO500
 (Letter N)
 IF [#1EQ14]GOTO9214
 N9214 M97 P9214
 GOTO500
 (Letter O)
 IF [#1EQ15]GOTO9215
 N9215 M97 P9215
 GOTO500
 (Letter P)
 IF [#1EQ16]GOTO9216
 N9216 M97 P9216
 GOTO500
 (Letter Q)
 IF [#1EQ17]GOTO9217
 N9217 M97 P9217
 GOTO500
 (Letter R)
 IF [#1EQ18]GOTO9218
 N9218 M97 P9218
 GOTO500
 (Letter S)
 IF [#1EQ19]GOTO9219
 N9219 M97 P9219
 GOTO500
 (Letter T)
 IF [#1EQ20]GOTO9220
 N9220 M97 P9220
 GOTO500
 (Letter U)
 IF [#1EQ21]GOTO9221
 N9221 M97 P9221
 GOTO500
 (Letter V)
 IF [#1EQ22]GOTO9222
 N9222 M97 P9222
 GOTO500
 (Letter W)
 IF [#1EQ23]GOTO9223
 N9223 M97 P9223
 GOTO500
 (Letter X)
 IF [#1EQ24]GOTO9224
 N9224 M97 P9224
 GOTO500
 (Letter Y)
 IF [#1EQ25]GOTO9225
 N9225 M97 P9225
 GOTO500
 (Letter Z)
 IF [#1EQ26]GOTO9226
 N9226 M97 P9226
 GOTO500

 N200
 (Number 0)
 IF [#4EQ10]GOTO9110
 N9110 M97 P9110
 GOTO500
 (Number 1)
 IF [#4EQ1]GOTO9101
 N9101 M97 P9101
 GOTO500
 (Number 2)
 IF [#4EQ2]GOTO9102
 N9102 M97 P9102
 GOTO500
 (Number 3)
 IF [#4EQ3]GOTO9103
 N9103 M97 P9103
 GOTO500
 (Number 4)
 IF [#4EQ4]GOTO9104
 N9104 M97 P9104
 GOTO500
 (Number 5)
 IF [#4EQ5]GOTO9105
 N9105 M97 P9105
 GOTO500
 (Number 6)
 IF [#4EQ6]GOTO9106
 N9106 M97 P9106
 GOTO500
 (Number 7)
 IF [#4EQ7]GOTO9107
 N9107 M97 P9107
 GOTO500
 (Number 8)
 IF [#4EQ8]GOTO9108
 N9108 M97 P9108
 GOTO500
 (Number 9)
 IF [#4EQ9]GOTO9109
 N9109 M97 P9109
 GOTO500

 N300
 (Character Space)
 IF [#3EQ9301]GOTO9301
 N9301 M97 P9301
 GOTO500
 (Character Dash)
 IF [#3EQ9302]GOTO9302
 N9302 M97 P9302
 GOTO500
 (Character Colon)
 IF [#3EQ9303]GOTO9303
 N9303 M97 P9303
 GOTO500

 N400
 (Series)
 IF [#19GE1]GOTO9400
 N9400 M97 P9400
 GOTO500

 N500
M99

(O9###)
(|||| )
(|||> Character Code First Digit)
(||>  Character Code Second Digit)
(|>   Character Type [1:digit,2:letter,3:symbol])
(>    Not Used)

O9400 (Series);
IF [#599NE0]GOTO1
#599=1
N1
(transfer to temporary varibale)
#597 = #599

(This loop uses arithmetic to find the digit we currently need to be engraving)
WHILE[FIX[#597]GT0]DO1
 (Extract digit)
 N2 #598 = FIX[#597 MOD 10]
 (Move to next digit)
 #597 = #597 / 10
 (Move to start position:)
 G52 X[#110+[[#19-1]*.1]] (xPos+[nDigits*.1])
 G0 X0  
 (Engrave the letter)
 M97 P[#598+9100]
 (decrement number of letters to engrave)
 #19= #19 - 1
END1

IF (#599GT#)GOTO3
#599=0 (start over)
N3 #599=#599 + 1
M99;

O9201 (Letter A);
(Move to start position)
 G91 X.0813 Y-.1
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
M99;


O9202 (Letter B);
(Move to start position)
 G91 X.0438 Y-.05
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
M99;


O9203 (Letter C);
(Move to start position)
 G91 X.0813 Y-.1
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
M99;


O9204 (Letter D);
(Move to start position)
 G91 X.0188 Y-.05
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
M99;


O9205 (Letter E);
(Move to start position)
 G91 X.075 Y-.1
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
M99;


O9206 (Letter F);
(Move to start position)
 G91 X.075 Y0
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
M99;


O9207 (Letter G);
(Move to start position)
 G91 X.0813 Y0
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
 G91 X.0188 Y-.1
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
 G91 X.05 Y0
 G1 Z-.01
 Y-.1 F10.
 Z.09 F20.
 G0 Z.1
M99;


O9210 (Letter J);
(Move to start position)
 G91 X.025 Y0.
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
 G91 X.0188 Y0
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
 G91 X.0125 Y-.1
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
 G91 X.0813 Y0
 G1 Z-.01
 Y-.1 F10.
 X.0188 Y0
 Y-.1
 Z.09 F20.
 G0 Z.1
M99;


O9215 (Letter O);
(Move to start position)
 G91 X.0813 Y-.05
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
 G91 X.025 Y-.05
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
 G91 X.0813 Y-.05
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
 G91 X.025 Y-.05
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
 G91 X.025 Y-.0875
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
 G91 X.0813 Y0
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
 G91 X.0188 Y0
 G1 Z-.01
 X.05 Y-.1 F10.
 X.0813 Y0
 Z.09 F20.
 G0 Z.1
M99;


O9223 (Letter W);
(Move to start position)
 G91 X.0125 Y0
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
 G91 X.0813 Y-.1
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
 G91 X.0188 Y0
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
 G91 X.075 Y-.1
 G1 Z-.01
 X.025 F10.
 X.075 Y0
 X.025
 Z.09 F20.
 G0 Z.1
M99;

O9110 (Number 0);
(Move to start position)
 G91 X.025 Y-.05
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
 G91 X.0625 Y-.1
 G1 Z-.01
 Y0 F10.
 X.0375 Y-.025
 Z.09 F20.
 G0 Z.1
M99;


O9102 (Number 2);
(Move to start position)
 G91 X.0813 Y-.1
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
 G91 X.0438 Y-.0438
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
 G91 X.0625 Y0
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
 G91 X.0188 Y-.1
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
 G91 X.0781 Y-.0625
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
 G91 X.075 Y0
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
 G91 X.0781 Y-.0625
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
 G91 X.05 Y-.05
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
 G91 X.075 Y-.0563
 G1 Z-.01 F20.
 X.025 F10.
 Z.09 F20.
 G0 Z.1
M99;

O9303 (Colon);
(Move to start position)
 G91 X.05 Y-.0813
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