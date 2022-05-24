NB.%phrb6.ijs - J Phrases Section 7B. Rotations & Reflections
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb7.ijs" target="_blank">Script source: phrb7.ijs</a>
NB.-<hr>


m0=: ]                            NB. Identity
m1=: m6@m7                        NB. Three-o&rsquo;clock rotation
m2=: m4@m6                        NB. Six-o&rsquo;clock rotation
m3=: m4@m7                        NB. Nine-o&rsquo;clock rotation
m4=: |.@]                         NB. Horizontal reflection
m5=: m2@m7                        NB. Counterdiagonal reflection
m6=: |."_1@]                      NB. Vertical reflection
m7=: |:@]                         NB. Diagonal reflection
d8=: m0`m1`m2`m3`m4`m5`m6`m7 @. [ NB. i d8 y gives mi y (all rotates and reflects)
