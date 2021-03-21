NB. =========================================================
NB.%timeline.ijs - Time line plot of a cash flow
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Basic Finance</a>
NB.-<hr>
NB.- Script: ~addons/finance/finrxec/basicfinance/timeline.ijs
NB.- Contributor: William Szuch
NB.- Updated: 28/2/2021
NB.- Depend: ~addons/graphics/plot/plot.ijs
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.-<hr>
NB.- Show the cash flow as a time line plot at the periods when the cash 
NB.- flow occurred from a reference point of period equal to 0. 
NB.- As a convention the cash inflow to a portfolio is positive 
NB.- <a href="../timeline.ijs" target="_blank">Script source: timeline.ijs</a>
NB.-<hr>


require 'plot'


NB. =========================================================
NB.*timelinecf m -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> plotdef/plot
NB.- Show the cash flow as a time line plot.
NB.-syntax: 
NB.+timelinecf(T;C)
NB.- T = list of periods measured in time units from an 
NB.-     origin (ie: 0) at which the cash flow occurred
NB.- C = the amout of cash flow at each period in the 
NB.-     list of periods in Y0
NB.-example: 
NB.+   timelinecf (0 1 2 3 4;1 2 3 4 5)
NB.+   timelinecf (0 1 2 3 4 5.5 3.3 0.5 _1;1 2 3 _4 5 _6 7 8 9)
NB.+   timelinecf ((i. 25);100, - 24 #10)
NB.+   timelinecf (0 1 2 3 4;3 4 5)  NB. (T;C) do not match
NB. ---------------------------------------------------------
timelinecf =: 3 : 0
'' timelinecf y
:
'Y0 Y1' =. y
if. -. (#Y0) = (#Y1) do. <'*** (T:periods) and (C:cash flows) do not match - check data ***' return. end.
TITLE =. 'title Cash Flow Time Line'
XCAPTION =. 'xcaption Period (Time Units)'
YCAPTION =. 'ycaption Cash Flow'
TYPE =. 'type stick'
AXES =. 'axes 1 0'
COLOR =. 'color blue'
TTT =. (TITLE;XCAPTION;YCAPTION;TYPE;AXES;COLOR) 
if. 1 = IFJHS do.  plotdef 'jijx';'';500 400 end.
TTT plot (Y0;Y1)
)


