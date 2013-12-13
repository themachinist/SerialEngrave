SerialEngrave
========

Introducing the last engraving macro you will ever need. Written to be compatible with Fanuc Macro B format NC code and tested on Fanuc, Haas, and Mori Seiki machines using a standard ISO font.

##Features
* Engrave any letter, number, and three characters (space, dash, and colon)
* Engrave a self-incrementing series of numbers with a single-line of code
* Fanuc compatible

##Setup

Before you call the subprogram you need to setup the Work Coordinate System (WCS), orient the work plane by rotating (G68) the WCS, position the engraving by transforming (G10) the WCS, and setting the text size by scaling (G51) the toolpath. You will also need to set three variables which define the clearance position in between characters, the spacing in between characters, and a counter the program uses to keep track of which character it is engraving. The counter should be reset with each new phrase.

This is an early revision and the code has not been rigorously tested. A list of controls confirmed to be compatible will be updated as the code is tested. Please, review the license prior to using this code for your own projects.

##Usage

See the file DemoProgram.nc


##Character tables

###Numbers
	 0  1  2  3  4  5  6  7  8  9 
	 |  |  |  |  |  |  |  |  |  | 
	10  1  2  3  4  5  6  7  8  9 

####Letters
	a  b  c  d  e  f  g  h  i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z 
	|  |  |  |  |  |  |  |  |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   | 
	1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26 

####Characters
	_  -  :
	|  |  |
	1  2  3
