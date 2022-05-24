NB.%phrb9.ijs - J Phrases Section 9B. Linear Vector Functions
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb9.ijs" target="_blank">Script source: phrb9.ijs</a>
NB.-<hr>


a0=: MR=: 1 : 'x.@=@i.@#' NB. Matrix representation of linear function
d1=: mp=: +/ . *          NB. Matrix product
a2=: L=: &mp              NB. Linear function represented by matrix
a3=: inv=: ^:_1           NB. Inverse adverb
a4=: MRI=: (^:_1) 'MR' f. NB. Matrix representation of inverse function
a5=: MR (%.@)             NB. "
