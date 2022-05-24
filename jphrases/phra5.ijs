NB.%phra5.ijs - J Phrases Section 5A. Structural
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.-<a href="../phra5.ijs" target="_blank">Script source: phra5.ijs</a>
NB.-<hr>

m0=: ,:                             NB. Add leading dimension of length 1
m1=: ,:"_1                          NB. Add leading dim of length 1 to items
m2=: ,:"1                           NB. Add leading dim of length 1 to rows
m3=: ,:"0                           NB. Add leading dim of length 1 to scalars
m4=: ,.                             NB. 1-column table from list
d5=:([:":[:,.[),"1('  '"_,"1 [:":]) NB. Append row stub x to table y
m6=: ,:-                            NB. Array and its negative
m7=: #:&.<:@# $ ]                   NB. Make a hypercube from a vector of length n (where n is a power of 2)
