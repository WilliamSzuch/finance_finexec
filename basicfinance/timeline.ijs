NB. =========================================================
NB.%timeline.ijs - Time line plot of a cash flow
NB.-<script src="../js/basicfinance_links.js"></script>
NB.- Script: ~addons/finance/finrxec/basicfinance/timeline.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 6 25
NB.- Depend: ~addons/graphics/plot/plot.ijs
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.-<hr>
NB.- Show the cash flow as a time line plot at the periods when the cash 
NB.- flow occurred from a reference point of period equal to 0. 
NB.- As a convention the cash inflow to a portfolio is positive 
NB.- <a href="../timeline.ijs" target="_blank">Script source: timeline.ijs</a>
NB.-<hr>
NB.- plot not working properly with level cash flow with type stick.
NB.- type stick' plot 5 # 2 
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
NB.-     list of periods in T
NB.-example: 
NB.+   timelinecf(0 1 2 3 4;1 2 3 4 5)
NB.+   timelinecf(_3 _2 _1 0 1 2 3 ;1 2 3 4 5 _6 7)
NB.+   timelinecf(0 1 2 3 4 5.5 3.3 0.5 _1;1 2 3 _4 5 _6 7 8 9)
NB.+   timelinecf((i. 25);100, - 24 #10)
NB.+   timelinecf(0 1 2 3 4;3 4 5)  NB. (T;C) do not match
NB. ---------------------------------------------------------
timelinecf =: 3 : 0
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


