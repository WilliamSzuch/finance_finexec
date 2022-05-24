NB. =========================================================
NB.%date_tools.ijs - Tools for handling dates
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.html">Date Time | </a>
NB.-<hr>
NB.- Script: ~addons/finexec/datetime/date_tools.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions loaded to locale: base 
NB.- Status: done: review
NB.- <a href="../date_tools.ijs" target="_blank">Script source: date_tools.ijs</a>
NB.-<hr>
NB.- This script has definitions that are useful for handling dates.
NB.-   checking dates
NB.-   age
NB.-   system
NB.-   date conversions
NB.- The J Calendar starts from 1800 1 1 (Wed):  day number = 0 eg todate 0 gives 1800 1 1
NB.- also, 1 todate 0 gives 18000101
NB.- Use is made of the J utility: dates.ijs that is loaded 
NB.- into 'z' as part of the Standard Library.
NB.- 
NB.- Monday is the first day of the week as per: ISO 8601.
NB.- Index: Monday = 0, Sunday = 6 (Days = 0 1 2 3 4 5 6)
NB.-   calendar 2009
NB.- 1 calendar 2009   NB. < ISO 8601 >
NB.- 
NB.- In the ISO 8601 calendar a week starts on monday.
NB.- 1 YEAR = 365.2425 days
NB.- 
NB.- Date format as a number: <yyyy mm dd> or <yyyymmdd>
NB.- 
NB.- Use of 'calendar' is slow - could consider doing something faster.
NB.-
NB.- The preferred formats for a date are: yyyy mm dd eg. 1997 6 30 etc.
NB.- Alternative format: yyyymmdd eg 19970630 has advantages.
NB.-
NB.- Use 'getdate' for conversion of character dates to format: yyyy mm dd.
NB.-
NB.- An Excel date is a number displayed with a date format.
NB.- It starts from 1900 1 1 with a well known leap year bug.
NB.- 
NB.- To convert from J day numbers (result of verb 'todayno' in dates.ijs),to 
NB.- Excel day number subtract 36522 from the J day number.
NB.-
NB.- Some useful date conversion verbs are also contained in the script.
NB.- 
NB.- Format date: yyyymmdd
NB.- (1) Dates in yyyymmdd format can be held as a vector and not a matrix.  
NB.-     This can have some advantages.
NB.-     Can also help with dates in EXCEL 
NB.- 
NB.- Consider:  1&todate 
NB.-            1&todayno  
NB.- to work with date format yyyymmdd
NB.-<hr> 
NB.- Gregorian Calendar - Started by Pope Gregory Vlll in 1582.
NB.-
NB.- Leap Year: 
NB.- Every year that is exactly divisible by four is a leap year,
NB.- except for years that are exactly divisible by 100;
NB.- The centurial years that are exactly divisible by 400 are still leap years.
NB.- For example, the years 1800,1900,2100,2200 are not leap years;
NB.- The year 2000 ia a leap year.
NB.-<hr>


NB. =========================================================
NB. Useful Date Calendar Nouns
NB.*MONTHS n Months mmm
NB.*MONTHSA n Months full name
NB.*DAYS n Days as dd
NB.*DAYSA n Days full name
NB.*DAYSB n Days as ddd
MONTHS  =: ;: 'Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec'
MONTHSA =: ;: 'January Febuary March April May June July August September Octber November December'
DAYS    =: ;: 'Mo Tu We Th Fr Sa Su'
DAYSA   =: :: 'Monday Tuesday Wednesday Thursday Friday Saturday Sunday'
DAYSB   =: :: 'Mon Tue Wed Thu Fri Sat Sun'


NB. =========================================================
NB.*valdate_yyyymmdd v - 
NB.- <b>Form</b> explicit
NB.- Validate that a date is in YYYYMMDD format
NB.- Returns 1 if date valid.
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
NB.*day_of_week v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno from dates.ijs (stdlib)
NB.- Day of the week.
NB.-syntax:
NB.+day_of_week(D)
NB.+D = date: yyyy mm dd
NB.-example:
NB.+  day_of_week(1800 1 1)
NB.+Wed
NB.+  day_of_week(2020 8 7)
NB.+Fri
NB. ---------------------------------------------------------
day_of_week =: 3 : 0
DAYS =. 'Wed';'Thr';'Fri';'Sat';'Sun';'Mon';'Tue'
 >(7|todayno y){DAYS
)


