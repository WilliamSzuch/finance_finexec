NB. =========================================================
NB.%loanschedule.ijs - Loan schedule using Fold conjunctions F: and F.
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/basicfinance/loanschedule.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../loanschedule.ijs" target="_blank">Script source: loanschedule.ijs</a>
NB.-<hr>
NB.- Loan schedule:
NB.- Using the Fold conjuctions F: and F.
NB.- No rounding. 
NB.- Loan repayment are at the end of period.
NB.- <b>Process:</b>
NB.- (1) Set initial values for the loan schedule calculation.
NB.- (2) rub  setv '' each time a calculation is required to
NB.- reset the initial values for the loan schedule.  
NB.- (3) Run required definition: 
NB.-       lshd ''     
NB.-       lshd_a ''
NB.-<hr>
NB.- Equations:
NB.- To Do: 
NB.-<hr>


require 'plot'


NB. =========================================================
NB.*setv m Set the initial values for the loan schedule.
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Set initial values for the loan schedule.
NB.-syntax:
NB.+setv ''
NB.-example:
NB.+  setv ''
NB. ---------------------------------------------------------
setv =: 3 : 0
MAXITER =: 200
L0 =: 100000     NB. Initial loan amount
E =: 0.05        NB. Effective interest rate per time period
P =: 7500        NB. Loan repayment at end of period
N =: 1           NB. Period counter
smoutput <'*** Initial values set ***'
)


NB. =========================================================
NB.*v v Operand to Fold conjunction
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the full loan schedule.
NB.-syntax:
NB.+lshd ''
NB.-example:
NB.+  lshd ''
NB. ---------------------------------------------------------
v =: 3 : 0
_3 Z: MAXITER   NB. Stop Fold on too many iterations
_2 Z: L0 < 0    NB. Stop Fold when loan amount is negative
NB. ---------------------------------------------------------
B =: L0
NZ =: N
EZ =: E
PZ =: P
I =: B*E
NB. ---------------------------------------------------------
NB. Recurrence relations
N =: N+1
E =: E* 1.01
P =: P *1.05
L0 =: B + I - PZ
)


NB. =========================================================
NB.*u m Operand to Fold conjunction
NB. ---------------------------------------------------------
u =: 3 : 'NZ,B,EZ,I,PZ,L0'


NB. =========================================================
NB.*HDR n Header for loan schedule 
HDR =: 'Period';'Start';'E';'I';'P';'End'


NB. =========================================================
NB.*lshd m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the full loan schedule.
NB.-syntax:
NB.+lshd ''
NB.-example:
NB.+  lshd ''
NB.+  <"0 lshd ''
NB.+  HDR,<"0 lshd ''
NB.+  plot 1{"1 lshd ''
NB. ---------------------------------------------------------
lshd =:  u F: v 


NB. =========================================================
NB.*lshd_a m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the last result of the Fold calculations.
NB.-syntax:
NB.+lshd_a ''
NB.-example:
NB.+lshd_a ''
NB.+ <"0 lshd_a ''
NB. ---------------------------------------------------------
lshd_a =: u F. v





