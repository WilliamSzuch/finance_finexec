NB.%phrc9.ijs - J Phrases Section 9C. Polynomials & Rational Functions
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrc9.ijs" target="_blank">Script source: phrc9.ijs</a>
NB.-<hr>


d0=: sum=: +/@,:                                NB. Polynomial sum. Try 1 2 sum 1 3 3 1 
d1=: dif=: -/@,:                                NB. "       difference
d2=: ppr=: +//.@(*/)                            NB.   "       product
m3=: pdi=: 1: }. ] * i.@#                       NB. "       derivative
d4=: pin=: , ] % >:@i.@#                        NB.  "       integral (left arg gives constant)
m5=: piz=: 0&pin                                NB. "       integral 0 constant of integration
m6=: atop=: [ +/ .* 1 0"_ ,ppr/\@(<:@#@[# ,:@]) NB. Composition: (c atop d)&p. is equivalent to (c&p.) @ (d&p.)
m7=: p.                                         NB. Transformation between roots and coefficients
d8=: p.                                         NB. Polynomial in terms of roots or coefficients
c9=: FIT=: 2 :'x. %. ]^/(i.y.)"_'               NB. f FIT d gives coeffs of pn fit of degree d-1
d10=: ff=: ^!._1                                NB. Falling factorial (_1-stope)
d11=: fp=: p.!._1 " 1 0                         NB. Falling factorial polynomial
a12=: VM=: ((/ ~)(@i.))(@#)                     NB. Vandermonde adverb 
m13=: fcFc=:]+/ .*~^VM%.ff VM                   NB. Falling coeffs From ordinary coeffs
m14=: cFfc=: fcFc^:_1                           NB. Ordinary coeffs From falling coeffs
d15=: taut=: p. -: fcFc@[ fp ]                  NB. Tautology
d16=: rf=: ^!.1                                 NB. Rising factorial
a17=: S=: 1 : '^!.x.'                           NB. Stope adverb (1 S is rf Try 0.1 S) 
d18=: mtn=:{.@[+/ .*]*/ .^}.@[                  NB. Multinomial e.g. (c,E) mtn x,y,z
c19=: R=: 2 : 'x.&p. % y.&p.'                   NB. Rational conjunction
c20=: TR=: 2 : '(x.&p. % y.&p.) t.'             NB. Taylor series of rational function
d21=: dp=: (|.@[ p. ])"1 1 0                    NB. Polynomial in descending powers
d22=: dsum=: sum&.|.                            NB. Polynomial sum in descending powers
d23=: ddif=: dif&.|.                            NB. Polynomial difference in descending powers
d24=: dppr=: ppr                                NB. Polynomial product in descending powers
m25=: dpdi=: pdi&.|.                            NB. Polynomial derivative in descending powers
m26=: ".&> 'a=:2&{'; 'b=:1&{'; 'c=:0&{'         NB. Coefficients a, b, and c of quadratic 
m27=: dsc=: (b^2:) - 4:*a*c                     NB. Discriminant of quadratic
m28=: r=:(-@b(+,-)%:@dsc)%+:@a                  NB. Roots of quadratic
d29=: m28@(1: , ,)                              NB. b d29 c gives roots of  1,b,c
m30=: ] d29"0 i.@>.@(*: % 4:)                   NB. Arguments limited to real results