NB. =========================================================
NB.*day_of_weekno v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno from dates.ijs (stdlib)
NB.- Number of day in the week, start with Monday = 0
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno from dates.ijs (stdlib)
NB.- Sunday = 6 (Days = 0 1 2 3 4 5 6)
NB.- Calendar starts from 1800 1 1
NB.-symtax:
NB.+ day_of_weekno(D)
NB.+D = date: yyyy mm dd
NB.-example:
NB.+  day_of_weekno 1996 6 30
NB.+6
NB.+  day_of_weekno 2020 8 10
NB.+0
NB. ---------------------------------------------------------
day_of_weekno =: 3 : 0
DAYS =. 2 3 4 5 6 0 1  
>(7|todayno y){DAYS
)


NB. =========================================================
NB.*set_weekly_dates v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno from dates.ijs (stdlib)
NB.- Set dates at weekly intervals.
NB.- Includes the start date.
NB.-syntax:
NB.+(D)set_weekly_dates(N)
NB.+D = start date: yyyy mm dd
NB.+N = number of weekly intervals
NB.-example:
NB.+  1998 9 22 set_weekly_dates 3
NB.+1998  9 22
NB.+1998  9 29
NB.+1998 10  6
NB.+1998 10 13
NB. ---------------------------------------------------------
set_weekly_dates =: 4 : 0
X0 =. x   
Y0 =. 1 + y
todate (todayno X0) + 7* i. Y0
)


NB. =========================================================
NB.*days_in_month v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno from dates.ijs (stdlib)
NB.- Days in month.
NB.-syntax:
NB.+days_in_month(YYYY,MM)
NB.+ YYYY,MM = year and month
NB.-example:
NB.+  days_in_month 1996 6
NB.+30
NB.-
NB.+ days_in_month 2020 2
NB.+29
NB. ---------------------------------------------------------
days_in_month =: 3 : 0
#"., 2 }. 8 21 $ ,> calendar y
)


NB. =========================================================
NB.*end_of_month v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> days_in_month
NB.- Sets future end of month dates.
NB.- Inculdes first date.
NB.-syntax:
NB.+(YYYY,MM)end_of_month(N)
NB.+YYYY,MM = start month 
NB.+N = number of monthly intervals
NB.-example:
NB.+  (1990 11)end_of_month 4
NB.+1990 11 30
NB.+1991 12 31
NB.+1991  1 31
NB.+1991  2 28
NB.-
NB.+  (2020 1)end_of_month 4
NB.+2020 1 31
NB.+2020 2 29
NB.+2020 3 31
NB.+2020 4 30
NB. ---------------------------------------------------------
end_of_month =: 4 : 0 
'YYYY MM' =. x
YY  =. 0{"1 [0 12 #: (12 * YYYY) + MM +i.y+1
M_0 =. (12#: MM +i.y+1)
M_12 =. (12*0=M_0)+M_0
DD =. days_in_month"1 YY,.M_12
YY,.M_12,.DD
)


NB. =========================================================
NB.*next_month v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> days_in_month
NB.- Gives future or past month with same day or nearest if at end of month.
NB.-syntax:
NB.+(D)next_month(N)
NB.+D = start date : yyyy mm dd
NB.+N = Number of months forward or back
NB.-example:
NB.+  1996 6 30 next_month 2
NB.+1996 8 30
NB.-
NB.+  2020 3 30 next_month _1
NB.+2020 2 29
NB. ---------------------------------------------------------
next_month =: 4 : 0 
'YYYY MM DD' =. x
'YYYYY MMM'  =. 0 12 #: (12 * YYYY)+ (MM-1) + y
MMM =. 1 + MMM 
DDD =. DD <. days_in_month (YYYYY, MMM)
YYYYY, MMM, DDD
)


