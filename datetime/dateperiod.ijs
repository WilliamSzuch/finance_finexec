NB. =========================================================
NB.%dateperiod.ijs - Dates grouped by by period
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Date Time</a>
NB.-<hr>
NB.- Script: ~addons/finexec/datetime/dateperiod.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions loaded to locale: base 
NB.- Status: done:
NB.- <a href="../dateperiod.ijs" target="_blank">Script source: dateperiod.ijs</a>
NB.-<hr>
NB.- Definition creating perodical dates and grouping dates into periods.  
NB.- The definitions in the Standard Library script dates.ijs are available. 
NB.- The J Calendar starts from 1800 1 1 (Wed): with day number = 0 
NB.+    todate 0 
NB.+1800 1 1
NB.+
NB.+   1 todate 0 
NB.+18000101
NB.- Monday is the first day of the week as per: ISO 8601.
NB.- Index: Monday = 0, Sunday = 6 (Days = 0 1 2 3 4 5 6)
NB.+   calendar 2020 1
NB.- The ISO 8601 calendar - a week starts on monday.
NB.- 1 year = 365.2425 days
NB.+┌─────────────────────┐
NB.+│         Jan         │
NB.+│ Su Mo Tu We Th Fr Sa│
NB.+│     1  2  3  4  5  6│
NB.+│  7  8  9 10 11 12 13│
NB.+│ 14 15 16 17 18 19 20│
NB.+│ 21 22 23 24 25 26 27│
NB.+│ 28 29 30 31         │
NB.+│                     │
NB.+└─────────────────────┘
NB.-
NB.+   1 calendar 2018 1
NB.+┌─────────────────────┐
NB.+│         Jan         │
NB.+│ Mo Tu We Th Fr Sa Su│
NB.+│  1  2  3  4  5  6  7│
NB.+│  8  9 10 11 12 13 14│
NB.+│ 15 16 17 18 19 20 21│
NB.+│ 22 23 24 25 26 27 28│
NB.+│ 29 30 31            │
NB.+│                     │
NB.+└─────────────────────┘
NB.- 
NB.- Date formats as a number: yyyy mm dd or yyyymmdd
NB.+    todayno  2017 1 1
NB.+79258
NB.+   1 todayno  20170101
NB.+79258
NB.- Use of definition 'calendar' is slow - could consider doing something faster.
NB.-
NB.- The preferred formats for a date are: 
NB.- yyyy mm dd eg. 1997 6 30 etc.
NB.- yyyymmdd eg 19970630 has advantages.
NB.-
NB.- Use the definition 'getdate' for conversion of character dates to format: yyyy mm dd.
NB.+   getdate('2017/1/1')
NB.+2017 1 1
NB.+   getdate('1/1/2017')
NB.+2017 1 1
NB.-
NB.- An Excel date is a number displayed with a date format.
NB.- It starts from 1900 1 1 with a well known leap year bug.
NB.- ??? Check if this applied to Excel 2016
NB.- 
NB.- To convert from J day numbers (result of verb 'todayno' in dates.ijs),to 
NB.- Excel day number subtract 36522 from the J day number.
NB.-
NB.- Some useful date conversion verbs are also contained in the script.
NB.- 
NB.- Formated date: yyyymmdd:
NB.- (1) Dates in yyyymmdd format can be held as a vector and not a matrix.  
NB.-     This can have some advantages.
NB.-     Can also help with dates in Excel 
NB.- 
NB.- Define:  1 & todate 
NB.-          1 & todayno  
NB.- to work with date format yyyymmdd
NB.-<hr>


