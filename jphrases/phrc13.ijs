NB.%phrc13.ijs - J Phrases Section 13C. Type Change
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrc13.ijs" target="_blank">Script source: phrc13.ijs</a>
NB.-<hr>


m0=: [: 0&": 10"_ #. #:                                NB. Character binary format of integer y
m1=: 1: ": |:@(10 10"_ #: >:@i.)                       NB. Character form of column # heading
m2=: ] { '0123456789abcdef'"_                          NB. Character form of #, bases 2 thru 16
m3=: <"1                                               NB. Box lists of array y
m4=:16"_#.'0123456789abcdef'"_ i.]                     NB. Decimal from hexadecimal characters y
m5=: 10"_ #. '0123456789'"_ i. ]                       NB. Decimal from decimal characters y
m6=: ".                                                NB. Convert rows of y to numbers (default 0)
d7=: [ ]`[@.(0: = #@]) ".@]                            NB. # from character y, x if y not a number
m8=: }.@(".@('0 '&,@(*./@(e.&  '0123456789'@]) # ])))  NB. # from character, empty if not character
m9=: ".                                                NB. Execute each row of  character table y
m10=: +/@:".                                           NB. Sum of numbers in character table y
m11=: ":@,.                                            NB. Format numeric list y as table
d12=: [:}."1[:": (10"_^[)+([:,.])                      NB. Format list y as x-wide col with leading 0s
d13=: [ n24 } m25@]                                    NB. Format y with 0s replaced by x
d14=: ":"_1                                            NB. Row-wise format of y by x 
d15=: ":                                               NB. Format y in fields <.x wide and 1|x decimals
m16=: #@":                                             NB. Number of characters in format of y
n17=: rn=: 'MDCLXVI'                                   NB. Roman numerals
m18=: rn&i.                                            NB. Roman numerals y in code
m19=: {&1000 500 100 50 10 5 1                         NB. Decode decimal values from indices y
m20=: [: | [:-/]+//.~0:,~2:</\]                        NB. Decimal number  from values of Roman
m21=: DFR=: m20@m19@m18                                NB. Decimal from Roman
m22=: RFD=:#&rn@(5 2 5 2 5 2 5&#:)                     NB. Roman  from Decimal  (no refinements)
v23=: [: <"1 $ #: [: m26 [:,'1'"_ =]                   NB. Indices of '1' in character table y
n24=: [`(v23@{:@])`({.@])                              NB. Gerund for amend
m25=: [: ": ] ,: ] = 0:                                NB. Laminate boolean array locating free 0s in y
m26=: +/ {. \:                                         NB. Indices of 1s in Boolean list y 