NB. =========================================================
NB.*set_monthly_dates v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> next_month
NB.- Set dates at monthly intervals on fixed day, From 1800 1 1.
NB.- Includes first date.
NB.- Watch out for end of months ie. 28,29,30 & 31
NB.-syntax:
NB.+ (D)set_monthly_dates(N) 
NB.+D = start date: yyyy mm dd 
NB.+N = number of months forward
NB.-example:
NB.+  2020 8 11 set_monthly_dates 3
NB.+2020  8 11
NB.+2020  9 11
NB.+2020 10 11
NB.-
NB.+  2020 1 31 set_monthly_dates 12
NB.+2020  1 31
NB.+2020  2 29
NB.+2020  3 31
NB.+2020  4 30
NB.+2020  5 31
NB.+2020  6 30
NB.+2020  7 31
NB.+2020  8 31
NB.+2020  9 30
NB.+2020 10 31
NB.+2020 11 30
NB.+2020 12 31
NB. ---------------------------------------------------------
set_monthly_dates =: 4 : 0
> x & next_month each i. y
)


NB. =========================================================
NB. System info
NB. =========================================================


NB. =========================================================
NB.*time_sys v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Gives current time on system - HH MM SS(with fractions).
NB.-syntax:
NB.+ time_sys ''
NB.-example:
NB.+  time_sys ''
NB. ---------------------------------------------------------
time_sys =: 3&}. @ (6!:0)


