NB.%phrc4.ijs - J Phrases Section 4C. Test
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrc4.ijs" target="_blank">Script source: phrc4.ijs</a>
NB.-<hr>


d0=: -:&(/:~)                       NB. Are x and y permutations of each other?
m1=: /:~-:i.@#                      NB. Is y a permutation vector?
m2=: -:-@|:                         NB. Is y antisymmetric?
m3=: -:|:                           NB. Is y symmetric?
m4=: [:+./[:*./]=/0 1"_             NB. Are all atoms of Boolean list y equal?
m5=: *./ .= +./                     NB. Are all atoms of Boolean list y equal?
m6=: *./ .= *./                     NB. Are all atoms of Boolean list y equal?
d7=: -.@(] <:/ .>: >.@] , [)"1      NB. Is y in the half open on the right interval x and is it an integer?
d8=: e.                             NB. Is list x a row of array y?
m9=: *./@(= >./\)                   NB. Are columns of y in ascending order?
m10=: *./@(= <./\)                  NB. Are columns of y in descending order?
m11=: >./=<./                       NB. Are atoms of numerical list y equal?
m12=: *./ +. -.@(+./)               NB. Are atoms of Boolean list y equal? 
m13=: *./ = +./                     NB. Are atoms of Boolean list y equal?
m14=: *./@(= {.)                    NB. Are atoms of list y equal?
m15=: 0:=#|+/                       NB. Are atoms of Boolean list y equal?
m16=: *./@(#1&|.)                   NB. Are atoms of Boolean list y equal?
m17=: ([:,:0:,#)-: v19"_ rxmatch ]  NB. Is y a legal J name?
d18=: rxmatch=: 17!:0               NB. '' to get rxmatch
v19=: '[[:alpha:]][[:alnum:]_]* '"_ NB. 'regex' to get alpha: and alnum:
