NB.%phrf10.ijs - J Phrases Section 10F. Random Numbers
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrf10.ijs" target="_blank">Script source: phrf10.ijs</a>
NB.<hr>


d0=: {.@[ + ?@(] $ -@(-/@[))                NB. Shape y array of random numbers in x
d1=: ?@#                                    NB. x numbers from i.y with replacement
d2=: ?                                      NB. x numbers from i.y without replacement
m3=: 9!:1@<.@(+/ .^&2@(6!:0@]))             NB. Randomizing random number seed
m4=: (>:@? % 2147483647&[) @ $ & 2147483646 NB. Random numbers between 0 and 1
m5=: {~ ?~@#                                NB. Random shuffle of y
