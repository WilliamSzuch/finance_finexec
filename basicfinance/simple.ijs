NB. =========================================================
NB.%simple.ijs - Simple interest definitions for constant simple interest rates
NB.- Script: ~addons/finance/finexec/basicfinance/simple.ijs
NB.- Contributor: William Szuch
NB.- Updated: 30/1/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Basic Finance</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Definitions for solving simple interest rate problems for
NB.- a constant simple interest rate over a period.
NB.- <a href="../eqs/simple_ijs_eqs.html" target="_blank">Script equations: simple.ijs</a>
NB.- <a href="../simple.ijs" target="_blank">Script source: simple.ijs</a>
NB.-<hr>


NB. =========================================================
NB.*r m - 
NB.- <b>Form:</b> tacit
NB.- Present value of 1 payable in 1 time unit 
NB.- for a simple interest rate S.
NB.- <a href="../eqs/r_eq.html" target="_blank">Equation: r(S)</a>
NB.-syntax:
NB.+r(S)
NB.+S = simple interest rate for one time unit
NB.-example:
NB.+   r(0.05)
NB.+0.952381
NB.-
NB.+   r(0 0.01 0.05 0.09)
NB.+1 0.990099 0.952381 0.917431
NB. ---------------------------------------------------------
r =: [: % 1 + ]


NB. =========================================================
NB.*rt d -
NB.- <b>Form:</b> tacit
NB.- Present value of 1 payable in a period of T time units
NB.- for a constant simple interest rate S over the period.
NB.- <a href="../eqs/rt_eq.html" target="_blank">Equation: (S)rt(T)</a>
NB.-syntax:
NB.+(S)rt(T) 
NB.+S = constant simple interest rate for one time unit over the period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0.05)rt(10)
NB.+0.666667
NB.-
NB.+   (0.05)rt(0.1)
NB.+0.995025
NB.-
NB.+   (0.05)rt(0.1 0.5 0.75 1)
NB.+0.995025 0.97561 0.963855 0.952381
NB.-
NB.+   (0 0.05 0.07)rt(0 0.1 0.5 0.75 1)
NB.+1        1        1
NB.+1 0.995025 0.993049
NB.+1  0.97561 0.966184
NB.+1 0.963855 0.950119
NB.+1 0.952381 0.934579
NB. ---------------------------------------------------------
rt =: 1 % 1 + *"_ 0


NB. =========================================================
NB.*s m -
NB.- <b>Form:</b> tacit
NB.- Future value of 1 in 1 time unit 
NB.- for a simple interest rate S.
NB.- <a href="../eqs/s_eq.html" target="_blank">Equation: s(S)</a>
NB.- syntax:
NB.+   s(S)
NB.+S = simple interest rate for one time unit
NB.-example:
NB.+   s(0.05)
NB.+1.05
NB.-
NB.+   s(0 0.05 0.1 0.15)
NB.+1 1.05 1.1 1.15
NB. ---------------------------------------------------------
s =: 1 + ] 


