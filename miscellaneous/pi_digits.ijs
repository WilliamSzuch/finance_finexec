NB. =========================================================
NB.%pi_digits.ijs - Calculator digits of pi
NB.-<script src="../js/miscellaneous_links.js"></script>
NB.- Contributor: William Szuch
NB.- Updated: 2023 03 07
NB.- Depend: 
NB.- Definitions: loaded to locale base. 
NB.- Status: dev  
NB.- <a href="../pi_digits.ijs" target="_blank">Script source: pi_digits.ijs</a>
NB.-<hr>
NB.- Calculate the digits of pi using several methods
NB.- as a string and integer and compare the results.
NB.- See: video by Rob Therriault on Youtube.
NB.- <a href='https://www.youtube.com/watch?v=vyILnD0e2IE'>Bob's pi video</a>
NB.- See: Vocabulary at: x:
NB.- Also see Notes in the script for comparison calculations.
NB.-<hr>


NB. =========================================================
NB. pi_1000001.ijs -  file with string for 1000001 digits of pi.
NB. ie: 31415926535897932384...
NB. View file for details:
NB. open '~Finexec_dev/pi_digits/pi_1000001.ijs'
NB. PI_1000001
load '~Finexec_dev/pi_digits/pi_1000001.ijs'


NB. =========================================================
NB.*bigpi m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b>nil 
NB.- Definition taken from:
NB.- ~addon/math/misc/bigpi.ijs
NB.- Calculate several digits of pi
NB.- from Borwein
NB.- version: 1.0.0
NB.- Calculate pi to different levels of of precision
NB.-syntax:
NB.+bigpi(N)
NB.+N = number of steps
NB.+    each step adds about 14 digits of precision
NB.-
NB.-example:
NB.+  #": bigpi 72    NB.(gives 1009 digits of pi)
NB.+1009
NB. ---------------------------------------------------------
bigpi=: 3 : 0
a=. 545140134x
b=. 640320x ^ 3
c=. 13591409x
d=. 6541681608x
n=. i. >: x: y
s=. (!6*n) * c + a * n
e=. (!3*n) * ((!n)^3) * b^n
m=. {:e
f=. d * -/ (s * m) % e
k=. (a*m) * <.@%: b * 10x^28*y
k <.@% f
)


NB. =========================================================
NB.*pi_s m -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Calculate digits of pi as a string
NB.- Taken from Vocabulary x:
NB.-syntax:
NB.+pi_s(N)
NB.+N = number of digits of pi as a string
NB.-
NB.-example:
NB.+   pi_s 20
NB.+31415926535897932384 
NB. ---------------------------------------------------------
pi_s =: [: ": [: <.@o. 10 ^ [: x: <:   


NB. =========================================================
NB.*pi_n m -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Calculate digits of pi as an integer number
NB.-syntax:
NB.+pi_n(N)
NB.+N = number of digits of pi
NB.-
NB.-example:
NB.+   pi_n 20
NB.+31415926535897932384 
NB. ---------------------------------------------------------
pi_n =: [: <.@o. 10 ^ [: x: <: 


NB. =========================================================
NB.pi_R m -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Calculate digits of pi as an integer number 
NB.- As in video by Rob Therriault
NB.-syntax:
NB.+pi_R(N)
NB.+N = number of digits of pi
NB.-
NB.-example:
NB.+   pi_R 20
NB.+31415926535897932384
NB. ---------------------------------------------------------
pi_R =: <. @ o.@ (10x ^ <:)


NB. =========================================================
Note 'Compare pi_n and pi_R integer values'
(pi_n = pi_R) 10000
1
(pi_n = pi_R) 100000  NB. This takes several minutes
1
NB. pi_n and pi_R results are the same.
)


NB. =========================================================
Note 'Compare strings at 10000 digits'
Z_10k      =: 10000 {. PI_1000001   NB. Base string
BIGPI_10k  =: 10000 {. ": bigpi 720
PI_S_10k   =: pi_s 10000
PI_R_10k   =: ": pi_R 10000 

+/ Z_10k = BIGPI_10k
10000

+/Z_10k = PI_S_10k
9917

+/Z_10k = PI_R_10k
9917

+/PI_S_10k = PI_R_10k
10000

+/BIGPI_10k = PI_S 10k
9917

(Z_10k = PI_S_10k) i. 0
9905
NB. Difference start at 9905 digits in PI_S_10k and PI_R_10k
)


NB. =========================================================
Note 'Compare strings at 50000 digits'
Z_50k     =: 50000 {. PI_1000001    NB. Base string
BIGPI_50k =: 50000 {. ": bigpi 720 * 5
PI_50k    =: pi_s 50000

+/Z_50k = BIGPI_50k
50000

+/Z_50k = PI_50k
49529

+/BIGPI_50k = PI_50k
49529

(Z_50k = PI_50k) i. 0
49485
NB. Difference starts at 49485 in PI50k
)


NB. =========================================================
Note 'Compare strings'

   +/ (1129 {.PI_1000001) = ( pi_s 1129)
1128

   +/ (2000 {.PI_1000001) = ( pi_s 2000)
1998

   +/ (1129 {.PI_1000001) = 1129 {.": bigpi 750
1129

)
