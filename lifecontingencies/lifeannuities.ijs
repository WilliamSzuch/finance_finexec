NB. =========================================================
NB.%lifeannuities.ijs - Life annuity definitions
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Life Contingencies</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/lifecontingencies/lifeannuities.ijs
NB.- Contributor: William Szuch
NB.- Updated: 31/7/2020
NB.- Depend: ~addons/finance/finexec/qxtables/qxtools.ijs'
NB.- Definitions: loaded to locale base
NB.- Status: update:
NB.- <a href="../lifeannuities.ijs" target="_blank">Script scource: lifeannuities.ijs</a>
NB.-<hr>
NB.- Definitions to calculate life annuities 
NB.- for single and multiple lives.
NB.- Qx tables loaded to the locale base.
NB.- See: Qx_ALL for a list of names.
NB.- See: Qx_ALT for a list of Australian Life Tables.
NB.- All mortality tables start at age = 0.
NB.- <img alt="NF" src="../eqs/lifeannuities_ijs_eqs.gif">
NB.-<hr>
NB.- Note:
NB.- (1) Extending Qx tables by 5 years. 
NB.- (2) Variable interest rates
NB.- (3) Multiple lives
NB.- (4) term annuities
NB.- (5) axy
NB.- (6) reversionary
NB.- (7) payment frequency with a year
NB.- (8) dev tacits
NB.-<hr>


require '~addons/finance/fp/qxtables/qxtools.ijs'


