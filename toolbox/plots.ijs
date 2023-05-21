NB. =========================================================
NB.%plots.ijs - Plot tools
NB.-<script src="../js/toolbox_links.js"></script>
NB.- Script: ~addons/finance/finexec/toolbox/plots.ijs
NB.- Contrinutor: William Szuch
NB.- Updated: 2022 6 26
NB.- Depend: ~addons/graphics/plot.ijs
NB.- Definitions: loaded to locale base 
NB.- Status: done
NB.- <a href="../plot.ijs" target="_blank">Script source: plot.ijs</a>
NB.-<hr>
NB.- Definitions for using the plot in Jqt and JHS.
NB.- Further details about plot see: <a class="HREF" href="https://code.jsoftware.com/wiki/Plot" target="_blank">JWiki Plot</a> 
NB.-<hr>


require '~addons/graphics/plot/plot.ijs'


NB. =========================================================
NB.*plotm v -
NB.- <b>Form</b> explicit 
NB.- Allow for multiple plots in Qt.
NB.- Move plot window as required to show multiple plots.
NB.-syntax:
NB.+ plotm - as for plot
NB.-example:
NB.+  plotm i. 123
NB.+  plotm *: i. 123
NB.+  'title ASD' plotm *: i. 123
NB.+  plotm each (i.10);(i.100);(%: i. 100)    NB. 3 plots 
NB.+  ('title P1'plotm i. 10); ('title P2'plotm %: i. 100)  NB. 2 plots
NB. ---------------------------------------------------------
plotm =: 3 : 0
NB. caller_jwplot_=. coname ''
a =. '' conew 'jwplot'
'' plot__a y
:
NB. caller_jwplot_=. coname ''
a =. '' conew 'jwplot'
x plot__a y
)


NB. =========================================================
NB.*plotsizedefault m - 
NB.- <b>Form</b> explicit 
NB.- Only for JHS
NB.- set default plot size
NB.- size attributes for subsequent plots
NB.-syntax:
NB.+plotsizedefault ''
NB. ---------------------------------------------------------
plotsizedefault =: 3 : 0
if. IFJHS=1 do. plotdef 'jijx';'plot';500 400 else. return. end.
)
plotsizedefault ''


NB. =========================================================
NB.*plotsize m -
NB.- <b>Form</b> explicit 
NB.- Only for JHS.
NB.- Change the size of the plot in the Execution Window
NB.- for subsequent plots.
NB.- Default setting in pixcels: W =500,H = 400
NB.-syntax:
NB.+plotsize(W,H)
NB.+W = width in pixcels
NB.+H = height in piscels
NB.-example:
NB.+   plotsize(300 300)
NB.+The try: 
NB.+   plot(i. 10)  
NB. =========================================================
plotsize =: 3 : 0
if. IFJHS=1 do. plotdef 'jijx';'plot';y else. 'Not in JHS' end.
)


NB. =========================================================
NB.*plotshow m -
NB.- <b>Form</b> explicit 
NB.- Only for JHS.
NB.- Show the plot in a new tab plot.
NB.-syntax:
NB.+plotshow(W,H)
NB.+W = width in pixcels
NB.+H = height in piscels
NB.-example:
NB.+   plotshow(300 300)
NB.+The try: 
NB.+   plot(i. 10)  
NB. =========================================================
plotshow =: 3 : 0
if. IFJHS=1 do. plotdef 'show';'plot';y else. 'Not in JHS' end.
)


NB. =========================================================
NB.*plotlink m -
NB.- <b>Form</b> explicit 
NB.- Only for JHS.
NB.- Show the plot in a link.
NB.-syntax:
NB.+plotlink(W,H)
NB.+W = width in pixcels
NB.+H = height in piscels
NB.-example:
NB.+   plotlink(300 300)
NB.+The try: 
NB.+   plot(i. 10)  
NB. =========================================================
plotlink =: 3 : 0
if. IFJHS=1 do. plotdef 'link';'plot';y else. 'Not in JHS' end.
)


NB. =========================================================
NB.*plotnone m -
NB.- <b>Form</b> explicit 
NB.- Only for JHS.
NB.- Create plot in ~temp/plot.html.
NB.-syntax:
NB.+plotnone(W,H)
NB.+W = width in pixcels
NB.+H = height in piscels
NB.-example:
NB.+   plotnone(300 300)
NB.+The try: 
NB.+   plot(i. 10)  
NB. =========================================================
plotnone =: 3 : 0
if. IFJHS=1 do. plotdef 'none';'plot';y else. 'Not in JHS' end.
)


NB. =========================================================
NB.*plotjhsshow m -
NB.- <b>Form</b> explicit 
NB.- Only for JHS.
NB.- Show plot in window plot ie: ~temp/plot.html.
NB.-syntax:
NB.+plotjhsshow(P) y
NB.-example:
NB.+   plotjhsshow(~temp/plot.html)
NB. =========================================================
plotjhsshow =: 3 : 0
if. IFJHS=1 do. 'plot' jhsshow y else. 'Not in JHS' end.
)


NB. =========================================================
NB.*plotkeys m -
NB.- <b>Form</b> tacit 
NB.- Set up the keys for a plot.
NB.-syntax:
NB.+plotkeys(L)
NB.+L = list of boxed labels for the plot
NB.-example:
NB.+   plotkeys('ABC')
NB.+  (plotkeys('ABC'))  plot i. 10
NB.+   plotkeys('ABC';'EFG')
NB.+   plotkeys('ABC';'DEF';'EFGAA')
NB.+   plotkeys('QxM';'ALT_2010_12_F')
NB. ---------------------------------------------------------
plotkeys =: 'key ' , [: , [: > [: ,&' '&.> [: ,&'"'&.> [: '"'&,&.> <^:(L. = 0:)
NB. ---------------------------------------------------------
PK =. 13 : 0 
'key ' ,, >(,&' ' each ,&'"'  each  '"'&, each boxopen y)
)
Note 'T plotkeys'
plotkeys =. PK f.
)


NB. =========================================================
NB.*plotfn a -
NB.-<b>Form</b> explicit
NB.- Plot the results from a function/defiition.
NB.-syntax:
NB.+(f)plotfn(X)
NB.+f = function/definition
NB.+X = values inputed to f
NB.-example: 
NB.+  f =: %:
NB.+  f plotfn i. 10
NB.+  f plotfn 10 + i. 10
NB.-
NB.+   sin plotfn i. 100 
NB.-
NB.+  fz =: (*: @: (+/\ @: sin))
NB.+  fz plotfn i. 100 
NB.-
NB.+  (sin,:cos) plotfn(0.1*i.100)
NB. ---------------------------------------------------------
plotfn =: 1 : 0
plot  (];u) y
)





