NB.%phra8.ijs - J Phrases Section 8A. Numbers & Counting
NB.-<script src="../js/jphrases_links.js"></script>
NB.-<a href="../phra8.ijs" target="_blank">Script source: phra8.ijs</a>
NB.-<hr>


n0  =: pi=: 1p1                                                     NB. &pi;
v1 =: PI=: 1p1"_                                                    NB. Other ranks are possible
n2 =: 2p1 1r2p1 1r6p1                                               NB. List of multiples of &pi;
n3 =: 2p_1 1r2p_1 1r6p_1                                            NB. Multiples of reciprocal &pi;
n4 =: 1x1                                                           NB. Euler&#146s number (2.71828 ...)
v5 =: 1x1 1x_1 _1x_1"0                                              NB. List function of rank zero
m6 =: pitimes=: 1p1&*                                               NB. Like o. but infinite rank
m7 =: ln=: 1x1&^.                                                   NB. Like ^. (natural log)
m8 =: ln=: 1x1"_ ^. ]                                               NB.  "
m9 =: [:^ 0j2p1&% * i.                                              NB. Roots of unity; e.g. m9 5
m10=: 1:=1:^m9                                                      NB. Roots of unity; e.g. m10 5
m11=: sbase=: %:@(2p1&%)* %&1x1 ^]                                  NB. Stirling's approximation, base term
m12=: scorr=: 1 1r12 1r288 _139r51840 _571r2488320&p.@%             NB. Stirling's approximation, correction
m13=: stirg =: sbase * scorr                                        NB. Stirling's approx for &#915;(y) [<a href="references.htm#1">AS[1]</a>  6.1.37]
n14=: |1-(!10)%stirg 1+10                                           NB. Relative error for !10
m15=: stirf =: ^@(1r12&%)*%:@(2p1&*) * %&1x1 ^ ]                    NB. Stirling's approx to !y [<a href="references.htm#1">AS[1]</a> 6.1.38]
n16=: |1-(!10)%stirf 10                                             NB. Relative error for !10
m17=: even=: 2:*i.                                                  NB. Even integers
m18=: odd=: >:@even                                                 NB.  Odd integers
m19=: odd=: 1:+2:*i.                                                NB. Odd integers
m20=: grid=: +`(*i.)/                                               NB. grid b,s,n   is From b step s for n
m21=: Ai=: >:@i.                                                    NB. Augmented integers (1 to y)
m22=: +/\@($&1)                                                     NB.  " (but not negint arg)
m23=: Ei=: i.@>:                                                    NB. Extended integers (0 to y)
m24=: Si=: Ei@+: - ]                                                NB. Symmetric integers (-y to y)
m25=: bc=: Ei ! ]                                                   NB. Binomial coefficients
m26=: (0&,+,&0)^:([`1:)                                             NB.  "
m27=: bct=: Ei !/ Ei                                                NB. Pascal's triangle (bc table)
m28=: !/~@Ei                                                        NB.  "
m29=: !~/~@Ei                                                       NB. Pascal's triangle
m30=: (0&,+,&0)^:(i.`1:)                                            NB.  "
m31=: 1 1&([: +//. */)^:(i.`1:)                                     NB.  "
m32=: +/\@(|.!.0)^:(i.`($&1))                                       NB.  "
m33=: odometer=: #: i.@(*/)                                         NB. All #s in radix y (odometer)
m34=: >@,@{@(i.&.>"_)                                               NB.  " Try m34 10 10
m35=: ,:@i.@0:`([: ,/ i.@{. ,."0   2$:@}.)@.(*@#)                   NB.  " Try m35 2 2 2
m36=: tt=: #:@i.@(2&^)                                              NB. Truth table of order y
m37=: odometer@($&2)                                                NB.  "
m38=: >@,@{@($&(<0 1))                                              NB.  "
m39=: ,:@i.`([: ,/ i.@2: ,."0 2$:@<:)@.*                            NB.  "
m40=: [:|:2&^($ #&0 1)"(0)2&^@i.@-                                  NB.  "
m41=: (i.@# = i.~) # ]                                              NB. Nub (all distinct items of)    ~.
m42=: ~: # ]                                                        NB.  " Try m42 2 7 1 8 2 8
m43=: +./@(</\"1"_)@= # ]                                           NB.  " m43 ;:'all in all'
m44=: ~.@(i.~) { ]                                                  NB.  "
m45=: {./.~                                                         NB.  "
m46=: ({.;#)/.~                                                     NB. Nub and count
m47=: #/.~                                                          NB.  " Try m47 2 7 1 8 2
m48=: +/"1@=                                                        NB.  " Try m48 ;: 'all in all'
m49=: 1: #. =                                                       NB.  "
m50=: ifb=: # i.@#                                                  NB. Index from boolean
d51=: bfi=: i.@[ e. ]                                               NB. Boolean from index; e.g. 0 d51 5 7
d52=: 1:`]`($&0@[)}                                                 NB. Boolean from index
m53=: cfpv=: #;.1                                                   NB. Count from partition vector
m54=: pvfc=: [: ; {.&1&.>                                           NB. Partition vector from count
m55=: i.@(+/) e. 0&,@(+/\)                                          NB.  "
n56=: 2147483647=p: 105097564                                       NB. The 105,097,564-th prime (0 origin)
m57=: lp=: p:@i.                                                    NB. List first y primes
m58=: fotp=: (2&(_2:=-/\)#}:)@lp                                    NB. First of twin primes among first y
m59=: p:^:_1                                                        NB. Number of primes less than y
n60=: 2 2 2 3 5 -: q: 120                                           NB. Prime factorization of 120
m61=: taut=: -: */@q:                                               NB. y = product of factors. Try m61 12345
m62=: dpe=: (~. ,: 1: #. =)@q:                                      NB. Distinct primes with exponents
m63=: |:@(({.,#)/.~)@q:                                             NB.  "
m64=: taut=: = */@(^/)@dpe                                          NB. y = product over powers. Try m64 120
m65=: = */ .^/@dpe                                                  NB.  "
m66=: divisors=: /:~ @ , @ > @ (*/&.>/) @ ((^ i.@>:)&.>/) @ (__&q:) NB. Divisors of y . Try m66 900
m67=: /:~@~.@(*/ .^"1 tt@#)@q:                                      NB.  "
m68=: /:~ @ , @: (*/&>) @ {@ (<@(1&,)@(*/\)/.~) @ q:                NB.  "
m69=: >:@i. ([ #~ 0: = |) ]                                         NB.  "
m70=: perfect=: +: = +/@divisors                                    NB. Perfect number test
m71=: 1: = #@q:                                                     NB. Prime test
d72=: q:@[ -: -.&q:                                                 NB. Relatively prime test
d73=: 1: = +.                                                       NB.  "
m74=: totient=:* -.@%@~.&.q:                                        NB. Totient [<a href="references.htm#3">GKP[3]</a> 4.53]
m75=: */@(^/-(^<:)/)@dpe                                            NB.  "
m76=: [: +/ 1: = (+.i.)                                             NB.  "
m77=: [:/:~[:~.]|[:*:[:m50]m73[:i.]                                 NB. Quadratic residues
d78=: L=: [:{&_1 1|~e.(|*:@}.@i.)@]                                 NB. Legendre symbol
d79=: L * L~                                                        NB. Quadratic reciprocity
d80=: cfe=:<.@(([:%1:|])^:(i.@[`]))                                 NB. x terms of continued fraction expansion of y
m81=: rapprox=: (, % +.)&1"0                                        NB. Rational approximation to y
m82=: [:>:[:m50]m72"0[:>:[:i.[:<:]                                  NB. Numbers prime to y
m83=: 3 : '<.@o.&.((10^y.)&*) 1'                                    NB. y digits of &pi;
m84=: [: +/ %@!@i.                                                  NB. y digits of e
d85=: 4 : '-:@(+y.&%)^:(>.2^.1>.x.-16)x:%:y.'                       NB. x digits of the square root of integer y
