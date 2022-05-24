NB.%phrf9.ijs - J Phrases Section 9F. Geometry
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrf9.ijs" target="_blank">Script source: phrf9.ijs</a>
NB.<hr>


m0=: Ar=: */                                                 NB. Area of rectangle
m1=: Ab=: 2: * [:+/ ] *1&|.                                  NB. Area of box
m2=: Vb=: */                                                 NB. Volume of box
m3=: Lci=: 2: * o.                                           NB. Length (circumference) of circle (radius)
m4=: Aci=: [:o. ] ^ 2:                                       NB. Area of circle (r)
d5=: Aco=: o.@*                                              NB. Area of cone, excluding base (h r)
d6=: Vco=: 1r3p1"_ * ] * *                                   NB. Volume of cone (h r)
m7=: As=: 4p1"_ * ] ^ 2:                                     NB. Area of sphere (r)
m8=: Vs=: 4r3p1"_ * ] ^ 3:                                   NB. Volume of sphere (r)
m9=: L=: +/&.(*:"_)"1                                        NB. Length of a vector
d10=: Lp=: [: L [ , [: L [: -: ]                             NB. Length of edges of pyramid (h   w,l)
d11=: Ap=: [:+/ ]* [:L"1 [,"0-:@]                            NB. Area of pyramid, excluding base (h w,l)
d12=: Vp=: 1r3"_ * */@,                                      NB. Volume of pyramid
m13=: sp=: -:@(+/)                                           NB. Semi-perimeter
m14=: h=: [: %: [: */ sp - 0: , ]                            NB. Heron's formula for area of triangle
m15 =: L=: +/&.(*:"_)"1                                      NB. Length
m16=: D=: 1&|.-]                                             NB. Displacement
m17=: LS=: L"1@D                                             NB. Lengths of sides
m18=: S=: 1&o.@(*&1r180p1)                                   NB. Sine in degrees
m19=: C=: 2&o.@(*&1r180p1)                                   NB. Cosine in degrees
m20=: r=: (C,S),:(-@S,C)                                     NB. 2-dim rotation matrix in degrees
m21=: b=: <"1@(,"0/~)                                        NB. Table of boxed index pairs: do i 0 2 
d22=: R=: (r@])`(b@[)`(=@i.@3:)}                             NB. 3-dim rm: From axis 0 to 2 is 0 2 R a
d23=: mp=: +/ . *                                            NB. Matrix product
m24=: R3=: (2 0"_ R 0&{)mp(1 2"_ R       1&{)mp(0 1"_ R 2&{) NB. R3 p,q,r is p-rotate from axis 2 to 1 on q-r from 1 to 2 on r-r from 0 to 1
m25=: Det=: -/ . *                                           NB. Determinant
m26=: Area=: [:Det ] ,. %@!@{:@$                             NB. Area of triangle
m27=: Vol=: Area f.                                          NB. Volume of simplex in n-space (fixed)
d28=: dsplitby=: ~:/@:*@:Vol@:     (,"1 2)                   NB. Are points pairs (2 by n matrix) x separated by n by n simplex y?
m29=: Area2=: [: -: [: +/ 2: Det\ ]                          NB. Area of polygon
