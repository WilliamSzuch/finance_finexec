NB. =========================================================
NB.%edatetime_tools.ijs - Tools for working with edatetime
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Date Time</a>
NB.-<hr>
NB.- Script: ~addons/finexec/datetime/edatetime_tools.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: Foreigns: 6!:14, 6!:15, 6!:16 and 6!:17
NB.- Definitions loaded to locale: base 
NB.- Status: dev: 
NB.- <a href="../edatetime_tools.ijs" target="_blank">Script source: edatetime.ijs</a>
NB.-<hr>
NB.- This script has definitions that are useful for handling edatetimes.
NB.- For more detailed information see: 
NB.- <href "https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m6" _blank>Foreigns 6!:</a>
NB.-note:
NB.- Leap Year: 
NB.- Every year that is exactly divisible by four is a leap year,
NB.- except for years that are exactly divisible by 100;
NB.- The centurial years that are exactly divisible by 400 are still leap years.
NB.- For example, the years 1800,1900,2100,2200 are not leap years;
NB.- The year 2000 is leap year.
NB.-
NB.- Nano second  = 1e_9
NB.- Milli second = 1e_3
NB.- 
NB.- edateimes are measured in nanoseconds from 1/1/2000. 
NB.-
NB.- edatetimes are in the range:
NB.- 1800-01-01 to 2200-12-31
NB.- If the edatetime is outside the range the result is the error:
NB.-  _9223372036854775808.
NB.-
NB.- digit time integer: YYYYMMDDhhmmss 
NB.- Expanded digit dateime: Year, Month, Day, Hours, Minutes, Seconds, nanoseconds
NB.-<hr>


NB. =========================================================
NB.*cDateTime m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:0
NB.- Current date time format: yyyy MM DD hh mm ss 
NB.- Seconds to 1/1000  
NB.-syntax:
NB.+  cDateTime '' 
NB. ---------------------------------------------------------
cDateTime =: 6!:0


