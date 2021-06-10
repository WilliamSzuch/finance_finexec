NB. =========================================================
NB.%lease.ijs - Definitions for lease calculations
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/basicfinance/lease.ijs
NB.- Contributor: William Szuch
NB.- Updated: 10/4/2021
NB.- Depend: ~addons/finance/finexec/ipm/mwrr.ijs
NB.-         ~addons/finance/finexec/basicfinance/compound.ijs
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../lease.ijs" target="_blank">Script source: lease.ijs</a>
NB.-<hr>
NB.- Definitions for lease calculation problems with
NB.- a constant effective interest rate over the lease term.
NB.- No rounding in calculations unles specified in the definition.
NB.- A yearly nominal interest rate payable monthly 
NB.- is used in the calculation.
NB.- Lease payments are monthly in arrears with a ballooon 
NB.- payment at the end of the lease with the final monthly payment.
NB.- For example a 36 month lease will have:
NB.- 36 monthly payments 1 ... 36 and
NB.- balloon payment at the end of month 36 
NB.- Lease arrangements can have an Up Front Fee.    
NB.-<hr>


require '~addons/finance/finexec/basicfinance/compound.ijs'
require '~addons/finance/finexec/basicfinance/loan.ijs'
require '~addons/finance/finexec/toolbox/bisection.ijs'


NB. =========================================================
NB.*leasePmt m - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> an
NB.- Calculate the monthly lease repayments for a lease.
NB.- Lease payments are assumed to be paid in arrears with a final residual
NB.- balloon payment at the end of the term.
NB.-synrax:
NB.+leasePmt(L;B;R;T)
NB.+L = loan amount 
NB.+B = balloon payment - residual amount
NB.+R  = yearly nominal interest rate payable monthly
NB.+T = term of lease in months(interger)
NB.-example:
NB.+  leasePmt(20000;10000;0.075;36)
NB.+373.562
NB.-
NB.+  leasePmt(30000;10000;0.0358;36)
NB.+616.584
NB. ---------------------------------------------------------
leasePmt =: 3 : 0
'L B R T' =. y
E =. R%12
(L - B%(1+E)^T) % ((E)an(T))
)



NB. =========================================================
NB.*f d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> an
NB.- Definition to calculate the difference between loan amount 
NB.- and the present value of lease monthly payments.
NB.- Used in leaseR with bisection to 
NB.- Solve f(x) = 0
NB.-syntax:
NB.+(L;B;T;P)f(E)
NB.+L = loan amount 
NB.+B = balloon payment - residual amount
NB.+T = term of lease in months(interger)
NB.+P = monthly lease payment
NB.+E = monthly effective interest rate
NB.-example:
NB.+(30000;10000;36;616.56)f(0.0358%12)
NB. ---------------------------------------------------------
f =: 4 :0
'L B T P' =. x
L- (P*(y)an(T)) + B%(1+y)^T
)


NB. =========================================================
NB.*leaseR m-
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> f
NB.-                bisection
NB.- Calculate the yearly nominal interest rate payable monthly
NB.- for a lease.
NB.- Using the Bisection Method.
NB.- The result is a two item list:
NB.- (1) monthly effective inteerest rate
NB.- (2) value of f(x) using the approximation ie: error
NB.-syntax:
NB.+(L;B;T;P)leaseR(A;B:[Tol])
NB.+L = loan amount 
NB.+B = balloon payment - residual amount
NB.+T = term of lease in months(interger)
NB.+P = monthly lease payment
NB.+A,B = lower and upper values of initial range
NB.+[TOL] = default tolerence for solution 0.01 
NB.-example:
NB.+  (20000;10000;36;373.56)leaseR(0;0.1;0.001)
NB.+0.00624986 0.000287248
NB.-
NB.+  (30000;10000;36;616.56)leaseR(0;0.05;0.001)
NB.+0.00298219 _0.000491984
NB. ---------------------------------------------------------
leaseR =: 4 : 0
x&f bisection y
)


NB. =========================================================
NB.*leasePmtShd m-
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> leasePmt
NB.-                loanBal
NB.- Calculate the monthly lease repayment schedule.
NB.- Interest and monthly payment paid at end of the month.
NB.-syntax:
NB.+([Opt])leasePmtShd(L;B;R;T)
NB.+[Opt] = optional result display: 
NB.+        default numeric table with columns: 
NB.+ Opt =  1 boxed  table with header
NB.+       'Month';'Bal Start';'Eff Rate';'Int';'Pmt';'Bal End'
NB.+L = loan amount 
NB.+B = balloon payment - residual amount
NB.+R  = yearly nominal interest rate payable monthly
NB.+T = term of lease in months(interger)
NB.-example:
NB.+  leasePmtShd(20000;10000;0.075;36)
NB.+  (1)leasePmtShd(30000;10000;0.0358;36)
NB. ---------------------------------------------------------
leasePmtShd =: 3 : 0
'' leasePmtShd y
:
'L B R T' =. y 
E =. R%12
Pmt =. leasePmt(y)
HDR1 =.'Month';'Bal Start';'Eff Rate';'Int';'Accum Int';'Pmt';'Accum Pmt';'Bal End'
HDR =.'Month';'Bal Start';'Eff Rate';'Int';'Pmt';'Bal End'
Mth =. <"0 [1 + i. T
Cnt =. 1
Shd =. loanBal(L;E;Pmt)
while. Cnt < T do.
 Cnt =. Cnt+1
 Shd =. Shd,loanBal((_1{Shd);E;Pmt)
end.
R1 =. (T,5) $ Shd
AccInt =. +/\ 2{"1 R1
AccPmt =. +/\ 3{"1 R1
R2 =. 0 1 2 5 3 6 4{"1 R1,.AccInt,.AccPmt
RShd =. HDR1,(Mth,.<"0 R2)
if. 1 = #x  do. RShd else. R2 end.
)



