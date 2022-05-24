NB.%phrb8.ijs - J Phrases Section 8B. Grids
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb8.ijs" target="_blank">Script source: phrb8.ijs</a>
NB.-<hr>


m0=: i.                            NB. First y non-negative integers
m1=: Ai=: >:@i.                    NB. Augmented integers (begin at 1)
m2=: Ei=: i.@>:                    NB. Extended integers (0 to y inclusive)
m3=: Si=: -Ei@+:                   NB. Symmetric integers (-y to y inclusive)
m4=: grid=: +`(*i.)/               NB. General grid (2{y steps from 0{y by 1{y)
m5=: cb=: ] {. 1 _1"_ $~ >: - 2&|  NB. Checkerboard. Try box cb 2 3 4 5
m6=: box=: <"2                     NB. Box rank 2 cells (for readable display)
m7=: CB=: *cb@$                    NB. Alternate signs of atoms of y.
m8=: bcb=: _1&=@cb                 NB. Boolean checkerboard
m9=: {. 0 1"_ $~ ] + 2&|@>:        NB. "
m10=: _1: ^ m9                     NB. Checkerboard
a11=: syft=: (/~)(@Si)             NB. Symmetric function tables
v12=: WRAP=: wrap : (wrap@]^:[)    NB. Wrap (monad) and repeated wrap (dyad) 
m13=: wrap=: RL@(,.(next+i.@#))^:4 NB. Wrap argument with successive integers 
m14=: RL=: |.@|:                   NB. Roll table to left
m15=: next=: >:@(>./)@,            NB. Next integer after largest in table