NB. =========================================================
NB.*cDigitTime m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:0
NB.- Current digit time format as integer: YYYYMMDDhhmmss
NB.-syntax:
NB.+  cDigitTime '' 
NB. ---------------------------------------------------------
cDigitTime =: [: ". [: 6!:0 ]&'YYYYMMDDhhmmss'


NB. =========================================================
NB.*cNanoDateTime m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:0, 6!:14
NB.- Current nano date time
NB.+  cNanoDateTime ''
NB. ---------------------------------------------------------
cNanoDateTime =: 6!:14@:([: ". [: 6!:0 ]&'YYYYMMDDhhmmss')
NB. ---------------------------------------------------------
Note 'T cNanoDatetime'
cNanoDatetime =: (6!:14 @: cDigitTime ) f.
)


NB. =========================================================
NB.*cISO_8601DateTime m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:0, 6!:14,6!:16
NB.- Current ISO-8601 date time
NB.+  cISO_8601DateTime ''
NB. ---------------------------------------------------------
cISO_8601DateTime =: 6!:16@:(6!:14@:([: ". [: 6!:0 ]&'YYYYMMDDhhmmss'))
NB. ---------------------------------------------------------
Note 'T cISO_8601DateTime'
cISO_8601DateTime =: (6!:16 @: cNanoDateTime )f.
)


NB. =========================================================
NB.*ndt m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Convert ISO 8601 edatetime to nanoseconds
NB.- edatetime 'YYYY-MM-DDTHH:MM:SS'
NB.-syntax:
NB.+dtn0(D) 
NB.+D = ISO 8601 datetime 
NB.-example:
NB.+  ndt '2000'
NB.+0
NB.+
NB.+  ndt '2200'
NB.+6311433600000000000
NB.+
NB.+  ndt '2201'
NB.+_9223372036854775808   NB. Outside range
NB.+
NB.+ Further examples ISO 8601 formats to try:
NB.+  ndt '2000-01'
NB.+  ndt '2000-01-01'
NB.+  ndt '2000-01-01T'
NB.+  ndt '2000-01-01T00'
NB.+  ndt '2000-01-01T00:00'
NB.+  ndt '2000-01-01T00:00:00'
NB.+  ndt '2000-01-01T00:00:00.00'
NB. ---------------------------------------------------------
ndt =: 6!:17


NB. =========================================================
NB. Durarions in nano seconds
Second  =: ndt '2000-01-01T00:00:01' NB. 1 minute
Minute  =: 60 * Second               NB. 1 minute
Hour    =: 60 * Minute               NB. 1 hour
Day     =: 24 * Hour                 NB. 1 day 
Days28  =: 28 * Day                  NB. 28 days
Days29  =: 29 * Day                  NB. 29 days
Days30  =: 30 * Day                  NB. 30 days
Days31  =: 31 * Day                  NB. 31 days
Year365 =: 365 * Day                 NB. year 365 days
Year366 =: 366 * Day                 NB. year 366 days


NB. =========================================================
NB.*nddt m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:14
NB.- Convert digit time to nanoseconds
NB.-syntax:
NB.+ndft(D)
NB.+D = digit date time: YYYYMMDDhhmmss
NB.-example:
NB.+  nddt(20000101000000)   
NB.+0
NB.+
NB.+  nddt(20100101000000) 
NB.+315619200000000000  
NB.+
NB.+  nddt(19900101000000) 
NB.+_315532800000000000
NB. ---------------------------------------------------------
nddt =: 6!:14


NB. =========================================================
NB.*ddtn m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:15
NB.- Convert nanosecond datetime to expanded digit time
NB.- Expanded digit time: Year, Month, Day, Hours, Minutes, Seconds, nanoseconds
NB.-syntax:
NB.+ddtn(N) 
NB.+N = nanoseconds
NB.-example:
NB.+  ddtn(0) 
NB.+2000 1 1 0 0 0 0
NB.+
NB.+  ddtn(315619200000000000)
NB.+2010 1 1 0 0 0 0 
NB.+
NB.+  ddtn(_315532800000000000)
NB.+1990 1 1 0 0 0 0
NB. ---------------------------------------------------------
ddtn =: 6!:15


NB. =========================================================
NB.*dtn m -
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:16
NB.- Convert nanoseconds to ISO 8601 datetime
NB.-syntax:
NB.+dtn(N) 
NB.+N = nanoseconds
NB.-example:
NB.+  dtn(0) 
NB.+2000-01-01T00:00:00.000000000
NB.+
NB.+  dtn(315619200000000000)
NB.+2010-01-01T00:00:00.000000000
NB.+
NB.+  dtn(_315532800000000000)
NB.+1990-01-01T00:00:00.000000000
NB.+  
NB.+  dtn(315619210001000000)
NB.+2010-01-01T00:00:10.001000000
NB.+
NB.+ dtn(7311433600000000000)  NB. Outside range
NB.+?
NB. ---------------------------------------------------------
dtn =: '. 9'&(6!:16)


NB. =========================================================
NB.*dtn0 m Same as dtn without nanoseconds
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Convert nanoseconds to ISO 8601 datetime
NB.-syntax:
NB.+dtn0(N) 
NB.+N = nanoseconds
NB.-example:
NB.+  dtn0(0) 
NB.+2000-01-01T00:00:00
NB.+
NB.+  dtn0(315619200000000000)
NB.+2010-01-01T00:00:00
NB.+
NB.+  dtn0(_315532800000000000)
NB.+1990-01-01T00:00:00
NB.+  
NB.+  dtn0(315619210001000000)
NB.+2010-01-01T00:00:10
NB.+
NB.+ dtn0(6311433600000000000)
NB.+2200-01-01T00:00:00
NB.+
NB.+ dtn0(7311433600000000000)  NB. Outside range
NB.+?
NB. ---------------------------------------------------------
dtn0 =: 6!:16


NB. =========================================================
NB.*tndiff d - 
NB.- <b>Form</b> tacit
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Difference between pairs of edatetimes in nano seconds 
NB.- edates in ISO 8601 format: 'yyyy-MM-DDTHH:MM:SS
NB.-syntax: 
NB.+(ED) tndiff(BD)
NB.+ED = end date
NB.+BD = begin datre
NB.example:
NB.+  '2021-01-01' tndiff '2020-01-01'
NB.  31622400000000000
NB.- 
NB.+  '2021-06-30' tndiff '1950-11-10'
NB.+  2229120000000000000
NB.-
NB.+  '2021-06-30T10:10:10.1' tndiff '1950-11-10'
NB.+  2229156610100000000
NB. ---------------------------------------------------------
tndiff =: ([: 6!:17 [) - [: 6!:17 ]


NB. =========================================================
NB*tdiffyears d -
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Difference between pairs of edatetimes in years 
NB.- Calculate the number of days between the pairs of edatetimes
NB.- and % 365.25
NB.- edatetimess in ISO 8601 format: 'yyyy-MM-DDTHH:MM:SS
NB.- 86400000000000 *365.24 (Day * 365.25)
NB.- 31557600000000000  used to convert nano seconds to years 
NB.-syntax: 
NB.+(ED) tdiffyears(BD)
NB.+ED = end date
NB.+BD = begin date
NB.example:
NB.+  '2021-01-01' tdiffyears '2020-01-01'
NB.+1.00205
NB.- 
NB.+  '2021-06-30' tdiffyears '1950-11-10'
NB.+70.6366
NB.-
NB.+  '2021-06-30T10:10:10.1' tdiffyears '1950-11-10'
NB.+70.7377
NB.-
NB.+  '1994-10-01' tdiffyears '1986-05-23' 
NB.+8.35866 
NB. ---------------------------------------------------------
tdiffyears =: (([: 6!:17 [) - [: 6!:17 ]) % 31557600000000000"_


NB. =========================================================
NB*tdiffdays d -
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Difference between pairs of edatetimes in days 
NB.- edatetimess in ISO 8601 format: 'yyyy-MM-DDTHH:MM:SS
NB.- 86400000000000 used to convert nano secoonds to days
NB.-syntax: 
NB.+(ED) tdiffdays(BD)
NB.+ED = end date
NB.+BD = begin date
NB.example:
NB.+  '2021-01-01' tdiffdays '2020-01-01'
NB.+366
NB.- 
NB.+  '2021-06-30' tdiffdays '1950-11-10'
NB.+25800
NB.-
NB.+  '2021-06-30T10:10:10.1' tdiffdays '1950-11-10'
NB.+25800.4
NB.-
NB.+  '1994-10-01' tdiffdays '1986-05-23' 
NB.+3053
NB. ---------------------------------------------------------
tdiffdays =: (([: 6!:17 [) - [: 6!:17 ]) %  86400000000000"_


NB. =========================================================
NB.*ageLastBD d - 
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Age last birthday - edatetime
NB.-syntax: 
NB.+(ED) ageLatBD(BD)
NB.+ED = date of calculation
NB.+BD = date of birth
NB.example:
NB.+  '2021-01-01' ageLastBD '2020-01-01'
NB.+1
NB.-
NB.+  '2021-06-30' ageLastBD '1950-11-10'
NB.+70
NB.-
NB.+  '2021-06-30T10:10:10.1' ageLastBD '1950-11-10'
NB.+70
NB.-
NB.+  '1994-10-01' ageLastBD '1986-05-23' 
NB.+8 
NB. ---------------------------------------------------------
ageLastBD =: [: <. (([: 6!:17 [) - [: 6!:17 ]) % 31557600000000000"_


NB. =========================================================
NB.*ageNextBD d - 
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Age next birthday - edatetime
NB.-syntax: 
NB.+(ED) ageNextBD(BD)
NB.+ED = date of calculation
NB.+BD = date of birth
NB.example:
NB.+  '2021-01-01' ageNextBD '2020-01-01'
NB.+2
NB.-
NB.+  '2021-06-30' ageNextBD '1950-11-10'
NB.+71
NB.-
NB.+  '2021-06-30T10:10:10.1' ageNextBD '1950-11-10'
NB.+71
NB.-
NB.+  '1994-10-01' ageNextBD '1986-05-23' 
NB.+9 
NB. ---------------------------------------------------------
ageNextBD =: [: >. (([: 6!:17 [) - [: 6!:17 ]) % 31557600000000000"_



NB. =========================================================
NB.*ageNearestBD d - 
NB.- <b>Depend:</b> Foreign 6!:17
NB.- Age nearest birthday - edatetime
NB.-syntax: 
NB.+(ED) ageNearestBD(BD)
NB.+ED = date of calculation
NB.+BD = date of birth
NB.example:
NB.+  '2021-01-01' ageNearestBD '2020-01-01'
NB.+1
NB.-
NB.+  '2021-06-30' ageNearestBD '1950-11-10'
NB.+71
NB.-
NB.+  '2021-02-30T10:10:10.1' ageNearestBD '1950-12-10'
NB.+70
NB.-
NB.+  '1994-10-01' ageNearestBD '1986-05-23' 
NB.+8 
NB. ---------------------------------------------------------
ageNearestBD =: [: <. 0.5 + (([: 6!:17 [) - [: 6!:17 ]) % 31557600000000000"_


NB. =========================================================



