O1000 (SerialEngrave)
G69 G17 G90 
G91 G28 Z0. 

(REQUIRED PARAMETERS)
(probably going to move these into their own .nc since they are required)

(retract height here)
#130=-0.1

(character spacing)
#132=0.085 

(character rotation angle)
#133=35.

(set lot number)
#140=4.

(set tool and offset)
T11 H11

(rpm and feed rate)
S6000 F30.

(XYZ origin)
G90 G10 L2 P5 X-8.243 Y-7.355 Z-17.526
(XYZ adjustment)
G91 G10 L2 P5 X-.2 Y.73 Z-.0035
G90 

M06
G17 G90 G58 G00 X0. Y0. M03
G68 X0 Y0 R[#133]
G43 Z[ABS[#130]]
/M08
G65 P9100 D10.  
G65 P9100 D[#140]
G65 P9100 C2. 
G65 P9100 S3. 
 
G00 Z3. M09 
G91 G28 G00 Z0. Y0. 
M30
