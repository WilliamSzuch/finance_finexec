NB. =========================================================
NB.%datedb.ijs - Date data base
NB.-<script src="../js/datetime_links.js"></script>
NB.- Script: ~addons/finexec/datetime/datedb.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 7 24
NB.- Depend: ~addons/data/jd/jd.ijs
NB.- Dates data base. 
NB.- Start of Month Date data base
NB.- End of Month Date data base 
NB.- Status: dev 
NB.- <a href="../datedb.ijs" target="_blank">Script source: datedb.ijs</a>
NB.-<hr>
NB.- Set up a date data base.
NB.- 401 Years
NB.- 365.242 = Average days per year (146462 % 401)
NB.- YYYYMMDD: 18000101 to 22001231
NB.- DayNo:     0 ... 146461
NB.- Days = 146462
NB.- Months = 4812
NB.- Weeks 687 and 2 days
NB.- ISO 8601
NB.- Month: 1 = January ... 12  = December
NB.- DayOfWeek:  0 = Monday, 1= Tuesday, ... 6 =  Sunday
NB.-<hr>


NB. =========================================================
Note 'Set up datedb and load datedb'
load 'jd'
NB. ---------------------------------------------------------
NB. 'new' jdadmin '~addons/finance/finexec/datetime/datedb'  NB. create new db 
NB. ---------------------------------------------------------
jdadmin           '~addons/finance/finexec/datetime/datedb'  NB. open db 
NB. ---------------------------------------------------------
jdadmin ''
NB. jdadmin 0   NB. close all db
NB. ---------------------------------------------------------
NB. jd 'list ...'
jd 'list version'
NB. ---------------------------------------------------------
NB. jd 'info ...'
jd 'info table'
jd 'info schema'
jd 'info summary'
jd 'info agg'
jd 'info ref'
NB. ---------------------------------------------------------
NB. jd 'dropcol ...'
NB. jd 'droptable ...'
NB. jd 'dropdb'          NB. Drop open db 
NB. ---------------------------------------------------------
jdpath_jd_ ''  NB. Use to show current db.
NB. ---------------------------------------------------------
jd 'reads /types from Dates where jdindex range 0,10'
jd 'reads /types /e from Dates where jdindex range 0,10'
)


NB. =========================================================
NB. From data_tools.ijs 
date_convert4 =: (10000 100 100)&#:


NB. =========================================================
NB. Modified from data_tools.ijs day_of_weekno
day_weekno =: 3 : 0
DAYS =. 2 3 4 5 6 0 1  
>(7|y){DAYS
)


NB. =========================================================
Note 'Creating Dates data'
N =: i. 146462
D =: 1&todate N
Z =: ('DayNo';'Date'),.N;D
NB. ---------------------------------------------------------
Y =: 0&{"1 date_convert4 D
M =: 1&{"1 date_convert4 D
Da =: 2&{"1 date_convert4 D
ZZ =: Y;M;Da
ZZZ =: ('Year';'Month';'Day'),.ZZ
NB. ---------------------------------------------------------
WD =: day_weekno i. 146462 
)


NB. =========================================================
NB. Note 'Create table column headings'
HDR=: 'DayNo int, Date int'
jd 'droptable Dates'
jd'createtable Dates ',HDR
jd'reads count Year from Dates'
)


NB. =========================================================
Note 'Adding data to table'
jd 'insert Dates';,Z
jd 'reads from Dates where jdindex range 0,10'
)


NB. =========================================================
Note 'Add new columns' 
jd 'dropcol Dates Year'
jd 'createcol Dates Year int'
jd 'createcol Dates Month int'
jd 'createcol Dates Day int'
jd 'update Dates';_;,ZZZ
jd 'reads  from Dates where jdindex range 300,370'
NB. ---------------------------------------------------------
NB. Add DayofWeek 
jd 'dropcol Dates DayOfWeek'
jd 'createcol Dates DayOfWeek int'
jd 'update Dates';_;,'DayOfWeek';WD
)


NB. =========================================================
Note 'Some reads'
jd 'reads count Day from Dates where Day = 28'
jd 'reads from Dates where Month = 2 and Day = 28'
jd 'reads from Dates where Month = 2 and Day = 29'
jd 'reads count Day from Dates'
jd 'reads count Day from Dates where Day = 28 and Month = 2'
jd 'reads count Day from Dates where Day = 29 and Month = 2'
)


NB. =========================================================
Note 'Start and End of Month Dates'
Months = 4812
$ jd 'reads from Dates where jdindex in 0,1,2,146461'
jd 'reads from Dates where jdindex =146461'
jd 'reads count Day from Dates where Day = 1'
NB. ---------------------------------------------------------
Start of Month Index
Indx_SoM =: > 1{ ,jd 'read jdindex from Dates where Day = 1'
SoM_Dates =: jd 'read from Dates where jdindex in ',(' ',',')stringreplace(": Indx_SoM)
NB. ---------------------------------------------------------
End of Month Index
Indx_EoM =: (_1 + 1}. Indx_SoM),146461
EoM_Dates =:  jd 'read from Dates where jdindex in ',(' ',',')stringreplace(": Indx_EoM)
)


NB. =========================================================
Note 'Create tables: StartMonth EndMonth dates'
HDR =: 'DayNo int, Date int, Year int, Month int, Day int, DayOfWeek int'
NB. ---------------------------------------------------------
jd 'droptable StartMonth'
jd 'createtable StartMonth ',HDR
jd 'insert StartMonth'; ,SoM_Dates
jd 'reads count Year from StartMonth'
jd 'reads from StartMonth where jdindex in 0,1,2,4000'
NB. ---------------------------------------------------------
jd 'droptable EndMonth'
jd 'createtable EndMonth ',HDR
jd 'insert EndMonth'; ,EoM_Dates
jd 'reads count Year from EndMonth'
jd 'reads from EndMonth where jdindex in 0,1,2,4000'
jd 'reads from EndMonth where Month = 2 and Day in 28,29'
)


NB. =========================================================
Note 'Ceate coluimns: NanoDate, ISO_8601,DigitDate
jd 'info schema Dates'
jd 'reads /types from Dates where jdindex range (0,10)'
$ Date =: jd 'get Dates Date'
$ DigitTime =: 1000000* Date
jd 'createcol Dates DigitTime int'; DigitTime
NB. ---------------------------------------------------------
$ NanoDate =: 6!:14 jd 'get Dates DigitTime'
jd 'createcol Dates NanoDate int'; NanoDate
jd 'reads /types from Dates where jdindex range (0,10)'
NB. ---------------------------------------------------------
$ISO_8601 =: 6!:16 jd 'get Dates NanoDate'
jd 'createcol Dates ISO_8601 byte 19'; ISO_8601
jd 'reads /types from Dates where jdindex in 0,10,146000'
NB. ---------------------------------------------------------
jd 'createcol Dates Edate edate';jd 'get Dates ISO_8601'
jd 'reads /e /types from Dates where jdindex in 0,10,146000'
jd 'reads /types from Dates where jdindex in 0,10,146000'

)
