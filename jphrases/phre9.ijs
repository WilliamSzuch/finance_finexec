NB.%phre9.ijs - J Phrases Section 9E. Quadrature & Simpson's Rule
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phre9.ijs" target="_blank">Script source: phrde9.ijs</a>
NB.<hr>


m0=: W=: integ p. +: >. 1:         NB. Weights for 1+2*y points; try m0 3x
m1=: integ=: pint"1@%.@vm          NB. Integral of inverse of Vandermonde
m2=: vm=: ^~/~@i.@>:@+:            NB. Transposed Vm of order 1+2*y
m3=: pint=: 0: , ] % >:@i.@#       NB. Polynomial integral of coefficients y
m4=: pder=: 1: }. ] * i.@#         NB. Polynomial derivative of coefficients y
d5=: EW=: +/@(-@take {."0 1 ])     NB. Extended weights (x groups of #y points)
d6=: take=:i.@[ (] + <:@] * [) #@] NB. Amounts of overtake
