NB. =========================================================
NB.%lifetable.ijs - Life table definitions
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Life Contingencies</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/lifecontingencies/lifetable.ijs
NB.- Contributor: William Szuch
NB.- Updated: 31/2/2020
NB.- Depend: ~addons/finance/finexec/qxtables/qxtools.ijs'
NB.- Definitions: loaded to locale base
NB.- Status: todo: equations
NB.- <a href="../lifetable.ijs" target="_blank">Script source: lifetable.ijs</a>
NB.-<hr>
NB.- Definitions to calculate life table functions and survival factors.
NB.- Qx tables loaded to the locale base.
NB.- See: Qx_ALL for a list of names.
NB.- See: Qx_ALT for a list of Australian Life Tables.
NB.- All mortality tables start at age = 0.
NB.- <img alt="NF" src="../eqs/lifetable_ijs_eqs.gif"></a>
NB.-<hr>
NB.- Note:
NB.- (1) Dealing with Ages outside the range of the mortality table.
NB.- (2) Dealing with qx>1 if Qx table is scaled up.
NB.- use of ext5 
NB.- Tables - try to make tacit 
NB.- pxn,qxn - try to make into tacit
NB.- Plots
NB.-<hr>


require '~addons/finance/finexec/qxtables/qxtools.ijs'


