NB.% J Phrases Section 1A. Conventions
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.-<a href="../phra1.ijs" target="_blank">Script source: phra1.ijs</a>
NB.-<hr>


n0=: i. 6            NB. list of first six non-negative integers
m1=: ^&3             NB. Cube
m2=: mean=: +/ % #   NB. Arithmetic mean
d3=: $,:             NB. x copies of y
m4=: <.@(0.5&+)      NB. Round
m5=: =+              NB. Test for real number
m6=: (<0 _1)&C.      NB. Swap leading and final items
m7=: +/\ -: +/\.&.|. NB. Prefix sum scan is suffix under reversal 