NB. =========================================================
NB.*date_sys v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Gives current date on system - YYYY MM DD.
NB.-synyax:
NB.+  date_sys ''
NB.-example:
NB.+  date_sys ''
date_sys =: 3&{. @ (6!:0)


NB. =========================================================
NB.*date_time_sys v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Gives current date and time on the system - yyyy MM DD HH MM SS.
NB.-syntax:
NB.+  date_time_sys ''
NB.-example:
NB.+  date_time_sys ''
NB. ---------------------------------------------------------
date_time_sys =: 6!:0


NB. =========================================================
NB. Ages, and dates of dirth 
NB. =========================================================


NB. =========================================================
NB.*last_bd v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno, todate
NB.- Gives date of last bithday at x for date of birth y
NB. REVIEWED: 2/7/2003
NB.-syntax:
NB.+(D)last_bd(B)
NB.+D = date of calculation: yyyy mm dd
NB.+B = date of birth: yyyy mm dd
NB. If birthay on same date as D then gives date as at D 
NB. Also be careful about  B > D just investigate. 
NB.-exapmle: 
NB.+  1997 6 30 last_bd 1954 5 12
NB.+1997 5 12
NB.-
NB.+  1997 5 12 last_bd 1954 5 12
NB.+1997 5 12
NB. ---------------------------------------------------------
last_bd =: 4 : 0
'A B C' =. x
'D E F' =. y
DX =. todayno x
D1 =. todayno A,E,F
D2 =. todayno (A-1),E,F
todate (D1>DX){(D1,D2)
)


NB. =========================================================
NB.*next_bd v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno, todate
NB.- Gives date of next bithday at x for date of birth y
NB.-syntax:
NB.+(D)next_bd(B)
NB.+D = date of calculation: yyyy mm dd
NB.+B = date of birth: yyyy mm dd
NB. If birthay on same date as D then gives date as at D 
NB. Also be careful about  B > D just investigate. 
NB.-example:
NB.+ 1997 6 30 next_bd 1954 5 12
NB.+1998 5 12
NB. ---------------------------------------------------------
next_bd =: 4 : 0
'A B C' =. x
'D E F' =. y
DX =. todayno x
D1 =. todayno A,E,F
D2 =. todayno (A+1),E,F
todate (D1<DX){(D1,D2)
)


NB. =========================================================
NB.*age_yydd v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno
NB.- Produces age of B at D in yy,dd (years & days).
NB.-syntax:
NB.+ (D)age_yydd(B)
NB.+D = date of calculation: yyyy mm dd
NB.+B = date of birth: yyyy mm dd
NB. Watch for cases when B > D
NB.-example:
NB.+  1997 6 30 age_yydd 1954 5 12
NB.+43 49
NB.-
NB.+  2002 11 9 age_yydd 1948 11 10
NB.+53 364
NB. ---------------------------------------------------------
age_yydd =: 4 : 0
D =. x last_bd y
DD =. (todayno x) - (todayno D)
YYYY =. (0{D) - 0{y
YYYY, DD
)


NB. =========================================================
NB.*age_yrs v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> tsdiff
NB.- Same as 'tsdiff' in dates.ijs
NB.- Produces age of y at x in years(fractions).
NB.- Years converted to fraction by using 'tsdiff'
NB.- Based on months and days.
NB.- Watch for cases when B > D
NB.-syntax:
NB.+ (D)age_yrs(B)
NB.+D = date of calculation: yyyy mm dd
NB.+B = date of birth: yyyy mm dd
NB.-example:
NB.+  1997 6 30 age_yrs 1954 5 12
NB.+43.1326
NB.-
NB.+  2002 11 9 age_yrs 1948 11 10
NB.+53.9961
NB. ---------------------------------------------------------
age_yrs =: tsdiff 



NB. =========================================================
NB.*dur_yrs v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> tsdiff
NB.- Duration years & fractions from x to y
NB.- Based on months and days.
NB.syntax:
NB.+(T)dur_yrs(F)
NB.+T = date to: yyyy mm dd  
NB.+F = date from: yyyy mm dd
NB.-syntax:
NB.+  1994 11 1 dur_yrs 2011 9 2
NB.+_16.8372
NB.-
NB.+ 1994 11 1 dur_yrs 1990 9 2
NB.+4.16279
NB. ---------------------------------------------------------
dur_yrs =: tsdiff 


NB. =========================================================
NB.*age_nearestbd v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> tsdiff
NB.- Age nearest birthday.
NB.- If birthay on D then gives age at D
NB.- Watch for B > D
NB.- Based on the tsdiff using 365 days.
NB.-syntax:
NB.+(D)age_nearestbd(B)
NB.+D = calculation date: yyyy mm dd
NB.+B = birth date: yyyy mm dd
NB.-example:
NB.+  2002 10 9 age_nearestbd 1948 11 10
NB.+54
NB. ---------------------------------------------------------
age_nearestbd =: 4 : 0
<. 0.5 + x tsdiff y
)


NB. =========================================================
NB.*age_lastbd v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> last_bd
NB.- Age last birthday
NB.- If birthay on D then gives age at D
NB.-syntax:
NB.+(D)age_lastbd(B) y
NB.+D = date of calculation: yyyy mm dd
NB.+B = date of birth: yyyy mm dd
NB.-example:
NB.+ 1997 6 30 age_lastbd 1948 11 10
NB.+48
NB. ---------------------------------------------------------
age_lastbd =: 4 : 0
D =. x last_bd y
(0{D) - (0{y)
)


NB. =========================================================
NB.*age_nextbd v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> next_bd
NB.- Age next birthday
NB.- If birthay on D then gives age at D
NB.-syntax:
NB.+(D)age_nextbd(B)
NB.+D = date of calculation: yyyy mm dd
NB.+B = date of birth: yyyy mm dd
NB.+example: 
NB.+  1997 6 30 age_nextbd 1948 11 10
NB.+49
NB. ---------------------------------------------------------
age_nextbd =: 4 : 0
d =. x next_bd y
(0{d) - (0{y)
)


NB. =========================================================
NB.*tsdiff_a v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- The differences between pairs of dates is expressed as: - yyyy mm dd.
NB.- Based on tsdiff
NB.- start and end dates are vectors or matrices in form yyyy mm dd 
NB.- end dates should be later than begin dates
NB.- Method is to subtract dates on a calendar basis to determine
NB.- Result is integer number of years, months and days (yy,mm,dd).
NB.- Note the result when D<F
NB.-syntax:
NB.+(T)tsdiff_a(F)
NB.+T = to date: yyyy mmm dd
NB.+F = from date: yyyy mm dd
NB.-example:
NB.+  1998 10 1 tsdiff_a 1988 5 23
NB.+10 4 9
NB.-
NB.+  1998 10 1 tsdiff_a 1998 10 3
NB.+_1 11 29
NB. ---------------------------------------------------------
tsdiff_a=: 4 : 0
r=. -/"2 d=. _6 (_3&([\)) \ ,x,"1 y
if. #i=. i#i.#i=. 0 > 2{"1 r do.
  j=. (-/0=4 100 400 |/ (<i;1;0){d)* 2=m=. (<i;1;1){d
  j=. _1,.j + m{0 31 28 31 30 31 30 31 31 30 31 30 31
  n=. <i;1 2
  r=. (j + n{r) n } r
end.
NB. r +/ . % 1 12 365
'yz mz dd' =. ,r       NB. Convert to vector
NB. Adjustment to r to take into account negative months that occur in r.
m1 =. 12|mz           NB. Adjusting for negative months
y1 =. yz + (*mz) <. 0 
y1,m1,dd
)


NB. =========================================================
NB.*tsdiff_b v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> tsrep
NB.- The differences between pairs of dates is expressed
NB.- in 1000's of a second.
NB.- Based on tsrep
NB.-syntax:
NB.+(S)tsdiff_a(F)
NB.+S = start date and time: yyyy mm dd hh mm ss:eg: 2001 1 1 0 0 0
NB.+F = finish date and time: yyyy mm dd hh mm ss eg. 2001 1 1 0 1 0
NB.-example:
NB.+  2001 1 1 0 0 0 tsdiff_b 2001 1 1 0 1 0
NB.+60000
NB.-
NB.+  2001 1 1 0 0 0 tsdiff_b 2002 1 1 0 0 0
NB.+31536000000
NB. ---------------------------------------------------------
tsdiff_b=: 4 : 0
R =. (tsrep y) - tsrep x
)


NB. =========================================================
NB.*tsdiff_c v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> tsrep
NB.- The differences between pairs of dates is expressed as: - yyyy mm dd hh mm ss.
NB.- Based on tsrep
NB.-syntax:
NB.+(S)tsdiff_a(F)
NB.+S = start date and time: yyyy mm dd hh mm ss eg: 2001 1 1 0 0 0>
NB.+F = finish date and time: yyyy mm dd hh mm ss eg. 2002 1 1 0 1 0
NB.-example:
NB.+  2001 1 1 0 0 0 tsdiff_c 2002 1 1 0 1 0
NB.+1 0 0 0 1 0
NB. ---------------------------------------------------------
tsdiff_c =: 4 : 0
DATE_0 =. 1 tsrep 0
R1 =. 1 tsrep (tsrep y) - tsrep x
R2 =. R1 - DATE_0
)


NB. =========================================================
NB. Some date conversion definitions
NB. =========================================================


NB. =========================================================
NB.*date_convert1 v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> chopstring
NB.- Verb to convert text date of the form 'yy-mm-dd', yyyy mm dd etc.
NB.- with '-' as the separetar between parts of date to 'yyyy mm dd' format.
NB.-syntax:
NB.+([C])date_convert1(D)
NB.+[C] = Century eg. 1900 2000 etc: default = 1900
NB.+D = date as text: yy-mm-dd
NB.-example:  
NB.+  1900 date_convert1 '97-6-30'
NB.+1997 6 30
NB.-
NB.+  2000 date_convert1 '97-6-30'
NB.+2097 6 20
NB.-
NB.+ 2000 date_convert1'1-6-30'
NB.+2001 6 30
NB. ---------------------------------------------------------
date_convert1 =: 3 : 0
1900 date_convert1 y
: 
'YY MM DD' =. , ". > '-'& chopstring y 
(x + YY),MM, DD
)


NB.????

NB. =========================================================
NB.*date_convert2 v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> chopstring
NB.- Verb to convert text date of the form 'yyZmmZdd' to yyyy mm dd.
NB.- with 'Z' as the separetar between parts of date.
NB.-syntax:
NB.+(Z;C) FORM: x date_convert2 y 
NB.+Z;C = delimitor;century eg. (1900;Z) 
NB.+D = date as text: 'yyZmmZdd' Z = some delimiter
NB.-example:
NB.+  ('s';1900) date_convert2 '97s6s30'
NB.+1997 6 30
NB.-
NB.+  ('/';1900) date_convert2 '97/6/30'
NB.+1997 6 30
NB.-
NB.+  ('s';2000)date_convert2 '97s6s30'
NB.+2097 6 30
NB. ---------------------------------------------------------
date_convert2 =: 4 : 0
'DELIN CENT' =. x
'YY MM DD' =. , ". > DELIN chopstring y
(YY + CENT), MM, DD
)


NB. =========================================================
NB.*date_convert3 v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Convert from yyyy mm dd to yyyymmdd.
NB.-syntax:
NB.+  date_convert3(D)
NB.+D = date: yyyy mm dd
NB.-example:
NB.+ date_convert3 1994 7 1
NB.+19940701
NB. ---------------------------------------------------------
date_convert3 =: [: +/(10000 100 1)&* 


NB. =========================================================
NB.*date_convert4 v -
NB.- Convert from yyyymmdd to yyyy mm dd.
NB. REVIEWED: 2/7/2003
NB. FORM: date_convert y
NB.       y = <yyyymmdd>
NB. EXAMPLE:  date_convert4 19940701
NB. ---------------------------------------------------------
date_convert4 =: (10000 100 100)&#:


NB. =========================================================
NB.*date_convert5 v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> charsub, getdate
NB.- Convert date text 'dd.mm.yyyy' to yyyy mm dd.
NB.-syntax:
NB.+  date_convert5(D)
NB.+D = text text in format: 'dd.mm.yyyy'
NB.-example:
NB.+  date_convert5 '1.1.2000'
NB.+2000 1 1
NB. ---------------------------------------------------------
date_convert5 =: 3 : 0
D1 =. '. ' charsub y
D2 =. getdate D1
)


NB. =========================================================
NB.*date_convert6 v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> charsub
NB.- Convert date text 'dd.mm.yy' -> yyyy mm dd.
NB.- Note the treatment of the year in yy format.
NB.-syntax:
NB.+([C]) date_convert6(D)
NB.+[C] = Century eg. 1900 2000 etc: default = 1900
NB.+D = date in text format 'dd.mm.yy'
NB.-example:
NB.+  1900 date_convert6 '1.1.89' 
NB.+1989 1 1
NB.-
NB.+  2000 date_convert6 '1.1.00'
NB.+2000 1 1 
NB. ---------------------------------------------------------
date_convert6 =: 3 : 0
1900 date_convert6 y 
:
'DD MM YY' =. ". '. ' charsub y
YEAR =. x + YY
YEAR, MM, DD
)


NB. =========================================================
NB.*days_diff v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> todayno
NB.- By: R.E. Ross
NB.- Number of days between to dates.
NB.-syntax:
NB.+(S)days_diff(E)
NB.+S = start date: yyyy mm dd
NB.+E = end date: yyyy mm dd
NB.-example:
NB.+ 1948 11 10 days_diff 2003 7 8 
NB.+19963
NB.-
NB.+  >1948 11 10 & days_diff each 2003 7 8;2004 1 1;2005 2 1 
NB.+19963 20140 20537
NB. ---------------------------------------------------------
days_diff =: 4 : '(todayno y) - (todayno x)'


NB. =========================================================
NB.*wks v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> weekday
NB.- Gives number of weeks in year.
NB.- In the ISO calendar a week starts on Monday
NB.-syntax:
NB.+([F])wks(Y)
NB.+[F] = first day of week:
NB.+      0 - first day of week is Sunday (default)
NB.+Y = year
NB.-example:
NB.+  wks 2000 +i.10
NB.+52 52 52 53 52 52 52 52 53 52
NB.-
NB.+  4 wks 2000 +i.10
NB.+52 52 52 52 52 52 52 52 52 52
NB. ---------------------------------------------------------
wks=: 3 : 0
0 wks y
:
52+ +./"1(x+3)=weekday(1 1,:12 31),"0 1/~ y
)