NB. =========================================================
NB.*st d -
NB.- <b>Form:</b> tacit
NB.- Future value of 1 in T time units 
NB.- for a simple interest rate S.
NB.- <a href="../eqs/st_eq.html" target="_blank">Equation: (S)st(T)</a>
NB.-syntax:
NB.+(S)st(T)
NB.+S = constant simple interest rate for one time unit over the period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0.05)st(0.6)
NB.+1.03
NB.-
NB.+   (0.05)st(0 0.5 1.5)
NB.+1 1.025 1.075
NB.-
NB.+   (0.05 0.07)st(0.1 0.5 0.75 1)
NB.+ 1.005  1.007
NB.+ 1.025  1.035
NB.+1.0375 1.0525
NB.+  1.05   1.07
NB. ---------------------------------------------------------
st =: (1 + *"_ 0)


NB. =========================================================
NB.*sirate m - 
NB.- <b>Form:</b> tacit
NB.- Calculate the simple interest rate for a 
NB.- time unit from the amount at the start and end of a period. 
NB.- <a href="../eqs/sirate_eq.html" target="_blank">Equation: sirate(A0;A1;T)</a>
NB.-syntax:
NB.+ sirate(A0;A1;T)
NB.+A0 = amount at start of a period
NB.+A1 = amount at end of the period
NB.+T =  period in time units 
NB.-example: 
NB.+  sirate(100;110;1) 
NB.+0.1   
NB.-
NB.+   sirate(100;90;1)
NB.+ _0.1
NB.-
NB.+   sirate(100;103;(91%365))
NB.+0.12033
NB.-
NB.+   sirate(100;110;0.5 0.7 1 1.1) 
NB.+0.2 0.142857 0.1 0.0909091
NB. ---------------------------------------------------------
sirate =: (>@:(1&{) - >@:(0&{)) % >@:(2&{) * >@:(0&{)
NB. ---------------------------------------------------------
Note 'T sirate'
selb0 =. >@:(0&{)
selb1 =. >@:(1&{)
selb2 =. >@:(2&{)
m0 =. selb1 - selb0
m1 =. selb2 * selb0
sirate =. (m0 % m1) f.
)


NB. =========================================================
NB.*sirate_E m Explicit form of sirate
NB. ---------------------------------------------------------
sirate_E =: 3 : 0
'A0 A1 T' =. y
(A1 - A0)%T*A0
)


NB. =========================================================
NB.*effective_simple d -
NB.- <b>Form:</b> explicit
NB.- Calculate the effective interest rate for a time from the 
NB.- simple interest rate for a time unit over a period. 
NB.- <a href="../eqs/effective_simple_eq.html" target="_blank">Equation: (S)effective_simple(T)</a>
NB.-syntax:
NB.+(S)effective_simple(T)
NB.+S = constant simple interest rate for one time unit over the period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0.05)effective_simple(1)
NB.+0.05
NB.-
NB.+   (0.05)effective_simple(3)
NB.+0.0476896
NB.-
NB.+   (0.05)effective_simple(i. 10)
NB.+0 0.05 0.0488088 0.0476896 0.0466351 0.0456396 0.0446975 0.0438044 0.042956 0.0421489
NB. ---------------------------------------------------------
effective_simple =:  4 : 0
_1+^ (^.(1+x*y))%y
)


NB. =========================================================
NB.*simple_effective d -
NB.- <b>Form:</b> explicit
NB.- Calculate the simple interest rate for a time from the 
NB.- effective interest rate for a time unit over a period. 
NB.- <a href="../eqs/simple_effective_eq.html" target="_blank">Equation: (S)simple_effective(T)</a>
NB.-syntax:
NB.+(E)simple_effective(T)
NB.+E = constant effective interest rate for one time unit over the period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0.05)simple_effective(1)
NB.+0.05
NB.-
NB.+   (0.05)simple_effective(3)
NB.+0.0525417
NB.-
NB.+   (0.05)simple_effective(i. 10)
NB.+0 0.05 0.05125 0.0525417 0.0538766 0.0552563 0.0566826 0.0581572 0.0596819 0.0612587
NB. ---------------------------------------------------------
simple_effective =:  4 : 0
(_1+(1+x)^y)%y
)


NB. =========================================================
NB.*effective_simple_T d Tacit form of effective_simple
NB. ---------------------------------------------------------
effective_simple_T =: _1 + [: ^ ] %~ [: (^.) 1 + *
NB. ---------------------------------------------------------
Note 'T effective_simple_T'
effective_simple_T =.  13 : '_1+^ (^.(1+x*y))%y'
)


NB. =========================================================
NB.*simple_effective_T d Tacit form of simple_effective
NB. ---------------------------------------------------------
simple_effective_T =: ] %~ _1 + ] ^~ 1 + [
NB. ---------------------------------------------------------
Note 'T imple_effective_T'
simple_effective_T =.  13 : '(_1+(1+x)^y)%y'
)




NB. =========================================================



