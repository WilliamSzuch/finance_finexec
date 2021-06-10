NB.%phre10.ijs - J Phrases Section 10E. Approximation
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.- <a href="../phre10.ijs" target="_blank">Script source: phrde10.ijs</a>
NB.<hr>


d0=: ^.@]  ^@(] +/ .* %.) 1:,.[ NB. Exponential fit of x and y
d1=: ] (] +/ .* %.) 1: ,. [     NB. Linear least squares fit of x and y
d2=: [: ^ 1&,.@[ %.~ ^.@]       NB. a and b such that y is approx. a * b^x</sup>
d3=: 1&,.@[ %.~ ]               NB. a and b such that y is approx. a + b*x
