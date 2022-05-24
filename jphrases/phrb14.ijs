NB.%phrb14.ijs - J Phrases Section 14B. Date & Time
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb14.ijs" target="_blank">Script source: phrb4.ijs</a>
NB.-<hr>


m0=: 6!:0                                                         NB. System time stamp yyyy mm dd hh mm ss (argument y needed but ignored)
m1=: [:<._3:{.]                                                   NB. hh mm ss part of time stamp
m2=: 1000"_ #. ]                                                  NB. Base-1000 form of y
m3=: (':'"_) _6 _3} ":                                            NB. Format with ':' between fields
m4=: [:<.3:{.]                                                    NB. yyyy mm dd part of time stamp
m5=: ('/'"_) 4 7} ":                                              NB. Format with '/' between fields
m6=: [: m3 [: m2 [: m1 m0                                         NB. Formatted time stamp hh:mm:ss
m7=: [: m5 [: m2 [: m4 m0                                         NB. Formatted date stamp yyyy/mm/dd
m8=: (':'"_) 2 5} [: ": 1000"_ #. _3: {. [: <. m0                 NB. Formatted time stamp hh:mm:ss
m9=: ('/'"_) 4 7} [: ": 1000"_ #.  3: {. [: <. m0                 NB. Formatted date stamp yyyy.mm/dd
m10=: 100"_#.100"_|3:{. m0                                        NB. yymmdd from ccyy mm dd (y neglected)
m11=: 0: ~:/ .= 4 100 400"_ |/ ]                                  NB. Is y a leap year?
m12=: 28"_ + m11@]                                                NB. Number of days in February of year y
d13=: 31"_ - 2: | 7: | [                                          NB. 31 - 2 | 7 | x: days in month x, not = 1
d14=: d13`m12@.([=1:)                                             NB. Number of days in month x of year y
m15=: ('0123456789 '"_ i.[:":[:|. 3: {. 6!:0) { ('0123456789.'"_) NB. Current date in dd.mm.yy fmt, neglect y
m16=: ((12"_ <: {.),2:) { 'apm'"_                                 NB. am or pm depending on first atom of y
m17=: ([: m3 m2) , (' '"_ , m16)                                  NB. Formatted 3-atom time y in 'm' form
m18=: [:":[:(1:|.])100"_|[:m4 m0                                  NB. Formatted date in mm dd yy form
m19=: '/'"_(]#[:i.#)@(' '"_=])}]                                  NB. Replace blanks in y by '/'
m20=: m19@m18                                                     NB. Formatted date in mm/dd/yy form
m21=: >:@(365&* + m22)@(-&1601)                                   NB. # of New Year's Day, Gregorian  year y; m21 1601 is 1
m22=: -/@:<.@(%&4 100 400)"0                                      NB. # of leap days in y years (Clavian corr.)
m23=: 7&|@m21                                                     NB. Day of week year y begins (0=Sunday)  
