NB. =========================================================
NB.%fundprojection.ijs - Fund projection using the Fold conjunctions F: and F.
NB.-<script src="../js/basicfinance_links.js"></script>
NB.- Script: ~addons/finance/finexec/basicfinance/fundprojection.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 6 25
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev
NB.- <a href="../fundprojection.ijs" target="_blank">Script source: fundprojection.ijs</a>
NB.-<hr>
NB.- Fund projection:
NB.- Using the Fold conjuctions F: and F.
NB.- No rounding. 
NB.- Cash flows at the end of period.
NB.- <b>Process:</b>
NB.- (1) Set initial values for the fund projection schedule calculation in setiv.
NB.- (2) run setiv '' each time a calculation is required to
NB.- reset the initial values for the fund projection.      
NB.- (3) Run required fund projection definition: 
NB.-       fproj ''     
NB.-       fproj_a ''
NB.-<hr>
NB.- Equations:
NB.- To Do: 
NB.-<hr>


require 'plot'


NB. =========================================================
NB.*setiv m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Set the initial values for the fund projection schedule.
NB.-syntax:
NB.+setiv ''
NB.-example:
NB.+  setiv ''
NB. ---------------------------------------------------------
setiv =: 3 : 0
F0 =: 100000        NB. Fund at start of period
Ci =: 1 + i. 12     NB. Cash flow in
Co =: 12 # 2        NB. Cash flow out
Cn =: Ci - Co       NB. Net cash flow
R  =: 12#0.05       NB. Investment return for the period
NX  =: #Ci          NB. Number of periods
N =: 0              NB. Period counter
smoutput <'*** Initial values set ***'
)


NB. =========================================================
NB.*vv d Operand to Fold conjunction
NB. ---------------------------------------------------------
vv =: 3 : 0
_2 Z: N = NX       NB. Stop Fold after last period
NB. ---------------------------------------------------------
NZ =: N
F =: F0
RZ =:  N{R
CiZ =: N{Ci
CoZ =: N{Co
CnZ =: CiZ - CoZ
IZ  =: F*RZ
NB. ---------------------------------------------------------
NB. Recurrence relations
N =: N+1
F0 =: F+IZ+CnZ
)


NB. =========================================================
NB.*uu m Operand to Fold conjunction
NB. ---------------------------------------------------------
uu =: 3 : 'N,F,RZ,IZ,CiZ,CoZ,CnZ,F0'


NB. =========================================================
NB.*HDR n - 
NB.- Header for fund projection schedule 
HDR =: 'Period';'Start';'R';'I';'Ci';'Co';'Cn';'End'


NB. =========================================================
NB.*fproj m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the full fund projection schedule.
NB.-syntax:
NB.+fproj ''
NB.-example:
NB.+  fproj ''
NB.+  <"0 fproj ''
NB.+  HDR,<"0 fproj ''
NB.+  plot 1{"1 fproj ''
NB. ---------------------------------------------------------
fproj =: uu F: vv @:setiv


NB. =========================================================
NB.*fproj_l m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the last result of the Fold calculations.
NB.-syntax:
NB.+fproj_l ''
NB.-example:
NB.+  fproj_l ''
NB.+  HDR,:<"0 fproj_l ''
NB. ---------------------------------------------------------
fproj_l =: uu F. vv @:setiv





