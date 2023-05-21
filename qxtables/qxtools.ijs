NB. =========================================================
NB.%qxtools.ijs - Definitions for modifying Qx tables and loading all the Qx tables
NB.-<script src="../js/qxtables_links.js"></script>
NB.- Script: ~addons/finance/finexec/qxtables/qxtools.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-30
NB.- Depend: ~addons/finance/finexec/qxtables/al.ijs
NB.-         ~addons/finance/finexec/qxtables/alt.ijs
NB.-         ~addons/finance/finexec/qxtables/ann.ijs
NB.-         ~addons/finance/finexec/qxtables/elt.ijs
NB.- Definitions: loaded to locale base
NB.- Status: update
NB.- <a href="../qxtools.ijs" target="_blank">Script source: qxtools.ijs</a>
NB.-<hr>
NB.- Tools for for adjusting and modifying Qx tables.
NB.- Plot Qx tables.
NB.- This script loads all the Qx mortality tables.
NB.-<hr>
NB.- Boxed Qx tables
NB.- '0.5' 8!:0 Qx_Data
NB.-<hr>

require '~addons/graphics/plot/plot.ijs'
require '~addons/finance/finexec/qxtables/al.ijs'
require '~addons/finance/finexec/qxtables/alt.ijs'
require '~addons/finance/finexec/qxtables/ann.ijs'
require '~addons/finance/finexec/qxtables/elt.ijs'


NB. =========================================================
NB.*quadfit d -
NB.- <b>Form:</b> explicit
NB.- Calculate a quadratic curve from 2 values to a final value of 1
NB.- over a number of steps. 
NB.- Used to calculate an extended Qx table by fitting a quadratic  
NB.- from the last to two values of the Qx table to 1. 
NB.-syntax:
NB.+(Qx)quadfit(N)
NB.+Qx = Qx table to be extended 
NB.+N = number of years the Qx table is to be extended  
NB.+    from last value to a final value of 1
NB.-example:
NB.+   (0.6 0.7)quadfit(5)
NB.+0.786667 0.86 0.92 0.966667 1
NB.-
NB.+   (2 3)quadfit(5)
NB.+3.53333 3.6 3.2 2.33333 1
NB.-
NB.+   (1 1.2 2 3)quadfit(5)
NB.+3.53333 3.6 3.2 2.33333 1
NB.-
NB.+   (ALT_2005_07_M)quadfit(5)
NB.+0.389359 0.478886 0.610502 0.784207 1
NB.-
NB.+   (ALT_2005_07_M)quadfit(1)
NB.+1
NB.-
NB.+   (ALT_2005_07_M)quadfit(10)
NB.+0.358262 0.385597 0.423924 0.473244 0.533555 0.60486 0.687156 0.780445 0.884726 1
NB.-
NB.+   (ALT_2005_07_M)quadfit(0)
NB. ---------------------------------------------------------
quadfit =: 4 : 0
if. 0 = y do. RES =. '' return. end.
A =. 3 3 $ 1 0 0 1 1 1, (y+1) ^ i. 3 
B =. ((_2 {. x),1)
a =. +/ . *
2}. ((%. A) a B) p. i. y +2
)


NB. =========================================================
NB.*qxextend d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> quadfit
NB.- Extend the qx table from the last value to a final value 
NB.- of 1 over a number of years to terminate all lives.
NB.- This is done by By fitting a quadratic from last 2 values of 
NB.- the Qx table to 1 after a further N years.
NB.- form:tacit
NB.- depend: quadfit
NB.-syntax:
NB.+(Qx)qxextend(N)
NB.+Qx = qx table to be extended 
NB.+N = number of years the qx values to be extended 
NB.-example:
NB.+   _5{. (ALT_2005_07_M)qxextend(5)
NB.+0.389359 0.478886 0.610502 0.784207 1
NB.-
NB.+   _5{. (ALT_2005_07_M) qxextend(0)
NB.+0.32069 0.3261 0.3311 0.33657 0.34192
NB.-
NB.+   _5{. (ALT_2005_07_M)qxextend(1)
NB.+0.3261 0.3311 0.33657 0.34192 1
NB.-
NB.+   _10{. (ALT_2005_07_M)qxextend(10)
NB.+0.358262 0.385597 0.423924 0.473244 0.533555 0.60486 0.687156 0.780445 0.884726 1
NB.-
NB.+   _5{.(ALT_2005_07_M)qxextend(5)
NB.+0.389359 0.478886 0.610502 0.784207 1
NB. ---------------------------------------------------------
qxextend =: [ , [ quadfit ]


NB. =========================================================
NB. Listing Qx Tables
NB. =========================================================


NB. =========================================================
NB.*QxF n default female Qx table : ALT_2010_12_F
QxF =: ALT_2010_12_F
NB.*QxM n  default male Qx table : ALT_2010_12_M
QxM =: ALT_2010_12_M


NB. =========================================================
NB.*Qx_DF n list of default tables
Qx_DF =: 0 : 0
QxF Australian Life Table 2010-12 Females
QxM Australian Life Table 2010-12 Males
)


NB. =========================================================
NB.*Qx_ALL n list of all Qx tables
Qx_ALL =: Qx_DF,Qx_AL,Qx_ALT,Qx_ANN,Qx_ELT


NB. =========================================================
NB.*Qx_ALL_Boxed n boxed list of all Qx tables
Qx_ALL_Boxed =:  LF cut Qx_ALL


NB. =========================================================
NB.*Qx_ALT_Boxed n boxed list of Australian Life Tables
Qx_ALT_Boxed =: LF cut Qx_ALT


NB. =========================================================
NB.*Qx_Names n names of Qx Tables
Qx_Names  =: >> 0{ each cut each LF cut Qx_ALL


NB. =========================================================
NB.*Qx_Desc n description of Qx Tables
Qx_Desc  =: joinstring"1  ,&' ' each > 1}. each  cut each LF cut Qx_ALL


NB. =========================================================
NB.*Qx_Names_Desc n names and description of Qx tables
Qx_Names_Desc =: (<"1 Qx_Names),.(<"1 Qx_Desc)


NB. =========================================================
NB.*descQx m -
NB.- Get description of the Qx table from name.
NB.+  descQx 'QxF'
NB.+  descQx 'ALT_2010_12_M'
NB. ---------------------------------------------------------
descQx =: 3 : 0
N =. < y
Indx =. (dtb each 0{"1 Qx_Names_Desc) i. N
> Indx { (dtb each 1{"1 Qx_Names_Desc)
)


NB. =========================================================
NB.*Qx_Data n qx values same order as Qx_Names
Qx_Data =: > ". each <"1 Qx_Names


NB. =========================================================
Note 'Create table for exporting to Excel'
For JHS
jtable  '0.5' 8!:0 Qx_Data
)


NB. =========================================================
NB. Plots
NB. =========================================================


NB. =========================================================
NB.*plotQx d -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> plot
NB.- Plot Qx tables (Jqt and JHS)
NB.-syntax:
NB.+(Qx)plotQx(A0 A1)
NB.+Qx = boxed list of Qx table names
NB.+A0,A1 = age range (integers)
NB.-example:
NB.+  ('QxF')plotQx(10 20)
NB.+  ('QxF';'QxM')plotQx(10 20)
NB.+  ('ALT_2013_15_M';'ALT_2010_12_M';'ALT_1960_62_M')plotQx(30 50)
NB.-note:
NB.- Use: Qx_ALL to show the available tables
NB.-      Qx_Names_Desc to a show boxed list of available tables
NB. ---------------------------------------------------------
plotQx =: 4 : 0
T1 =. boxopen x
'A1 A2' =. y 
Ages =. A1 + i. 1 + A2 - A1
T11 =. > Ages&{ each  ". each T1
DATA =. Ages;T11
TITLE =. 'title Mortality Tables (Qx)'
XCAPTION =. 'xcaption Age'
YCAPTION =. 'ycaption qx'
TYPE =. 'type line'
KEYS =. 'key ' ,, >(,&' ' each ,&'"'  each  '"'&, each boxopen x) 
TTT =. (TITLE;XCAPTION;YCAPTION;TYPE;KEYS)
TTT plot DATA
)


NB. =========================================================
NB.*plotz v -
NB.- <b>Form</b> explicit 
NB.- Copied from plotm in ~addons/finance/finexec/toolbox/plots.ijs
NB.- Allow for multiple plots in Qt.
NB.- Move plot window as required to show multiple plots.
NB.-syntax:
NB.+ plotz - as for plot
NB.-example:
NB.+  plotz i. 123
NB.+  plotz *: i. 123
NB.+  'title ASD' plotz *: i. 123
NB.+  plotz each (i.10);(i.100);(%: i. 100)
NB.+  ('title P1'plotz i. 10); ('title P2'plotz %: i. 100)
NB. ---------------------------------------------------------
plotz =: 3 : 0
NB. caller_jwplot_=. coname ''
a =. '' conew 'jwplot'
'' plot__a y
:
NB. caller_jwplot_=. coname ''
a =. '' conew 'jwplot'
x plot__a y
)


NB. =========================================================
NB.*plotzQx d -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> plot
NB.- Plot multiple tables (Jqt and JHS)
NB.-syntax:
NB.+(Qx)plotzQx(A0 A1)
NB.+Qx = boxed list of Qx table names
NB.+A0,A1 = age range (integers)
NB.+ For multiple plots ploltzQx [ plotzQx[plotzQx 
NB.+ or on separate lines.
NB.-example:
NB.+  ('QxF')plotzQx(10 20)
NB.+  ('QxF';'QxM')plotzQx(10 20)
NB.+  ('QxF')plotzQx(10 20) 
NB.+  ('QxF';'QxM')plotzQx(10 20)
NB.+  ('QxF')plotzQx(10 20)[('QxF';'QxM')plotzQx(10 20)  NB. 2 plots
NB.+  ('QxF')plotzQx(0 30)[('QxF';'QxM')plotmQx(30  60)[('QxF';'QxM')plotmQx(60 90)  NB. 3 plots
NB.+  ('QxF')plotzQx(10 20)
NB.+  ('QxF';'QxM)plotmQx(10 20)
NB.+  ('ALT_2017_19_M')plotzQx(0 30)[('ALT_1960_62_M')plotmQx(0 30)[('ALT_2017_19_M';'ALT_1960_62_M')plotzQx(0 30)
NB.-note:
NB.- Use: Qx_ALL to show the available tables
NB.-      Qx_Names_Desc to a show boxed list of available tables
NB. ---------------------------------------------------------
plotzQx =: 4 : 0
T1 =. boxopen x
'A1 A2' =. y 
Ages =. A1 + i. 1 + A2 - A1
T11 =. > Ages&{ each  ". each T1
DATA =. Ages;T11
TITLE =. 'title Mortality Tables (Qx)'
XCAPTION =. 'xcaption Age'
YCAPTION =. 'ycaption qx'
TYPE =. 'type line'
KEYS =. 'key ' ,, >(,&' ' each ,&'"'  each  '"'&, each boxopen x) 
TTT =. (TITLE;XCAPTION;YCAPTION;TYPE;KEYS)
TTT plotz DATA
)


