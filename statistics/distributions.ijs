NB. =========================================================
NB.%distributions.ijs - Distributions functions (pdf,cdf)
NB.-<script src="../js/statistics_links.js"></script>
NB.- Script: ~addons/finance/finexec/statistics/distributions.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2023 03 17
NB.- Depend: plot
NB.- Definitions: loaded to locale base
NB.- Status: dev
NB.- <a href="../distributions.ijs" target="_blank">Script source: distributions.ijs</a>
NB.-<hr>
NB.- Definitions for distribution functions:
NB.- Probability density function (pdf) 
NB.- Cummualtive density function (cdf)
NB.-<hr>
NB.- See stats functions from: '~addons/stats/base.ijs'
NB.- base.ijs loads complete set of base statistical verbs into locale z.
NB.-<hr>
NB.- Equations:
NB.- To Do
NB.-<hr>


NB. =========================================================
load 'plot'


NB. =========================================================
NB. Utils
steps=: {. + (1&{ - {.) * (i.@>: % ])@{:
random_01 =: ?@$ 0:


NB. ====================================================
NB.*normal_pdf v - 
NB.- <b>Form:</b> explici
NB.- <b>Depend:</b> nil
NB.- Normal pdf
NB.-syntax:
NB.+[M,S]normal_pdf(P)
NB.+   M = mean
NB.+   S = standard devation
NB.+ Default = (0,1)
NB.+   P = Point to calculate the value of the pdf
NB.-example:
NB.+   normal_pdf(_2 _1 0 1 2)
NB.+0.053991 0.241971 0.398942 0.241971 0.053991
NB.-
NB.+  plot (steps _4 4 1000);normal_pdf(steps _4 4 1000)
NB.-
NB.+  plot (steps _4 4 1000);(1,0.5)normal_pdf(steps _4 4 1000)
NB. ---------------------------------------------------------
normal_pdf =: 3 : 0
'' normal_pdf y
:
M   =. 0
S =. 1
if. (#x) > 0 do. M   =. 0{ x
                 S =. 1{ x end.
PP  =. 1 % (S * %: 2 * o.1) 
PP * (^1)^(-((y - M)^2)%(2*S^2)) 
)


NB. =======================================================
NB.*lognormal_pdf v - 
NB.- <b>Form:</b> explici
NB.- <b>Depend:</b>nil
NB.- Lognormal pdf
NB.- X has distribution Normal(mean,stddev) 
NB.- Y = exp(X) so that X = log(Y)
NB.- The pdf of Y is lognormal
NB.-syntax:
NB.+[M,S]lognormal_pdf(P)
NB.+   M = mean
NB.+   S = standard devation
NB.+   Default = (0,1)
NB.+   P = Point to calculate the value of the pdf
NB.-example:
NB.+  lognormal_pdf( 1 2)
NB.+0.398942 0.221853
NB.-
NB.+ plot (steps 0.001 4 1000);(0,0.5)lognormal_pdf(steps 0.001 4 1000)
NB. ---------------------------------------------------------
lognormal_pdf =: 3 : 0
'' lognormal_pdf y
:
M  =. 0  
S  =. 1
if. (#x) > 0 do. M    =. 0{ x
                 S  =. 1{ x end.
NB. Formulae
PP  =. 1 % (%: y*S *  2 * o.1) 
PP * (^1)^(-0.5*(((^.y) - M) % S)^2)
)


NB. =============================================
NB.*polygon_pdf v - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b>nil
NB.- Polygon pdf
NB.- Area under the polygon to be scaled to 1
NB.-syntax:
NB.+ (X;Y)polygon_pdf(P)
NB.       (X;Y) 2 item boxed vector that gives the shape of the pdf  
NB.       X  = Gives the points along the x axis 
NB.       Y  = Gives the shape of the pdf  - First point = 0;Last point = 0 
NB.       P  = Points to calculate the value of the pdf 
NB.-example:
NB.+  plot (0 1 2;0 2 0)  NB. Shape of pdf
NB.+ 

NB.+  plot (0 1 2 3 4 5;0 1 2 2 1 0) NB. Shape of pdf

NB. EXAMPLE: plot (0 1 3 5 10 12;0 2 4 5 6 0)polygon_pdf(10)
NB. EXAMPLE: Distribution:  plot (0 1 3 5 10 12;0 2 4 5 6 0) 
NB. ---------------------------------------------------------
polygon_pdf =: 4 : 0
RES =. < 'TO BE COMPLETED'
)



NB. =====================================================
NB.*polygon_cdf v Polygon cdf
NB.-synax:
NB. FORM: x polygon_cum_dist y
NB.       x  = <X1;X2> 2 item boxed vector that gives the shape of the cummulative distribution>  
NB.       X1  = Gives the points along the x axis 
NB.       X2  = Gives the cummulative probability - First point = 0;then monotonically increasing 
NB.       y  = <Number of randon samples required from the distribution>
NB. EXAMPLE: (0 1 3 5 10 12;0 2 4 5 6 7) polygon_cdf 10
NB. EXAMPLE: (0 1 3 5 10 12;0 2 4 5 6 7) polygon_cdf steps 0 12 1000
NB. EXAMPLE: Distribution:  plot (0 1 3 5 10 12;0 2 4 5 6 7) 
NB. ---------------------------------------------------------
polygon_cdf =: 4 : 0
NN    =. y    
XX    =. >0{x
CUM_PROB  =. >1{x
SCALE =. _1{ CUM_PROB
ZZ =. SCALE * random_01 NN
> x & x_from_y each ZZ
)


NB. ======================================================
NB.*x_from_y v Interpolation of y onto x - disctete curve.
NB. Curve should be increaseing so that one value x for each value of y
NB. FORM: x x_from_y y
NB.       x  =  <X1;X2> 2 item boxed vector that gives the shape of the curve  
NB.       X1  = Gives the points along the x axis 
NB.       X2  = Gives the points along the y axis
NB.       y  =  Value of y used to determine x
NB. EXAMPLE: (0 1 3 5 10 12;0 2 4 5 6 7) x_from_y 6.6
NB. EXAMPLE:  plot (0 1 3 5 10 12;0 2 4 5 6 7) 
NB. ---------------------------------------------------------
x_from_y =: 4 : 0
NN =. y
XX =. >0{x
YY =. >1{x
XX_DIF =. (}. XX) - (_1 }. XX)
YY_DIF =. (}. YY) - (_1 }. YY)
YY_DIF_SUM =. _1}. (0,+/\ YY_DIF)
Y1 =. 0 >. NN - YY_DIF_SUM
Y2 =. (YY_DIF) <. (Y1)
F =. XX_DIF % YY_DIF
+/ Y2 * F
)


NB. ======================================================
NB.*y_from_x v Interpolation of x onto y - disctete curve.
NB. Curve should such that one value y for each value of x
NB. REVIEWED: 2/8/2005
NB. FORM: x y_from_y x
NB.       x  =  Value of x used to determine y
NB.       y  =  <Y1;Y2> 2 item boxed vector that gives the shape of the curve  
NB.       Y1  = Gives the points along the x axis 
NB.       Y2  = Gives the points along the y axis

NB. EXAMPLE: (0 1 3 5 10 12;0 2 4 5 6 0) y_from_x 6.6
NB. EXAMPLE:  Shape: plot (0 1 3 5 10 12;0 2 4 5 6 0) 
y_from_x =: 4 : 0
< 'TO BE COMPLETED'
)



NB. ====================================================
NB.*poisson_pdf v - 
NB.- Poison pdf
NB. FORM: [x] poisson_density_fns y
NB.       x = <mean stddev>
NB.            <Default = (0 1)
NB.       y = <value>
NB. EXAMPLE:
NB. ---------------------------------------------------------
poisson_pdf =: 3 : 0
'' poisson_pdf y
:
< 'To be completed'
)


NB. === END of SCRIPT ===========================================================



