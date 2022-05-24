NB. =========================================================
NB.%compound.ijs - Compound interest definitions for constant effective interest rates
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/basicfinance/compound.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../compound.ijs"  target="_blank">Script source: compound.ijs</a>
NB.-<hr>
NB.- Definitions for solving compound interest rate problems for
NB.- a constant effective interest rate over a period.
NB.-   present value
NB.-   future value
NB.-   effective and nominal interest rate conversions between time units
NB.- Equations:
NB.- <img alt="NF" src="../eqs/compound_ijs.gif">
NB.-<hr>


NB. =========================================================
NB.*d m -
NB.- <b>Form:</b> tacit 
NB.- Effective rate of discount for one time unit for  
NB.- an effective interest rate E. 
NB.-syntax:
NB.+d(E)
NB.+E = effective interest rate for one time unit
NB.-example:
NB.+   d(0.05)
NB.+0.047619
NB.-
NB.+   d(0.0 0.01 0.05 0.1)
NB.+0 0.00990099 0.047619 0.0909091
NB. ---------------------------------------------------------
d =: 1 - [: % 1 + ]
NB. ---------------------------------------------------------
Note 'T d'
v =. [: % 1 + ]
d =. (1-v) f.
)


NB. =========================================================
NB. Present value: constant effective interest rate
NB. =========================================================


NB. =========================================================
NB.*v m -
NB.- <b>Form:</b> tacit 
NB.- Present value of 1 payable in 1 time unit for a 
NB.- effective interest rate E.
NB.-syntax:
NB.+v(E)
NB.+E = effective interest rate for one time unit
NB.-example:
NB.+   v(0.05)
NB.+0.952381
NB.-
NB.+   v(0 0.05 0.1 0.15)
NB.+1 0.952381 0.909091 0.869565
NB. ---------------------------------------------------------
v =: [: % 1 + ]


NB. =========================================================
NB.*vt d -
NB.- <b>Form:</b> tacit 
NB.- Present value of 1 payable in a period of T time units
NB.- for a constant effective interest rate E over the period.
NB.-syntax:
NB.+(E)vt(T)
NB.+E = constant effective interest rate per time unit over a period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0)vt(0)
NB.+1
NB.-
NB.+   (0.05)vt(10)
NB.+0.613913
NB.-
NB.+   (0 0.05 0.1 0.15)vt(10)
NB.+1 0.613913 0.385543 0.247185
NB.-
NB.+   (0.05)vt(0 5 10)
NB.+1 0.783526 0.613913
NB.-
NB.+   (0 0.05 0.1 0.15)vt(0 5 10) 
NB.+1        1        1        1
NB.+1 0.783526 0.620921 0.497177
NB.+1 0.613913 0.385543 0.247185
NB. ---------------------------------------------------------
vt =: ([: % 1 + ])~ ^"_ 0 ]
NB. ---------------------------------------------------------
Note 'T vt'
d1 =. ^"_ 0
v =. [: % 1 + ]
vt =. (v~ d1 ]) f.
)


