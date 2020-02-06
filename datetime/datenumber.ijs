NB. =========================================================
NB.%datenumber.ijs - Date utilities
NB.- Script: ~addons/finance/finexec/datetime/datenumber.ijs
NB.- Contributor: William Szuch
NB.- Updated: 6/2/2020
NB.- Depend: nil
NB.- Definitions loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Date Time</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- <a href="../datenumber.ijs" target="_blank">Script source: datenember.ijs</a>
NB.- This is an exercise in building long tacits for todayno and todate.
NB.- Taken from the explicit definition in dates.ijs 
NB.- in the Standard Libraray - stdlib.ijs.
NB.- This script defines definitions that convert a date to a number
NB.- and a number to a date.
NB.- The J calendar starts from 1800 1 1 (Wed):  day number = 0 eg: todate 0 gives 1800 1 1
NB.- also, 1 todate 0 gives 18000101
NB.- Use is made of the J utility: dates.ijs that is loaded to the z locale as
NB.- part of the stdlib.ijs.
NB.-
NB.- Monday is the first day of the week as per: ISO 8601.
NB.- Index: Monday = 0, Sunday = 6 (Days = 0 1 2 3 4 5 6)
NB.- calendar 2009
NB.- 1 calendar 2009 < ISO 8601 >
NB.-   
NB.- In the ISO 8601 calendar is a week that starts on Monday.
NB.- 1 YEAR = 365.2425 DAYS
NB.- 
NB.- Date format as a number: <yyyy mm dd> or <yyyymmdd>
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
NB.- <hr>
NB.- Definitions to be completed.
NB.- numbertodate/numbertodatex
NB.- Review definition.
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
NB.*datenumbertable v -
NB.<b>Form</b> explicit
NB.- Table with 5 columns: yyyy mm dd daynumber yyyymmdd
NB.- 1800 1 1 = 0 daynumber
NB.syntax
NB.+  datenumbertable(N,N1)
NB.+N = start day number 
NB.+N1 = number of days
NB.example
NB.+  datenumbertable(0,2)
NB.+1800 1 1 0 18000101
NB.+1800 1 2 1 18000102
NB. ---------------------------------------------------------
datenumbertable =:  3 : 0
'N N1' =. y
D =. todate N +i. N1
N =. todayno D
N1=. 1 todate N 
D,.(,.N),.(,.N1) 
)


NB. =========================================================
NB.*todayno v - 
NB.-<b>Form:</b> explicit
NB.- Converts dates to a day number.
NB.- Converse - todate
NB.- Already loaded as part of stdlib to the z locale from dates.ijs.
NB.- This is coverted to a tacit - for the exercise to build a large tacit.
NB.- see: datetonumber
NB.-syntax
NB.+([X])todayno(D)
NB.- [X] = optional:
NB.-       0 - dates in form YYYY MM DD (default)
NB.-       1 - dates in form YYYYMMDD
NB.-       2 - dates in form YYYY MM DD HH MM SS 
NB.-example:
NB.+   todayno 1998 5 23
NB.+72460
NB.-
NB.+  1 todayno 19980523
NB.+72460 
NB.-
NB.+  2 todayno 1998 5 23 12 30 30
NB.+72460.5
NB. ---------------------------------------------------------
todayno =: 3 : 0
0 todayno y
:
a=. y
if. 1=x do. a=. 0 100 100 #: a end.
a=. ((*/r=. }: $a) , {:$a) $,a
if. 1<x do.
  'y m d h mm s'=. <"_1 |: a
else.
  'y m d'=. <"_1 |: a
end.
y=. 0 100 #: y - m <: 2
n=. +/ |: <. 36524.25 365.25 *"1 y
n=. n + <. 0.41 + 0 30.6 #. (12 | m-3),"0 d
if. 1<x do.
  n=. n + (24 60 60#.h,.mm,.s)%24*3600
end.
0 >. r $ n - 657378
)


