NB.%phra10.ijs - J Phrases Section 10A. Sums & Means
NB.-<script src="../js/jphrases_links.js"></script>
NB.-<a href="../phra10.ijs" target="_blank">Script source: phra10.ijs</a>
NB.-<hr>


m0=: A=: # %~ +/                  NB. Arithmetic mean
m1=: G=: # %: */                  NB. Geometric mean
m2=: H=: A&.(%"_)                 NB. Harmonic mean 
m3=: C=: [: {. (A,G)^:_           NB. Common mean; arithmetic-geometric mean (<a href="references.htm#2">de Kerf [2]</a>)
m4=: A&(^&3)                      NB. Mean of cubes
a5=: (^&) (A&)                    NB. Generalized x-mean
m6=: m4 -: 3 a5                   NB. Tautology
a7=: (^&) (A&.)                   NB. L-x norm
m8=: (^&3)@(3 a7) -: (3 a5)       NB. Tautology
v9=: MA=: A\                      NB. x-period moving average of y
m10=: +/\  -: +/\.&.|.            NB. Tautology: invariance under reverse
m11=: +/\. -: +/\ &.|.            NB. Tautology: invariance under reverse
m12=: +/\^:(i.`($&1))             NB. Figurate numbers
m13=: 1: #. ]                     NB. Sum; +/"1
m14=: +/&.(*:"_)@:+."0            NB. Magnitude |
m15=: - |.!.0                     NB. .+/\^:_1
d16=: psum=: ([:+/ [ ^~ i.@])"0   NB. Sum of powers of integers; 2 sum 7
m17=: 0&psum -: [                 NB. Tautology: +/(i.n)^0
m18=: 1&psum -: 2&!               NB. Tautology: +/(i.n)^1
m19=: 2&psum -: 0 1r6 _1r2 1r3&p. NB. Tautology: +/(i.n)^2
m20=: [ (psum %. ^/~@]) i.@(2&+)  NB. Polynomial coeff. of +/(i.n)^k