NB. =========================================================
Note 'Utilities'
freqcount=. (\: {:"1)@(~. ,. #/.~)
)


NB. =========================================================
NB.*qx d -
NB.- <b>Form:</b> tacit
NB.- The probability of dying within a year for the selected Qx table. 
NB.- Qx tables start from age = 0. 
NB.-syntax:
NB.+(Qx)qx(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.-example:
NB.+   (ALT_2009_11_F)qx(20)
NB.+0.00025
NB.-
NB.+   (ALT_2010_12_F)qx(0 10 20 60)
NB.+0.00342 7e_5 0.00027 0.00407
NB. ---------------------------------------------------------
qx =: ] { [


NB. =========================================================
NB.*px d -
NB.- <b>Form:</b> tacit
NB.- The probability of surviving a year for the selected Qx mortality table.<br> 
NB.- Qx tables start from age = 0. 
NB.-syntax:
NB.+(Qx)px(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.-example:
NB.+   (ALT_2009_11_F)px(10)
NB.+0.99993
NB.-
NB.+   (ALT_2010_12_F)px(0 10 20 60)
NB.+0.99658 0.99993 0.99973 0.99593
NB. ---------------------------------------------------------
px =: 1 - (] { [)
NB. ---------------------------------------------------------
Note 'T px'
qx =. ] { [
px =. (1-qx) f.
)


NB. =========================================================
NB.*pxn1 d -
NB.- <b>Form:</b> tacit
NB.- The probability of a life surviving N years for the selected Qx table.
NB.- Qx tables start from age = 0.
NB.- (for one life) -  same equation as pxn
NB.-syntax:
NB.+(Qx)pxn1(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer age
NB.+N = integer period
NB.-example:
NB.+   (ALT_2009_11_F)pxn1(40;10)
NB.+0.987896
NB.-
NB.+   (ALT_2009_11_F)pxn1(0;40)
NB.+0.986089
NB.-
NB.+   (ALT_2009_11_F)pxn1(40;0)
NB.+1
NB.-
NB.+   (ALT_2010_12_F)pxn1(65;10)
NB.+0.899431
NB. ---------------------------------------------------------
pxn1 =: */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
NB. ---------------------------------------------------------
Note 'T pxn1'
selb1 =. >@:(0&{)     
delb2 =. >@:(1&{)             
d0 =.  [: i. ([: selb2 ])
d1 =. ([: selb1 ]) + d0
d2 =.  ([ px d1)
pxn1 =. (*/ @: d2) f. 
)


NB. =========================================================
NB.*pxn d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> boxtable
NB.- Extension of pxn1
NB.- The probability of a life surviving N years for the selected Qx table.
NB.- Qx tables start from age = 0. 
NB.-syntax:
NB.+(Qx)pxn(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.+N = integer period
NB.-example:
NB.+   (ALT_2009_11_F)pxn(40;10)
NB.+0.987896
NB.-
NB.+   (ALT_2009_11_F)pxn(0 10 20;40)
NB.0.986089 0.978671 0.953975
NB.-
NB.+   (ALT_2009_11_F)pxn(40;0 10 20 30)
NB.+1 0.987896 0.961543 0.902532
NB.-
NB.+   (ALT_2010_12_F)pxn(60 65 70;10 20)
NB.+0.938772 0.780252
NB.+0.899431 0.635069
NB.+0.831141 0.415658
NB. ---------------------------------------------------------
pxn =: 4 : 0
'AGES N' =. y
Qx =. x
pxn1 =. */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
Qx_pxn1 =. Qx&pxn1
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
> Qx_pxn1 each boxedtable(AGES;N)
)


NB. =========================================================
NB.*qxn1 d - 
NB.- <b>Form:</b> tacit
NB.- The probability of a life dying within N years for the selected Qx table.
NB.- Mortality tables start from age = 0. 
NB.- (for one life) -  same equation as qxn
NB.-syntax:
NB.+(Qx)qxn1(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer age
NB.+N = integer period
NB.-example:
NB.+   (ALT_2009_11_F)qxn1(40;10)
NB.+0.012104
NB.-
NB.+   (ALT_2009_11_F)qxn1(0;40)
NB.+0.0139106
NB.-
NB.+   (ALT_2009_11_F)qxn1(40;0)
NB.+0
NB.-
NB.+   (ALT_2010_12_F)qxn1(65;10)
NB.+0.100569
NB. ---------------------------------------------------------
qxn1 =: 1 - */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
NB. ---------------------------------------------------------
Note 'build qxn1'
pxn1 =. */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ]) 
qxn1 =. (1-pxn1)  f. 
)


NB. =========================================================
NB.*qxn d -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> boxtable
NB.- Extension of qxn1.
NB.- The probability for multiple ages dying with multiple periods 
NB.- for the selected Qx table.
NB.-Qx tables start from age = 0. 
NB.-syntax:
NB.+(Qx)qxn(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.+N = integer periods in years
NB.-example:
NB.+  (ALT_2009_11_F)qxn(40;10)
NB.+0.012104
NB.-
NB.+  (ALT_2009_11_F)qxne(40 50 60;10)
NB.+0.012104 0.0266759 0.0613706
NB.-
NB.+  (ALT_2009_11_F)qxn(40;10 20 30)
NB.+0.012104 0.0384571 0.0974675
NB.-
NB.+  (ALT_2009_11_F)qxn(20 30 40 50;10 20 30)
NB.+0.00281643 0.00787062 0.0198794
NB.+0.00506847  0.0171111 0.0433306
NB.+  0.012104  0.0384571 0.0974675
NB.+ 0.0266759  0.0864094  0.241221
NB. ---------------------------------------------------------
qxn =: 4 : 0
'AGES N' =. y
Qx =. x
qxn1 =.  1 - */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
Qx_qxn1 =. Qx&qxn1
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
> Qx_qxn1 each boxedtable(AGES;N)
)


NB. =========================================================
NB.*ex d -
NB.- <b>Form:</b> tacit 
NB.- Calculate the complete expectation of life with extended Qx table.
NB.-note: 
NB.- The complete expectation of life is the average number of 
NB.- years lived by person aged x from age x.<br>
NB.- The final value in the Qx table is extended by 5 years.
NB.-syntax:
NB.+(Qx)ex(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age= integer ages
NB.-example:
NB.+   (ALT_1960_62_M)ex(30 40 50 60 70)
NB.+ 41.119 31.8354 23.1279 15.6059 9.77224
NB.-
NB.+   (ALT_2009_11_F)ex(0 20 40 60) 
NB.+ 84.2052 64.6905 45.1089 26.414
NB. ---------------------------------------------------------
ex =: (0.5 + +/@:(*/\@:(1 - ] }. [: ([ , 5 # {:) [)))"_ 0
NB. ---------------------------------------------------------
Note 'T ex'
ext5 =. [,(5 # {:)      NB. extend Qx table by 5 items
qxext5 =. [: ext5 [     NB. extend Qx table by 5 years
age =. ]
qxages =. age }. qxext5 
pxages =. 1-qxages
ex1 =. +/ @: (*/\ @: pxages)
ex2 =. 0.5 + ex1
ex =. (ex2"_ 0 )f.
)


NB. =========================================================
NB.*exz d - 
NB.- <b>Form:</b> tacit 
NB.- Calculate the complete expectation of life without extended Qx table.
NB.-note: 
NB.- The complete expectation of life is the average number of 
NB.- years lived by person aged x from age x.<br>
NB.- The final value in the qx table has not been extended.
NB.- Same equation as for ex.
NB.-syntax:
NB.+(Qx)exz(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age  = integer ages
NB.-example:
NB.+   (ALT_1960_62_M)exz(30 40 50 60 70)
NB.+41.119 31.8354 23.1279 15.6059 9.77224
NB.-
NB.+   (ALT_2009_11_F)exz(0 20 40 60) 
NB.+84.1505 64.6354 45.0534 26.3563 
NB. ---------------------------------------------------------
exz =: (0.5 + +/@:(*/\@:(1 - ] }. [)))"_ 0
NB. ---------------------------------------------------------
Note 'T exz'
age =. ]
qxages =. age }. [ 
pxages =. 1-qxages
ex1 =. +/ @: (*/\ @: pxages)
ex2 =. 0.5 + ex1
exz =. (ex2"_ 0 )f.
)


NB. =========================================================
NB.*lx d -
NB.- Calculate the number of lives surviving to Age from 100,000 births for the 
NB.- Qx selected table.
NB.- Qx tables start from Age = 0.
NB.-syntax:
NB.+(Qx)lx(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.-example:
NB.+   (ALT_2009_11_F)lx(10)
NB.+99538.4
NB.-
NB.+   (ALT_2009_11_F)lx(0 10 20 30 40)
NB.+100000 99538.4 99391.2 99111.3 98608.9
NB. ---------------------------------------------------------
lx =: 100000 * [ (*/@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])"1) 0 ,"0 ]
NB. ---------------------------------------------------------
Note 'T lx'
pxn =. */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
d0 =. (0,"0 ])  NB. 0, Ages  
lx =. 100000 * ([ pxn"1  (0,"0 ])) f. 
)



NB. =========================================================
NB.*lxn1 d - 
NB.- <b>Form:</b> tacit
NB.- Calculate the number lives surviving to Age + N from 100,000 lives 
NB.- at Age for the selected Qx table.
NB.- Qx tables start from age = 0. 
NB.- (for one life) -  same equation as lxn
NB.-syntax:
NB.+(Qx)lxn1(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer age
NB.+N = interger duration in years
NB.-example:
NB.+  (ALT_2009_11_F)lxn1(10;10)
NB.+99852.1
NB.-
NB.+   (ALT_2009_11_F)lxn1(0;10)
NB.+99538.4
NB. ---------------------------------------------------------
lxn1 =: 100000 * */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
NB. ---------------------------------------------------------
Note 'T lxn1'
pxn1 =. */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
lxn1 =. (100000 * pxn1)  f. 
)


NB. =========================================================
NB.*lxn d -
NB.- <b>Form:</b> tacit
NB.- Extension of lxn1.
NB.- Multiple ages surviving for multiple periods in years
NB.- Calculate for multiple ages and periods surviving from 100,000
NB.- lives at each age for the selected (Qx) mortality table.
NB.- Qx tables start from age = 0. 
NB.-syntax:
NB.+(Qx)lxn(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.+N = integer periods 
NB.-example:
NB.+   (ALT_2009_11_F)lxn(10;10)
NB.+99852.1
NB.-
NB.+   (ALT_2009_11_F)lxn(40;10 20 30)
NB.+98789.6 96154.3 90253.2
NB.-
NB.+   (ALT_2009_11_F)lxn(20 30 40;10)
NB.+99718.4 99493.2 98789.6
NB.-
NB.+   (ALT_2009_11_F)lxn(20 40;0 10 20 30)
NB.+100000 99718.4 99212.9 98012.1
NB.+100000 98789.6 96154.3 90253.2
NB. ---------------------------------------------------------
lxn =: 4 : 0
Qx =. x
'Ages N' =. y
pxn1 =. */@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])
Qx_pxn1 =. Qx&pxn1
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
|: 100000 * > Qx_pxn1 each boxedtable(Ages;N)
)


NB. =========================================================
NB.*dx d -
NB.- <b>Form:</b> tacit
NB.- Number of deaths from Age to Age + 1 
NB.- from lx(Age) lives at Age. 
NB.-note:
NB.- lx(Age) is the number of lives surviving to Age from 100000 biths.
NB.-syntax:
NB.+(Qx)dx(Age)  
NB.+Qx = name of qx table starting at age = 0
NB.+Age = integer ages
NB.-example:
NB.+   (ALT_2005_07_M)dx(0) 
NB.+523
NB.-
NB.+   (ALT_2005_07_M)dx(0 10 20 50)
NB.+523 9.93219 73.2663 288.278 
NB. ---------------------------------------------------------
dx =: (100000 * [ (*/@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])"1) 0 ,"0 ]) - ((100000 * [ (*/@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])"1) 0 ,"0 ]) (1 + ]))
NB. ---------------------------------------------------------
Note 'T dx'
lx =. 100000 * [ (*/@:([ (1 - ] { [) ([: >@:(0&{) ]) + [: i. [: >@:(1&{) ])"1) 0 ,"0 ] 
dx =. (lx - (lx (1+]))) f.
)


NB. =========================================================
NB. Distributions and Plots
NB. =========================================================


NB. =========================================================
NB.*distDurLife d -
NB.- <b>Form:</b> explicit
NB.- Distribution of the duration of life for a selected Qx table and Age.
NB.- Number of simulations = 100,000 for distribution.
NB.-note:
NB.- Mortality table extended by 5 years.
NB.-syntax:
NB.+(Qx)distDurLife(Age)
NB.+Qx = name of qx table starting at age = 0
NB.+Age = integer age
NB.-example:
NB.+   (ALT_2013_15_M)distDurLife(54)
NB.+   (ALT_2013_15_M)distDurLife(0)
NB.-
NB.+   (ALT_2013_15_M)plotdistDurLife(54)
NB.+   (ALT_2013_15_M)plotdistDurLife(0)
NB.+   (ALT_2013_15_M)plotdistDurLife(10;1)
NB. ---------------------------------------------------------
distDurLife =: 4 : 0
rand01=: ?@$ 0:             NB. generate y random numbers in interval (0,1)
QX =: x
ext5 =. [,(5 # {:)
QX5 =: ext5 QX
Age =: y
QX5X =:  Age }. QX5
N=: # QX5X
RND =: ? (100000,N) $ 0
+/"1 */\"1  QX5X <:"1 RND
)


NB. =========================================================
NB. (ALT_2013_15_M)deaths100000(54)
deaths100000 =: 4  : 0
rand01=: ?@$ 0:             NB. generate y random numbers in interval (0,1)
R =. rand01 100000
QX =. x
Age =. y
QX=. Age{QX
+/ QX > R
)


NB. =========================================================
NB.*distDeathsYr d -
NB.- <b>Form:</b> explicit  
NB.- Distribution of the number of deaths in a year for a selected Qx table
NB.- and Age for 100,000 lives at Age.
NB.- 1000 simulations
NB.-example:
NB.+   (ALT_2013_15_M)distDeathsYr(54)
NB.+   (ALT_2013_15_M)distDeathsYr(0)
NB.-
NB.+   (ALT_2013_15_M)plotdistDeathsYr(54)
NB.+   (ALT_2013_15_M)plotdistDeathsYr(0)
NB. ---------------------------------------------------------
distDeathsYr =: 4 : 0
Qx=. x
Age =. y
d=. (Qx)&deaths100000 
>d each 1000#Age
)


NB. =========================================================
NB.*plotdistDurLife d -
NB.- <b>Form:</b> explicit 
NB.- <b>Depend:</b> distDurLife
NB.- Plot the pdf and cdf from distDurLife.
NB.-syntax:
NB.+(Qx)distDurLife(Age;[Y])
NB.+Qx = name of qx table starting at age = 0
NB.+Age = integer age
NB.- [Y] = 0 optinal = default - probability density functions (pdf)
NB.-     = 1 cumulative density function (cdf) 
NB.-example: 
NB.+   (ALT_2013_15_M)plotdistDurLife(54)
NB.+   (ALT_2013_15_M)plotdistDurLife(54;1)
NB.+   (ALT_2013_15_M)plotdistDurLife(0)
NB.+   (ALT_2013_15_M)plotdistDurLife(0;1)
NB. ---------------------------------------------------------
plotdistDurLife =: 4 : 0
freqcount=. (\: {:"1)@(~. ,. #/.~)
Qx =. x
'Age Opt' =. 2{. (>y),0
if. Opt = 0 do. 'title PDF'plot  (%100000)     *1{"1 sort  freqcount  (Qx)distDurLife(Age)
            else. 'title CDF' plot +/\(%100000) *1{"1 sort  freqcount  (Qx)distDurLife(Age) end.
)


NB. =========================================================
NB.*plotdistDeathsYr d -
NB.- <b>Form:</b> explicit 
NB.- <b>Depend:</b> distDyingYr
NB.- Plot the pdf and cdf from distDeathsYr.
NB.-syntax:
NB.+(Qx)distDeathsYr(Age;[Y])
NB.+Qx = name of qx table starting at age = 0
NB.+Age = integer age
NB.- [Y] = 0 optinal = default - probability density functions (pdf)
NB.-     = 1 cumulative density function (cdf) 
NB.-example: 
NB.+   (ALT_2013_15_M)plotdistDeathsYr(54)
NB.+   (ALT_2013_15_M)plotdistDeathsYr(54;1)
NB.+   (ALT_2013_15_M)plotdistDeathsYr(0)
NB.+   (ALT_2013_15_M)plotdistDeathsYr(0;1)
NB. ---------------------------------------------------------
plotdistDeathsYr =: 4 : 0
freqcount=. (\: {:"1)@(~. ,. #/.~)
Qx =. x
'Age Opt' =. 2{. (>y),0
if. Opt = 0 do. 'title PDF' plot  (%100000)   *1{"1 sort  freqcount  (Qx)distDeathsYr(Age)
            else. 'title CDF' plot +/\(%100000) *1{"1 sort  freqcount  (Qx)distDeathsYr(Age) end.
)







