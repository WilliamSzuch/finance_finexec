NB. =========================================================
NB.%fundprojection_a.ijs - Fund projection using the Fold conjunctions F:. and F..
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/basicfinance/fundprojection_a.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../fundprojection_a.ijs" target="_blank">Script source: fundprojection_a.ijs</a>
NB.-<hr>
NB.- Fund projection:
NB.- Using the Fold conjuctions F:. and F..
NB.- No rounding. 
NB.- Cash flow at the end of period.
NB.- <b>Process:</b>
NB.- (1) Set initial values for the fund projection schedule calculation.
NB.- (2) run setv '' each time a calculation is required to
NB.- reset the initial values for the fund projection.      
NB.- (3) Run required definition: 
NB.-       fproj_a ''     
NB.-       fproj_a_l ''
NB.-<hr>
NB.- Equations:
NB.- To Do: 
NB.-<hr>


require 'plot'


NB. =========================================================
NB.*setiv_a m- 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Set the initial values for the fund projection schedule.
NB.-syntax:
NB.+setiv_a ''
NB.-example:
NB.+  setiv_a ''
NB. ---------------------------------------------------------
setiv_a =: 3 : 0
F0 =: 100              NB. Fund at start of period
Ci =: 1 + i. 12        NB. Cash flow in
Co =: 12 # 2           NB. Cash flow out
Cn =: Ci - Co          NB. Net cash flow
R  =: 0.05+0.001*i.12  NB. Investment return for the period
N  =: 0                NB. Period counter 
smoutput <'*** Initial values set ***'
)


NB. =========================================================
NB.*vv_a d Operand to Fold conjunction
NB. ---------------------------------------------------------
vv_a =: 4 : 0
Cn =: x
NC =: N
Rz =:  NC{R
Ciz =: NC{Ci
Coz =: NC{Co
Fb =: y
Ic =: Rz * Fb
N =: NC+1
Fe =: Fb + Ic + x
)


NB. =========================================================
NB.*uu_a m Operand to Fold conjunction
NB. ---------------------------------------------------------
uu_a =: 3 : 'N,Fb,Rz,Ic,Ciz,Coz,Cn,Fe'


NB. =========================================================
NB.*HDR_a n Header for fund projection schedule 
HDR_a =: 'Period';'Start';'Rz';'Ic';'Ciz';'Coz';'Cn';'End'


NB. =========================================================
NB.*fproj_a m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the full fund projection schedule.
NB.-syntax:
NB.+lshd ''
NB.-example:
NB.+  F0 fproj_a Cn
NB.+  <"0 fproj Cn
NB.+  HDR,<"0 F0 fproj Cn
NB.+  plot 1{"1 F0 fproj_a Cn
NB. ---------------------------------------------------------
fproj_a =: uu_a F:. vv_a


NB. =========================================================
NB.*fproj_a_l m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the last result of the Fold calculations.
NB.-syntax:
NB.+fproj_a_l ''
NB.-example:
NB.+  F0 fproj_a_l Cn
NB.+  HDR_a<"0 F0 fproj_a_l Cn
NB. ---------------------------------------------------------
fproj_a_l =: uu_a F.. vv_a




