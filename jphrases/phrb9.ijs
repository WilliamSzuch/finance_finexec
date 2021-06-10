NB.%phrb9.ijs - J Phrases Section 9B. Linear Vector Functions
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb9.ijs" target="_blank">Script source: phrb9.ijs</a>
NB.-<hr>


a0=: MR=: 1 : 'x.@=@i.@#' NB. Matrix representation of linear function
d1=: mp=: +/ . *          NB. Matrix product
a2=: L=: &mp              NB. Linear function represented by matrix
a3=: inv=: ^:_1           NB. Inverse adverb
a4=: MRI=: (^:_1) 'MR' f. NB. Matrix representation of inverse function
a5=: MR (%.@)             NB. "
