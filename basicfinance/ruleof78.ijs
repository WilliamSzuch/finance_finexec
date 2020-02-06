NB. =========================================================
NB.%ruleof78.ijs - Rule of 78 
NB.- Script: ~addons/finance/finexec/basicfinance/ruleof78.ijs
NB.- Contributor: William Szuch
NB.- Updated: 4/2/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Basic Finance</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Rule of 78 outstanding monthly balance calculations.
NB.- Equations to be added.
NB.- <a href="../eqs/ruleof78_ijs_eqs.html" target="_blank">Script equations: ruleof78.ijs To Do</a>
NB.- <a href="../ruleof78.ijs" target="_blank">Script source: rule0f78.ijs</a>

NB.-<hr>


NB. =========================================================
NB.*ruleof78 v - 
NB.- <b>Form</b> explicit
NB.- Outstanding balances under the Rule of 78
NB.- Generates the outstanding balance at the end of each month 
NB.- after the periodic monthly loan repayment for a loan 
NB.- using the Rule of 78.
NB.- If the loan repayments are less than amount of loan 
NB.- the result is message and no calculation is made.
NB.- (1) loan repayments are at the end of the month
NB.- (2) loan balances are rounded to the nearer cent
NB.- <a href="../eqs/ruleof78_eq.html" target="_blank">Equation: ([Opt])ruleof78(A;M;X) To Do</a>
NB.-syntax:
NB.+([Opt])ruleof78(A;M;X)
NB.+[Opt] = disply option 
NB.+        default: unboxed table with no headings 
NB.+        1 = boxed table with heading and summary 
NB.+A = amount of loan
NB.+M = term of loan in integer months
NB.+X = amount of monthly loan repayment
NB.-example:
NB.+   ruleof78 (1000;12;110)
NB.+ 0   0   1000
NB.+ 1 110 939.23
NB.+ 2 110 874.36
NB.+ 3 110 805.38
NB.+ 4 110 732.31
NB.+ 5 110 655.13
NB.+ 6 110 573.85
NB.+ 7 110 488.46
NB.+ 8 110 398.97
NB.+ 9 110 305.38
NB.+10 110 207.69
NB.+11 110  105.9
NB.+12 110      0
NB.-example:
NB.+ Try these examples:
NB.+   (1)ruleof78(1000;12;110)
NB.+   (1)ruleof78(1000;110;12)
NB.+   rule7of78(1000;60;24)
NB.+   ruleof78(1200;100;12)
NB.+   ruleof78(3600;100;36)
NB.+   ruleof78(1000;70;12)   NB. repayments to low
NB.-
NB.+ Further examples:
NB.+   require 'plot'
NB.+   plot 2{"1 [ ruleof78  (1000;110;12)
NB.+   plot 2{"1 [ ruleof78 (1000;200;12)  NB. Rule of 78 not suitable
NB.+   plot 2{"1 [ ruleof78 (1000;200;24)  NB. Rule of 78 not suitable
NB. ---------------------------------------------------------
ruleof78 =: 3 : 0
'' ruleof78 y
:
round=. [ * [: <. 0.5 + %~  NB. round y to nearest x (e.g. 1000 round 12345)
'A M X'=. y
MONS =. i. >: M
T =.  |. MONS
D =. X * M
CR =. D - A
if. CR < 0 do. smoutput <'*** Total repayments less than amount of loan ***' return. end.
B1 =. ((A + CR) *T) % M
K =. (T * (T+1))%(M*(M+1))
D1 =. K * CR
BAL =. 0.01 round (B1 - D1)
PMTS =. 0, M#X
SHD =. MONS,. PMTS,.BAL
HDR =. 'Month End';'Payment';'Loan Balance'
SUM =. 'Total Payments';(+/PMTS) ;''
CRC =. 'Credit Charge';CR;''
if. 1 = #x  do. RES =. (HDR,<"0 SHD),SUM,:CRC return. end.
SHD
)



