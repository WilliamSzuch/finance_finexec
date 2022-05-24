NB.%phra6.ijs - J Phrases Section 6A. Sorting
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.-<a href="../phra6.ijs" target="_blank">Script source: phra6.ijs</a>
NB.-<hr>


m0=: /:~                NB. Sort the array y in ascending order
m1=: \:~                NB. Sort the array y in descending order
m2=: /:~"_1             NB. Sort the items of array y ascending
d3=: /:@:{ { [          NB. Sort indices x according to y
d4=: ]/:{"1             NB. Sort table y according to column x
d5=: \:@[`(/:@[) @. ]   NB. Grade x up if y is 1 and down if y is 0
d6=: \:~@[`(/:~@[) @. ] NB. Sort up or down  (Try literal argument)
d7=: /:~                NB. Sort y according to x
