NB. =========================================================
NB.%compoundv.ijs - Compound interest definitions for variable effective interest rates
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finance/fp/basicfinance/compoundv.ijs
NB.- Contributor: William Szuch
NB.- Updated: 6/8/2020
NB.- Depend: ~addons/finance/finexec/basicfinance/compound.ijs
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../compoundv.ijs" target="_blank">Script source: compoundv.ijs</a>
NB.-<hr>
NB.- Definitions for solving compound interest rate problems with
NB.- variable effective interest rates for the time units over a period.
NB.- <img alt="NF" src="../eqs/compoundv_ijs_eqs.gif">
NB.-<hr>


require '~addons/finance/fp/basicfinance/compound.ijs'


NB. =========================================================
Note 'utilities'
extend =. [ {. ] , (# {:)
extenda =. ([ {. ] , (# {:))~ 
)


NB. =========================================================
NB.*ev d -
NB.- <b>Form:</b> tacit
NB.- List of variable effective interest rates for N time units. 
NB.-syntax:
NB.+(Ev)ev(N)
NB.+ Ev = list of effective interest rates for a time unit with
NB.+      the last rate is extended for the period of N time units
NB.+ N = integer number of time units
NB.- <a href="../eqs/ev_eq.html" target="_blank">Equation: (Ev)ev(N)</a>
NB.-example:
NB.+   (0.05 0.055)ev(12) 
NB.+0.05 0.055 0.055 0.055 0.055 0.055 0.055 0.055 0.055 0.055 0.055 0.055
NB.-
NB.+   (0.02 +0.001 * i. 10)ev(6)
NB.+0.02 0.021 0.022 0.023 0.024 0.025
NB. ---------------------------------------------------------
ev =: ([ {. ] , (# {:))~
NB. ---------------------------------------------------------
Note 'T ev'
extenda =. ([ {. ] , (# {:))~ 
ev =. extenda f.
)



NB. =========================================================
NB.*evt d -
NB.- <b>Form:</b> tacit
NB.- List or table of variable effective interest rates plus one for T time units. 
NB.-syntax:
NB.+(Ev)evt(T)
NB.+ Ev = variable effective interest rate for time units over the oeriod
NB.+      the last rate is estended for the period 
NB. T = number of time units with last rate extended for the required period
NB.- <a href="../eqs/evt_eq.html" target="_blank">? Equation: (Ev)evt(T)</a>
NB.-example:
NB.+   (0.05 0.055)evt(0.5) 
NB.+1.0247
NB.-
NB.+   (0.05)evt(2.5) 
NB.+1.05 1.05 1.0247
NB.-
NB.+   (0.05 0.055)evt(2.5) 
NB.+1.05 1.055 1.02713
NB.-
NB.+   (0.05 0.055)evt(0 0.5 1 5.5) 
NB.+     1     1     1     1     1       1
NB.+1.0247     1     1     1     1       1
NB.+  1.05     1     1     1     1       1
NB.+  1.05 1.055 1.055 1.055 1.055 1.02713
NB. ---------------------------------------------------------
evt =: (1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ]
NB. ---------------------------------------------------------
Note 'T evt'
extenda =. ([ {. ] , (# {:))~ 
onesd =. #&1@:<. , ] - <. 
ip1 =. 1+<.
evt =. ((1+(extenda"_ 0 ip1)) ^ ([: onesd"0 ])) f. 
)


NB. =========================================================
NB. Present value definitions: variable effective interest rates
NB. =========================================================


NB. =========================================================
NB.*vvt d -
NB.- <b>Form:</b> tacit
NB.- Present value of 1 payable in a period of T time units
NB.- for variable effective interest rates Ev over the period.
NB.- <a href="../eqs/vvt_eq.html" target="_blank">? Equation: (Ev)vvt(T)</a>
NB.-syntax:
NB.+(Ev)vvt(T)
NB.+Ev = variable effective interest rate per time unit over a period
NB.+     the last rate is extended for the period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0.05 0.06 0.07)vvt(0.5)
NB.+0.9759
NB.-
NB.+   (0.05 0.06 0.07)vvt(3.5)
NB.+0.811763
NB.-
NB.+   (0.05 0.06 0.07)vvt(0 1 2 3)
NB.+1 0.952381 0.898473 0.839694
NB.-
NB.+   (0.05 0.06 0.07)vvt(0 0.5 1 1.5 2.5 10.1)
NB.+ 1 0.9759 0.952381 0.925034 0.868586 0.519393
NB. ---------------------------------------------------------
vvt =: [: % */"1@:((1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ])
NB. ---------------------------------------------------------
Note 'T vvt'
evt =. (1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ] 
vvt =. ([: %  (*/"1 @: ezt)) f.
)


NB. =========================================================
NB.*pvcfv d -
NB.- <b>Form:</b> tacit
NB.- Present value of a cash flow C payable at the periods 
NB.- of T time units for variable effective interest rates Ev. 
NB.- <a href="../eqs/pvcfv_eq.html" target="_blank">Equation: (E)pvcfv(C;T)</a>
NB.-syntax:
NB.+(Ev)pvcfv(C;T)
NB.+Ev = variable effective interest rate per time unit over the period.
NB.+     the last rate is estended for the period 
NB.+C  = amount of cash flow 
NB.+T = periods in time units of cash flow
NB.-example:
NB.+   (0.05)pvcfv(1;1)
NB.+0.952381
NB.-
NB.+   (0.05 0.1)pvcfv(1 1 1;1 2 3) 
NB.+2.60527
NB.-
NB.+   (0.05 0.1)pvcfv((1+i.10);(1+ i. 10)) 
NB.+30.4186
NB.-
NB.+   (0.05)pvcfv((1+i.10);(1+ i. 10)) 
NB.+39.3738
NB. ---------------------------------------------------------
pvcfv =: +/@:(>@:([: 0&{ ]) * [ ([: % */"1@:((1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ])) >@:([: 1&{ ]))
NB. ---------------------------------------------------------
Note 'T pvcfv'
selC =. >@: ([: 0&{  ])
selT =. >@: ([: 1&{  ])
vvt =. [: % */"1@:((1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ])
pvcfv =. (+/@: (selC * [ vvt selT)) f.
)


NB. =========================================================
NB. Future value definitions: variable interest rates
NB. =========================================================


NB. =========================================================
NB.*wvt d -
NB.- <b>Form:</b> tacit
NB.- Future value of an amount of 1 in a period of T time units
NB.- for variable effective interest Ev over the period.
NB.- <a href="../eqs/wvt_eq.html" target="_blank">Equation: (Ev)wvt(T)</a>
NB.-syntax:
NB.+(Ev)wvt(T)
NB.+Ev = variable effective interest rate per time unit over a period
NB.+     the last rate is extended for the period
NB.+T = number of time units in the period
NB.-example:
NB.+   (0)wvt(0)
NB.+1
NB.-
NB.+   (0.05)wvt(10)
NB.+1.62889
NB.-
NB.+   (0 0.05 0.1 0.15)wvt(10)
NB.+3.07232
NB.-
NB.+   (0.05)wvt(0 5 10)
NB.+1 1.27628 1.62889
NB.-
NB.+   (0 0.05 0.1 0.15)wvt(0 5 10 10.5) 
NB.+1 1.52749 3.07232 3.2947
NB. ---------------------------------------------------------
wvt =: */"1@:((1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ])
NB. ---------------------------------------------------------
Note 'T wvt'
evt =. (1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ]
wvt =. (*/"1 @: evt) f.
)


NB. =========================================================
NB.*fvcfv d -
NB.- <b>Form:</b> tacit
NB.- Future value of a cash flow C payable at the periods 
NB.- of T time units from the point of accumulation for variable 
NB.- effective interest rates Ev.
NB.- <a href="../eqs/fvcfv_eq.html" target="_blank">Equation: (Ev)fvcfv(C;T)</a>
NB.-syntax:
NB.+(Ev)pvcfv(C;T)
NB.+Ev = variable effective interest rate per time unit over the period.
NB.+     the last rate is estended for the period 
NB.+C  = amount of cash flow 
NB.+T = periods in time units of cash flow from the point of accumulation.
NB.-example:
NB.+   (0.05)fvcfv(1;1)
NB.+1.05
NB.- 
NB.+   (0.05 0.1)fvcfv(1 1;1 2)
NB.+2.205
NB.-
NB.+   (0.05 0.1)fvcfv(1 1 1;1 2 3) 
NB.+3.4755
NB.-
NB.+   (0.05 0.1)fvcfv((1+i.10);(1+ i. 10)) 
NB.+105
NB.-
NB.+   (0.05)fvcfv((1+i.10);(1+ i. 10)) 
NB.+77.9321
NB. ---------------------------------------------------------
fvcfv =: +/@:(>@:([: 0&{ ]) * [ */"1@:((1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ]) >@:([: 1&{ ]))
NB. ---------------------------------------------------------
Note 'T fvcfv'
selC =. >@: ([: 0&{  ])
selT =. >@: ([: 1&{  ])
wvt =: */"1@:((1 + ((([ {. ] , (# {:))~"_ 0) (1 + <.))) ^ [: (#&1@:<. , ] - <.)"0 ])
fvcfv =. (+/@: (selC * [ wvt selT)) f.
)


NB. =========================================================
NB. Useful definitions
NB. =========================================================


NB. =========================================================
NB.*anvF v -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:>/b> vf0, vf1
NB.- Present value of a level cash flow of one per time unit
NB.- with variable effective interest rates Ev over the period
NB.- paid at frequency F within the time unit. 
NB.- <a href="../eqs/anvF_eq.html" target="_blank">Equation: ([x])anvF(N;Ev;[F])</a>
NB.-syntax:
NB.+([x])anvF(Ev;N;[F])
NB.+[x] = 0 : optional: default case payments in advance 
NB.+      1 :  payments in arrears
NB.+Ev = list of effective interest rate per time unit and can vary
NB.-     last rate extended, first rate applies to first time unit
NB.+N = integer number of payments of 1 per time unit.
NB.+[F] = Optional: default frequency = 1
NB.+      frequency of payments over a time unit: 1/2/3/4 etc _ for continous
NB.-example:
NB.+ (1)anvF(0.05;1)  
NB.+0.952381
NB.-
NB.+ (0)anvF(0.05;1)  
NB.+1
NB.-
NB.+  anvF(0.05;1)  
NB.+1
NB.-
NB.+  anvF(0.05;10)  
NB.+8.10782
NB.-
NB.+  anvF(0.05 0.06;10)
NB.+7.86647
NB.-
NB.+  anvF(0.05;10;12) 
NB.+7.92931
NB.-
NB.+  anvF(0.06;10;12)
NB.+7.59716
NB.- 
NB.+  (1)anvF(0.05 0.06;10;12)
NB.+7.62808
NB.- 
NB.+  anvF(0.05 0.06;10;_)
NB.+7.64625
NB. ---------------------------------------------------------
anvF =: 3 : 0
'' anvF y
:
extend =. [ {. ] , (# {:)
'Ev N F' =: 3{. y, <1   
EvN =: N extend Ev
if. 0 = #x  do. S =. 0 else. S =. x end.
if. S = 0 do.  V1 =. , > vf0&F each EvN 
          else. V1 =. , > vf1&F each EvN end.
D1 =. % */\(N extend 1,(1 + EvN))
+/ V1 * D1  
)