NB. =========================================================
NB.*valdate_yyyymmdd v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> valdate from dates.ijs (stdlib)
NB.- Validate that a date is in YYYYMMDD format
NB.- Returns 1 if date valid, 0 for invalid date.
NB.- Based on valdate in dates.ijs (stdlib)
NB.-syntax:
NB.+valdate_yyyymmdd(D)
NB.+D = dates in YYYYMMDD format   
NB.-example:
NB.+  valdate_yyyymmdd 20200131 20200132
NB.+1 0
NB.-
NB.+  valdate_yyyymmdd 20190228 20190229 20200229
NB.+1 0 1
NB. ---------------------------------------------------------
valdate_yyyymmdd =: valdate @ (0 100 100 & #:)


NB. =========================================================
NB.*todate1 m -
NB.- <b>Form:</b> explicit-
NB.- <b>Depend:</b> todate from dates.ijs (stdlib)
NB.- Convert a day number to a date with format: yyyymmdd.
NB.- Similiar to todate.
NB.-syntax:
NB.+todate1(N)
NB.+N = day number
NB.-example:
NB.+   todate1 79000 
NB.+20160418
NB.-
NB.+   todate 79000 
NB.+2016 4 18
NB.-
NB.+   todate1 0
NB.+18000101
NB. ---------------------------------------------------------
todate1 =: 1&todate


NB. =========================================================
NB.*todayno1 m -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno from dates.ijs (stdlib)
NB.- Convert date to a day number.
NB.- Similiar to todayno.
NB.syntax:
NB.+todayno1(D)
NB.+D = date in numeric format yyyymmdd
NB.-example:
NB.+   todayno1 20170101
NB.+79258
NB.+   todayno 2017 01 01
NB.+79258
NB.+   todayno1 18000101
NB.+0
NB. ---------------------------------------------------------
todayno1 =: 1&todayno


NB. =========================================================
NB.*index_period d -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> nil
NB.- Calculate the index of the period of the occurence of a date
NB.- in a sequence of dates defining the periods.
NB.- The period is closed on the right side (a < z <= b).
NB.- Dates to be converted to format: yyyymmdd
NB.-syntax:
NB.+(P)index_period(D)
NB.+P = dates setting out the periods
NB.+    dates must be in ascending order
NB.+    date format: yyyymmdd
NB.+D = dates to be grouped into the periods
NB.+    date format: yyyymmdd 
NB.-example:
NB.+   (20190630 20200630)index_period(20190630 20200630 20210630)
NB.+0 1 2
NB.-
NB.+   (20190630 20200630)index_period(20200531 20200630 20200701)
NB.+1 1 2
NB.-
NB.+   (20150630 20160630 20170630)index_period(20170101) 
NB.+2
NB.-
NB.+   (20150630 20160630 20170630)index_period(20150531 20150630 20170101 20170630 20170701) 
NB.+ 0 0 2 2 3
NB.-
NB.+   (20150630 20160630 20170630)index_period(20150630 20150701) 
NB.+0 1
NB. ---------------------------------------------------------
index_period =: I. 


NB. =========================================================
NB.*periods_yr d - 
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> nil
NB.- Yearly period dates
NB.- <b>Note:</b>
NB.- February start date 29/2 and 28/2 will result in invalid dates .
NB.- Need to modify definition if end of February dates are required.
NB.- 29/2/and 28/2  
NB.-syntax:
NB.+(D)periods_yr(N)
NB.+D = start date format YYYMMDD
NB.+N = Number of yearly periods
NB.-example:
NB.+   19801231 periods_yr 0
NB.+19801231
NB.-
NB.+   19801231 periods_yr 1
NB.+19801231 19811231
NB.-
NB.+  20200630 periods_yr 4
NB.+20200630 20210630 20220630 20230630 20240630
NB.-
NB.+  valdate_yyyymmdd 20200229 periods_yr 6
NB.+1 0 0 0 1 0 0
NB. ---------------------------------------------------------
periods_yr =: [ + 10000 * [: (i.) 1 + ]
NB. ---------------------------------------------------------
Note 'T periods_yr'
periods_yr =. 13 : 'x+10000* i. 1 + y'
)


NB. =========================================================
NB.*periods_hy d -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Half yearly periods.
NB.- <b>Note:</b>
NB.- Leap year date 29/2 not valid as invalid dates result. 
NB.-syntax:
NB.+(D,D1)periods_yr(N)
NB.+D = start date for first half year format YYYMMDD
NB.+D1 = end date for firt half year format YYYYMMDD 
NB.+N = Number of half yearly periods
NB.-example:
NB.+  19800630 19801231 periods_hy 0
NB.+19800630
NB.-
NB.+  19800630 19801231 periods_hy 1
NB.+19800630 19801231
NB.-
NB.+   19801231 19800630 periods_hy 5
NB.+19800630 19801231 19810630 19811231 19820630 19821231
NB.-
NB.+  valdate_yyyymmdd 20200229 20200731 periods_hy 10
NB.+1 1 0 1 0 1 0 1 1 1 0
NB.-
NB.+   valdate_yyyymmdd 20200228 20200731 periods_hy 10
NB.+1 1 1 1 1 1 1 1 1 1 1
NB. ---------------------------------------------------------
periods_hy =: 4 : 0
R0 =. (0{x) + 10000 * i. 1+y
R1 =. (1{x) + 10000 * i. 1+y
(y+1){. /:~ R0,R1
)


NB. =========================================================
NB.*periods_qrt d - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Quarterly period dates.
NB.- <b>Note:</b>
NB.- Leap year date 29/2 not valid as invalid dates result.
NB.-syntax:
NB.+(D,D1,D2,D3)periods_qrt(N)
NB.+D,D1,D2,D3 = first four quarterly dates format YYYYMMDD
NB.+N = number of quarterly periods
NB.-example:
NB.+  (19800331 19800630 19800930 19801231)periods_qrt(0)
NB.+19800630
NB.-
NB.+ (19800331 19800630 19800930 19801231)periods_qrt(2)
NB.+19800630 19800930 19801231
NB.-
NB.+  ,.(19800331 19800630 19800930 19801231)periods_qrt 8
NB.+19800630
NB.+19800930
NB.+19801231
NB.+19810630
NB.+19810930
NB.+19811231
NB.+19820630
NB.+19820930
NB.+19821231
NB. ---------------------------------------------------------
periods_qrt =: 4 : 0
R0  =. (0{x) + 10000 * i. 1=y
R1  =. (1{x) + 10000 * i. 1+y
R2  =. (2{x) + 10000 * i. 1+y
R3  =. (3{x) + 10000 * i. 1+y
(y+1){./:~ R0,R1,R2,R3
)


NB. =========================================================
NB.*month_days m - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todate,todayno from dates.ijs (stdlib) 
NB.-      valdate_yyyymmdd from daterperiod.ijs
NB.- Vector of dates in a month as YYYYMMDD 
NB.-syntax:
NB.+ month_days(Y,M)
NB.+Y,M = Year,Month eg: 2009 12
NB.-example: 
NB.+   ,.month_days 2020 2
NB.+20200201 20200202 20200203  ... 20200227 20200228 20200229
NB. ---------------------------------------------------------
month_days =: 3 : 0
'YYYY MM' =. y
ST =. (1 todate todayno YYYY,MM,1) + i. 31
(valdate_yyyymmdd ST) # ST
)


NB. =========================================================
NB.*periods_monthly d - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todate,todayno from dates.ijs (stdlib) 
NB.-     valdate_yyyymmdd from daterperiod.ijs
NB.- Set monthly dates for a specific day of the month.
NB.- Treatment of 29, 30 and 31: 
NB.- Treated as End of MONTH if date exceeds End of Month.
NB.-syntax:
NB.+ (D)periods_monthly(N)
NB.+D = start date - format yyymmdd
NB.+N = number of monthly periods
NB.-example:
NB.+  (20090132)periods_monthly(4)
NB.+*** Invalid Start Date ***
NB.-
NB.+  (20200131)periods_monthly(0)
NB.+20200131
NB.-
NB.+  ,.(20200131)periods_monthly(13)
NB.+20200131
NB.+20200229
NB.+20200331
NB.+20200430
NB.+20200531
NB.+20200630
NB.+20200731
NB.+20200831
NB.+20200930
NB.+20201031
NB.+20201130
NB.+20201231
NB.+20210131
NB.+20210228
NB. ---------------------------------------------------------
periods_monthly =: 4 : 0
if. 0 = valdate_yyyymmdd x do. '*** Invalid Start Date ***' return. end.
max =. >./
'YYYY MM DD' =.  todate 1 todayno x
YYYY_MM =. (0 12#: (0 12 #. YYYY,(MM-1)) + i. 1+y) +"1 [0 1
M1 =. month_days"1  YYYY_MM
M2 =. (DD-1) {"1 M1
SEL =. 0 = M2
END_MM =. (max"1 M1) * SEL
M2 + END_MM
)


NB. =========================================================
NB.*periods_end_monthly d -
NB.- <b>Form</b> explicit 
NB.- <b>Depend:</b> nil
NB.- Set end of monthly periods.
NB.-syntax:
NB.+(Y,M)periods_end_monthly(N)
NB.+Y,M = year and month to start ie: YYYY,MM
NB.+N = Number of monthly periods
NB.-example:
NB.+  (2019 12)periods_end_monthly(0)
NB.+20191231
NB.-
NB.+  (2019 12)periods_end_monthly(4)
NB.+20191231 20200131 20200229 20200331 20200430 
NB.-
NB.+  (2018 12)periods_end_monthly(4)
NB.+20181231 20190131 20190228 20190331 20190430
NB. ---------------------------------------------------------
periods_end_monthly =: 4 : 0
'YYYY MM' =. x
max =. >./
YYYY_MM =. (0 12#: (0 12 #. YYYY,(MM-1)) + i. 1+y) +"1 [0 1
M1 =. month_days"1  YYYY_MM
(max"1 M1)
)







