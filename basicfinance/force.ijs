NB. =========================================================
NB.%force.ijs - Force of interest definitions (Continous compounding)
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finexec/finexec/basicfinance/force.ijs
NB.- Contributor: William Szuch
NB.- Updated: 6/8/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../force.ijs" target="_blank">Script equations: force.ijs</a>
NB.-<hr>
NB.- Definitions for solving force of interest (continous compounding) problems. 
NB.- <img alt="NF" src="../eqs/force_ijs_eqs.gif">
NB.-<hr>


NB. =========================================================
NB.*ez m -
NB.- <b>Form:</b> tacit
NB.- Equivalent effective interest rate for a constant force
NB.- of interest rate for one time unit.
NB.-syntax:
NB.+ez(Z) 
NB.+Z = constant force of interest rate for one time unit.
NB.-example:
NB.+   ez(0.05)
NB.+0.0512711
NB.-
NB.+   ez(_0.05 0 0 0.05 0.1)
NB.+_0.0487706 0 0 0.0512711 0.105171
NB. ---------------------------------------------------------
ez =: _1 + ^


NB. =========================================================
NB.*ze m -
NB.- <b>Form:</b> tacit
NB.- Equivalent constant force of interest rate for a 
NB.- constant effective interest rate for one time unit.
NB.-syntax:
NB.+ez(Z) 
NB.+E = constant effective interest rate for one time unit.
NB.-example:
NB.+   ze(0.05)
NB. 0.0487902
NB.-
NB.+   ze(_0.05 0 0 0.05 0.1)
NB.+_0.0512933 0 0 0.0487902 0.0953102
NB.-
NB.+   ze(_0.0487706 0 0 0.0512711 0.105171)
NB.+_0.05 0 0 0.05 0.1
NB. ---------------------------------------------------------
ze =: [: ^. 1 + [


NB. =========================================================
NB. Present value definitions
NB. =========================================================


NB. =========================================================
NB.*f m -
NB.- <b>Form:</b> tacit
NB.- Present value of an amount of 1 payable in one time unit 
NB.- for a force of interest rate Z.
NB.-syntax:
NB.+f(Z)
NB.+Z = constant force of interest rate for one time unit.
NB.-example:
NB.+   f(0.05)
NB.+0.951229
NB.-
NB.+   f(0.01 0.05 0.1)
NB.+0.99005 0.951229 0.904837
NB. ---------------------------------------------------------
f =: [: % [: ^ ]


NB. =========================================================
NB.*fc m -
NB.- <b>Form:</b> tacit
NB.- Present value of an amount of 1 paid continuosly over one time unit 
NB.- for a force of interest rates Z.
NB.-syntax:
NB.+fc(Z)
NB.+Z = constant force of interest rate for one time unit.
NB.-example:
NB.+   fc(0.05)
NB.+0.975412
NB.-
NB.+   fc(0.01 0.05 0.1)
NB.+0.995017 0.975412 0.951626
NB.-
NB.+   fc(0 0.1)
NB.+1 0.951626
NB. ---------------------------------------------------------
fc =: ((1 - [: % [: ^ ]) % ])`(1"_)@.(0 = ])"0
NB. ---------------------------------------------------------
Note 'build fc'
f =. [: % [: ^ ]
fc0 =. ((1 - f)%])`(1"_) @.(0=]) 
fc =. fc0"0  f. 
)


NB. =========================================================
NB.*ft d -
NB.- <b>Form:</b> tacit
NB.- Present value of an amount of 1 payable in T time units
NB.- for a constant force of interest Z over the period.
NB.-syntax:
NB.+(Z)ft(T)
NB.+Z = constant force of interest rate per time unit over a period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0.05)ft(5)
NB.+0.778801
NB.-
NB.+   (0.05)ft(0 5 10)
NB.+1 0.778801 0.606531
NB.-
NB.+   (0.0 0.05 0.10)ft(5)
NB.+1 0.778801 0.606531
NB.-
NB.+   (0.0 0.05 0.1 0.15)ft(0 5 10)
NB.+ 1        1        1
NB.+1 0.778801 0.606531
NB.+1 0.606531 0.367879
NB.+1 0.472367  0.22313
NB. ---------------------------------------------------------
ft =: ([: % [: ^ ])~ ^"_ 0 ]
NB. ---------------------------------------------------------
Note 'build ft'
f =. [: % [: ^ ]
ft =. (f~(^"_ 0) ]) f.
)


NB. =========================================================
NB.*fct1 d -
NB.- <b>Form:</b> tacit
NB.- Restricted form of fct: only single values for Z and T.
NB.- Present value of continous payments over the period of
NB.- of T time units where the rate of payment per time unit
NB.- is one for a constant force of interest Z.
NB.- <a class="HREF" href="../eqs/fct_eq.html" target="_blank">Equation: (Z)fct1(T)</a>
NB.+(Z)fct(T)
NB.+Z = constant force of interest rate per time unit over the period.
NB.+T = period in time units of continous payments
NB.-example:
NB.+   (0)fct1(0)
NB.+0
NB.-
NB.+   (0)fct1(10)
NB.+10
NB.-
NB.+   (0.05)fct1(0)
NB.+0
NB.+   (0.05)fct1(10)
NB.+7.86939
NB. ---------------------------------------------------------
fct1 =: ]`([ %~ 1 - [: ^ [: - *)@.((0 = ]) ([: -. >.) 0 = [)
NB. ---------------------------------------------------------
Note 'T fct1'
t =: ([: -. >.)
s =: ((0 = ]) t (0 = [)) 
f =: 13 : '(1 - ^-x*y)%x'
fct1 =: ((])`(f) @.s)f.
)


NB. =========================================================
NB.*fct1_E d Explicit form of fct1
NB. ---------------------------------------------------------
fct1_E =: 4 : 0
if. x=0 do. y return. end.
if. y=0 do. y return. end.
(1 - ^-x*y)%x
)


NB. =========================================================
NB.*fct d -
NB.- <b>Form:</b> tacit
NB.- Present value of continous payments over the period of
NB.- of T time units where the rate of payment per time unit
NB.- is one for a constant force of interest Z.
NB.-syntax:
NB.+(Z)fct(T)
NB.+Z = constant force of interest rate per time unit over the period.
NB.+T = period in time units of continous payments
NB.-example:
NB.+   (0.0)fct(10)
NB.+10
NB.-
NB.+   (0.05)fct(10)
NB.+7.86939
NB.-
NB.+   (0.05)fct(0 5 10)
NB.+0 4.42398 7.86939
NB.-
NB.+   (0 0.05 0.10)fct(10)
NB.+10 7.86939 6.32121
NB.-
NB.+   (0 0.05 0.10 0.15)fct(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 4.42398 3.93469 3.51756
NB.+10 7.86939 6.32121 5.17913
NB. ---------------------------------------------------------
fct =: >@:([: (([: > 1&{) ]`([ %~ 1 - [: ^ [: - *)@.((0 = ]) ([: -. >.) 0 = [) [: > 0&{)&.> [: <"1@:(>@:(0&{) ;"0/ >@:(1&{)) ] ; [)
NB. ---------------------------------------------------------
Note 'T fct'
fct1 =. ]`([ %~ 1 - [: ^ [: - *)@.((0 = ]) ([: -. >.) 0 = [)
boxedtable =: <"1@:(>@:(0&{) ;"0/ >@:(1&{))
f =. ([:>1&{) fct1 ([:>0&{)
d =. [: boxedtable (];[)
fct =. >@: ([: f each d) f.
)


NB. =========================================================
NB.*fct_E d  Explicit form of fct
NB. ---------------------------------------------------------
fct_E =: 4 : 0
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
TABLE =. boxedtable(y;x)
ff =. ([:>1&{) fct1_E ([:>0&{)
> ff each TABLE
)


NB. =========================================================
NB.*fn d -
NB.- <b>Form:</b> tacit
NB.- Present value of N payments of 1 paid at the beginning of each time unit
NB.- for a constant force of interest rate Z over the period.
NB.- ie. Payments in advance
NB.-syntax:
NB.+(Z)fn(N)
NB.+Z = constant force of interest rate per time unit over the period.
NB.+N = integer number of payments over the period  
NB.-example:
NB.+   (0.0)fn(10)
NB.+10
NB.-
NB.+   (0.05)fn(10)
NB.+8.06776
NB.-
NB.+   (0.05)fn(0 5 10)
NB.+0 4.53551 8.06776
NB.-
NB.+   (0 0.05 0.10)fn(10)
NB.+10 8.06776 6.64253
NB.-
NB.+   (0 0.05 0.10 0.15)fn(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 4.53551 4.13471 3.78797
NB.+10 8.06776 6.64253 5.57727
NB. ---------------------------------------------------------
fn =: +/@:(([: % [: ^ ])~ ^"_ 0 [: (0 + i.) ])"_ 0
NB. ---------------------------------------------------------
Note 'build fn'
d1 =. [: (0+i.)]
d2 =. ^"_ 0
f =. [: % [: ^ ]
fn =. (+/ @: (f~ d2 d1)"_ 0) f. 
)


NB. =========================================================
NB. Future value definitions
NB. =========================================================


NB. =========================================================
NB.*g m - 
NB.- <b>Form:</b> tacit
NB.- Future value of an amount of 1 in one time unit 
NB.- for a force of interest rates Z.
NB.-syntax:
NB.+g(Z)
NB.+Z = constant force of interest rate for one time unit.
NB.-example:
NB.+   g(0.05)
NB.+1.05127
NB.-
NB.+   g(0 0.01 0.05 0.1)
NB.+1 1.01005 1.05127 1.10517
NB. ---------------------------------------------------------
g =: [:^]


NB. =========================================================
NB.*gc m -
NB.- <b>Form:</b> tacit
NB.- Future value of an amount of 1 paid continuosly over one time unit 
NB.- for a force of interest rates Z.
NB.-syntax:
NB.+gc(Z)
NB.+Z = constant force of interest rate for one time unit.
NB.-example:
NB.+   gc(0.05)
NB.+1.02542
NB.-
NB.+   gc(0.01 0.05 0.1)
NB.+1.00502 1.02542 1.05171
NB.-
NB.+   gc(0 0.1)
NB.+1 1.05171
NB. ---------------------------------------------------------
gc =: ((1 -~ [: ^ ]) % ])`(1"_)@.(0 = ])"0
NB. ---------------------------------------------------------
Note 'T gc'
g=. [:^]
gc0 =. ((1 -~ g)%])`(1"_) @.(0=]) 
gc1 =. gc1"0  f. 
)


NB. =========================================================
NB.*gt d -
NB.- <b>Form:</b> tacit
NB.- Future value of an amount of 1 payable in T time units
NB.- for a constant force of interest Z over the period.
NB.-syntax:
NB.+(Z)gt(T)
NB.+Z = constant force of interest rate per time unit over a period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0.05)gt(5)
NB.+1.28403
NB.-
NB.+   (0.05)gt(0 5 10)
NB.+1 1.28403 1.64872
NB.-
NB.+   (0.0 0.05 0.10)gt(5)
NB.+1 1.28403 1.64872
NB.-
NB.+   (0.0 0.05 0.1 0.15)gt(0 5 10)
NB.+1       1       1       1
NB.+1 1.28403 1.64872   2.117
NB.+1 1.64872 2.71828 4.48169
NB. ---------------------------------------------------------
gt =: ([: ^ ])~ ^"_ 0 ]
NB. ---------------------------------------------------------
Note 'T gt'
g =. [:^]
gt =. (g~(^"_ 0) ]) f.
)


NB. =========================================================
NB.*gn d -
NB.- <b>Form:</b> tacit
NB.- Future value of N payments of 1 payable at intervals for a  time unit.
NB.- for a constant force of interest Z.
NB.- accumulated to the time of the last payment.
NB.- (ie: payments in arrears)
NB.-syntax:
NB.+(Z)gn(N)
NB.+Z = constant force of interest rate per time unit over the period.
NB.+N = number of payments over the period  
NB.-example:
NB.+   (0.0)gn(10)
NB.+10
NB.-
NB.+   (0.05)gn(10)
NB.+12.6528
NB.-
NB.+   (0.05)gn(0 5 10)
NB.+0 5.53968 12.6528
NB.-
NB.+   (0 0.05 0.10)gn(10)
NB.+10 12.6528 16.338
NB.-
NB.+   (0 0.05 0.10 0.15)gn(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 5.53968 6.16826 6.90212
NB.+10 12.6528  16.338 21.5139
NB. ---------------------------------------------------------
gn =: +/@:(([: ^ ])~ ^"_ 0 [: |. [: i. ])"_ 0
NB. ---------------------------------------------------------
Note 'T gn'
d1 =. [: |. ([: i. ])
d2 =. ^"_ 0
g =: [:^]
gn =. (+/ @: (g~ d2 d1)"_ 0) f. 
)


NB. =========================================================
NB.*gct1 d -
NB.- <b>Form:</b> tacit
NB.- Restricted form of fct: only single values for Z and T.
NB.- Present value of continous payments over the period of
NB.- of T time units where the rate of payment per time unit
NB.- is one for a constant force of interest Z.
NB.-syntax:
NB.+(Z)gct(T)
NB.+Z = constant force of interest rate per time unit over the period.
NB.+T = period in time units of continous payments
NB.-example:
NB.+   (0)gct1(0)
NB.+0
NB.-
NB.+   (0)gct1(10)
NB.+10
NB.-
NB.+   (0.05)gct1(0)
NB.+0
NB.+   (0.05)gct1(10)
NB.+12.9744
NB. ---------------------------------------------------------
gct1 =: ]`([ %~ _1 + [: ^ *)@.((0 = ]) ([: -. >.) 0 = [)
NB. ---------------------------------------------------------
Note 'T gct1'
t =. ([: -. >.)
s =. ((0 = ]) t (0 = [)) 
f =. 13 : '(_1 + ^x*y)%x'
gct1 =. ((])`(f) @.s)f.
)


NB. =========================================================
NB.*gct1_E d Explicit form of gct1
NB. ---------------------------------------------------------
gct1_E =: 4 : 0
if. x=0 do. y return. end.
if. y=0 do. y return. end.
(_1 + ^x*y)%x
)


NB. =========================================================
NB.*gct d -
NB.- <b>Form:</b> tacit
NB.- Present value of continous payments over the period of
NB.- of T time units where the rate of payment per time unit
NB.- is one for a constant force of interest Z.
NB.-syntax:
NB.+(Z)gct(T)
NB.+Z = constant force of interest rate per time unit over the period.
NB.+T = period in time units of continous payments
NB.-example:
NB.+   (0.0)gct(10)
NB.+10
NB.-
NB.+   (0.05)gct(10)
NB.+12.9744
NB.-
NB.+   (0.05)gct(0 5 10)
NB.+0 5.68051 12.9744
NB.-
NB.+   (0 0.05 0.10)gct(10)
NB.+10 12.9744 17.1828
NB.-
NB.+   (0 0.05 0.10 0.15)gct(0 5 10)
NB.+ 0       0       0       0
NB.+ 5 5.68051 6.48721 7.44667
NB.+10 12.9744 17.1828 23.2113
NB. ---------------------------------------------------------
gct =: >@:([: (([: > 1&{) ]`([ %~ _1 + [: ^ *)@.((0 = ]) ([: -. >.) 0 = [) [: > 0&{)&.> [: <"1@:(>@:(0&{) ;"0/ >@:(1&{)) ] ; [)
NB. ---------------------------------------------------------
Note 'T gct'
gct1 =: ]`([ %~ _1 + [: ^ *)@.((0 = ]) ([: -. >.) 0 = [)
boxedtable =: <"1@:(>@:(0&{) ;"0/ >@:(1&{))
f =. ([:>1&{) gct1 ([:>0&{)
d =. [: boxedtable (];[)
gct =. >@: ([: f each d) f.
)


NB. =========================================================
NB.*gct_E d Explicit form of gct
NB. ---------------------------------------------------------
gct_E =: 4 : 0
boxedtable =: <"1@:(>@:(0&{) ;"0/ >@:(1&{))
TABLE =: boxedtable(y;x)
gg =: ([:>1&{) gct1 ([:>0&{)
> gg each TABLE
)








