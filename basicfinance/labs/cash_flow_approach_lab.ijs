NB. =========================================================
LABTITLE=: 'Cash Flow Approach'
LABAUTHOR=: 'William Szuch'

NB. =========================================================
Lab Chapter Introduction
NB.=========================================================

NB. =========================================================
Lab Section Tutorial Information
 Updated: 2022-06-11
 load 'finance/finexec'
 load 'labs/labs'
 lab '~addons/finance/finexec/basicfinance/tutes/cash_flow_approach_tut.ijs'
)
NB.---------------------------------------------------------
NB. Show the Tutorial Chapters
lab':'


NB. =========================================================
Lab Section Cash Flow Approach
 The Finexec project adopts a cash flow approach to 
 understanding basic financial calculations and solving 
 problems. This is made possible through the use of the 
 computer and an interactive programming language. 

 Many financial calculations can be regarded as comprising of 
 the following three parts.
 (1) amount and time of the cash flow<br>
 (2) selecting a suitable simple or effective rate of 
     interest and time unit<br>
 (3) probability that the cash flow is paid or recieved
 In the Basic Finance category we ignore the probability of the 
 cash flow being paid or received. This is considered in other
 categories such as Life Contingencies.

 The Basic Finance definitions are built around defining: 
 S = simple interest rate for a time unit
 E = effective interest rate for a time unit
 C = amount of cash flow
 T = period of the cash flow in time units
 The definitions are executed in the J system to solve problems.
 Examples of applying the definitions are illustrated in the tutorials 
)
NB. ---------------------------------------------------------
NB.Load some stuff
showscript'~addons/finance/finexec/basicfinance/tutes/cash_flow_approach_tut.ijs' 
load '~addons/finance/finexec/basicfinance/compound.ijs'
load '~addons/finance/finexec/basicfinance/simple.ijs'
load '~addons/finance/finexec/basicfinance/timeline.ijs'
finexec_html'basicfinance/docs/timeline.htm'
require 'plot'
NB. ---------------------------------------------------------
NB. Definitions loaded to the base locale
names ''

NB. =========================================================
Lab Chapter Cash Flow Timeline
NB. =========================================================

NB. =========================================================
Lab Section Example Cash Flow Plots
 A plot of the cash flow timeline can be useful in solving a 
 problem.
 The definition timelinecf can be used to show a plot of the
 cash flow.
 
 timelinecf(T;C)
 T = list of periods measured in time units from an
    origin (ie: 0) at which the cash flow occurred 
 C = the amout of cash flow at each period in the
    list of periods in T
)

NB. =========================================================
Lab Section Plot 1
)
NB. ---------------------------------------------------------
timelinecf (0 1 2 3 4 5.5 3.3 0.5 _1;1 2 3 _4 5 _6 7 8 9)

NB. =========================================================
Lab Section  Plot 2
NB. ---------------------------------------------------------
timelinecf ((i. 25);100, - 24 #10)

NB. =========================================================
Lab Section Cash Flow Amount
 The cash flow is simply the amount money that is paid or 
 received at a point of time. The cash flow can therefore be
 considered as list of amounts to be used for a calculations. 
 Some simple examples are shown.
)

NB. =========================================================
Lab Section Level Level cash flows 
)
NB. ---------------------------------------------------------
[C =: 1 1 1 1 1
[T =: 1+i.#C 
timelinecf(T;C) 

NB. =========================================================
Lab Section Uniformly increasing flow
)
NB. ---------------------------------------------------------
[C =: 1+ i. 10 
[T =: i. #C
timelinecf(T;C)

NB. =========================================================
Lab Section Uniformly decreasing flow flow 
)
NB. ---------------------------------------------------------
[C =: |. 1+ i. 10 
[T =: i. #C
timelinecf(T;C)

NB. =========================================================
Lab Section Variable flow flow
)
NB. ---------------------------------------------------------
[C =:  5 10 12 14 18 11
[T =: i. #C
timelinecf(T;C)

NB. =========================================================
Lab Section Random cash flow in the range: 90 to 100
)
NB. ---------------------------------------------------------
[C =: 90 + (?10#11)
[T =: i. #C
timelinecf(T;C)

NB. =========================================================
Lab Chapter Selection of Interest Rate
NB. =========================================================

NB. =========================================================
Lab Section Selection of Interest Rate
 The choice of a simple or effective interest rate and time 
 unit for a  calculation should be carefully considered as 
 this will impact the approach to solving the problem. 

 The time unit is used to  determine the timing of the 
 cash flow. A well selected simple or effective interest 
 rate and time unit can make it easier to construct and
 solve the problem.

 There is no one right approach and this will determined on 
 the how the cash flow and interest rate are defined for 
 the problem. 
 
 One approach for compound interest problems is to select 
 the time unit that applies to the effective interest rate.
 For example if the effective interest rate is 6.0% yearly 
 a time unit of a year is appropriate. 
)

NB. =========================================================
Lab Section Example 1
 Present value of $100 in 0.5,1,and 5 years at a 
 yearly effective interest rate of 6.0%.
)
NB. ---------------------------------------------------------
   100 * (0.06)vt(0.5 1 5)

NB. =========================================================
Lab Section Example 2
 If the rate of interest is 6.0% yealy convertible 
 half-yearly it is simple to use a half-yearly effective 
 interest rate  of 3.0% with the  time unit of half a year.
 Present value of $100 in 0.5,1,and 5 years at a interest 
 rate of 6.0% convertible half-yearly
)
NB. ---------------------------------------------------------
    100 * (0.03)vt(2* 0.5 1 5)

NB. =========================================================
Lab Section Example 3
 If we have a yearly effective interest rate of 6.0% and 
 want to work with monthly cash flows it can be easier to 
 convert the effective interest rate to a time unit of a 
 month and then work with monthly time units.
 Present value of $100 in 0.5,1,and 5 months at a yearly 
 effective inerest rate of 6.0% 
 First we convert the yearly effective interest rate to
 a monthly effective interest rate
)
NB. ---------------------------------------------------------
  [EM =: (0.06)econvf(12)
  100 * (EM)vt(0.5 1 5)
NB. ---------------------------------------------------------
NB. Alternate appraoch - using yearly time units
    100 * (0.06)vt((0.5 1 5)%12)

NB. ---------------------------------------------------------
NB. Tutorial End