NB. =========================================================
NB.*an0 d -
NB.- <b>Form:</b> tacit 
NB.- Present value of N payments of 1 paid at the beginning of each time unit
NB.- for a constant effective interest rate E over the period.
NB.- Payments in advance
NB.-syntax:
NB.+(E)an0(N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+N = integer number of payments over the period  
NB.-example:
NB.+   (0.0)an0(10)
NB.+10
NB.-
NB.+   (0.05)an0(10)
NB.+8.10782
NB.-
NB.+   (0.05)an0(0 5 10)
NB.+0 4.54595 8.10782
NB.-
NB.+   (0 0.05 0.10)an0(10)
NB.+10 8.10782 6.75902
NB.-
NB.+   (0 0.05 0.10 0.15)an0(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 4.54595 4.16987 3.85498
NB.+10 8.10782 6.75902 5.77158
NB. ---------------------------------------------------------
an0 =: +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0
NB. ---------------------------------------------------------
Note 'T an0'
d1 =. [: (0+i.)]
d2 =. ^"_ 0
v =. [: % 1 + ]
an0 =. (+/ @: (v~ d2 d1)"_ 0) f. 
)


NB. =========================================================
NB.*an d - 
NB.- <b>Form:</b> tacit 
NB.- Same as an0 but payments deferred for 1 time unit
NB.- Payments in arrears
NB.-syntax:
NB.+(E)an(N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+N = integer number of payments over the period  
NB.-example:
NB.+   (0.05)an(0 5 10)
NB.+0 0.952381 4.32948 7.72173
NB.-
NB.+   (0 0.05 0.10 0.15)an(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 4.32948 3.79079 3.35216
NB.+10 7.72173 6.14457 5.01877
NB. ---------------------------------------------------------
an =: +/@:(([: % 1 + ])~ ^"_ 0 [: (1 + i.) ])"_ 0
NB. ---------------------------------------------------------
Note 'T an'
d1 =. [: (1+i.)] 
d2 =. ^"_ 0
v =. [: % 1 + ]
an =. (+/ @: (v~ d2 d1)"_ 0) f.
)


NB. =========================================================
NB.*anD d -
NB.- <b>Form:</b> tacit 
NB.- Present value of N payments of 1 payable at the beginning of each time unit 
NB.- with the first payment deferred for D time units
NB.- for a constant effective interest rate E over the period.
NB.-syntax:
NB.+(E)anD(D;N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+D = deferred period in time units to the first payment
NB.+N = number of payments in the period  
NB.-example:
NB.+   (0.0)anD(1;10)
NB.+10
NB.-
NB.+   (0.05)anD(0.5;10)
NB.+7.91242
NB.-
NB.+   (0.05)anD(1.5;0 5 10)
NB.+0 4.22514 7.53564
NB.-
NB.+   (0 0.05 0.10 0.15)anD(1;10)
NB.+10 7.72173 6.14457 5.01877
NB.-
NB.+  (0 0.05 0.10 0.15)anD(2;0 5 10)
NB.+ 0       0       0       0
NB.+ 5 4.12331 3.44617 2.91492
NB.+10 7.35403 5.58597 4.36415
NB. ---------------------------------------------------------
anD =: ([ (([: % 1 + ])~ ^"_ 0 ]) >@:([: 0&{ ])) *"1 [ +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0 >@:([: 1&{ ])
NB. ---------------------------------------------------------
Note 'T anD'
selD =. >@: ([: 0&{  ])
selN =. >@: ([: 1&{  ])
vt =. ([: % 1 + ])~ ^"_ 0 ]
an0 =. +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0
anD =.  (([ vt selD) *"1 ([ an0 selN)) f.
)


NB. =========================================================
NB.*anF d -
NB.- <b>Form:</b> tacit 
NB.- Present value of multiple payments of 1/F paid at intervals of 1/F of a time unit
NB.- at start of the first payment 
NB.- for a constant effective interest rate E over the period.
NB.- Payments in advance
NB.-syntax:
NB.+(E)anF(F;N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+F = integer number of multiple payments in a time unit
NB.+N = integer number of time units over the period  
NB.-example:
NB.+   (0.05)anF(2;1)
NB.+0.98795
NB.-
NB.+   (0.05)anF(2;0 1 10)
NB.+0 0.98795 8.01012
NB.-
NB.+   (0 0.05 0.1)anF(2;5 10)
NB.+ 5 4.49117 4.07284
NB.+10 8.01012 6.60175
NB.-
NB.+   (0 0.05 0.10 0.15)anF(2;0 5 10)
NB.+ 0       0       0       0
NB.+ 5 4.49117 4.07284 3.72488
NB.+10 8.01012 6.60175 5.57681
NB. ---------------------------------------------------------
anF =: (1 % >@:([: 0&{ ])) * (_1 + (1 + [) ^ 1 % >@:([: 0&{ ])) +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0 >@:([: 0&{ ]) * >@:([: 1&{ ])
NB. ---------------------------------------------------------
Note 'T anF'
selF =. >@: ([: 0&{  ])
selN =. >@: ([: 1&{  ])
d1 =. 1 % selF
fn =. selF * selN
ef =. _1 +  (1+[) ^ d1
an0 =. +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0 
anF =.(d1 * ef an0 fn) f. 
)


NB. =========================================================
NB.*pvcf d -
NB.- <b>Form:</b> tacit 
NB.- Present value of a cash flow C payable at the periods 
NB.- of T time units
NB.- for a constant effective interest rate E over the period.
NB.-syntax:
NB.+(E)pvcf(C;T)
NB.+E = constant effective interest rate per time unit over the period.
NB.+C = amount of cash flow 
NB.+T = periods in time units of cash flow
NB.-example:
NB.+   (0 0.05)pvcf(1;1)
NB.+1 0.952381
NB.-
NB.+   (0.05)pvcf(1;1)
NB.+0.952381
NB.-
NB.+   (0.05 0.1)pvcf(1 1 1;1 2 3) 
NB.+2.72325 2.48685
NB.-
NB.+   (0.05 0.1)pvcf((1+i. 10);(1+ i. 10)) 
NB.+39.3738 29.0359
NB. ---------------------------------------------------------
pvcf =: +/@:(>@:([: 0&{ ]) * [ (,:@:([: % 1 + ])~ ^"_ 0 ]) >@:([: 1&{ ]))
NB. ---------------------------------------------------------
Note 'T pvcf'
selC =. >@: ([: 0&{  ])  
selT =. >@: ([: 1&{  ])
vt =. ,:@: ([: % 1 + ])~ ^"_ 0 ] NB. Make table  
pvcf =. (+/ @: (selC * [ vt selT)) f. 
)


NB. =========================================================
NB. Future value: constant effective interest rate
NB. =========================================================


NB. =========================================================
NB.*w m - 
NB.- <b>Form:</b> tacit 
NB.- Future value of 1 payable in 1 time unit for a 
NB.- effective interest rate E.
NB.-syntax:
NB.+w(E)
NB.+E = effective interest rate for one time unit
NB.-example:
NB.+   w(0.05)
NB.+1.05
NB.-
NB.+   w(0 0.05 0.1 0.15)
NB.+1 1.05 1.1 1.15
NB. ---------------------------------------------------------
w =: 1 + ]


NB. =========================================================
NB.*wt d -
NB.- <b>Form:</b> tacit 
NB.- Future value of 1 payable in a period of T time units
NB.- for a constant effective interest E over the period.
NB.-syntax:
NB.+(E)wt(T)
NB.+E = constant effective interest rate per time unit over a period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0)wt(0)
NB.+1
NB.-
NB.+   (0.05)wt(10)
NB.+1.62889
NB.-
NB.+   (0 0.05 0.1 0.15)wt(10)
NB.+1 1.62889 2.59374 4.04556
NB.-
NB.+   (0.05)wt(0 5 10)
NB.+1 1.27628 1.62889
NB.-
NB.+   (0 0.05 0.1 0.15)wt(0 5 10) 
NB.+1       1       1       1
NB.+1 1.27628 1.61051 2.01136
NB.+1 1.62889 2.59374 4.04556
NB. ---------------------------------------------------------
wt =: (1 + ])~ ^"_ 0 ]
NB. ---------------------------------------------------------
Note 'T wt'
w =: 1 + ]
wt =. (w~(^"_ 0) ]) f.
)



NB. =========================================================
NB.*sn d -
NB.- <b>Form:</b> tacit 
NB.- Future value of N payments of 1 payable at intervals for a time unit.
NB.- for a constant effective rate of interest E.
NB.- accumulated to the time of the last payment.
NB.- Payments in arrears
NB.-syntax:
NB.+(E)sn(N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+N = number of payments over the period  
NB.-example:
NB.+   (0.0)sn(10)
NB.+10
NB.-
NB.+   (0.05)sn(10)
NB.+12.5779
NB.-
NB.+   (0.05)sn(0 5 10)
NB.+0 5.52563 12.5779
NB.-
NB.+   (0 0.05 0.10)sn(10)
NB.+10 12.5779 15.9374
NB.-
NB.+   (0 0.05 0.10 0.15)sn(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 5.52563  6.1051 6.74238
NB.+10 12.5779 15.9374 20.3037
NB. ---------------------------------------------------------
sn =: +/@:((1 + ])~ ^"_ 0 [: |. [: i. ])"_ 0
NB. ---------------------------------------------------------
Note 'T sn0'
d1 =. [: |. ([: i. ])
d2 =. ^"_ 0
w =. 1 + ]
sn =. (+/ @: (w~ d2 d1)"_ 0) f. 
)


NB. =========================================================
NB.*sn1 d -
NB.- <b>Form:</b> tacit 
NB.- Same as sn but payments accumulated for
NB.- an additional time unit. 
NB.- Payments in advance
NB.-syntax:
NB.+(E)sn1(N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+N = number of payments over the period  
NB.-example:
NB.+   (0 0.05 0.10 0.15)sn1(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 5.80191 6.71561 7.75374
NB.+10 13.2068 17.5312 23.3493
NB. ---------------------------------------------------------
sn1 =: +/@:((1 + ])~ (^"_ 0) 1 + [: |. [: i. ])"_ 0
NB. ---------------------------------------------------------
Note 'T sn1'
d1 =. 1 + [: |. ([: i. ])
d2 =. ^"_ 0
w =: 1 + ]
sn1 =. (+/ @: (w~ d2 d1)"_ 0) f.
)


NB. =========================================================
NB.*snD d -
NB.- <b>Form:</b> tacit 
NB.- Futuret value of N payments of 1 payable interval of a time unit 
NB.- accumulated for a further D time units from the last payment.
NB.-syntax:
NB.+(E)snD(D;N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+D = period in time units from last payment
NB.+N = number of payments in the period  
NB.-example:
NB.+   (0.0)snD(1;10)
NB.+10
NB.-
NB.+   (0.05)snD(0.5;10)
NB.+12.8885
NB.-
NB.+   (0.05)snD(1.5;0 5 10)
NB.+0 5.94519 13.5329
NB.-
NB.+   (0 0.05 0.10 0.15)snD(1;10)
NB.+10 13.2068 17.5312 23.3493
NB.-
NB.+  (0 0.05 0.10 0.15)snD(2;0 5 10)
NB.+ 0       0       0       0
NB.+ 5 6.09201 7.38717  8.9168
NB.+10 13.8671 19.2843 26.8517
NB. ---------------------------------------------------------
snD =: ([ ((1 + ])~ ^"_ 0 ]) >@:([: 0&{ ])) *"1 [ +/@:((1 + ])~ ^"_ 0 [: |. [: i. ])"_ 0 >@:([: 1&{ ])
NB. ---------------------------------------------------------
Note 'T sn_d'
selD =. >@: ([: 0&{  ])
selN =. >@: ([: 1&{  ])
sn =: +/@:((1 + ])~ ^"_ 0 [: |. [: i. ])"_ 0
wt =: (1 + ])~ ^"_ 0 ]
snD =.  (([ wt selD) *"1 ([ sn selN)) f.
)


NB. =========================================================
NB.*snF d -
NB.- <b>Form:</b> tacit 
NB.- Future value of multiple payments of 1/F paid at intervals 1/F of a time unit
NB.- accumuleted to the last payment.
NB.- Payments in arrears
NB.-syntax:
NB.+(E)snF(F;N)
NB.+E = constant effective interest rate per time unit over the period.
NB.+F = integer number of multiple payments in a time unit
NB.+N = intenger number of time units over the period  
NB.-example:
NB.+   (0.05)snF(2;1)
NB.+1.01235
NB.-
NB.+   (0.05)snF(2;0 1 10)
NB.+0 1.01235 12.7332
NB.-
NB.+   (0 0.05 0.1)snF(2;5 10)
NB.+ 5 5.59386 6.25409
NB.+10 12.7332 16.3264
NB.-
NB.+   (0 0.05 0.10 0.15)snF(2;0 5 10)
NB.+ 0       0       0       0
NB.+ 5 5.59386 6.25409 6.98639
NB.+10 12.7332 16.3264 21.0385
NB. ---------------------------------------------------------
snF =: (1 % >@:([: 0&{ ])) * (_1 + (1 + [) ^ 1 % >@:([: 0&{ ])) +/@:((1 + ])~ ^"_ 0 [: |. [: i. ])"_ 0 >@:([: 0&{ ]) * >@:([: 1&{ ])
NB. ---------------------------------------------------------
Note 'T snF'
selF =. >@: ([: 0&{  ])
selN =. >@: ([: 1&{  ])
d1 =. 1 % selF
fn =. selF * selN
ef =. _1 +  (1+[) ^ d1
sn =: +/@:((1 + ])~ ^"_ 0 [: |. [: i. ])"_ 0
snF =.(d1 * ef sn fn) f. 
)


NB. =========================================================
NB.*fvcf d -
NB.- <b>Form:</b> tacit 
NB.- future value of a cash flow C accumulated for periods 
NB.- of T time units.
NB.-syntax:
NB.+(E)fvcf(C;T)
NB.+E = constant effective interest rate per time unit over the period.
NB.+C = amount of cash flow 
NB.+T = accumulation periods in time units of cash flow  
NB.-example:
NB.+   (0 0.05)fvcf(1;1)
NB.+1 1.05
NB.-
NB.+   (0.05)fvcf(1;1)
NB.+1.05
NB.-
NB.+   (0.05 0.1)fvcf(1 1 1;1 2 3) 
NB.+3.31013 3.641
NB.-
NB.+   (0 0.05 0.1)fvcf((1+i. 10);(|. i. 10)) 
NB.+55 64.1357 75.3117
NB. ---------------------------------------------------------
fvcf =: +/@:(>@:([: 0&{ ]) * [ (,:@:(1 + ])~ ^"_ 0 ]) >@:([: 1&{ ]))
NB. ---------------------------------------------------------
Note 'T fvcf'
selC =. >@: ([: 0&{  ])
selT =. >@: ([: 1&{  ])
wt =: ,: @: (1 + ])~ ^"_ 0 ]  NB. make table
fvcf =. (+/@: (selC * [ wt selT)) f.
)


NB. =========================================================
NB. Effective Interest Rate Convertions
NB. =========================================================


NB. =========================================================
NB.*econvf d -
NB.- <b>Form:</b> tacit 
NB.- Convert an effective interest rate E for an initial time unit to
NB.- an equivalent effective interest rate for a new time unit of 
NB.- 1/F of the initial time unit.
NB.-syntax:
NB.+(E)econvf(F)
NB.+E = effective interest rate for the initial time unit
NB.+F = period of new time unit of 1/F times the initial time unit
NB.-example:
NB.+   (0.05)econvf(2)
NB.+0.0246951
NB.-
NB.+   (0.05 0.1)econvf(2 4 12)
NB.+ 0.0246951  0.0488088
NB.+ 0.0122722  0.0241137
NB.+0.00407412 0.00797414
NB. ---------------------------------------------------------
econvf =: _1 + (1 + [) (^"_ 0) 1 % ]
NB. ---------------------------------------------------------
Note 'T econvf'
dE =. 1+[
dF =. 1 % ]
econvf =. (_1 + (dE ^"_ 0 dF)) f. 
)


NB. =========================================================
NB.*econvg d -
NB.- <b>Form:</b> tacit 
NB.- Convert an effective interest rate E for an initial time unit to
NB.- an equivalent effective interest rate for a new time unit of 
NB.- G times the inital time unit.
NB.-syntax:
NB.+(E)econvg(G)
NB.+E = effective interest rate for old time unit
NB.+G = period of new time unit, G times the initial time unit
NB.-example:
NB.+   (0.025)econvg(2)
NB.+0.050625
NB.-
NB.+   (0.025 0.01)econvg(2 4 12)
NB.+0.050625   0.0201
NB.+0.103813 0.040604
NB.+0.344889 0.126825
NB. ---------------------------------------------------------
econvg =: _1 + (1 + [) (^"_ 0) 1 * ]
NB. ---------------------------------------------------------
Note 'T econvg'
dE =. 1+[
dG =. 1 *]
econvg =. (_1 + (dE ^"_ 0 dG)) f. 
)


NB. =========================================================
NB.*enominal d -
NB.- <b>Form:</b> tacit 
NB.- Convert a nominal interest rate for a period to an effective
NB.- interest rate for a time unit.
NB.-syntax:
NB.+(R)enominal(F)
NB.+R = nominal interest rate for a period
NB.+F = the number of times interest is payable and accumulated in the period
NB.-example:
NB.+   (0.12)enominal(1 2 3 4 6)
NB.+0.12 0.06 0.04 0.03 0.02
NB.-
NB.+   (0.06 0.12)enominal(1 2 3 4 6)
NB.+ 0.06 0.12
NB.+ 0.03 0.06
NB.+ 0.02 0.04
NB.+0.015 0.03
NB.+ 0.01 0.02
NB. ---------------------------------------------------------
enominal =: [ (*"_ 0) 1 % ]
NB. ---------------------------------------------------------
Note 'T enominal'
dR =. [
dF =. 1 % ]
enominal =. (dR *"_ 0 dF) f. 
)


NB. =========================================================
NB.*rconvf d -
NB.- <b>Form:</b> tacit 
NB.- Convert a nominal interest rate for a period to an effective
NB.- interest rate for time unit for the same period.
NB.-syntax:
NB.+(R)rconvf(F)
NB.+R = nominal interest rate for a period
NB.+F = the number of times interest is payable and accumulated in the period
NB.-example:
NB.+   (0.12)rconvf(2)
NB.+0.1236
NB.+   (0.12)rconvf(1 2 3 4 6)
NB.-
NB.+0.12 0.1236 0.124864 0.125509 0.126162
NB.-
NB.+   (0.06 0.12)rconvf(1 2 3 4 6)
NB.+     0.06     0.12
NB.+   0.0609   0.1236
NB.+ 0.061208 0.124864
NB.+0.0613636 0.125509
NB.+0.0615202 0.126162
NB. ---------------------------------------------------------
rconvf =: _1 + (1 + [ (*"_ 0) 1 % ]) ^ ]
NB. ---------------------------------------------------------
Note 'T rconvf'
enominal =. [ (*"_ 0) 1 % ]
ef =. 1 + enominal
rconvf =. _1 + (ef ^ ])  f. 
)


NB. =========================================================
NB. Further definitions
NB. =========================================================


NB. =========================================================
NB.*vf0 d -
NB.- <b>Form:</b> explicit
NB.- Present value of 1 paid over a single time unit.
NB.- Payments commencing at the start of the first frequency 
NB.- interval in the time unit.
NB.- Paymenmt in advance.
NB.-syntax:
NB.+ (E)vf0(F)
NB.+E = effective interest rate for the time unit
NB.+F = integer frequency of payments in time unit: 1/2/3/etc  
NB.+    and _ for continous payments. 
NB.-example:
NB.+  (0)vf0(0)
NB.+0
NB.-
NB.+  (0)vf0(_)
NB.+1
NB.-
NB.+  (0.1)vf0(0) 
NB.+0
NB.-
NB.+  (0.1)vf0(2)
NB.+0.976731
NB.-
NB.+  (0.1)vf0(12)
NB.+0.957616
NB.-
NB.+  (0.1)vf0(_)
NB.+0.953824
NB. ---------------------------------------------------------
vf0 =: 4 : 0
if. (x = 0)*(y = 0) do. 0 return. end.
if. (x = 0)*(-. y = 0) do. 1 return. end.
if. y = _ do. D =. ^. 1 + x
              (1 - ^-D)%D
          else.(% y) * +/ % ((1 + x)^(1 % y))^i. y end.
)


NB. =========================================================
NB. Make vf0 tacit - To Do
Note 'T vf0'
s0 =: (x = 0)*(y = 0)
s1 =: (x = 0)*(-. y = 0)
s2 =: (-. x = 0)*(y =_)
s3 =: (-. x = 0)*(-. y =_)

f0 =: (0"_)
f1 =: (1"_)
f2a =: [: ^ (1+[)
f2 =: 13 : '(1-^- x f2a y) % x f2a y'
f3 =: 13 : '(% y) * +/ % ((1 + x)^(1 % y))^i. y'
)


NB. =========================================================
NB.*vf1 d - 
NB.- <b>Form:</b> explicit
NB.- Present value of 1 paid over a single time unit.
NB.- Payments commencing at the end of the first frequency 
NB.- interval in the time unit.
NB.- Payment in arrears.
NB.-syntax:
NB.+ (E)vf1(F)
NB.+E = effective interest rate for the time unit.
NB.+F = integer frequency of payments in the time unit: 1/2/3/etc  
NB.+    and _ for continous payments. 
NB.-example:
NB.+   (0.1)vf1(2)
NB.+0.931277
NB.-
NB.+   (0.1)vf1(12)
NB.+0.950041
NB.-
NB.+   (0.1)vf1(_)
NB.+0.953824
NB. ---------------------------------------------------------
vf1 =: 4 : 0
if. (x = 0)*(y = 0) do. 0 return. end.
if. (x = 0)*(-. y = 0) do. 1 return. end.
if. y = _ do. D =. ^. 1 + x
              (1 - ^-D)%D
          else.(% y) * +/ % ((1 + x)^(1 % y))^(1+i. y) end.
)


NB. =========================================================
NB. Make vf1 tacit - To Do
Note 'T vf1'
s0 =: (x = 0)*(y = 0)
s1 =: (x = 0)*(-. y = 0)
s2 =: (-. x = 0)*(y =_)
s3 =: (-. x = 0)*(-. y =_)

f0 =: (0"_)
f1 =: (1"_)
f2a =: [: ^ (1+[)
f2 =: 13 : '(1-^- x f2a y) % x f2a y'
f3 =: 13 : '(% y) * +/ % ((1 + x)^(1 % y))^i. y'
)