NB. =========================================================
Note 'Utilities'
arg0 =. >@:(0&{)               NB. 1st item in a boxed list
arg1 =. >@:(1&{)               NB. 2nd item in a boxed list
arg2 =. >@:(2&{)               NB. 3rd item in a boxed list
extendl =. (] {. ([ , (# {:))) NB. extend left argument
extendr =. ([ {. (] , (# {:))) NB. extend right argument
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
)


NB. =========================================================
NB.*ax d - 
NB.- <b>Form:</b> tacit
NB.- single life annuity with yearly payments of 1 in arrears.
NB.-syntax:
NB.+(Qx;E)ax(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+E = yearly effective interest rate
NB.+Age = integer ages
NB.-example:
NB.+   (ALT_1960_62_M;0.04)ax(65)
NB.+8.71606
NB.-
NB.+   (ALT_1960_62_M;0.04)ax(50 60 65 70)
NB.+13.8119 10.4011 8.71606 7.10639
NB.-
NB.+   (AL_AM92_ULT;0.04)ax(17 50 60) 
NB.+22.367 16.4441 13.1335
NB. ---------------------------------------------------------
ax =: ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
NB. =========================================================
Note 'T ax'
arg0 =. >@:(0&{)               NB. 1st item in a boxed list
arg1 =. >@:(1&{)               NB. 2nd item in a boxed list
d0 =.  [: */\ (1 - ( ] }. ([: arg0 [)))
d1 =. ([: % (1+([: arg1 [ ))) ^  (1 + ([: i. ([: # d0)))
d2 =. (+/ @: (d0 * d1)) NB. one age 
ax =. (d2"_ 0) f.
)


NB. =========================================================
NB.*ax0 d - 
NB.- <b>Form:</b> tacit
NB.- single life annuity with yearly payments of 1 in advance.
NB.-syntax:
NB.+(Qx;E)ax0(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+E = yearly effective interest rate
NB.+Age = integer ages
NB.-example:
NB.+   (ALT_1960_62_M;0.04)ax0(65)
NB.+9.71606
NB.-
NB.+   (ALT_1960_62_M;0.04)ax0(50 60 65 70)
NB.+14.8119 11.4011 9.71606 8.10639
NB.-
NB.+   (AL_AM92_ULT;0.04)ax0(17 50 60) 
NB.+23.367 17.4441 14.1335
NB. ---------------------------------------------------------
ax0 =: 1 + +/@:(([: */\ 1 - ] }. [: >@:(0&{) [) * ([: % 1 + [: >@:(1&{) [) ^ 1 + [: i. [: # [: */\ 1 - ] }. [: >@:(0&{) [)"_ 0
NB. =========================================================
Note 'T ax0'
ax =: ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
ax0 =. (1+ax) f.
)


NB. =========================================================
NB.*ax_M m -
NB.- <b>Form:</b> tacit
NB.- Monadic form of ax.
NB.- single life annuity with payments in arrears
NB.- <a href="../eqs/ax_M_eq.html" target="_blank">Equation: (Qx)ax_M(Age)</a>
NB.- Calculate the value of a single life annuity with
NB.- yearly payments in arrears of one.
NB.-syntax:
NB.+ax_M(Qx;Age;E)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.+E = yearly effective interest rate
NB.-example:
NB.+   ax_M(ALT_1960_62_M;65;0.04)
NB.+8.71606
NB.-
NB.+   ax_M(ALT_1960_62_M;50 60 65 70;0.04) 
NB.+13.8119 10.4011 8.71606 7.10639
NB.-
NB.+   ax_M(AL_AM92_ULT;17 50 60;0.04) 
NB.+22.367 16.4441 13.1335
NB. ---------------------------------------------------------
ax_M =: ((>@:(0&{)) ; (>@:(2&{))) (((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0) (>@:(1&{))
NB. =========================================================
Note 'T ax_M'
arg0 =: >@:(0&{)               NB. 1st item in a boxed list
arg1 =: >@:(1&{)               NB. 2nd item in a boxed list
arg2 =: >@:(2&{)               NB. 3rd item in a boxed list
ax =: ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
ax_M =. ((arg0;arg2) ax arg1) f. 
)


NB. =========================================================
NB.*ax0_M m -
NB.- <b>Form:</b> tacit
NB.- Monadic form of ax0
NB.- Single life annuity with payments yearly payments 
NB.- in advance of one.
NB.-syntax:
NB.+axm0(Qx;Age;E)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.+E = yearly effective interest rate
NB.-example:
NB.+    axm0(ALT_1960_62_M;65;0.04)
NB.+9.71606
NB.-
NB.+   axm0(ALT_1960_62_M;50 60 65 70;0.04) 
NB.+14.8119 11.4011 9.71606 8.10639
NB.-
NB.+   axm0(AL_AM92_ULT;17 50 60;0.04)
NB.+23.367 17.4441 14.1335
NB. ---------------------------------------------------------
ax0_M =: 1 + (((>@:(0&{)) ; (>@:(2&{))) (((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0) (>@:(1&{)))
NB. ---------------------------------------------------------
Note 'T ax0_M'
ax =: ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
ax0_M =. (1+ax) f. 
)


NB. =========================================================
NB.*axn1 d - 
NB.- <b>Form:</b> tacit 
NB.- (Same as axn - one life)
NB.- Single life term annuity with yearly payments of 1 in arrears.
NB.-syntax:
NB.+(Qx;E)axn1(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+E = yearly effective interest rate
NB.+Age = integer ages
NB.+N = term of annuity - integer years
NB.-example:
NB.+   (AL_49_52_M_ULT;0.05)axn1(65;10)
NB.+6.39308
NB.-
NB.+   (AL_49_52_M_ULT;0.05)axn1(50;20)
NB.+11.2005
NB. ---------------------------------------------------------
axn1 =: +/@:(([: */\ ([: >@:(1&{) ]) {. 1 - ([: >@:(0&{) ]) }. [: >@:(0&{) [) * ([: % 1 + [: >@:(1&{) [) ^ 1 + [: i. [: # [: */\ ([: >@:(1&{) ]) {. 1 - ([: >@:(0&{) ]) }. [: >@:(0&{) [)
NB. ---------------------------------------------------------
Note 'T axn1'
arg0 =. >@:(0&{)              
arg1 =. >@:(1&{)               
Age =. ([: arg0 ])
N =. ([: arg1 ])
Px =.  (1 - ( Age }. ([: arg0 [)))
Pxn =. ([: arg1 ]) {. Px
d0 =.  [: */\ Pxn
d1 =. ([: % (1+([: arg1 [ ))) ^  (1 + ([: i. ([: # d0)))
axn1 =. (+/ @: (d0 * d1)) f.  NB. one age ; one term
)


NB. =========================================================
NB.*axn d -
NB.- <b>Form:</b> explicit
NB.- Single life term annuity with yearly payments of 1 in arrears.
NB.-syntax:
NB.+(Qx;E)axn(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+E = yearly effective interest rate
NB.+Age = integer ages
NB.+N = term of annuity - integer years
NB.-example:
NB.+   (AL_49_52_M_ULT;0.05)axn(65;10)
NB.+6.39308
NB.-
NB.+   (AL_49_52_M_ULT;0.05)axn(50;20)
NB.+11.2005
NB.-
NB.+   (AL_49_52_M_ULT;0.05)axn(40 50;20)
NB.+12.0099 11.2005
NB.-
NB.+   (AL_49_52_M_ULT;0.05)axn(50;10 20 30)
NB.+7.39698 11.2005 12.6708
NB.-
NB.+   (AL_49_52_M_ULT;0.05)axn(40 50;10 20 30)
NB.+ 7.6169 12.0099 14.2688
NB.+7.39698 11.2005 12.6708
NB. ---------------------------------------------------------
axn =: 4 : 0
'AGES N' =: y
'Qx E' =. x
axn1 =: +/@:(([: */\ ([: >@:(1&{) ]) {. 1 - ([: >@:(0&{) ]) }. [: >@:(0&{) [) * ([: % 1 + [: >@:(1&{) [) ^ 1 + [: i. [: # [: */\ ([: >@:(1&{) ]) {. 1 - ([: >@:(0&{) ]) }. [: >@:(0&{) [)
Qx_axn1 =. (Qx;E)&axn1
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
> Qx_axn1 each boxedtable(AGES;N)
)


NB. =========================================================
NB. Two lives
NB. =========================================================


NB. =========================================================
NB.*axy d -
NB.- <b>Form:</b> explicit
NB.- Joint life annuity with yearly payments of 1 in arrears.
NB.- (ie: payable while both lives are alive)
NB.- The last value in the Qx tables is extended so that tables
NB.- are of equal length for the selected ages.
NB.-syntax:
NB.+(Qx;Qy;E)ax(Agex;Agey)
NB.+Qx = name of Qx table for life x starting at age = 0
NB.+Qy = name of Qx table for life y starting at age = 0
NB.+E = yearly effective interest rate
NB.+Agex = age of life x(integer age)
NB.+Agey = age of life y(integer age)
NB.-example:
NB.+   (ALT_2013_15_F;ALT_2013_15_M;0.035)axy(60;65)
NB.+11.9358
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.025)axy(20;20)
NB.+26.7798
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axy(30;40)
NB.+17.0961
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axy(66;70)
NB.+6.71193
NB. ---------------------------------------------------------
axy =: 4 : 0
'Qx Qy E' =. x
'Agex Agey' =. y
extend =. [ {. ] , (# {:)
Qxx =. Agex }. Qx
Qyy =. Agey }. Qy
T =. (#Qxx)>.(#Qyy)
Qxxx =. T extend Qxx
Qyyy =. T extend Qyy
Qxy =. Qxxx + Qyyy - (Qxxx*Qyyy)
Pxyn =. */\(1-Qxy)
D =. % (1+E)^1+i. (T)
+/ Pxyn * D
)


NB. =========================================================
NB.*axyLS d -
NB.- <b>Form:</b> explicit
NB.- Last survivor annuity with yearly payments of 1 in arrears.
NB.- (ie: payable while at least one life is alive)
NB.- The last value in the Qx tables is extended so that tables
NB.- are of equal length for the selected ages.
NB.-syntax:
NB.+(Qx;Qy;E)axLS(Agex;Agey)
NB.+Qx = name of Qx table for life x starting at age = 0
NB.+Qy = name of Qx table for life y starting at age = 0
NB.+E = yearly effective interest rate
NB.+Agex = age of life x(integer age)
NB.+Agey = age of life y(integer age)
NB.-example:
NB.+   (ALT_2013_15_F;ALT_2013_15_M;0.035)axyLS(60;65)
NB.+17.4866
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axyLS(20;20)
NB.+22.7473
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axyLS(30;40)
NB.+21.2563
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axyLS(66;70)
NB.+12.3762
NB. ---------------------------------------------------------
axyLS =: 4 : 0
ax =. ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
'Qx Qy E' =. x
'Agex Agey' =. y
extend =. [ {. ] , (# {:)
Qxx =. Agex }. Qx
Qyy =. Agey }. Qy
T =. (#Qxx)>.(#Qyy)
Qxxx =. T extend Qxx
Qyyy =. T extend Qyy
Qxy =: Qxxx + Qyyy - (Qxxx*Qyyy)
Pxyn =. */\(1-Qxy)
D =. % (1+E)^1+i. (T)
Rxy =. +/ Pxyn * D
Rx =. (Qx;E)ax(Agex) 
Ry =. (Qy;E)ax(Agey) 
Rx + Ry - Rxy
)


NB. =========================================================
NB.*axyR d -
NB.- <b>Form:</b> explicit
NB.- Reversionary annuity - payable on the life of x 
NB.- then a percentage to the life y if life y survives life x.
NB.- Payments yearly in arresrs.
NB.- The last value in the Qx tables is extended so that tables
NB.- are of equal length for the selected ages.
NB.-syntax: 
NB.+(Qx;Qy;E)axLS(P:Agex;Agey)
NB.+Qx = name of Qx table for life x starting at age = 0
NB.+Qy = name of Qx table for life y starting at age = 0
NB.+E = yearly effective interest rate
NB.+Agex = age of life x(integer age)
NB.+Agey = age of life y(integer age)
NB.P =  proportion of annuity that reverts to life y 
NB.     if life y survives the life x
NB.-example:
NB.+   (ALT_2013_15_F;ALT_2013_15_M;0.035)axyR(0.6;60;65)
NB.+17.0282
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axyR(0.5;20;20)
NB.+22.2674
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axyR(0.75;30;40)
NB.+21.0848
NB.-
NB.+   (ANN_55_F_ULT;ANN_55_M_ULT;0.04)axyR(0.6;66;70)
NB.+11.8757
NB. ---------------------------------------------------------
axyR =: 4 : 0
ax =. ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
'Qx Qy E' =. x
'P Agex Agey' =. y
extend =. [ {. ] , (# {:)
Qxx =. Agex }. Qx
Qyy =. Agey }. Qy
T =. (#Qxx)>.(#Qyy)
Qxxx =. T extend Qxx
Qyyy =. T extend Qyy
Qxy =: Qxxx + Qyyy - (Qxxx*Qyyy)
Pxyn =. */\(1-Qxy)
D =. % (1+E)^1+i. (T)
Rxy =. +/ Pxyn * D
Rx =. (Qx;E)ax(Agex) 
Ry =. (Qy;E)ax(Agey) 
Rx + P*(Ry - Rxy)
)





