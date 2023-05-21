NB. =========================================================
NB.%loanschedule.ijs - Loan schedule using Fold conjunctions F: and F.
NB.-<script src="../js/basicfinance_links.js"></script>
NB.- Script: ~addons/finance/finexec/basicfinance/loanschedule.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 6 25
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev
NB.- <a href="../loanschedule.ijs" target="_blank">Script source: loanschedule.ijs</a>
NB.-<hr>
NB.- Loan schedule:
NB.- Using the Fold conjuctions F: and F.
NB.- No rounding. 
NB.- Loan repayment are made at the end of period.
NB.- <b>Process:</b>
NB.- (1) Set initial values for the loan schedule calculation in  setv
NB.- (2) run:  setv '' each time a calculation is required to
NB.-     reset the initial values for the loan schedule.
NB.      Required for F. and F: conjunctions  
NB.- (3) Run the required definitions: 
NB.-       lshd ''     
NB.-       lshd_a ''
NB.-<hr>
NB.- Equations- To Do 
NB.- Provide for a repayment schedule. 
NB.-<hr>


require 'plot'


NB. =========================================================
NB.*setv m Set the initial values for the loan schedule.
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Set initial values for the loan schedule.
NB.- Required to be run before each loan calulation.
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
NB. ---------------------------------------------------------
NB. Allow for changes to E and P
EX =: 1.01       NB. Effective interest rate increases per period
PX =: 1.05       NB. Repayment increase rate  rate per period
smoutput <'*** Initial values set ***'
)


NB. =========================================================
NB.*vo v Operand to Fold conjunction
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Show the full loan schedule.
NB.-syntax:
NB.+lshd ''
NB.-example:
NB.+  lshd ''
NB. ---------------------------------------------------------
vo =: 3 : 0
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
E =: E* EX     
P =: P*PX     
L0 =: B + I - PZ
)


NB. =========================================================
NB.*uo m Operand to Fold conjunction
NB. ---------------------------------------------------------
uo =: 3 : 'NZ,B,EZ,I,PZ,L0'


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
lshd =: uo F: vo


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
lshd_a =: uo F. vo





