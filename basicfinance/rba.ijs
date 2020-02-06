NB. =========================================================
NB.%rba.ijs - Reserve Bank of Australia formula for calculating value of securities
NB.- Script: ~addons/finance/finexec/basicfinance/rba.ijs
NB.- Contributor: William Szuch
NB.- Updated: 30/1/2020
NB.- Depend: ~addons/finance/finexec/basicfinance/compound.ijs
NB.-         ~addons/finance/finexec/utility/bisection.ijs
NB.- Definitions: loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Basic Finance</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- RBA - Treasury Bond calculations.
NB.- Financial calculations based on the Reserve Bank formula.
NB.- Methodology set out in the Reserve Bank of Australia 
NB.- note dated: 27/10/1992 No. 92-24
NB.- <a class="HREF" href="https://aofm.gov.au/ags/" target="_blank">RBA Notes and Equations</a> 
NB.- <a href="../rba.ijs" target="_blank">Script source: rba.ijs</a>
NB.-<hr>
NB.- <b>Treasury Bond Yield Calculation</b>
NB.- Using bisection method with (E)pvcf(C;T)
NB.-  
NB.+ Working backwards - calculate market value then
NB.+ reverse process to calculate yield.
NB.+   rba_tb(1992 11 1);(1998 1 15);(1993 1 15);6.25;0.0415;100
NB.+121.132 
NB.+ OR
NB.+C =: (11 # 6.25),100
NB.+T =: (75%184)+(i. 11),10
NB.+   (0.0415)pvcf(C;T)
NB.+121.132
NB.-
NB.+M =: 121.132 NB. Market value
NB.+Solve for E using bisection: 
NB.+ 0 = M - (E)pvcf(C;T)
NB.+define
NB.+f1 =: M - pvcf&(C;T)
NB.+f1 =: 121.132 - pvcf&(C;T)
NB.+ (f1) bisection (0.03;0.06)
NB.+    0.041499
NB.+_0.000908185


require '~addons/finance/finexec/basicfinance/compound.ijs'
require '~addons/finance/finexec/utility/bisection.ijs'


NB. =========================================================
Note 'utilities'
extend =. [ {. ] , (# {:)  NB. lists.ijs
an =. +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0 NB. compound.ijs
)


NB. =========================================================
NB.*rba_tb v -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> todayno
NB.- RBA - Treasury Bonds Basic Formula as taken from notes.
NB.-syntax:
NB.+([X])rbs_tb(Y0;Y1;Y2;Y3;Y4;Y5)
NB.+[X] Optional - Default value = 0
NB.+    = 0  Cum interest
NB.+    = 1  Ex Interest at next date
NB.+    = 2  Excluding Accrued Interest
NB.+    = 3  Near Maturing Bonds - specifically those entitling a purchaser
NB.+           to only the final coupon payment and repayment of principal
NB.+ date format: yyyy mm dd
NB.+Y0 = Valuation Date 
NB.+Y1 = Maturity Date
NB.+Y2 = Next interest payment date
NB.+Y3 = Half yearly rate of coupon per $100 face value eg 3.0
NB.+Y4 = Effective half yearly yield to maturity eg. 0.035
NB.+Y5 = Face value on maturity
NB.-example:
NB.+   rba_tb(1992 11 1);(1998 1 15);(1993 1 15);6.25;0.0415;100
NB.+121.132  NB. agrees with notes.
NB.-
NB.+ Value at coupon date 
NB.+   rba_tb(1993 1 15);(1998 1 15);(1993 1 15);6.25;0.0415;100
NB.+123.156
NB.- 
NB.+ rba_tb(2003 10 24);(2015 4 15);(2004 4 15);3.125;0.028;100
NB.+105.6
NB.-
NB.+Using basic formula, the price of 
NB.+the 2.75% 21 November 2028 Treasury Bond, 
NB.+assuming a yield to maturity of 2.8300% per annum 
NB.+and settlement date of 27 October 2017, is calculated to be $100.431.
NB.+ In this example, i = 0.014150 (i.e. 2.830 divided by 200), 
NB.+f = 25, d = 184, g = 1.375 (i.e. half of 2.75) and n = 22.
NB.+   rba_tb(2017 10 27);(2028 11 21);(2017 11 21);1.375;0.014150;100
NB.+100.431
NB.-note:
NB.- Alternative method using a cash flow approach.
NB.- Using (E)pvcf(C;T)
NB.+C =: (11 # 6.25),100
NB.+T =: (75%184)+(i. 11),10
NB.+   (0.0415)pvcf(C;T)
NB.+121.132
NB.-
NB.+C =: (11 # 6.25),100
NB.+T =: (0%184)+(i. 11),10
NB.+   (0.0415)pvcf(C;T)
NB.+123.156
NB.-
NB.+C =: (23 # 3.125),100
NB.+T =: (174%183)+(i. 23),22
NB.+   (0.028)pvcf(C;T)
NB.+105.6
NB.-
NB.+C =: (23 # 1.375),100
NB.+T =: (25%184)+(i. 23),22
NB.+   (0.01415)pvcf(C;T)
NB.+100.431
NB.- Using: (E)vt(T)
NB.+C =: (11 # 6.25),100
NB.+T =: (75%184)+(i. 11),10
NB.+   +/C*(0.0415)vt(T)
NB.+121.132
NB.- Using only: v(E)
NB.+C =: (11 # 6.25),100
NB.+T =: (75%184)+(i. 11),10
NB.+   +/C*(v(0.0415))^T
NB.+121.132
NB.---------------------------------------------------------
rba_tb =: 3 : 0
'' rba_tb y
:
y0 =. >0{y        NB. Valuation Date - yyyy mm dd
y1 =. >1{y        NB. Maturity Date
y2 =. >2{y        NB. Next interest payment date
y3 =. >3{y        NB. Half yearly rate of coupon per $100 face value eg 3
y4 =. >4{y        NB. Effective half yearly yield to maturity 0.035
y5 =. >5{y        NB. Face value on maturity
v =. 1%(1+y4)
g =. y3
f =. (todayno y2) - (todayno y0)                NB. Days to next interest payment
d1 =. (0 12 #: (0 12 #. 0 1{y2) - 6), 2{y2      NB. Date half year before next interest payment
d =. (todayno y2) - (todayno d1)                NB. Days in half year ending on next interest payment
n =. ((0 12 #. 0 1{y1) - ( 0 12 #. 0 1{y2)) % 6 NB. term in half years from next interest payment to maturity date
an =. +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0
vn1 =. v*an
NB. ---------------------------------------------------------
res1 =. (v^(f%d)) * ((g*(1 + (y4 vn1 n)))+(100*v^n))  NB. Cum Interest
NB. ---------------------------------------------------------
res2 =. (v^(f%d)) * ((g*(0 + (y4 vn1 n)))+(100*v^n))  NB. Ex Interest
res3 =. res1 - (y5*g%100)*(1 - f%d)                   NB. Exculing accrued interest
res4 =. (y5%100) * ((100+g) % (1+ y4 * (f%365)))      NB. Near maturity
if. 0 = #x do. S =: 0 else. S =: x end.
select. S
  case.  0 do. r =. res1
  case.  1 do. r =. res2
  case.  2 do. r =. res3
  case.  3 do. r =. res4
end.
)


NB. =========================================================
NB.*rba_tb_capital_index v -
NB.- RBA - Treasury Bonds Basic Formula - Treasury Capital Index Bonds - cum or ex interest.
NB.-syntax:  
NB.+rba_tb_capital_index(y0;y1;y2;y3;y4;y5;y6;y7;y8)
NB.+Interest payments are quarterly
NB.+y0= Valuation Date - yyyy mm dd
NB.+y1= Maturity Date
NB.+y2= Next quarterly interest payment date
NB.+y3= Rate of quarterly coupon per $100 face value eg 3
NB.+y4= Quarterly real yield 0.012
NB.+y5= Face value
NB.+y6= K0 index factor per $100
NB.+y7= K1 index factor per $100
NB.+y8= 1 = cum interest, 0 = ex interest
NB.+Kt are based on $100, formula
NB.-example:
NB.+   rba_tb_capital_index(1992 10 15 ; 2005 8 20; 1992 11 20;1;0.012;100;159.77;159.55;1)
NB.+148.414 NB. as per notes
NB.----------------------------------------------------------------
rba_tb_capital_index =: 3 : 0
an =. +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0
y0=. >0{y        NB. Valuation Date - yyyy mm dd
y1=. >1{y        NB. Maturity Date
y2=. >2{y        NB. Next quarterly interest payment date
y3=. >3{y        NB. Rate of quarterly coupon per $100 face value eg 3
y4=. >4{y        NB. Quarterly real yield 0.012
y5=. >5{y        NB. Face value
y6=. >6{y        NB. K0 index factor per $100
y7=. >7{y        NB. K1 index factor per $100
y8=. >8{y        NB. 1 = cum interest, 0 = ex interest
v=. 1%(1+y4)
vn1 =: v*an
g=. y3
f=. (todayno y2) - (todayno y0)                NB. Days to next interest payment
d1=. (0 12 #: (0 12 #. 0 1{y2) - 3), 2{y2      NB. Date quarter year before next interest payment
d=. (todayno y2) - (todayno d1)                NB. Days in quarter year ending on next interest payment
n=. ((0 12 #. 0 1{y1) - ( 0 12 #. 0 1{y2)) % 3 NB. term in quarters from next interest payment to maturity date
r1=. (y5%100) * (v^(f%d)) * ((g*(y8 + (y4 vn1 n)))+(100*v^n))
K0=. y6
K1=. y7
p=. (_1 +K1%K0)
r2=.  (K1 % 100)*(1 + p)^(-f%d)
r3=. r1 * r2
)


NB. ===========================================================================
NB.*rba_bond v -
NB.- Bond valuation - generalised approach
NB.- Using basis similar to RBA.
NB.- Method also applicable for bills as cash flow basis is used.
NB.- Market value on a discounted cash flow basis
NB.-syntax: 
NB.+rba_bond(y0;y1;y2;y3;y4;y5;y6;y7;y8)
NB.+y0 = Name of security
NB.+y1 = Valuation Date - yyyy mm dd
NB.+y2 = Maturity Date
NB.+y3 = Next interest payment date
NB.+y4 = Yearly rate of coupon per $100 face value eg 5
NB.+y5 = Coupon frequency payment 1/2/3/4/6/12 times per year
NB.+y6 = Nominal annual yield to maturity : effective half yearly eg 0.07
NB.+y7 = Face value on maturity
NB.+y8 = 0 = cum interest, 1 = ex interest; 2 cum interest BUT exc. accrued interest
NB.-example:
NB.+    rba_bond('ABC Bond';1997 6 30;2001 11 15;1997 11 15;6;2;0.07;1000;0)
NB.+┌────────┬─────────┬──────────┬──────────┬─┬─┬────┬────┬─┬────────────┬──────┐
NB.+│ABC Bond│1997 6 30│2001 11 15│1997 11 15│6│2│0.07│1000│0│MKT VALUE = │970.27│
NB.+└────────┴─────────┴──────────┴──────────┴─┴─┴────┴────┴─┴────────────┴──────┘
NB. ---------------------------------------------------------
rba_bond =: 3 : 0
y0 =. >0{y        NB. Name of security
y1 =. >1{y        NB. Valuation Date - yyyy mm dd
y2 =. >2{y        NB. Maturity Date
y3 =. >3{y        NB. Next interest payment date
y4 =. >4{y        NB. Yearly rate of coupon per $100 face value eg 5
y5 =. >5{y        NB. Coupon frequency payment 1/2/3/4/6/12 times per year
y6 =. >6{y        NB. Nominal annual yield to maturity : effective half yearly eg 0.07
y7 =. >7{y        NB. Face value on maturity
y8 =. >8{y        NB. 0 = cum interest, 1 = ex interest; 2 cum interest BUT exc. accrued interest
v =. 1%((1+y6%2)^(1%6))^(12%y5)   NB. Effective rate per payment period
i =. _1 + 1%v
an =. +/@:(([: % 1 + ])~ ^"_ 0 [: (0 + i.) ])"_ 0
vn1 =. v*an
g =. y4%y5         NB. Coupon per payment period
f =. (todayno y3) - (todayno y1)                       NB. Days to next interest payment
d1 =. (0 12 #: (0 12 #. 0 1{y3) - 12%y5), 2{y3         NB. Date previous interest payment
d =. (todayno y3) - (todayno d1)                       NB. Days in period ending on next interest payment
n =. ((0 12 #. 0 1{y2) - ( 0 12 #. 0 1{y3)) %(12%y5)   NB. Periods from next interest payment to maturity date
r0 =. (y7%100) * (v^(f%d)) * ((g*(1 + (i vn1 n)))+(100*v^n))
r1 =. (y7%100) * (v^(f%d)) * ((g*(0 + (i vn1 n)))+(100*v^n))
r2 =. r0 - (y7*g%100)*(1 - f%d)
r3 =. y8{r0,r1,r2
y,'MKT VALUE = ';r3
)


NB. ==========================================
NB.*rba_tn v -
NB.- Treasury Notes - Basic Formula.
NB.- Using RBA formula
NB.-syntax: 
NB.+[x0]rba_tn(y0;y1;y2;y3)
NB.+x0 = Default: Discounting 
NB.      1 Effective Annual Discount Rate
NB.+y0 = Valuation Date - yyyy mm dd
NB.+y1 = Maturity Date
NB.+y2 = Annual Yield to Maturity eg. 0.0575
NB. y3 = Face value on maturity 100
NB.-example:
NB.+   rba_tn(1997 6 30;1997 9 29;0.0575;100)    NB. ie. 13 weeks
NB.+98.586
NB.-
NB.+   (1)rba_tn(1997 6 30;1997 9 29;0.0575;100) NB. ie. 13 weeks
NB.+98.566
NB. ---------------------------------------------------------
rba_tn =: 3 : 0
'' rba_tn y
:
y0 =. >0{y        NB. Valuation Date - yyyy mm dd
y1 =. >1{y        NB. Maturity Date
y2 =. >2{y        NB. Annual Yield to Maturity eg. 0.0575 [Annual rate of discount]
y3 =. >3{y        NB. Face value on maturity 100
days =. (todayno y1) - (todayno y0)
res1 =. y3 % (1 + (days%365)*y2)
res2 =. y3 * (1 - (days%365)*y2)
if. 0 = #x do. S =. 0 else. S =. x end.
select. S
  case.  0 do. r =. res1
  case.  1 do. r =. res2
end.
)


NB. =========================================================
NB.*rba_tn_yield v -
NB.- Treasury Notes - Basic Formula
NB.- Using RBA formula  - Calculate yield.
NB.-syntax:
NB.+[x0]rba_tn_yield(y0;y1;y2;y3)
NB. x0 = Default - Effective Annual Rate 
NB.      1 => Effective Annual Discount Rate
NB. y0 = Valuation Date - yyyy mm dd
NB. y1 = Maturity Date
NB. y2 = Price eg. 98.585
NB. y3 = Face value on maturity 100
NB.-example:
NB.+   rba_tn_yield(1997 6 30;1997 9 29;98.587;100)  NB. ie. 13 weeks
NB.+┌────────────────────────┬─────────┐
NB.+│Nominal Annual Rate =   │0.0574876│
NB.+├────────────────────────┼─────────┤
NB.+│Effective Annual Rate = │0.05874  │
NB.+└────────────────────────┴─────────┘
NB. ---------------------------------------------------------
rba_tn_yield =: 3 : 0
'' rba_tn_yield y
:
y0 =. >0{y        NB. Valuation Date - yyyy mm dd
y1 =. >1{y        NB. Maturity Date
y2 =. >2{y        NB. Price eg. 98.585
y3 =. >3{y        NB. Face value on maturity 100
days =. (todayno y1) - (todayno y0)
r1 =. ((y3 - y2)%y2) * 365%days
r2 =._1+ (1 +((y3 - y2)%y2)) ^ 365%days
res1 =. 2 2 $ 'Nominal Annual Rate = ';r1;'Effective Annual Rate = ';r2
res2 =. 2 2 $ 'Nominal Annual Discount Rate = ';r1;'Effective Annual Discount Rate = ';r2
if. 0 = #x do. S =. 0 else. S =. x end.
select. S
  case.  0 do. r =. res1
  case.  1 do. r =. res2
end.
)


