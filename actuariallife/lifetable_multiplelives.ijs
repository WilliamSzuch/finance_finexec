NB. =========================================================
NB.%lifetable_multiplelives.ijs - Life table calculations for multiple lives
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Actaurial Life</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/actuariallife/lifetable_multiplelives.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: ~addons/finance/finexec/qxtables/qxtools.ijs'
NB.- Definitions: loaded to locale base
NB.- Status: todo: equations
NB.- <a href="../lifetable_multiplelives.ijs" target="_blank">Script source: lifetable_multiplelives.ijs</a>
NB.-<hr>
NB.- Definitions to calculate life table functions and survival factors
NB.- for mu;tiple lives.
NB.- Qx tables loaded to the locale base.
NB.- See: Qx_ALL for a list of names.
NB.- See: Qx_ALT for a list of Australian Life Tables.
NB.- All mortality tables start at age = 0.
NB.- Note:
NB.- (1) Dealing with Ages outside the range of the mortality table.
NB.- (2) Dealing with qx>1 if Qx table is scaled up.
NB.- use of ext5 
NB.- Tables - try to make tacit 
NB.- Plots
NB.-<hr>
NB.- Equations:
NB.- To Do
NB.-<hr>


require '~addons/finance/finexec/qxtables/qxtools.ijs'


NB. =========================================================
NB. Two lives
NB. =========================================================


