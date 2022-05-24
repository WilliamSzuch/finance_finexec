NB. =========================================================
NB.%showgrid.ijs - Show data in a grid -using isigrid
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Toolbox</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/toolbox/showgrid.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev
NB.- <a href="../showgrid.ijs" target="_blank">Script source: showgrid.ijs</a>
NB.-<hr>
NB.- Display data in a grid.
NB.- Further dev - cut data from display.
NB.- See: showtable.ijs, edittable.ijs 
NB.-<hr>


NB. =========================================================
NB.*showgrid m
NB.- <b>Form:</b> explict
NB.- <b>Depend:</b> nil
NB.- Display a noun in a grid.
NB.- Noun requires to be table.
NB.-syntax:
NB.+showgrid(D)
NB.+D = data table
NB.-    numeric - undoxed and boxed
NB.-    text - boxed
NB.-    numeric/text - boxed 
NB.-example:
NB.+  showgrid i. 12 12
NB.+  showgrid <"0 i. 12 12
NB.-
NB.+ Sample data tables
NB.+ A =: i. 10 10
NB.+ A1 =: <"0 i. 10 10
NB.+ B =: 10 10 $ <'Text' 
NB.+ C =: A1,.B
NB.-
NB.+  showgrid A
NB.+  showgrid A1
NB.+  showgrid B
NB.+  showgrid C
NB.-
NB.+ Show a large grid - 1,000,000 cells
NB.+ Faster than showtable
NB.+  showgrid ? 1000 1000 $10000
NB.-
NB.+ Causes J to crash 
NB.+   showgrid 10 10 $'A'
NB. ---------------------------------------------------------
showgrid=: 3 : 0
toLF=. [:;(LF,~":)each
Data=: deb toLF 8!:0 y
'Rws Cls'=: $y
wd 'pc ShowGrid escclose closeok;pn "Show Grid"'
wd 'cc G isigrid'
wd 'set G shape ',":Rws,Cls
wd 'set G data *',Data
wd 'pmove 100 10 600 300'
wd 'pshow'
)



