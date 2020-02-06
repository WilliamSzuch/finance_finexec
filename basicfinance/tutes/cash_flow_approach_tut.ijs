0 : 0 
NB. =========================================================
TITLE: Cash Flow Approach
)
0 : 0 
NB. ---------------------------------------------------------
Tutorial Sections
)
spx':'
NB.spxsection:Introduction
0 : 0
NB. ---------------------------------------------------------
The Finexec project adopts a cash flow approach to understanding 
basic financial calculations and solving problems. This is made possible 
through the use of the computer and an interactive programming 
language. Many financial calculations can be regarded as comprising of 
the following three parts.
(1) amount and time of the cash flow<br>
(2) selecting a suitable simple or effective rate of interest and time unit<br>
(3) probability that the cash flow is paid or recieved
In the Basic Finance category we ignore the probability of the 
cash flow being paid or received. This is considered in other
categories such as Life Contingencies.
For this tutorial we require:
)
load '~addons/finance/finexec/basicfinance/compound.ijs'
load '~addons/finance/finexec/basicfinance/simple.ijs'
load '~addons/finance/finexec/basicfinance/timeline.ijs'
require 'plot'
0 : 0
NB. ---------------------------------------------------------
The Basic Finance definitions are built around defining: 
S = simple interest rate for a time unit
E = effective interest rate for a time unit
C = amount of cash flow
T = period of the cash flow in time units
The definitions are executed in the J system to solve problems.
Examples of applying the definitions are illustrated in the tutorials 
)
NB.spxsection:Cash Flow Timeline
0 : 0
NB. ---------------------------------------------------------
A plot of the cash flow timeline can be useful in solving a problem.
The definition timelinecf can be used  to show a plot of the cash flow.
)
timelinecf (0 1 2 3 4 5.5 3.3 0.5 _1;1 2 3 _4 5 _6 7 8 9)
timelinecf ((i. 25);100, - 24 #10)
NB.spxsection:Cash Flow Amount
0 : 0
NB. ---------------------------------------------------------
The cash flow is simply the amount money that is paid or received at
a point of time. The cash flow can therefore be considered as list of amounts
to be used for a calculations. Some simple examples are shown.
)
NB. Level cash flows 
   [C0 =: 1 1 1 1 1
   [C1 =: 10 # 2
    C0,C1
NB. Uniformly increasing flow flow
    [C0 =: 1+ i. 10 
    [C1 =: 10 * (1+i. 10)
NB. Uniformly decreasing flow flow 
    [C0 =: |. 1+ i. 10 
    [C1 =: 100 - (i. 10)
NB. Variable flow flow
    [C0 =:  5 10 12 14 18 11
    [C1 =: _10 99 50
NB. Random cash flow in the range: 90 to 100
   [L0 =: 90 + (?10#11)
   [L1 =: (2#3),(4#5),(1 1 1)
NB.spxsection:Selection of Interest Rate
0 : 0
NB. ---------------------------------------------------------
The choice of a simple or effective interest rate and time unit for a
calculation should be carefully considered as this will impact 
the approach to solving the problem. The time unit is used to
determine the timing of the cash flow. A well selected simple or effective 
interest rate and time unit can make it easier to construct and
solve the problem.
There is no one right approach and this will determined on the how the cash flow
and interest rate are defined for the problem. One approach for compound interest 
problems is to select the time unit that applies to the effective interest rate.
For example if the effective interest rate is 6.0% yearly a time unit of a year 
is appropriate.
)
NB.spxsection:Examples
0 : 0
NB. ---------------------------------------------------------
Present value of $100 in 0.5,1,and 5 years at a 
yearly effective interest rate of 6.0%.
) 
   100 * (0.06)vt(0.5 1 5)
0 : 0
NB. ---------------------------------------------------------
If the rate of interest is 6.0% yealy convertible half-yearly it is
simple to use a half-yearly effective interest rate of 3.0% with the 
time unit of half a year.
Present value of $100 in 0.5,1,and 5 years at a interest rate of 6.0% 
convertible half-yearly
)
    100 * (0.03)vt(2* 0.5 1 5)
0 : 0
NB. ---------------------------------------------------------
If we have a yearly effective interest rate of 6.0% and want to 
work with monthly cash flows it can be easier to convert the
effective interest rate to a time unit of a month and then work
with monthly time units.
Present value of $100 in 0.5,1,and 5 months at a yearly 
effective inerest rate of 6.0% 
First we convert the yearly effective interest rate to
a monthly effective interest rate
)
  [EM =: (0.06)econvf(12)
  100 * (EM)vt(0.5 1 5)
NB. Alternate appraoch - using yearly time units
    100 * (0.06)vt((0.5 1 5)%12)
0 : 0
NB. ---------------------------------------------------------
It is important that the effective interest rate and the time unit
are constant for the problem.
)

NB.spxsection:End