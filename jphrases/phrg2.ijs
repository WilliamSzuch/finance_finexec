NB.%phrg2.ijs - J Phrases Section 2G. Verb Trains
NB.-<script src="../js/jphrases_links.js"></script>
NB.-<a href="../phrg32ijs" target="_blank">Script source: phrg2.ijs</a>
NB.-<hr>


m0=: >: @ +: @ i.        NB. First odd integers
m1=: 1: + 2: * i.        NB. 	Same as m0
m2=: +/ @ (1: + 2: * i.) NB. Sum of odd integers
m3=: [: +/ 1: + 2: * i.  NB. Same as m2 using cap
m4=: m2 -: *:            NB. Sum of odds is square (Tautology)
m5=: < i. 1:             NB. The first element where x<y ;     also works for = ~: < <: >: > E. 
m6=: < i. 0:             NB. The first element where not x<y
m7=: < i: 1:             NB. The last element where x<y
m8=: < i: 0:             NB. The last element where not x<y
m9=: [: +/ <             NB. The number of elements where x<y
