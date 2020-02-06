NB. =========================================================
NB.%mwrr.ijs - Money weighted rate of rerurn (internal rate of return)
NB.- Script: ~addons/finance/finexec/ipm/mwrr.ijs
NB.- Contributor: William Szuch
NB.- Updated: 3/2/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Basic Finance</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Definitions to calculate the money weighted rate of return for a time unit.  
NB.- Also referred to as the internal rate of return.
NB.- External cash flow:
NB.-   cash inflow positive (eg: 100 10)
NB.-   cash outflow negative (eg: _10 _12)
NB.- If a solution exits it is in the range [_1,_] where _ is infinity.
NB.- <a href="../eqs/mwrr_ijs_eqs.html" target="_blank">Script equations: mwrr.ijs</a>
NB.- <a href="../mwrr.ijs" target="_blank">Script source: mwrr.ijs</a>
NB.-<hr>


NB. =========================================================
NB.*mwr v - 
NB.- <b>Form:</b> explicit
NB.- Calculate the money weighted rate of return for a non-periodic 
NB.- cash flow.
NB.- The money weighted rate of return is the effective interest rate for
NB.- the time unit of the cash flow.
NB.- The money weighted rate of return is calculated for the solution to
NB.- the equation that the present value of the cach flow is zero. 
NB.- (1) constant time units
NB.- (2) money weighted rate of return calculated by Newton-Raphson method.
NB.- (3) tolerance 1e_6
NB.- (4) non periodic cash flow
NB.- (5) Maximum iterations 15
NB.- <a href="../eqs/mwr_eq.html" target="_blank">Equation: ([I])mwr(C;T)</a>
NB.-syntax:
NB.+([I])mwr(C;T)
NB.+[I] = optional initial trial value (decimal interest rate) 
NB.+      default = 0 
NB.+C  = non-periofic cash flow 
NB.+     must have at least one change of sign 
NB.+T = time of the cash flow in time units
NB.-example:
NB.+ mwr(_1 1;0 1)
NB.+0
NB.-
NB.+  mwr(_1 1.5;0 1)
NB.+0.5
NB.-
NB.+  mwr(_10 10 5;0 1 1.5)
NB.+0.419643
NB.-
NB.+  mwr(_10 10 5 5;0 1 1.5)
NB.+┌───────────────────────────────────────┐
NB.+│*** cash flow and time do not match ***│
NB.+└───────────────────────────────────────┘
NB.-
NB.+  mwr(_10 10 5 5 _5 _5 5);(0 1 1.5 3.5 6 7 8)
NB.+0.507807
NB. ---------------------------------------------------------
mwr=: 3 : 0
0 mwr y
:
E=. %>:x
'C T'=. y
TOL =. 1e_6
MAX=. 15
if. -. (#C)=(#T) do. smoutput <'*** Cash flow and time do not match ***' return. end.
if. 2>#C do. smoutput <'*** Cash flow must have at least two items ***' return. end.
if. -. *./_1 1 e.*C do. smoutput < '*** No sign change in cash flow ***' return. end.
DF=. C* T
mp=. +/ . *
while.
  R=. E - (C mp E ^ T) % DF mp E ^ T - 1
  TOL < |E-R do.
  E=. R
  if. 0=MAX=. <:MAX do. smoutput <'*** Maximum number iterations exceeded 15 ***' return. end.
end.
<:%R
)


