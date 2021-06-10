NB.%phra9.ijs - J Phrases Section 9A. Matrix Algebra
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.-<a href="../phra9.ijs" target="_blank">Script source: phra9.ijs</a>
NB.-<hr>


m0=: I=: =@i.@#                 NB. Identity matrix of order of y
m1=: inv=: %.                   NB. Matrix inverse
d2=: mq=: %.                    NB. Matrix quotient
d3=: mp=: +/ . *                NB. Matrix product
d4=: amp=: -/ . *               NB. Alternating matrix product
m5=: det=: -/ . *               NB. Determinant
d6=: fit=: {:@] %. {.@] ^/ i.@[ NB. d fit x,:f x is coeffs of pn fit of degree d-1
