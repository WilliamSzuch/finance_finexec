NB. =========================================================
NB.%lists.ijs - Create lists of data
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Toolbox</a>
NB.-<hr>
NB.- script: ~adons/finance/finexec/toolbox/lists.ijs
NB.- Contributor: William Szuch
NB.- Updated: 5/8/2020
NB.- depend:nil
NB.- Definitions: loaded to locale base 
NB.- Status: done:
NB.- <a href="../lists.ijs" target="_blank">Script source: lists.ijs</a> 
NB.-<hr>
NB.- Definitions for creating lists of data, numeris and text.
NB.-<hr>


NB. =========================================================
NB.*extend d -
NB.- <b>Form:</b> tacit
NB.- Extend the last item of a list.
NB.-syntax:
NB.+(N)extend(L)
NB.+N = number of items in the extended list
NB.+L = list to be extended
NB.-example:
NB.+   (12)extend(1.01 1.02 1.03)
NB.+1.01 1.02 1.03 1.03 1.03 1.03 1.03 1.03 1.03 1.03 1.03 1.03
NB.-
NB.+   (2)extend(1.01 1.02 1.03 1.04 1.05)
NB.+1.01 1.02
NB.-
NB.+   (15)extend('asd')
NB.+asddddddddddddd
NB.-
NB.+   (6)extend('ad';1;2;'ZZ')
NB.+┌──┬─┬─┬──┬──┬──┐
NB.+│ad│1│2│ZZ│ZZ│ZZ│
NB.+└──┴─┴─┴──┴──┴──┘
NB. ---------------------------------------------------------
extend =: [ {. (] , (# {:)) 


NB. =========================================================
NB.*extenda d -
NB.- <b>Form:</b> tacit
NB.- Extend the last item of a list.
NB.- Similiar to extend except reversed.
NB.-syntax:
NB.+(L)extenda(N)
NB.+N = number of items in the extended list
NB.+L = list to be extended
NB.-example:
NB.+   (1.01 1.02 1.03)extenda(12)
NB.+1.01 1.02 1.03 1.03 1.03 1.03 1.03 1.03 1.03 1.03 1.03 1.03
NB.-
NB.+   (1.01 1.02 1.03 1.04 1.05)extenda(2)
NB.+1.01 1.02
NB.-
NB.+   ('asd')extenda(15)
NB.+asddddddddddddd
NB.-
NB.+   ('ad';1;2;'ZZ')extenda(6)
NB.+┌──┬─┬─┬──┬──┬──┐
NB.+│ad│1│2│ZZ│ZZ│ZZ│
NB.+└──┴─┴─┴──┴──┴──┘
NB. ---------------------------------------------------------
extenda =: ([ {. ] , (# {:))~
NB. ---------------------------------------------------------
Note 'build extenda'
extenda =. extend~ f.
)


NB. =========================================================
NB.*steps m -
NB.- <b>Form:</b> tacit
NB.- Generate uniform steps over a closed interval.
NB.- The end points of the interval are inculded.
NB.-syntax:
NB.+steps(A,B,N)
NB.+A = lower limit of range
NB.+B = upper limit of range
NB.+N = number of steps in the interval
NB.-example:
NB.+   steps(0,10,5)
NB.+0 2 4 6 8 10
NB.-
NB.+   steps(1.0,1.1,10)
NB.+1 1.01 1.02 1.03 1.04 1.05 1.06 1.07 1.08 1.09 1.1
NB. ---------------------------------------------------------
steps=: {. + (1&{ - {.) * (i.@>: % ])@{:

