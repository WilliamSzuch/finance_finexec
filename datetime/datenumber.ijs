NB. =========================================================
NB.%datenumber.ijs - Date number utilities
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Date Time</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/datetime/datenumber.ijs
NB.- Contributor: William Szuch
NB.- Updated: 31/7/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../datenumber.ijs" target="_blank">Script source: datenember.ijs</a>
NB.-<hr>
NB.- This is an exercise in building long tacits for todayno and todate.
NB.- Taken from the explicit definition in dates.ijs in stdlib
NB.- This script defines definitions that convert a date to a number
NB.- and a number to a date.
NB.- The J calendar starts from 1800 1 1 (Wed):  day number = 0 eg: todate 0 gives 1800 1 1
NB.- also, 1 todate 0 gives 18000101
NB.- Use is made of the J addon: dates.ijs that is loaded to the z locale as
NB.- part of the stdlib.ijs.
NB.-
NB.- Monday is the first day of the week as per: ISO 8601.
NB.- Index: Monday = 0, Sunday = 6 (Days = 0 1 2 3 4 5 6)
NB.- calendar 2009
NB.- 1 calendar 2009 (ISO 8601)
NB.-   
NB.- In the ISO 8601 calendar is a week that starts on Monday.
NB.- 1 YEAR = 365.2425 DAYS
NB.- 
NB.- Date format as a number: yyyy mm dd or yyyymmdd
NB.- 
NB.- The preferred date formats: 
NB.- yyyymmdd eg: 19970630
NB.- yyyy mm dd eg: 1997 6 30 
NB.-
NB.- Use 'getdate' for conversion of character dates to format: yyyy mm dd.
NB.-
NB.- An Excel date is a number displayed with a date format.
NB.- It starts from 1900 1 1 with a well known leap year bug.
NB.-
NB.- To convert from J day numbers (result of verb 'todayno' in dates.ijs),to 
NB.- Excel day number subtract 36522 from the J day number.
NB.-<hr>
NB.- Definitions to be completed.
NB.- numbertodate/numbertodatex
NB.-<hr>


NB. =========================================================
NB. Utilities
y0 =. 0&{  NB. get 1st item from a list
y1 =. 1&{  NB. get 2nd item from a list
y2 =. 2&{  NB. get 1st item from a list
gt2 =. <:&2 NB. less than or equal to 2
yymm =. (0 100)&#:
n0 =. +/ @:<. @: ((36524.25 365.25)&*)
mod12 =. ((12&|) @: (-&3) @: y1),y2
adj =. -&657378 
ymd =.  (0 100 100)&#: NB. convert YYYYMMDD to YYYY MM DD
ymd000 =. (0 0 0,~ ymd)  NB. convert YYYYMMDD to YYYY MM DD 0 0 0


NB. =========================================================
NB.*datenumbertable m -
NB.- <b>Form:</b> explicit
NB.- <b>depend:</b> todate (stdlib: dates.ijs)
NB.- Table with 5 columns: yyyy mm dd daynumber yyyymmdd
NB.- 1800 1 1 = 0 daynumber
NB.-syntax:
NB.+  datenumbertable(N,N1)
NB.+N = start day number 
NB.+N1 = number of days
NB.-example:
NB.+  datenumbertable(0,2)
NB.+1800 1 1 0 18000101
NB.+1800 1 2 1 18000102
NB.-
NB.+   datenumbertable(80353,4)
NB.+2020 1 1 80353 20200101
NB.+2020 1 2 80354 20200102
NB.+2020 1 3 80355 20200103
NB.+2020 1 4 80356 20200104
NB. ---------------------------------------------------------
datenumbertable =:  3 : 0
'N N1' =. y
D =. todate N +i. N1
N =. todayno D
N1=. 1 todate N 
D,.(,.N),.(,.N1) 
)


NB. =========================================================
NB.*datetonumber m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Based on explixit todayno from dates.ijs (stdlib)
NB.- Convert a date to a day number.
NB.-syntax:
NB.+datetonumber(D)
NB.+D = table of dates with format YYYY MM DD
NB.-example:
NB.+  datetonumber 2014 12 1
NB.+78496
NB.-
NB.+  datetonumber (1998 3 23,:2014 12 1)
NB.+72399 78496
NB.-
NB.+  datetonumber(1998 3 23,2014 12 1,2019 1 1,:2019 5 20)
NB.+72399 78496 79988 80127
NB. ---------------------------------------------------------
datetonumber =: -&657378@:(+/@:<.@:(36524.25 365.25&*)@:(0 100&#:@:(0&{ - <:&2@:(1&{))) + <.@:(0.40999999999999998&+)@:(0 30.600000000000001&#.)@:(12&|@:(-&3)@:(1&{) , 2&{))"1
NB. ---------------------------------------------------------
Note 'T datetonumber'
m0 =. yymm @:(y0 - (gt2 @:y1))
m1 =. n0 @: m0
m2 =.  m1 + (<.@: (0.41&+) @: ((0 30.6)&#.) @: mod12)
datetonumber =. (adj @: m2)"1 f.
)


NB. =========================================================
NB.*datetonumberx m -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- convert a date to a day number
NB.- Based on explicit todayno from dates.ijs (stdlib)
NB.-syntax:
NB. datetonumberx(D)
NB.-D = list of dates with format YYYYMMDD
NB.-example:
NB.+  datetonumberx 20141201
NB.+78496
NB.-
NB.+  datetonumberx (19980323,20141201)
NB.+72399 78496
NB. ---------------------------------------------------------
datetonumberx =: -&657378@:(+/@:<.@:(36524.25 365.25&*)@:(0 100&#:@:(0&{ - <:&2@:(1&{))) + <.@:(0.40999999999999998&+)@:(0 30.600000000000001&#.)@:(12&|@:(-&3)@:(1&{) , 2&{))"1@:(0 100 100&#:)
NB. ---------------------------------------------------------
Note 'T datetonumberx'
datetonumberx =. datetonumber @: ymd f. 
)


NB. =========================================================
NB.*numbertodate m -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Convert a day number to a date
NB.- Based on explicit todate from dates.ijs (stdlib)
NB.+TO Do
NB.-syntax: 
NB.+ numbertodate(D)
NB.+D = day number 
NB.-example:
NB. ---------------------------------------------------------
numbertodate =: 'To Do'


NB. =========================================================
NB.*numbertodatex m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Convert a day number to a date
NB.- Based on explicit todate from dates.ijs (stdlib)
NB.+To Do
NB.-syntax:
NB.+   numbertodatex(D)
NB.+D = day number
NB.-example:
NB. ---------------------------------------------------------
numbertodatex =: 'To Do'


