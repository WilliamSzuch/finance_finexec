NB. =========================================================
NB.%loan.ijs - Definitions for loan calculations, plots and schedules
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/basicfinance/loan.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: ~addons/graphics/plot/plot.ijs
NB.-         ~addons/finance/finexec/ipm/mwrr.ijs
NB.-         ~addons/finance/finexec/toolbox/plot.ijs
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../loan.ijs" target="_blank">Script source: loan.ijs</a>
NB.-<hr>
NB.- Definitions for loan calculation problems with
NB.- a constant effective interest rate over the loan period.
NB.- Defintions for loan schedules and plots.
NB.- No rounding in calculations unles specified in the definition.
NB.-<hr>


require '~addons/graphics/plot/plot.ijs'
require '~addons/finance/finexec/ipm/mwrr.ijs' 
require '~addons/finance/finexec/toolbox/plots.ijs'


NB. =========================================================
NB.*loanTerm m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> loanBal
NB.- Calculate the number of time units to fully repay
NB.- a loan. The result is a two item list:
NB.- (1) number of time units payments
NB.- (2) amount of over payment in the final payment
NB.- No rounding in the calculations.
NB.-syntax:
NB.+loanTermMonths(L;R;P)
NB.+L = amount of loan
NB.+E = effective interest rate for the time unit  
NB.+P = loan repayment at end of time unit
NB.-example:
NB.+  loanTerm(100000;0.01;12000) 
NB.+ 9 _3053.8
NB.-
NB.+ loanTerm(100000;0.005;1110.21)
NB.+120 _0.816215
NB.-
NB.+ loanTerm(100000;0.005;975.85)
NB.+145 _975.805
NB.-
NB.+ loanTerm(1000;0.01;1200)
NB.+1 _190
NB.-
NB.+ loanTerm(1000;0.01;1)
NB.+┌───────────────────────────────┐
NB.+│Loan Payments not repaying loan│
NB.+└───────────────────────────────┘
NB. ---------------------------------------------------------
loanTerm =: 3 : 0
'L E P' =. y
M =. 1
B =. 4{loanBal(L;E;P)
if. B >: L do. <'Loan Payments not repaying loan' return. end.
while. B > 0 do. M =. M+1 
                 B =. 4{loanBal(B;E;P) end.
M,B
)


NB. =========================================================
NB.*loanTermMonths m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> loanBal
NB.- Calculate the number of months to fully repay
NB.- a loan. The result is a two item list:
NB.- (1) number of monthly payments
NB.- (2) amount of over payment in the final monthly payment
NB.- No rounding in the calculations.
NB.-syntax:
NB.+loanTermMonths(L;R;P)
NB.+L = amount of loan
NB.+R = yearly nominal interest rate payable monthly  
NB.+P = monthly loan repayment
NB.-example:
NB.+  loanTermMonths(100000;0.12;12000) 
NB.+ 9 _3053.8
NB.-
NB.+ loanTermMonths(100000;0.06;1110.21)
NB.+120 _0.816215
NB.-
NB.+ loanTermMonths(100000;0.06;975.85)
NB.+145 _975.805
NB.-
NB.+ loanTermMonths(1000;0.06;1200)
NB.+1 _195
NB.+
NB.+ loanTermMonths(1000;0.06;5)
NB.+┌───────────────────────────────┐
NB.+│Loan Payments not repaying loan│
NB.+└───────────────────────────────┘
NB. ---------------------------------------------------------
loanTermMonths =: 3 :0 
'L R P' =: y
E =: R%12
M =: 1
B =: 4{loanBal(L;E;P)
if. B >: L do. <'Loan Payments not repaying loan' return. end.
while. B > 0 do. M =: M+1 
                 B =: 4{loanBal(B;E;P) end.
M,B
)


NB. =========================================================
NB.*loanMonthlyPmt d -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Calculate the level monthly loan repayments.
NB.- Loan repayments commence at the end of the first month.
NB.-syntax:
NB.+(R)loanMonthlyPmt(L;M)
NB.+R = yearly nominal rates of interest payable monthly
NB.+L = amount of the loan
NB.+M = period of the loan in months (integer)
NB.-example:
NB.+   (0.06)loanMonthlyPmt(100000;120)
NB.+1110.21
NB.-
NB.+   (0.06 0.05)loanMonthlyPmt(100000;120 132 144)
NB.+1110.21 1060.66
NB.+ 1036.7 986.449
NB.+ 975.85  924.89
NB. ---------------------------------------------------------
loanMonthlyPmt =: >@:([: 0&{ ]) % ([: ([ (*"_ 0) 1 % ])&12 [) +/@:(([: % 1 + ])~ ^"_ 0 [: (1 + i.) ])"_ 0 >@:([: 1&{ ]) 
NB. ---------------------------------------------------------
Note 'T loanMonthlyPmt'
R =. [
L =. >@:([:0&{ ]) 
M =. >@:([: 1&{ ]) 
enominal =. [ (*"_ 0) 1 % ]
enominal12 =. enominal&12
E =. [: enominal12 R
vn1 =. +/@:(([: % 1 + ])~ ^"_ 0 [: (1 + i.) ])"_ 0
loanMonthlyPmt =. (L % (E) vn1 (M)) f.
)


NB. =========================================================
NB.*loanBal m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Loan balance over one time unit after interest and loan repayment.
NB.- Result is a 5 item list:
NB.- (1) loan balance at start of the time unit
NB.- (2) effective interest rate for the time unit
NB.- (3) interest payable at the end of the time unit
NB.- (4) payment made at the end of the time unit
NB.- (5) loan balance at the end of the time unit
NB.-     a negative balance is an overpayment
NB.-syntax:
NB.+loanBal(L;E;P)
NB.+L = loan balance at start of time unit
NB.+E = effective rate of interest for the time unit
NB.+P = payment at the end of the time unit
NB.-example:
NB.+   loanBal(100000;0.06;7110)
NB.+100000 0.06 6000 7110 98890
NB.-
NB.+  loanBal(1000;0.06;1200)
NB.+1000 0.06 60 1200 _140
NB.-
NB.+  loanBal(1000;0.06;55)
NB. ---------------------------------------------------------
loanBal =: 3 : 0
'L0 Em P' =. y
Int =. L0*Em
L1 =. (L0 + Int)-P
L0,Em,Int,P,L1
)


NB. =========================================================
NB.*loanMonthlyPmtShd v -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> loanBal
NB.- Calculate the monthly loan repayment schedule.
NB.- Interest and monthly payment paid at end of the month.
NB.-syntax:
NB.+([Opt])loanMonthlyPmtShd(R;L;M)
NB.+[Opt] = optional result display: 
NB.+        default numeric table with columns: 
NB.+ Opt =  1 boxed  table with header
NB.+       'Month';'Bal Start';'Eff Rate';'Int';'Pmt';'Bal End'
NB.+R = annual nominal rate of interest payable monthly
NB.+L = amount of the loan
NB.+M = period of the loan in months (integer)
NB.-example:
NB.+   loanMonthlyPmtShd(0.12;100000;120)
NB.+  (1)loanMonthlyPmtShd(0.12;100000;120)
NB. ---------------------------------------------------------
loanMonthlyPmtShd =: 3 : 0
'' loanMonthlyPmtShd y
:
'R L M' =. y 
Em =. R%12
Pmt =. L % +/ (1+Em) ^ - 1+i. M
HDR1 =.'Month';'Bal Start';'Eff Rate';'Int';'Accum Int';'Pmt';'Accum Pmt';'Bal End'
HDR =.'Month';'Bal Start';'Eff Rate';'Int';'Pmt';'Bal End'
Mth =. <"0 [1 + i. M
Cnt =. 1
Shd =. loanBal(L;Em;Pmt)
while. Cnt < M do.
 Cnt =. Cnt+1
 Shd =. Shd,loanBal((_1{Shd);Em;Pmt)
end.
R1 =. (M,5) $ Shd
AccInt =. +/\ 2{"1 R1
AccPmt =. +/\ 3{"1 R1
R2 =. 0 1 2 5 3 6 4{"1 R1,.AccInt,.AccPmt
RShd =. HDR1,(Mth,.<"0 R2)
if. 1 = #x  do. RShd else. R2 end.
)


NB. =========================================================
NB.*loanLevelPmt d - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Calculate the level loan repayments for time units.
NB.- Loan repayments commence at the end of the first time unit.
NB.-syntax:
NB.+(E)loanLevelPmt(L;N)
NB.+E = effective rate of interest for the time unit
NB.+L = amount of the loan
NB.+N = number of loan repayments (integer)
NB.-example:
NB.+   (0.06)loanLevelPmt(100000;12)
NB.+11927.7
NB.-
NB.+   (0.06 0.05)loanLevelPmt(100000;10 15 20)
NB.+13586.8 12950.5
NB.+10296.3 9634.23
NB.+8718.46 8024.26
NB. ---------------------------------------------------------
loanLevelPmt =: >@:([: 0&{ ]) % [ +/@:(([: % 1 + ])~ ^"_ 0 [: (1 + i.) ])"_ 0 >@:([: 1&{ ])
NB. ---------------------------------------------------------
Note 'build loanLevelPmt'
E =. [
L =. >@:([:0&{ ]) 
N =. >@:([: 1&{ ]) 
vn1 =. +/@:(([: % 1 + ])~ ^"_ 0 [: (1 + i.) ])"_ 0
loanLevelPmt =. (L % (E)vn1(N)) f.
)


NB. =========================================================
NB.*loanLevelPmtEffRate v -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> mwrPeriodic
NB.- Calculate the effective rate of interest for a time unit 
NB.- for a loan with level repayments at each time unit.
NB.- Depend: mwrPeriodic
NB.syntax:
NB.+([I])loanLevelPmtEffRate(L;N;Pmt)
NB.+[I] = optional initial trial value (decimal interest rate)
NB.+      default = 0 
NB.+L = anount of loan
NB.+N = number of level repayments at each time unit
NB.+    repayments commence at the end of the first time unit
NB.+Pmt = level repayment 
NB.-example:
NB.+   loanLevelPmtEffRate(100000;20;6500)
NB.+0.0264024
NB.-
NB.+   loanLevelPmtEffRate(500000;(20*12);2850)
NB.+0.00275434
NB. ---------------------------------------------------------
loanLevelPmtEffRate =: 3 : 0
0 loanLevelPmtEffRate y
:
'L N Pmt' =. y 
if. 0 = #x  do. E0 =. 0 else. E0 =. x end.
C =. (-L),N#Pmt
(E0)mwrPeriodic(C)
) 


NB. =========================================================
NB.*loanVarPmtsEffRate v -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> mwr
NB.- Calculate the effective rate of interest for a time unit 
NB.- for a loan with variable repayments at each time unit.
NB.- Depend: mwr
NB.syntax:
NB.+([I])loanVarPmtsEffRate(L;Pmts;T)
NB.+[I] = optional initial trial value (decimal interest rate)
NB.+      default = 0 
NB.+L = anount of loan
NB.+Pmts = list of loan repayments 
NB.+T =    time in time units of the loan repayments
NB.-example:
NB.+   loanVarPmtsEffRate(100000;(55000 65000);1 2)
NB.+0.126836
NB.-
NB.+   loanVarPmtsEffRate(500000;550000;1)
NB.+0.1
NB.-
NB.+   loanVarPmtsEffRate(500000;(100000,200000,100000,200000);1 2 3 4)
NB.+0.071948
NB. ---------------------------------------------------------
loanVarPmtsEffRate =: 3 : 0
0 loanVarPmtsEffRate y
:
'L Pmts T' =: y 
if. 0 = #x  do. E0 =. 0 else. E0 =. x end.
C =: (-L),Pmts
T =: 0,T
(E0)mwr(C;T)
) 


NB. =========================================================
NB. Loan plots
NB. =========================================================


NB. =========================================================
NB.*plotLoanMonthlyPmtShd m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> loanMonthlyPmtShd
NB.-                plotm   
NB.- Plot the loan monthly payment schedule details.
NB.-syntax:
NB.+plotLoanMonthlyPmtShd(R;L;M)
NB.+R = yearly nominal rate of interest payable monthly
NB.+L = amount of the loan
NB.+M = period of the loan in months (integer)
NB.-example:
NB.+   plotLoanMonthlyPmtShd(0.05;100000;120)
NB.+   plotLoanMonthlyPmtShd(0.06;100000;360)
NB.+   plotLoanMonthlyPmtShd(0.05;100000;12)
NB. ---------------------------------------------------------
plotLoanMonthlyPmtShd =: 3 : 0
'R L M' =. y 
SHD0 =.  loanMonthlyPmtShd(R;L;M)
Mths =. i. M+1
Pmt =. 4{0{SHD0
Bal =. L,6{"1 SHD0
IntCum =. +/\  0,2{"1 SHD0
PmtCum =. +/\  0,4{"1 SHD0
DATA =. Mths;Bal,IntCum,:PmtCum
TDATA =. 'Loan $',(": L),' Pmt $',(,'2' 8!:2 Pmt),' Period ',(": M),LF,'Yearly nominal interest rate payable monthly:',(,'q<%>2' 8!:2 R*100)
TITLE =. 'title Loan : Monthly Paymemts',LF,TDATA
XCAPTION =. 'xcaption Month'
YCAPTION =. 'ycaption $'
TYPE =. 'type line'
KEYS =. plotkeys('Loan balance';'Accumulated interest paid';'Accumulated payments')
TTT =. (TITLE;XCAPTION;YCAPTION;TYPE;KEYS)
TTT plotm DATA
)