NB.????

NB. =========================================================
NB.*week v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> weekday,wks,todauno
NB.- By: R.E. Ross
NB.- Gives the year and week of a date.
NB.- A week belongs to a year if and only if 4 days of the 
NB.- week belong to that year.
NB.- Week is based on a Mathematical procedure in
NB.- http://www.phys.uu.nl/~vgent/calendar/isocalendar.htm
NB.- In the ISO calendar a week starts on Monday
NB.-syntax:
NB.+([x])week(D) 
NB.+[F]= first day of week:
NB.+     0 - first day of week is Sunday (default)
NB.+D = date: yyyy mm dd
NB.-example:
NB.+   1 week 2004 1 1
NB.+ 2004 1
NB.-
NB.+   week 2004 1 1
NB.+2003 53
NB. ---------------------------------------------------------
week=: 3 : 0
0 week y
:
yr=.{.y
sd=.x ((i.~weekday){]) ((<:yr),.12,.29+i.3),yr,.1,.1+i.4
wk=. >.7%~>: y -&todayno sd
if. wk >x wks yr do. (>:yr),1 elseif. wk=0 do.(,x&wks)<:yr elseif. do.
yr,wk end.
)


NB. ===========================================================
NB.*wy v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> wks53
NB.- By: Eugene McDonnell
NB.- A function giving the number of weeks in an ISO year.
NB.-syntax:
NB.+wy(Y)
NB.+Y = YEAR
NB.-example:
NB.+  wy 2000 
NB.+52
NB.-
NB.+  >wy each 2000 + i. 10
NB.+52 52 52 52 53 52 52 52 52 52
NB. ---------------------------------------------------------
wy =: 13 : '52+wks53 y'


