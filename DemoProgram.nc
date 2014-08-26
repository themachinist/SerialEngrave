O1000 (SerialEngrave)
G69 G17 G90 
G91 G28 Z0. 
T11 M06  
(Set retract height here)
#130=-0.1
(Set character spacing here)
#132=0.085 
(Set lot number here)
#140=4.
(Set XYZ here)
G90 G10 L2 P5 X-8.243 Y-7.355 Z-17.526
(Adjust XYZ here)
G91 G10 L2 P5 X-.2 Y.73 Z-.0035
G90 
 
G17 G90 G58 G00 X0. Y0. S6000 M03  
G68 X0 Y0 R212.5 
G43 H11 Z[ABS[#130]] 
/M08  
F30.  
G65 P9100 D10.  
G65 P9100 D[#140]
G65 P9100 C2. 
G65 P9100 S3. 
 
G00 Z3. M09 
G91 G28 G00 Z0. Y0. 
M30
