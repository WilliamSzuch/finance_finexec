NB. =========================================================
LABTITLE=: 'Compound Interest (Effective Interest)'
LABAUTHOR=: 'William Szuch'

NB. =========================================================
Lab Chapter Introduction
NB.=========================================================

NB. =========================================================
Lab Section Tutorial Information
 Updated: 2022-06-10
 load 'finance/finexec'
 load 'labs/labs'
 lab '~addons/finance/finexec/basicfinance/tutes/compound_interest_tut.ijs'
)
NB.---------------------------------------------------------
NB. Show the Tutorial Chapters
lab':'

NB. =========================================================
Lab Section Defintions
 The tutorial introduces the definitions for
 effective interest rate (compound interest) calculations 
 and how they can be applied.
)
NB. ---------------------------------------------------------
NB. Load some stuff
showscript '~addons/finance/finexec/basicfinance/tutes/compound_interest_tut.ijs'
load '~addons/finance/finexec/basicfinance/compound.ijs'
finexec_html 'basicfinance/docs/compound.htm'
NB. ---------------------------------------------------------
NB. Definitions loaded to base locale
names ''

NB. =========================================================
Lab Chapter Future value 
NB. =========================================================

NB. =========================================================
Lab Section Future Value Examples
 Examples of future value calculations using effective rates.
 It is assumed that the effective interest rate is constant
 over the period
)

NB. =========================================================
Lab Section Example 1
 Calculate the future value of $1 in 1 year at
 6.0% yearly effective interest rate.
)
NB. ---------------------------------------------------------
w(0.06)

NB. =========================================================
Lab Section Example 2
 Calculate the future value of $100 in 3 years at
 6.0% yearly effective interest rate.
)
NB. ---------------------------------------------------------
100*(0.06)wt(3)

NB. =========================================================
Lab Section Example 3
 Calculate the final balance of $10,000 invested at a yearly
 effective interest rate of 5% for 1, 5, 10, 15 and 20 years.
)
NB. ---------------------------------------------------------
10000*(0.05)wt(1 5 10 15 20)

NB. =========================================================
Lab Section Example 4
 Calculate the future value of $1,000 in 1 5 10 20 years at 
 yearly effective interestr rates of 0%, 2%, 4% and 8%.
)
NB. ---------------------------------------------------------

1000*(0 0.02 0.04 0.08)wt(1 5 10 20)
 
NB. =========================================================
Lab Chapter Present value
NB. =========================================================

NB. =========================================================
Lab Section Example 1
 Calculate the present value of $1,000 due in 1 5 10 20 years
 at yearly effective interest rates of 0%, 2%, 4% and 8%.
)
NB. ---------------------------------------------------------
1000*(0 0.02 0.04 0.08)vt(1 5 10 20) 

NB. =========================================================
Lab Section Example 2
 Calculate the present value of $1,000 due in 23 and 90 days
 assuming 365 days in a years at yearly effective interest 
 rates of 0%, 2%, 4% and 8%.
)
NB. ---------------------------------------------------------
1000*(0 0.02 0.04 0.08)vt(23 90 % 365)  

NB. =========================================================
Lab Section Example 3
 Show a plot of the present value of $1,000 due in 0 to 
 20 years at yearly effective interest rates of 0%, 2%, 4% 
 and 8%.
)

NB. =========================================================
Lab Section Example 4
 Show a plot of the present value of $1,000 at 
 0%, 2%, 4% and 8% for years 0 to 20.   
)
NB. ---------------------------------------------------------
require 'plot'
plot |: 1000*(0 0.02 0.04 0.08)vt(i. 21) 

NB. ---------------------------------------------------------
NB. Tutorial End