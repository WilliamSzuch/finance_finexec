NB. =========================================================
NB.%twrr.ijs - Time weighted rates of return
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Investmane Performance</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/ipm/twrr.ijs
NB.- Contributor: William Szuch
NB.- Updated: 28/2/2021
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../twrr.ijs" target="_blank">Script source: twrr.ijs</a>
NB.-<hr>
NB.- Definitions to calculate the time weighted rate 
NB.- of return over for a time unit using several methods.
NB.- External cash flow:
NB.-   cash inflow positive (eg: 100 10)
NB.-   cash outflow negative (eg: _10 _12)
NB.- Date format: yyyymmdd (eg: 20161231;20160101)
NB.- Date is entered as an 8 digit number.
NB.- Equations:
NB.- <img alt="NF" src="../eqs/twrr_ijs_eqs.gif">
NB.-<hr>


NB. =========================================================
Note 'Utilities'
arg0 =. >@:(0&{)
arg1 =. >@:(1&{)
arg2 =. >@:(2&{)
arg3 =. >@:(3&{)
argx0 =. arg0 @:[
argx1 =. arg1 @:[
argy0 =. arg0 @:]
argy1 =. arg1 @:]
argy2 =. arg2 @:]
todaynox =. 1&todayno  NB. from stdlib.ijs
daysdiffx =. -&(1&todayno)
)


NB. =========================================================
NB.*twr d - 
NB.- <b>Form:</b> tacit
NB.- Time weighted rate of return with 
NB.- no external cash flow over a time unit.
NB.-syntax:
NB.+(Vb)twr(Ve)
NB.+Vb = portfolio value at the start of the time unit including accrued income
NB.+Ve = portfoliio value at the end of the time unit including accrued income
NB.-example:
NB.+   (100)twr(105)
NB.+0.05
NB.-
NB.+   (100)twr(110 105 98 90)
NB.+0.1 0.05 _0.02 _0.1
NB.-
NB.+   (100 105 110)twr(110) 
NB.+0.1 0.047619 0
NB.- 
NB.+   (100 105 110)twr(110 100) 
NB.+0.1  0.047619          0
NB.+  0 _0.047619 _0.0909091
NB. ---------------------------------------------------------
twr =: (-~ % [)"_ 0
NB. ---------------------------------------------------------
Note 'T twr'
d0 =. -~ % [
twr =. d0"_ 0 f.
)


NB. =========================================================
NB.*twr_M  m -
NB.- <b>Form:</b> tacit
NB.- Monadic form of twr. 
NB.- Time weighted rate of return for a time unit with 
NB.- no external cash flow.
NB.- <a href="../eqs/twr_eq.html" target="_blank">Equation: twr_M(Vb;Ve)</a>
NB.-syntax:
NB.+ twr_M(Vb;Ve)
NB.+ Vb = portfolio value at the start of the time unit including accrued income
NB.+ Ve = portfolio value at the end of the time unit including accrued income
NB.-example:
NB.+   twr_M(100;105)
NB.+0.05
NB.-
NB.+   twr_M(100;110 105 98 90) 
NB.+0.1 0.05 _0.02 _0.1
NB.-
NB.+   twr_M(100 105 110 ;110)
NB.+0.1 0.047619 0
NB.- 
NB.+   twr_M(100 105 110;110 100) 
NB.+0.1  0.047619          0
NB.+  0 _0.047619 _0.0909091
NB. ---------------------------------------------------------
twr_M =: >@:(0&{) (-~ % [)"_ 0 >@:(1&{)
NB. ---------------------------------------------------------
Note 'T twrm'
arg0 =: >@:(0&{)
arg1 =: >@:(1&{)
twr =. (-~ % [)"_ 0
twr_M =. (arg0 twr arg1) f. 
)


NB. =========================================================
NB.*twrDietz d -
NB.- <b>Form:</b> tacit
NB.- Time weighted rate of return for a time unit with 
NB.- external cash flow using the Dietz methodology.
NB.- This method assumes that the external cash flow is in the 
NB.- middle of the time unit.
NB.- <a href="../eqs/twrDietz_eq.html" target="_blank">Equation: (Vb;Ve)twrDietz(Ec)</a>
NB.-syntax:
NB.+(Vb;Ve)twrDietz_d(Ec)
NB.+Vb = portfolio value at the start of the time unit including accrued income
NB.+Ve = portfolio value at the end of the time unit including accrued income
NB.+Ec = external cash flow over the time unit
NB.-example:
NB.+   (100;105)twrDietz(1)
NB.+0.039801
NB.-
NB.+  (100;110)twrDietz(1 _2 3) 
NB.+0.0792079
NB. ---------------------------------------------------------
twrDietz =: ((>@:(1&{)@:[ - >@:(0&{)@:[) - +/@:]) % >@:(0&{)@:[ + 0.5 * +/@:]
NB. ---------------------------------------------------------
Note 'T twrDietz'
arg0 =. >@:(0&{)
arg1 =. >@:(1&{)
argx0 =. arg0 @:[
argx1 =. arg1 @:[
cft =. +/ @: ]
cfw =. 0.5 * cft
twrDietz =. (((argx1 - argx0) - cft) % (argx0 + cfw)) f. 
)


NB. =========================================================
NB.*twrDietz_M m -
NB.- <b>Form:</b> tacit
NB.- Monadic form of twrDietz.
NB.- Time weighted rate of return for a time unit with 
NB.- external cash flow using the Dietz methodology.
NB.- This method assumes that the external cash flow is in the 
NB.- middle of the time unit.
NB.-syntax:
NB.+twrDietz_M(Vb;Ve;Ec)
NB.+Vb = portfolio value at the start of the time unit unit including accrued income
NB.+Ve = portfolio value at the end of the time unit including accrued income
NB.+Ec = external cash flow over the time unit
NB.-example:
NB.+   twrDietz_M(100;105;1)
NB.+0.039801
NB.-
NB.+   twrDietz_M(100;110;1 _2 3) 
NB.+0.0792079
NB. ---------------------------------------------------------
twrDietz_M =: (((>@:(1&{)) - (>@:(0&{))) - ((+/)@:(>@:(2&{)))) % ((>@:(0&{)) + (((0.5)&*)@:((+/)@:(>@:(2&{)))))
NB. ---------------------------------------------------------
Note 'T twrDietz_M'
cft =. +/ @: arg2
cfw =. 0.5&*@:cf
twrDietz_M =. (((arg1 - arg0) - cft) % (arg0 + cfw)) f. 
)


NB. =========================================================
NB.*twrDietzProp d - 
NB.- <b>Form:</b> tacit
NB.- Time weighted rate of return for a time unit with 
NB.- external cash flow using the Dietz modified methodology.
NB.- The modified methodology weights the external cash flow by the proportion 
NB.- it is in the time unit.
NB.- External cash flow:
NB.-    cash inflow positive (eg: 100)
NB.-    cash outflow negative (eg: _10)
NB.-syntax:
NB.+(Vb;Ve)twrDietzProp(Ec;P)
NB.+Vb = portfolio value at the start of the time unit including accrued income
NB.+Ve = portfolio value at the end of the time unit including accrued income
NB.+Ec = external cash flow over the time unit
NB.+P  = proportion of the time unit of the Ecf to the end of the tikme unit
NB.+P in the range (0,1)
NB.-example:
NB.+   (1000;1020)twrDietzProp(0;0)
NB.+0.02
NB.-
NB.+   (1000;980)twrDietzProp(1;0.5)
NB.+_0.0209895
NB.-
NB.   (1000;1200)twrDietzProp(20 30 10 _20;0.8 0.7 0.5 0.3)
NB.+0.15444
NB. ---------------------------------------------------------
twrDietzProp =: ((([: >@:(1&{) [) - [: >@:(0&{) [) - +/@:([: >@:(0&{) ])) % ([: >@:(0&{) [) + +/@:(([: >@:(1&{) ]) * [: >@:(0&{) ])
NB. ---------------------------------------------------------
Note 'T twrDietzProp'
vb =.[: (>@:(0&{)) [
ve =.[: (>@:(1&{)) [
cf =.[: (>@:(0&{)) ] 
p =. [: (>@:(1&{)) ]
cft =.+/ @: cf
cfw =. +/ @: (p * cf)
twrDietzProp =. (((ve - vb) - cft)%(vb + cfw)) f.
)


NB. =========================================================
NB.*twrDietzProp_M  m - 
NB.- <b>Form:</b> tacit
NB.- Monadic form of twrDietzProp.
NB.- Time weighted rate of return for a time unit with 
NB.- external cash flow using the Dietz modified methodology.
NB.- The modified methodology weights the external cash flow by the proportion 
NB.- it is in the time unit.
NB.- External cash flow:
NB.-    cash inflow positive (eg: 100)
NB.-    cash outflow negative (eg: _10)
NB.-syntax:
NB.+twrDietzProp((Vb;Ve;Ec;P)
NB.+Vb = portfolio value at the start of the time unit including accrued income
NB.+Ve = portfolio value at the end of the time unit including accrued income
NB.+Ec = external cash flow over the time unit
NB.+P  = proportion of the time unit of the Ecf to the end of the tikme unit
NB.+P in the range (0,1)
NB.-example:
NB.+   twrDietzProp_M(1000;1020;0;0)
NB.+0.02
NB.-
NB.+   twrDietzProp_M(1000;980;1;0.5)
NB.+_0.0209895
NB.-
NB.+   twrDietzProp_M(1000;1200;20 30 10 _20;0.8 0.7 0.5 0.3)
NB.+0.15444
NB. ---------------------------------------------------------
twrDietzProp_M =: 0 1&{ (((([: >@:(1&{) [) - [: >@:(0&{) [) - +/@:([: >@:(0&{) ])) % ([: >@:(0&{) [) + +/@:(([: >@:(1&{) ]) * [: >@:(0&{) ])) 2 3&{
NB. ---------------------------------------------------------
Note 'T twrDietzProp_M' 
vbe =.0 1&{ 
ecp =. 2 3 & {
twrDietzProp =. ((([: >@:(1&{) [) - [: >@:(0&{) [) - +/@:([: >@:(0&{) ])) % ([: >@:(0&{) [) + +/@:(([: >@:(1&{) ]) * [: >@:(0&{) ]) 
twrDietzProp_M =. (vbe twrDietzProp ecp) f. 
)


NB. =========================================================
NB.*twrDietzDates d -
NB.- <b>Form:</b> explicit
NB.- Time weighted rate of return for a time unit with 
NB.- external cash flow using the Dietz modified methodology with dates.
NB.- External cash flow:
NB.-    cash inflow positive (eg: 100);
NB.-    cash outflow negative (eg: _10).
NB.- Dates are in format: yyyymmdd eg: 20160101 
NB.-syntax:
NB.+(Vb;VbD;Ve;VeD)twrDietzDates_de(Ec;D)
NB.+Vb = portfolio value at the start of the time unit including accrued income
NB.+VbD = date for Vb
NB.+Ve = portfolio value at the end of the time unit including accrued income
NB.+VeD = date of Ve
NB.+Ec = external cash flow over the period
NB.+D = dates of the Ec
NB.-example:
NB.+   (1000;20160101;1200;20160630)twrDietzDates(100 12 _50;20160301 20160215 20160201)
NB.+0.133407
NB. ---------------------------------------------------------
twrDietzDates =: 4 : 0 
daysdiffx =. -&(1&todayno)
'Vb DVb Ve DVe' =. x
'Ec DEc' =. y
DAYS =. DVe daysdiffx DVb
TEc =. +/ Ec
P =. (DVe daysdiffx DEc)%DAYS
((Ve - Vb) - TEc) % (Vb +  +/ Ec*P)
)


NB. =========================================================
NB.*twrDietzDates_M m - 
NB.- <b>Form:</b> explicit
NB.- Monadic form of twrDietzDates
NB.- Time weighted rate of return for a period with 
NB.- external cash flow using the Dietz modified methodology with dates.<br>
NB.- External cash flow:cash inflow positive (eg: 100);cash outflow negative (eg: _10).
NB.- Dates are in format: yyyymmdd eg: 20160101;20160630;20160215  
NB.-syntax:
NB.+twrDietzDates(Vb;VbD;Ve;VeD;Ec;D)
NB.+Vb = portfolio value at the start f the time unit including accrued income
NB.+VbD = date of Vb: yyyymmdd
NB.+Ve = portfolio value at the end of the time unit including accrued income
NB.+VeD = date of Ve: yyyymmdd
NB.+Ec = external cash flow over the time unit
NB.+D = dates of the external cash flow Ec: yyyymmdd as 8 digit numbers
NB.-example:
NB.+   twrDietzDatesm(1000;20160101;1200;20160630;100 12 _50;20160301 20160215 20160201)
NB.+0.133407
NB. ---------------------------------------------------------
twrDietzDates_M =: 3 : 0
daysdiffx =. -&(1&todayno)
'Vb DVb Ve DVe Ec DEc' =. y
DAYS =. DVe daysdiffx DVb
Tcf =. +/ Ec
P =. (DVe daysdiffx DEc)%DAYS
((Ve - Vb) - Tcf) % (Vb +  +/ Ec*P)
)








