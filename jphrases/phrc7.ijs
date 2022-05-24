NB.%phrc7.ijs - J Phrases Section 7C. Parity & Symmetry
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrc7.ijs" target="_blank">Script source: phrc7.ijs</a>
NB.-<hr>


m0=: Isodd=: 2&|                                         NB. Test if y is an odd integer
m1=: Iseven=: -.@Isodd                                   NB. Test if y is an even integer
m2=: Isperm=: -: /:@/:                                   NB. Test if y is a permutation vector
a3=: 1 : 'x. -: [: x. ?@!@# A. ]'                        NB. Necessary condition  for symmetry of fn.
m4=: Isperm * _1:^>/~ ~:/@,@:* </~@i.@#                  NB. Classify argument as a permutation
m5=: L=: >/~                                             NB. Left, centre, right limbs of the fork ...
m6=: C=: ~:/@,@:*                                        NB. ... evaluated in m4 ; see their use below ...
m7=: R=: </~@i.@#                                        NB. ... to demonstrate design of its definition
m8=: C.!.2                                               NB. same as m4
m9=: Isperm * _1:^+/@(<:@#@>@(C.@~.))                    NB. Parity of permutation from cycle lengths
m10=: -/@(|:-:"2],:-)                                    NB. Classify matrix (skew, neither, sym)
a11=: skn=: .:-                                          NB. Skew    part with respect to negate
a12=: syn=: ..-                                          NB. Symmetric           "
a13=: skt=: .:|:                                         NB. Skew    part with respect to transpose
a14=: syt=: ..|:                                         NB. Symmetric           "
m15=: sinh=: 5&o.                                        NB. Hyperbolic sine
m16=: cosh=: 6&o.                                        NB. Hyperbolic cosine
n17=: m=: 3 1 4,2 0 5,:1 4 1                             NB. A 3-by-3 matrix
d18=: ip=: +/ . *                                        NB. Inner (matrix) product
m19=: LF=: m&ip                                          NB. A linear function
m20=: cst=: C.!.2@(#:i.)@:#~                             NB. Complete skew tensor
d21=: cross1=: [ip cst@#@[ip]                            NB. Generalized cross-product
d22=: cross2=: ((_1: |.[)*(1:|.]))-((1: |.[)*(_1: |. ])) NB. Conventional cross product (not valid for dimension greater than 3)
m23=: det1=: +/@,@(*// * cst@#)                          NB. Determinant in terms of cst
m24=: det2=: -/ . *                                      NB. Determinant
m25=: length=: m24=: +/&.(*:"_)"1                        NB. Length of vector
m26=: arcsin=: _1&o.                                     NB. Arcsine
m27=: angle=:arcsin@(length@ cross1 % length@[*length@]) NB. Angle between two vectors
m28=: dfr=: 180p_1&*                                     NB. Degrees from radians
