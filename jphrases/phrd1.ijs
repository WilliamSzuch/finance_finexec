NB.%phrd1.ijs - J Phrases Section 1D. Function Tables
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrd1.ijs" target="_blank">Script source: phrd1.ijs</a>
NB.<hr>


d0=: +/                                NB. Addition table
d1=: */                                NB. Multiplication table
d2=: >./                               NB. Maximum table
d3=: [ by ] over +/                    NB. Bordered addition table
d4=: by=: ' '&;@,.@[,.]                NB. Format function
d5=: over=: ({.;}.)@":@,               NB. Format function
m6=: +/~@i.                            NB. Addition table on first y integers
m7=: bc=: !/~@i.                       NB. Binomial coefficients of order y
a8=: ft=: 1 : 'x./~@i.'                NB. Function table
a9=: bft=: 1 : 'i. by i. over x./~@i.' NB. Bordered function table (Explicit definition)