NB. ======================================================
NB.*pxy d - 
NB.- <b>Form:</b> explicit
NB.- Probability of joint lives surviving one year.
NB.-syntax:
NB.+(Qx1;Qx2)pxy(Age1;Age2)
NB.+Qx1,Qx2 = mortality tables
NB.+Age1,Age2 = integer ages
NB.-example:
NB.+  (ALT_2004_06_M;ALT_2004_06_F)pxy(0;0)
NB.+0.990075
NB.+
NB.+  (ALT_2004_06_M;ALT_2004_06_F)pxy(25;30)
NB.+0.99879
NB. ---------------------------------------------------------
pxy =: 4 : 0
'Qx1 Qx2' =. x
'A1 A2'   =. y
Q1 =. 1-A1{Qx1
Q2 =. 1-A2{Qx2
Q1*Q2
)


NB. ======================================================
NB.*pxy_v d - 
NB.- <b>Form:</b> explicit
NB.- Vector of probability of joint lives surviving by year.
NB.- The last value in the Qx tables is extended so that tables
NB.- are of equal length for the selected ages.
NB.-syntax:
NB.+(Qx1;Qx2)pxy_v(Age1;Age2)
NB.+Qx1,Qx2 = mortality tables
NB.+Age1,Age2 = integer ages
NB.-example:
NB.+  +/ (ALT_2004_06_M;ALT_2004_06_F)pxy_v(0;0)
NB.+73.0548
NB.+
NB.+  +/ (ALT_2004_06_M;ALT_2004_06_F)pxy_v(25;30)
NB.+47.3702
NB. ---------------------------------------------------------
pxy_v =: 4 : 0
'Qx1 Qx2' =. x
'A1 A2'   =. y
Q1 =. 1-A1}.Qx1
Q2 =. 1-A2}.Qx2
T =. (#Q1)>.(#Q2)
extendr =. ([ {. (] , (# {:))) NB. extend right argument
Q1z =. T extendr Q1
Q2z =. T extendr Q2
*/\Q1z*Q2z
)


NB. =========================================================
NB.*jexp d -
NB.- <b>Form:</b> explicit
NB.- Joint expextation of life.
NB.-syntax:
NB.+  (Qx1;Qx2)jexp(Age1;Age2)
NB.+Qx1,Qx2 = mortality tables
NB.+Age1,Age2 = integer ages
NB.-example:
NB.+  (ALT_2004_06_M;ALT_2004_06_F)jexp(0;0)
NB.+73.0548
NB.+
NB.+  (ALT_2004_06_M;ALT_2004_06_F)jexp(25;30)
NB.+47.3702
NB. ---------------------------------------------------------
jexp =: 4 : 0
'Qx1 Qx2' =. x
'A1 A2'   =. y
Q1 =. 1-A1}.Qx1
Q2 =. 1-A2}.Qx2
T =. (#Q1)>.(#Q2)
extendr =. ([ {. (] , (# {:))) NB. extend right argument
Q1z =. T extendr Q1
Q2z =. T extendr Q2
NB. ---------------------------------------------------------
+/ */\Q1z*Q2z
)


NB. =========================================================
NB.*lsexp d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> jexp
NB.- Last survivor expectation of life.
NB.-syntax:
NB.+  (Qx1;Qx2)lsexp_v(Age1;Age2)
NB.+Qx1,Qx2 = mortality tables
NB.+Age1,Age2 = integer ages
NB.-example:
NB.+  (ALT_2004_06_M;ALT_2004_06_F)lsexp(0;0)
NB.+89.062
NB.+
NB.+  (ALT_2004_06_M;ALT_2004_06_F)lsexp(25;30)
NB.+61.4951
NB. ---------------------------------------------------------
lsexp =:  4 : 0
exz =. (0.5 + +/@:(*/\@:(1 - ] }. [)))"_ 0 NB. From lifetables.ijs
'Qx1 Qx2'  =. x
'A1 A2'    =. y
A2 =.  >1{y
Q1 =. 1-A1}.Qx1
Q2 =. 1-A2}.Qx2
T =. (#Q1)>.(#Q2)
extendr =. ([ {. (] , (# {:))) NB. extend right argument
Q1z =. T extendr Q1
Q2z =. T extendr Q2
((Qx1)exz(A1)) + ((Qx2)exz(A2)) - (Qx1;Qx2)jexp(A1;A2)
)


NB. =================================================================================================
NB.*qxy d -
NB.- <b>Form:</b> explicit
NB.- Probability of joint lives failing for at least 
NB.- one life within the next year.
NB.-syntax:
NB.+(Qx1;Qx2)pxy(Age1;Age2)
NB.+Qx1,Qx2 = mortality tables
NB.+Age1,Age2 = integer ages
NB.-example
NB.+  (ALT_2004_06_M;ALT_2004_06_F)qxy(0;0)
NB.+0.00992547
NB.+
NB.+  (ALT_2004_06_M;ALT_2004_06_F)qxy(25;30)
NB.+0.00120969
NB. ---------------------------------------------------------
qxy =: 4 : 0
'Qx1 Qx2' =. x
'A1 A2'   =. y
Q1 =. A1{Qx1
Q2 =. A2{Qx2
Q1 + Q2 - Q1*Q2
)


NB. =========================================================
NB.*qx1y d -
NB.- <b>Form:</b> explicit
NB.- Probability of life x dying before life y in 
NB.- within the next year.
NB.-syntax:
NB.+(Qx1;Qx2)px1y(Age1;Age2)
NB.+Qx1,Qx2 = mortality tables
NB.+Age1,Age2 = integer ages
NB.-example
NB.+  (ALT_2004_06_M;ALT_2004_06_F)qx1y(0;0)
NB.+0.00538601
NB.-
NB.+  (ALT_2004_06_M;ALT_2004_06_F)qx1y(25;30)
NB.+0.000838984
NB. ---------------------------------------------------------
qx1y =: 4 : 0
'Qx1 Qx2' =. x
'A1 A2'   =. y
Q1 =. A1{Qx1
Q2 =. A2{Qx2
(1-Q1)*(1-Q2)*Q1
)


NB. =========================================================
NB. Three lives
NB. =========================================================


NB. =========================================================
NB.*pxyz d -
NB.- <b>Form:</b> explicit
NB.- Probability of three lives failing for at least 
NB.- one life within the next year.
NB.-syntax:
NB.+(Qx1;Qx2;Qx3)pxy(Age1;Age2;Age3)
NB.+Qx1,Qx2,Qx3 = mortality tables
NB.+Age1,Age2,Age3 ... = integer ages
NB.-example
NB.+  (ALT_2004_06_M;ALT_2004_06_F;ALT_2004_06_M)pxyz(0;0;0)
NB.+0.984689
NB.+
NB.+  (ALT_2004_06_M;ALT_2004_06_F;ALT_2004_06_M)pxyz(25;30;35)
NB.+0.997652
NB. ---------------------------------------------------------
pxyz =: 4 : 0
'Qx1 Qx2 Qx3' =. x
'A1 A2 A3'    =. y
Q1 =. 1-A1{Qx1
Q2 =. 1-A2{Qx2
Q3 =. 1-A3{Qx3
Q1*Q2*Q3
)


NB. ======================================================
NB.*pxyz_v d - 
NB.- <b>Form:</b> explicit
NB.- Vector of probability of three lives surviving by year.
NB.- The last value in the Qx tables is extended so that tables
NB.- are of equal length for the selected ages.
NB.-syntax:
NB.+  (Qx1;Qx2;Qx3)pxyz_v(Age1;Age2;Age3)
NB.+Qx1,Qx2,Qx3 = mortality tables
NB.+Age1,Age2,Age3 = integer ages
NB.-example:
NB.+  +/ (ALT_2004_06_M;ALT_2004_06_F;ALT_2004_06_M)pxyz_v(0;0;0)
NB.+69.4793
NB.+
NB.+  +/ (ALT_2004_06_M;ALT_2004_06_F;ALT_2004_06_M)pxyz_v(25;30;35)
NB.+43.5572
NB. ---------------------------------------------------------
pxyz_v =: 4 : 0
'Qx1 Qx2 Qx3' =: x
'A1 A2 A3'    =: y
Q1 =: 1-A1}.Qx1
Q2 =: 1-A2}.Qx2
Q3 =: 1-A3}.Qx3
T =: >./ (#Q1),(#Q2),(#Q3)
extendr =: ([ {. (] , (# {:))) NB. extend right argument
Q1z =: T extendr Q1
Q2z =: T extendr Q2
Q3z =: T extendr Q3
*/\Q1z*Q2z*Q3z
)



NB. =================================================================================================
NB.*qxyz d -
NB.- <b>Form:</b> explicit
NB.- Probability of joint lives failing for at least 
NB.- one life within the next year.
NB.-syntax:
NB.+(Qx1;Qx2;Qx3)pxyz(Age1;Age2;Age3)
NB.+Qx1,Qx2,Qx3 = mortality tables
NB.+Age1,Age2,Age3 = integer ages
NB.-example
NB.+  (ALT_2004_06_M;ALT_2004_06_F;ALT_2004_06_M)qxyz(0;0;0)
NB.+0.0153115
NB.+
NB.+  (ALT_2004_06_M;ALT_2004_06_F;ALT_2004_06_M)qxyz(25;30;35)
NB.+0.00234831
NB. ---------------------------------------------------------
qxyz =: 4 : 0
1- x pxyz y
)