NB. =========================================================
NB.*wks53 v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- A function for determining whether an ISO year has 52 or 53 weeks.
NB.- 1 if year has 53 ISO weeks, 0 otherwise
NB.-syntax:
NB.+wks53(Y)
NB.+Y = YEAR
NB.-example:
NB.+  >wks53 each 2000 2004
NB.+0 1
NB. ---------------------------------------------------------
wks53 =: 13 : '(4=yb y)+.(3=yb y)*.ly y' 


NB. =========================================================
NB.*leapyr v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Result: 1 if year is a leap year, 0 otherwise.
NB.-syntax:
NB.+leapyr(Y) y
NB.+Y = YEAR
NB.-example:
NB.+  >leapyr each 1800 2000 2004
NB.+0 1 1
NB. ---------------------------------------------------------
leapyr =: 13 : '~:/0=4 100 400|y'              


NB. =========================================================
NB.*yearb v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Gives the index of the weekday that the year begins.
NB.- 0 = Sunday, 1 = Monday, 2 = Tuesday etc
NB. ISO 8601 calendar: week starts on a Monday 
NB.-syntax:
NB.+yearb(Y)
NB.+Y = year
NB.-example:
NB.+  yearb 2005
NB.+5
NB.-
NB.+ >yearb each 2020 +i. 10
NB.+3 5 6 0 1 3 4 5 6 
NB. ---------------------------------------------------------
yearb =: 13 : '7|y+-/<.(<:y)%4 100 400'      


NB. =========================================================
NB.*wks53y v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> learyr,yearb
NB.- A definition for determining whether an ISO year has 52 or 53 weeks.
NB.- This is faster then wks53.
NB. ISO 8601 calendar: week starts on a Monday
NB.-syntax:
NB.+  wks53y(Y)
NB.+Y = year
NB.-example:
NB.+  wks53y 2000
NB.+0
NB.-
NB.+  >wks53y each 2000 +i. 20
NB.+0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0
NB. ---------------------------------------------------------
wks53y =: 13 : '+./(4 3 = yearb y)*.(1,leapyr y)'"0
 

NB. =========================================================
NB.*days_in_year v - 
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> days_diff
NB.- Shows number of days in a year.
NB.-syntax: 
NB.+  days_in_year(Y)
NB.+y = year
NB.-example:
NB.+  days_in_year 1800 
NB.+365
NB.-
NB.+  >days_in_year each 1800 2000 2004 2005 2008 2009 2020
NB.+365 366 366 365 366 365 366
NB. ---------------------------------------------------------
days_in_year =: 3 : 0
1+(y,1,1) days_diff (y,12,31)
)


