NB.%phrc10.ijs - J Phrases Section 10C. Math & Stats
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrc10.ijs" target="_blank">Script source: phrc10.ijs</a>
NB.-<hr>


m0=: median=: <.@-:@# { /:~        NB. Median of y
m1=: tc=: (+. +./ .*.~)^:_         NB. Transitive closure of connection matrix y
c2=: ^:                            NB. Apply function x y times
c3=: ^:                            NB. Conditional application of x if y is 0 or 1
m4=: gamma=: !@<:                  NB. Gamma function of y
d5=: beta=: *&m4 % m4@+            NB. Beta function of x and y
d6=: pd=: ^@-@] * ^~ % !@[         NB. Poisson distribution of states x with average number y
d7=: outof=: !                     NB. # of combs of y objects taken x at a time
d8=: ppr=: +//.@(*/)               NB. Product of polynomials x and y
m9=: -<./"1                        NB. Move rows of table y into first quadrant
m10=: npb=: p:^:_1                 NB. Number of primes before y
m11=: pto=: p:@i.@npb              NB. List of primes to y
d12=: dpr=: [: 0 2 1 3&|: */       NB. Direct matrix product of x and y
d13=: shurp=: (0 2;3 1)&|:@(*/)    NB. Shur product of x and y
d14=: shurs=: (0 2;3 1)&|:@(+/)    NB. Shur sum of x and y
m15=: <./ .+~                      NB. Extend distance table to next leg
d16=: +./ .*.                      NB. Extend a transitive binary relation
d17=: +/ .* % #@]                  NB. Mean of x weighted by y
d18=: -/ .%                        NB. Alternating sum of reciprocal series x%y
d19=: +/ .%                        NB. Sum of reciprocal series x%y
d20=: +/ .*                        NB. Matrix product
d21=: +/ .*                        NB. Sum over subsets of x located by y
m22=: +/ .*~                       NB. Sum of squares of y
d23=: +/ .*                        NB. Scalar (dot) product of vectors x and y
d24=: */ .^                        NB. Product over subsets of x located by y
m25=: +/@:*:                       NB. Sum of squares of y
m26=: det=: -/ .*                  NB. Determinant
m27=: (+/@(*:@(] - +/ % #)) % #)"1 NB. Sample variance (dispersion) of y
m28=: %:@m27"1                     NB. Standard deviation of y
d29=: (+/@((]-+/@]%#@])^[)%#@])"1  NB. x-th moment of y
m30=: m31"1                        NB. Mean of rows of table y
m31=: +/%#                         NB. Mean of list y or columns of table y
