NB.%phrh2.ijs - J Phrases Section 2H. Gerunds
NB.-<script src="../js/jphrases_links.js"></script>
NB.-<a href="../phrh2.ijs" target="_blank">Script source: phrh2ijs</a>
NB.-<hr>

m0=: horner=: +`*/                                   NB. m0 a,x,b,x,c is (a,b,c)p.x
m1=: grid=: +`(*i.)/                                 NB. grid b,s,n From b in n s-steps
m2=: case1=: _1:`%:`*:@.*"0                          NB. Sqr, _1, or sq root if neg, zero, or pos
d3=: sort=: /:~@]`(\:~@])@.[                         NB. Sort up or down for left 0 or 1
v4=: cases=: case1 : sort                            NB. Ambivalent function
a5=: sel=: 1 : '] #~ ] x. {.'                        NB. Selection for Quicksort
m6=: qs=: ] ` ($:@(<sel), =sel, $:@(>sel)) @. (1:<#) NB. Quicksort defined recursively
m7=: (0&,+,&0)^:([`1:)                               NB. Binomial coefficients (gerundial power)