NB. =========================================================
NB. Testing for dates
NB. =========================================================


NB. =========================================================
NB.*date_test v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> valdate
NB.- Test if a boxed date is valid. 
NB.- Test for dates in yyyy mm dd format
NB.-syntax:
NB.+date_test(D) y
NB.+D = boxed date
NB.-example:
NB.+  date_test < 2000 1 1
NB.+1
NB.-
NB.+  date_test < 20200811
NB.+0
NB.+  date_test < '2000/1/1'
NB.+0
NB. ---------------------------------------------------------
date_test =: 3 : 0
try. R =. valdate > y catch. R =. 0 end.
RES =. R
)


NB. =========================================================
NB.*dates_test v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> date_test
NB.- Test if a boxed list of dates is valid and
NB.- the result is an index of invalid dates.
NB.- Test for dates in yyyy mm dd format.
NB.-syntax:
NB.+dates_test(D) y
NB.+D = boxed dates
NB.-example: 
NB.+  dates_test < 2000 1 1
NB.+
NB.-
NB.+   dates_test <20200811
NB.+0
NB.-
NB.+  dates_test <20200811
NB.+  dates_test < '2000/1/1'
NB.+0
NB.-
NB.+  dates_test (10 # < 2000 1 1),(5 # < '2000/1/1'),(<'234'),(< 2005 1 1),(<20060101)
NB.+10 11 12 13 14 15 17
NB.-
NB.+  (dates_test { [)  (10 # < 2000 1 1),(5 # < '2000/1/1'),(<'234'),(< 2005 1 1),(<20060101)
NB.+┌────────┬────────┬────────┬────────┬────────┬───┬────────┐
NB.+│2000/1/1│2000/1/1│2000/1/1│2000/1/1│2000/1/1│234│20060101│
NB.+└────────┴────────┴────────┴────────┴────────┴───┴────────┘
NB. ---------------------------------------------------------
dates_test =: 3 : 0
RES =. (-. > date_test each y) # (i. # y)
)


NB. =========================================================
NB.*calendar_yr v -
NB.- <b>Form</b> explicit
NB.- <b>Depend:</b> nil
NB.- Formatted calendar for year [months]
NB.- Returns calendar for year, as a list of months
NB.- Based on 'calendar' in dates.ijs (stdlib) but shows YEAR
NB.- In the ISO 8601 calendar a week starts on Monday.
NB.-syntax:
NB.+([x]) calendar_yr(Y)
NB.+[x] = optional left argument and is the start day of week
NB.+    0=sunday (default)
NB.+    1=monday, 2 Tuesday ...
NB.+y = is one or more numbers: year, months
NB.+    If no months are given, it defaults to all months in year.
NB.-example:
NB.+  calendar_yr 2009 
NB.+  calendar_yr 2020 1 2 12
NB. ---------------------------------------------------------
calendar_yr=: 3 : 0
0 calendar_yr y
:
a=. ((j<100)*(-100&|){.6!:0'')+j=. {.y
b=. (a-x)+-/<.4 100 400%~<:a
r=. 28+3,(~:/0=4 100 400|a),10$5$3 2
r=. (-7|b+0,+/\}:r)|."0 1 r(]&:>:*"1>/)i.42
m=. (<:}.y),i.12*1=#y
h=. 'JanFebMarAprMayJunJulAugSepOctNovDec'
NB. ---------------------------------------------------------
h =. ,(12 3 $ h),"1 (": a) 
NB. ---------------------------------------------------------
NB. h=. ((x*3)|.' Su Mo Tu We Th Fr Sa'),:"1~_3(_12&{.)\h
h=. ((x*3)|.' Su Mo Tu We Th Fr Sa'),:"1~_7(_12&{.)\h
NB. ---------------------------------------------------------
<"2 m{h,"2[12 6 21 ($,) r{' ',3":1+i.31 1
)


