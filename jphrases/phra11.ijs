NB.%phra11.ijs - J Phrases Section 11A. Inverse
NB.-<script src="../js/jphrases_links.js"></script>
NB.-<a href="../phra11.ijs" target="_blank">Script source: phra11.ijs</a>
NB.-<hr>


a0=: I=: ^:_1                         NB. Inverse (adverb)
m1 =: ^ I                             NB. Natural log (^.); Inverse exponential
m2 =: ^.I                             NB. Exponential
m3 =: 10&^.                           NB. Base 10 log
m4 =: m3 I                            NB. Inverse base 10 log (10&^)
m5 =: ] -: m4@m3                      NB. Tautology (test that m4 is left inverse)
m6 =: ] -: m3@m4                      NB. Tautology (test that m4 is right inverse)
m7 =: ssc=: +/\                       NB. Sum scan (subtotals)
m8 =: ssc I                           NB. Inverse sum scan; first differences
m9 =: (]-:m8@m7)*.(]-:m7@m8)          NB. Tautology
m10=: assc=: -/\                      NB. Alternating sum scan
m11=: assc I                          NB. 
m12=: ] -:                            NB. 
m13=: * /\ I                          NB. e.g.  * /\ m13 3 1 4 15 9 26 5 3
m14=: % /\ I                          NB. e.g.  % /\ m14 3 1 4 15 9 26 5 3
m15=: ~:/\ I                          NB. e.g.  ~:/\ m15 1 1 0 1 1 0 1 1
m16=: = /\ I                          NB. e.g.  = /\ m16 1 1 0 1 1 0 1 1
m17=: + /\. I                         NB. e.g.  + /\. m17 3 1 4 15 9 26 5 3
m18=: - /\. I                         NB. e.g.  - /\. m18 3 1 4 15 9 26 5 3
m19=: * /\. I                         NB. e.g.  * /\. m19 3 1 4 15 9 26 5 3
m20=: % /\. I                         NB. e.g.  % /\. m20 3 1 4 15 9 26 5 3
m21=: ~:/\. I                         NB. e.g.  ~:/\. m21 1 1 0 1 1 0 1 1
m22=: = /\. I                         NB. e.g.  =/\. m22 1 1 0 1 1 0 1 1
d23=: # I                             NB. Expand; 'ab' -: 1 0 1 # 1 0 1 d23 'ab'
m24=: p: I                            NB. p (n) the number of primes less than n
m25=: x: I                            NB. Floating point approx. of a rational. e.g.  m25 3r7
m26=: 1&+ I                           NB. Inverse increment; decrement
m27=: +&1 I                           NB. Inverse increment; decrement
m28=: >: I                            NB. Inverse increment; decrement
m29=: _1&+ I                          NB. Inverse decrement; increment
m30=: +&_1 I                          NB. Inverse decrement; increment
m31=: -&1 I                           NB. Inverse decrement; increment
m32=: <: I                            NB. Inverse decrement; increment
m33=: 2&* I                           NB. Inverse double; halve
m34=: *&2 I                           NB. Inverse double; halve
m35=: +: I                            NB. Inverse double; halve
m36=: 0.5&* I                         NB. Inverse halve; double
m37=: *&0.5 I                         NB. Inverse halve; double
m38=: %&2 I                           NB.  Inverse halve; double
m39=: -: I                            NB. Inverse halve; double
m40=: ^&2 I                           NB. Inverse square
m41=: ^&3 I                           NB. Inverse cube
m42=: ^&0.5 I                         NB. Inverse square root
m43=: ^&1r3 I                         NB. Inverse cube root
m44=: 2&^ I                           NB. Inverse 2 with power; base 2 log
m45=: 10&^ I                          NB. Inverse 10 with power; base 10 log
m46=: 2&! I                           NB. Inverse triangular number. e.g. +/i.<.2&! I m
m47=: +~ I                            NB. Inverse double
m48=: *~ I                            NB. Inverse square
m49=: ^~ I                            NB. e.g.  x^x=: ^~ I 12
m50=: (3&+)@(%&2)I -: (%&2 I)@(3&+ I) NB. Inverse of composition is composition of inverses
