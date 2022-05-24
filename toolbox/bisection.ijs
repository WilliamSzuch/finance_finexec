NB. =========================================================
NB.%bisection.ijs - Bisection methodology for finding a solution to: f(x) = 0
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Toolbox</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/toolbox/bisection.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../bisection.ijs" target="_blank">Script source: bisection.ijs</a>
NB.-<hr>
NB.- Bisection method of solving: f(x) = 0.
NB.- Useful for calculating the money weighted rate of return (mwrr).
NB.- Equations:
NB.- <img alt="NF" src="../eqs/bisection_ijs.gif">
NB.-<hr>


NB. =========================================================
NB.*bisection a - 
NB.- <b>Form:</b> explicit
NB.- Calculate the solution to the function f(x) = 0 if it
NB.- exists is in the range A to B with tolerence TOL
NB.- using the Bisection method.
NB.- The result is two numbers:
NB.-   first number is the approximation for x to the solution f(x) = 0
NB.-   second number of the value of f(x) using the approximation ie: error
NB.- Some useful steps:
NB.- (1) select a suitable tolerence for the function or except default
NB.- (2) check if there is a solution - for example using signchange or
NB.-     plot
NB.- (3) check if there multiple solutions in the range 
NB.-syntax:
NB.+(f)bisection(A;B;[TOL])
NB.+f = function to be solved
NB.+A,B = lower and upper values of initial range
NB.+[TOL] = default tolerence for solution 0.01 
NB.-example:
NB.+ The examples requires:
NB.+ load 'plot'
NB.+ signchange =: [: - ([: */ ([: * >))       NB. signchange(A,B)
NB.+ steps=: {. + (1&{ - {.) * (i.@>: % ])@{:  NB. steps(A,B,N)
NB.+
NB.+   f1 =: _3.12 + [  NB. Simple linear function
NB.+   f1 i. 10         NB. shows there is a solution in range 0 to 9
NB.+_3.12 _2.12 _1.12 _0.12 0.88 1.88 2.88 3.88 4.88 5.88
NB.+   signchange f1(3,5) 
NB.+1  NB. Sign change in the interval (3,5)
NB.+   
NB.+   plot ([;f1) steps(0,10,100) 
NB.+
NB.+   (f1)bisection(0;9;0.001)
NB.+3.12012 0.000117187
NB.-
NB.+   (f1)bisection(0;9)
NB.+3.12891 0.00890625
NB.-
NB.+   (f1)bisection(4;9)
NB.+┌──────────────────────────────────┬─┬─┐
NB.+│*** No sign change in the range : │4│9│
NB.+└──────────────────────────────────┴─┴─┘
NB.-
NB.+ Further examples:
NB.+ f2 =: 3 : '_100 + 10 * *: y'
NB.+ f3 =: 3 : '100 + _10 * *: y'
NB.+ f4 =: 3 : '120 + _10 * *: y'
NB.+ plot ([;f2) steps(1,5,10)
NB.+ plot ([;f3) steps(1,5,10)
NB.+ plot ([;f4) steps(1, 5,10
NB.+ (f2)bisection(1;5;0.001)
NB.+ (f3)bisection(1;5)
NB.+ (f4)bisection(1;5)
NB. ---------------------------------------------------------
bisection =: 1 : 0
signchange =. [: - ([: */ ([: * >))
'TL TR TOR' =. 3{. y,< 0.01
'VL VR' =. u each (TL;TR)
NB. ---------------------------------------------------------
NB. Slope 
SL =. (0 < VL - VR) { _1 1   
if. VL = 0 do. RES =. TL return. end.
if. VR = 0 do. RES =. TR return. end.
if. -. signchange (VL;VR) do. smoutput '*** No sign change in the range : '; y return. end.
TM =. (TL + TR) % 2
VM =. u TM
while. TOR < | VM do. 
  if. (SL*VM) < 0 do.TR =. TM 
                 TM =. (TL + TR) % 2
                 VM =. u TM 
           else. TL =.TM
                 TM =. (TL + TR) % 2
                 VM =. u TM 
           end.
end.
>TM;VM
)