NB. =========================================================
NB.*mwrPeriodic v -
NB.- <b>Form:</b> explicit
NB.- Calculate the money weighted rate of return for a time unit 
NB.- for a periodic cash flow.
NB.- The money weighted rate of return is the effective interest rate for
NB.- the time unit of the cash flow.
NB.- The money weighted rate of return is calculated for the solution to
NB.- the equation that the present value of the cach flow is zero. 
NB.- (1) constant time units
NB.- (2) money weighted rate of return calculated by Newton-Raphson method.
NB.- (3) tolerance 1e_6
NB.- (4) periodical cash flow
NB.- (5) Maximum iterations 15
NB.- <a href="../eqs/mwrPeriodic_eq.html" target="_blank">Equation: ([I])mwrPeriodic(C)</a>
NB.-syntax:
NB.+([I])mwrPeriodic(C)
NB.+[I] = optional initial trial value (decimal rate)
NB.+      default = 0 
NB.+C   = periodic cash flow starting at time unit= 0 
NB.+      and increasing by uniform steps of one time unit for each cash flow 
NB.+      must have at least one change of sign
NB.-example:
NB.+   mwrPeriodic(_1 1.1)     
NB.+0.1
NB.-
NB.+   mwrPeriodic(_1 2)
NB.+1
NB.-
NB.+   mwrPeriodic(_1 0.9) 
NB.+_0.1
NB.-
NB.+   mwrPeriodic(1 1 _2)
NB.+0
NB.-
NB.+   mwrPeriodic(10 10 10 _30)
NB.+0
NB.-
NB.+   mwrPeriodic(10 10 10 _40)
NB.+0.150911
NB.-
NB.+   mwrPeriodic(_100 10 10 12 12 23 23 23 23 25 30 120)
NB.+0.164739
NB.-
NB.+   mwrPeriodic(20 20 10 10 12 12 23 23 23 23 25 30 _250 12)
NB.+_2.25588
NB. ---------------------------------------------------------
mwrPeriodic =: 3 : 0
0 mwrPeriodic y
:
E=. %>:x
C=. ,y
TOL=. 1e_6
MAX=. 15
if. 2>#C do. smoutput <'*** Cash flow must have at least two items ***' return. end.
if. -. *./_1 1 e.*C do. smoutput <'*** No sign change in cash flow ***' return. end.
C=. (|.C),:|.1|.C*i.#C
while. TOL<|E-R=. E-%/E#.C do. E =. R
  if. 0=MAX=. <:MAX do. smoutput <'*** Maximum number of iterations exceeded 15 ***' return. end.
end.
<:% R
)


NB. =========================================================
NB.*mwrDates v -
NB.- <b>Form:</b> explicit
NB.- Calculate the money weighted rate of return for a non-periodic 
NB.- cash flow with dates.
NB.- The money weighted rate of return is the effective interest rate for
NB.- the time unit of the cash flow.
NB.- The money weighted rate of return is calculated for the solution to
NB.- the equation that the present value of the cach flow is zero. 
NB.- (1) constant time unit of one year : assume 365 days
NB.-     if the period is less than a year the rate is not annualised
NB.- (2) money weighted rate of return calculated by Newton-Raphson method.
NB.- (3) tolerance 1e_6
NB.- (4) non periodic cash flow
NB.- (5) Maximum iterations 15
NB.- <a href="../eqs/mwrDates_eq.html" target="_blank">Equation: [I]mwrDates(C;D))</a>
NB.-syntax:
NB.+[I]mwrDates(C;D)
NB.+[I] = optional initial trial value (decimal interest rate)
NB.+      default = 0 
NB.+C   = cash flow 
NB.+      must have at least one change of sign
NB.+D = dates of the cash flow : yyyymmdd as 8 digit numbers
NB.-example: 
NB.+   mwrDates(1000 20 30 _1100;20140101 20150101 20160101 20170101)
NB. ---------------------------------------------------------
mwrDates =: 3 : 0
0 mwrDates y
:
todaynox =. 1&todayno
min =. <./
max =. >./
E =.  %>:x
'C D' =. y
DN =. todaynox D
Dmax =. max DN
Dmin =. min DN
Days =. Dmax - Dmin
T =.  (DN - Dmin)%365
TOL =. 1e_6
MAX=. 15
if. -. (#C)=(#T) do. smoutput <'*** Cash flow and time do not match ***' return. end.
if. 2>#C do. smoutput <'*** Cash flow must have at least two items ***' return. end.
if. -. *./_1 1 e.*C do. smoutput < '*** No sign change in cash flow ***' return. end.
DF=. C* T
mp=. +/ . *
while.
  R=. E - (C mp E ^ T) % DF mp E ^ T - 1
  TOL < |E-R do.
  E=. R
  if. 0=MAX=. <:MAX do. smoutput <'*** Maximum number iterations exceeded 15 ***' return. end.
end.
<:%R
)

