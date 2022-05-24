NB.%phrd9.ijs - J Phrases Section 9D. Transcendental Functions
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrd9.ijs" target="_blank">Script source: phrd9.ijs</a>
NB.<hr>


m0  =: (^1)&^              NB. Exponential ^
m1  =: (^1)&^.             NB. Natural log  ^.
m2  =: antilog=: 10&^      NB. Ten-to-the-power (Base-10 Antilog)
m3  =: log=:10&^.          NB. Base-10 log
m4  =: sin=: 1&o.          NB. Sin
m5  =: cos=: 2&o.          NB. Cos
m6  =: tan=: 3&o.          NB. Tan
m7  =: sinh=: 5&o.         NB. Sinh
m8  =: cosh=: 6&o.         NB. Cosh
m9  =: tanh=: 7&o.         NB. Tanh
m10=: ^    .:-&.j.         NB. Sin as odd part of exponential
m11=: ^@j. ..-             NB. Cos as even part
m12=: ^    .:-             NB. Sinh as odd part
m13=: ^    ..-             NB. Cosh as even part
m14=: sin  -: sinh&.j.     NB. Tautology
m15=: cos  -: cosh& j.     NB. "
m16=: tan  -: tanh&.j.     NB. "
m17=: sinh -: sin&.j.      NB. "
m18=: tan -: tanh&.j.      NB. "
m19=: tanh -: tan&.j.      NB. "
d20=: *    -: +&.^.        NB. "
d21=: *    -: +&.(10&^.)   NB. "
v22=: %    -: -&.^.        NB. "
d23=: +    -: *&.^         NB. "
d24=: +    -: *&.(10&^)    NB. "
v25=: -    -: %&.^         NB. "
m26=: gamma=: !@<:         NB. Gamma function of y
d27=: beta=: *&m26 % m26@+ NB. Beta function of x and y
