NB.%phrb11.ijs - J Phrases Section 11B. Duality
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb11.ijs" target="_blank">Script source: phrb11.ijs</a>
NB.-<hr>


m0 =: A=: +/ % #                             NB. Arithmetic mean
m1 =: H=: A &. (%"_)                         NB. Harmonic mean
m2 =: M=: A &. (^&p)                         NB. Generalized mean
a3 =: N=: (^&) (A&.)                         NB. L-x norm; 3-norm is 3 N y
m4 =: +/ &. (*:"_) @ +.                      NB. Magnitude | e.g. m4 3j4
a5 =: each=: &.>                             NB. Each (f each applies f to each box)
m6 =: ^    .: -&.j.                          NB. Sine
m7 =: sin  -: sinh&.j.                       NB. Tautology
m8 =: tan  -: tanh&.j.                       NB. "
m9 =: sinh -: sin&.j.                        NB. "
m10=: cosh -: cos& j.                        NB. "
m11=: tanh -: tan&.j.                        NB. "
v12=: <.   -: >.&.-                          NB. Tautology
v13=: >.   -: <.&.-                          NB. Tautology
d14=: *    -: +&.^.                          NB. Tautology
d15=: *    -: +&.(10&^.)                     NB. Tautology
v16=: %    -: -&.^.                          NB. Tautology
d17=: +    -: *&.^                           NB. Tautology
d18=: +    -: *&.(10&^)                      NB. Tautology
v19=: -    -: %&.^                           NB. Tautology
v20=: %.   -: %.&.|:                         NB. Tautology
v21=: %.   -: %.&.(+@|:)                     NB. Tautology
m22=: +/\  -: +/\.&.|.                       NB. Tautology
m23=: +/\. -: +/\ &.|.                       NB. Tautology
a24=: BW=: 1 : 'u./&.#:'                     NB.  Bitwise adverb
m25=: *. BW                                  NB. Bitwise AND.  e.g. m25 _1 100 200
m26=: +. BW                                  NB. Bitwise OR    e.g. m26 100 200
m27=: ~: BW                                  NB. Bitwise XOR   e.g. m27 100 200
m28=: i.&.(p:^:_1)                           NB. The primes less than n
m29=: totient=: * -.@%@~.&.q:                NB. Euler's totient function
m30=: |.&.;:                                 NB. Reverse the words;  e.g. m30 'three score and ten years'
n31=: a=: ' abcdefghijklmnopqrstuvwxyz'      NB. Space and alphabet
m32=: encrypt=: (#a)&|@>: &. (a&i.)          NB. Julius Caesar's cypher. e.g.
m33=: decrypt=: (#a)&|@<: &. (a&i.)          NB. decrypt encrypt x=:'from sea to sea'
m34=: J=: 1&|.&.#:                           NB. Survivor number in the Josephus problem of order n
d35=: ack=: c1`c1`c2`c3 @. (#.@(,&*))        NB. Ackermann's function
d36=: c1=: >:@]                              NB. 
d37=: c2=: <:@[ ack 1:                       NB. 
d38=: c3=: <:@[ ack [ ack <:@]               NB. 
m39=: 0&ack -:  >:&.(3&+)                    NB. Tautology
m40=: 1&ack -: 2&+&.(3&+)                    NB. Tautology
m41=: 2&ack -: 2&*&.(3&+)                    NB. Tautology
m42=: 3&ack -: 2&^&.(3&+)                    NB. Tautology
m43=: 4&ack -: ^/@#&2&.(3&+)                 NB. Tautology
m44=: 5&ack -: 3 : '^/@#&2^:(1+y.)&.(3&+) 1' NB. Tautology
