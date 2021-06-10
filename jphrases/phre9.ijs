NB.%phre9.ijs - J Phrases Section 9E. Quadrature & Simpson's Rule
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.- <a href="../phre9.ijs" target="_blank">Script source: phrde9.ijs</a>
NB.<hr>


m0=: W=: integ p. +: >. 1:         NB. Weights for 1+2*y points; try m0 3x
m1=: integ=: pint"1@%.@vm          NB. Integral of inverse of Vandermonde
m2=: vm=: ^~/~@i.@>:@+:            NB. Transposed Vm of order 1+2*y
m3=: pint=: 0: , ] % >:@i.@#       NB. Polynomial integral of coefficients y
m4=: pder=: 1: }. ] * i.@#         NB. Polynomial derivative of coefficients y
d5=: EW=: +/@(-@take {."0 1 ])     NB. Extended weights (x groups of #y points)
d6=: take=:i.@[ (] + <:@] * [) #@] NB. Amounts of overtake
