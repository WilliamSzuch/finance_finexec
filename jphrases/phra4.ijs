NB.%phra4.ijs - J Phrases Section 4A. Intervals
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.-<a href="../phra4.ijs" target="_blank">Script source: phra4.ijs</a>
NB.-<hr>
 

d0=: OO=: ({.@] <  [)*.([ < {:@])  NB. x OinO y  (Is x in open interval y)
d1=: OC=: ({.@] <  [)*.([ <: {:@]) NB. 	x OinC y
d2=: CO=: ({.@] <: [)*.([ <  {:@]) NB. x CinO y
d3=: CC=: ({.@] <: [)*.([ <: {:@]) NB. x CinC y
d4=: +/"1@d2                       NB. Number of x OinC y
d5=: 0:    e.~ class               NB. x OinO y
d6=: 0 1"_ e.~ class               NB. x OinC y
d7=: _1 0  "_ e.~ class            NB. x CinO y
d8=: _1 0 1"_ e.~ class            NB. x CinC y
d9=: class=: [: +/"1 [: * -/       NB. Class _2 to 2:   <A  ="a"  CINC="b">b
d10=: [: ~:/ >:/~                  NB. x OinC y
d11=: ] >/ .>~ [: ,.~ [            NB. x OinC y
d12=: sgd=: *@(-~/~)               NB. Signum of difference
d13=: 0&=@(+/)@sgd                 NB. OO
d14=: e.&0 1@(+/)@sgd              NB. OC
d15=: 0&>:@(%/)@sgd                NB. CO
d16=: >/@sgd                       NB. CC
