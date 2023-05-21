NB. =========================================================
NB.labhr
NB. =========================================================
NB.labchapter:Lab Info 
NB.=========================================================
0 : 0

Title: Simple Interest (Flat Interest)
Author: William Szuch
Updated: 2023 02 28
 load 'finance/finexec'
 load 'labs/labs'
 lab '~addons/finance/finexec/basicfinance/labs/simple_interest_lab.ijs'
)

lab':'

NB.labhr
NB. =========================================================
NB.labchapter:Definitions
NB. =========================================================
0 : 0

The lab introduces the definitions for
simple interest rate calculations and how they 
can be applied.
)

NB.labhr
NB. Load some stuff
showscript '~addons/finance/finexec/basicfinance/labs/simple_interest_lab.ijs'
load '~addons/finance/finexec/basicfinance/simple.ijs'
finexec_html 'basicfinance/docs/simple.htm'
NB. ---------------------------------------------------------
NB. Definitions loaded to base locale
names ''

NB.labhr
NB. =========================================================
NB.labchapter:Future value
NB. =========================================================
0 : 0

Examples of future value calculations using simple rates.
It is assumed that the simple interest rate is constant
over the period.
)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 1
0 : 0

Calculate the future value of $1 in 1 year at
6.0% yearly simple interest rate.
)
s(0.06)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 2
0 : 0

Calculate the future value of $1,000 in 1 year at
2.0%, 4.0% and 6.0% yearly simple interest rate.
)
1000 * s(0.02 0.04 0.06)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 3
0 : 0

Calculate the future value of $1,000 in 1,2 and 5 years at
6.0% yearly simple interest rate.
)
1000 * (0.06)st(1 2 5)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 4
0 : 0

 Calculate the future value of $1,000 in 1,2 and 5 years at
 4.0 and 6.0% yearly simple interest rate.
)
1000 * (0.04 0.06)st(1 2 5)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 5
0 : 0
 Calculate the future value of $1,000 in 1,10,20,91 and 
 182 days at 4.0 and 6.0% yearly simple interest rate.
 Assume 365 days in the year.
)
NB. ---------------------------------------------------------
1000 * (0.04 0.06)st(1 10 20 91 182 % 365)

NB.labhr
NB. =========================================================L
NB.labchapter:Present value
NB. =========================================================
0 : 0
Examples of present value calculations using simple rates.
It is assumed that the simple interest rate is constant
over the period.
)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 1
0 : 0
Calculate the present value of $1 in 1 year at
6.0% yearly simple interest rate.
)
r(0.06)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 2
0 : 0
Calculate the present value of $1,000 in 1 year at
2.0%, 4.0% and 6.0% yearly simple interest rate.
)
1000 * r(0.02 0.04 0.06)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 3
0 : 0
Calculate the present value of $1,000 in 1,2 and 5 years at
6.0% yearly simple interest rate.
)
1000 * (0.06)rt(1 2 5)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 4
0 : 0
Calculate the present value of $1,000 in 1,2 and 5 years at
4.0 and 6.0% yearly simple interest rate.
)
1000 * (0.04 0.06)rt(1 2 5)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 5
0 : 0
Calculate the present value of $1,000 in 1,10,20,91 and 
182 days at 4.0 and 6.0% yearly simple interest rate.
Assume 365 days in the year.
)
1000 * (0.04 0.06)rt(1 10 20 91 182 % 365)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 6
0 : 0
Calculate the present value of $100,000 Treasury Note 
payable in 20 days at 6.0% yearly simple interest rate.
Assume 365 days in the year.
)
100000 * (0.06)rt(20% 365)

NB.labhr
NB. =========================================================
NB.labchapter:Simple interest rate over a period
NB. =========================================================
0 : 0

Calculate the simple interest rate over a period.
)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 1
0 : 0

An investment increases in value from $100 to $120 over a
one year period. Calculate the yearly simple interest rate.
)
sirate(100;120;1)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 2
0 : 0

Calculate the yearly simple interest rate for an investmnet 
the increases in value $1,000 to $1,200 over a
over a periods of 0.5,1, 2 and 5 years.
)
sirate(1000;1200;0.5 1 2 5)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 3
0 : 0

Calculate the yearly simple interest rate for an investmnet 
the decreases in value $1,000 to $980 over a
over a periods of 0.5,1, 2 and 5 years.
Note: negative values in the Execution Window are displayed
with the underscore: ie: negative 1 is shown as _1
)
sirate(1000;980;0.5 1 2 5)

NB.labhr
NB. =========================================================
NB.labchapter:Accrued Interest
NB. =========================================================
0 : 0

Calculation of accrued interest.
)

NB.labhr
NB. =========================================================
NB.labchapter:   Example 1
0 : 0

Calculate the accrued interest on $10,000 invested for 23 
and 90 days at a yearly simple interest rate of 6.5% 
assuming 365 days in the year.
)
10000*_1+(0.065)st(23 90%365)

NB.labhr
NB. Lab End