NB. =========================================================
NB.*todate v
NB.-<b>Form:</b> explicit
NB.- Converts day numbers to a date
NB.- Already loaded as part of stdlib to the z locale from dates.ijs.
NB.- This is coverted to a tacit - for the exercise to build a large tacit.
NB.- see: numbertodate
NB.syntax
NB.+([X])todate(N)
NB.+ [X] = optional:
NB.-       0 - result in form <yyyy mm dd> (default)
NB.-       1 - result in form <yyyymmdd>
NB.-       2 - result in form <yyyy mm dd hh MM ss>
NB.example
NB.+  todate 78000 
NB.2013 7 23
NB.-
NB.+  1 todate 78000 
NB.+20130723
NB.-
NB.+  2 todate 78000.5 
NB.+2013 7 23 12 0 0
NB. ---------------------------------------------------------
todate =: 3 : 0
0 todate y
:
s=. $y
y=. s$ 0 (I. (,y) e. _ __)},y
a=. 657377.75 +, y=. <. p=. y
d=. <. a - 36524.25 * c=. <. a % 36524.25
d=. <.1.75 + d - 365.25 * y=. <. (d+0.75) % 365.25
r=. (1+12|m+2) ,: <. 0.41+d-30.6* m=. <. (d-0.59) % 30.6
if. 1<x do.
  h=. <. t=. 24*(1&|) ,p
  mm=. <. t=. 60*t-h
  ss=. 60*t-mm
  r=. s $ |: ((c*100)+y+m >: 10) ,r , |: h ,. mm,. ss
else.
  r=. s $ |: ((c*100)+y+m >: 10) ,r
end.
if. 1=x do. r=. 100 #. r end.
r
)


NB. =========================================================
NB.*datetonumber m - 
NB.<b>Form:</b> tacit
NB.- Convert a date to a day number.
NB.-syntax
NB.+datetonumber(D)
NB.+D = table of dates with format YYYY MM DD
NB.-example:
NB.+  datetonumber 2014 12 1
NB.+78496
NB.-
NB.+  datetonumber (1998 3 23,:2014 12 1)
NB.+72399 78496
NB.-
NB.+  datetonumber >(1998 3 23;2014 12 1;2019 1 1;2019 5 20)
NB.+72399 78496 79988 80127
NB. ---------------------------------------------------------
datetonumber =: ((-&657378)@:(((((+/)@:<.)@:((36524.25 365.25)&*))@:((0 100&#:)@:((0&{) - ((<:&2)@:(1&{))))) + (((<.@:((0.40999999999999998)&+))@:((0 30.600000000000001)&#.))@:((((12&|)@:(-&3))@:(1&{)) , (2&{)))))"1
NB. ---------------------------------------------------------
Note 'T datetonumber'
m0 =. yymm @:(y0 - (gt2 @:y1))
m1 =. n0 @: m0
m2 =.  m1 + (<.@: (0.41&+) @: ((0 30.6)&#.) @: mod12)
datetonumber =. (adj @: m2)"1 f.
)


NB. =========================================================
NB.*datetonumberx m -
NB.<b>Form:</b> tacit
NB.- convert a date to a day number
NB.-syntax
NB. datetonumberx(D)
NB.-D = list of date with format YYYYMMDD
NB.-example:
NB.+  datetonumberx 20141201
NB.+78496
NB.+
NB.+  datetonumberx (19980323,20141201)
NB.+72399 78496
NB. ---------------------------------------------------------
datetonumberx =: (((-&657378)@:(((((+/)@:<.)@:((36524.25 365.25)&*))@:((0 100&#:)@:((0&{) - ((<:&2)@:(1&{))))) + (((<.@:((0.40999999999999998)&+))@:((0 30.600000000000001)&#.))@:((((12&|)@:(-&3))@:(1&{)) , (2&{)))))"1)@:(0 100 100&#:)
NB. ---------------------------------------------------------
Note 'T datetonumberx'
datetonumberx =. datetonumber @: ymd f. 
)


NB. =========================================================
NB.*numbertodate m convert a day number to a date
NB.- Convert a date to a number.
NB.-syntax numbertodate Y
NB.-Y = day number 
numbertodate =: 'ZZZ'


NB. =========================================================
NB.*numbertodatex m convert a day number to a date
NB.-syntax numbertodatex Y
NB.-Y = day number
numbertodatex =: 'ZZZ'


