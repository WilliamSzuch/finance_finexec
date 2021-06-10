NB.%phrb15.ijs - J Phrases Section 15B. Miscellaneous
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb15.ijs" target="_blank">Script source: phrb15.ijs</a>
NB.-<hr>

v0=. '.'&$: : (2&{.@(<;._1)@,) NB. Split y on x (on period for monad)
m1=: (i.@# = i.~) # ]          NB. Nub ~.
n2=: a.{~65 97+/i.26           NB. A-Z, a-z
n=. 'psmith';(i.3 4);100 200   NB. assign local to explicit definition
n=: 'psmith';(i.3 4);100 200   NB. assign global
'one two three'=: n            NB. assign names
'a b c'=: i.3 4                NB. assign rows of matrix
'a b c d'=: |:i.3 4            NB. assign cols of matrix
'a b c'=: 1 2 3;'two';3 3$3    NB. assign opened elements
[x=: i.5                       NB. assign and display result
v=: +:@*:                      NB. assign name to verb
([ v) i.5                      NB. invoke verb, return argument
(;v) i.5                       NB. invoke verb, return argument linked to result
