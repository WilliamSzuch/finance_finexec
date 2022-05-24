NB. =========================================================
NB.%calendaryr.ijs - Calendar year tool: excerise in tacit form
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Date Time</a>
NB.-<hr>
NB.- Script: ~adons/finance/finexec/datetime/calendaryr.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions:  exported to locale base 
NB.- Status: done:
NB.- <a href="../calendaryr.ijs" target="_blank">Script source: calendaryr.ijs</a>
NB.-<hr>
NB.- This script defines the calendar year tool as a tacit.
NB.- This is an example of building a long tacit from an explicit definition.
NB.- Taken from the explicit definition of calendar in dates.ijs (stdlib).
NB.- Dealing with a large tacit.
NB.-<hr>
NB.- Review using dissect - get error but the tacit works
NB.-<hr>


NB. =========================================================
NB.*calendaryr v -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Based on calendar in dates.ijs (stblib)
NB.- Formatted calendar for year and months
NB.- Returns calendar for year, as a list of months
NB.- Modified to includer year in format. 
NB.-syntax:
NB.+([X])calendaryr(Y,[M])
NB.+[X] = optional left argument is the start day of the week
NB.+0 = Sunday (default)
NB.+1 = Monday
NB.+2 = Tuesday etc
NB.+Y = year as yyyy
NB.+[M] = optional months in the year
NB.+      If no months are given, it defaults to all months.
NB.-example:
NB.+   calendaryr(2014 3 4)
NB.+┌─────────────────────┬─────────────────────┐
NB.+│     Mar2014         │     Apr2014         │
NB.+│ Su Mo Tu We Th Fr Sa│ Su Mo Tu We Th Fr Sa│
NB.+│                    1│        1  2  3  4  5│
NB.+│  2  3  4  5  6  7  8│  6  7  8  9 10 11 12│
NB.+│  9 10 11 12 13 14 15│ 13 14 15 16 17 18 19│
NB.+│ 16 17 18 19 20 21 22│ 20 21 22 23 24 25 26│
NB.+│ 23 24 25 26 27 28 29│ 27 28 29 30         │
NB.+│ 30 31               │                     │
NB.+└─────────────────────┴─────────────────────┘
NB.-
NB.+   (2)calendaryr(2014 3 4)
NB.+┌─────────────────────┬─────────────────────┐
NB.+│     Mar2014         │     Apr2014         │
NB.+│ Tu We Th Fr Sa Su Mo│ Tu We Th Fr Sa Su Mo│
NB.+│              1  2  3│  1  2  3  4  5  6  7│
NB.+│  4  5  6  7  8  9 10│  8  9 10 11 12 13 14│
NB.+│ 11 12 13 14 15 16 17│ 15 16 17 18 19 20 21│
NB.+│ 18 19 20 21 22 23 24│ 22 23 24 25 26 27 28│
NB.+│ 25 26 27 28 29 30 31│ 29 30               │
NB.+│                     │                     │
NB.+└─────────────────────┴─────────────────────┘
NB. ---------------------------------------------------------
calendaryr    =: (0&$:) :((<"2)@:(((<:@:([: }. ])) , (i.@:((12"_) * ((1:) = ([: # ]))))) { (((([ * (3"_)) |. (' Su Mo Tu We Th Fr Sa'"_)) ((,:"1)~) ((_7"_) ((_12&{.)\) (,@:(((12 3"_) $ ('JanFebMarAprMayJunJulAugSepOctNovDec'"_)) (,"1) (":@([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ])))))) (,"2) (((12 6 21"_) $ ,)@:(((-@:((7&|)@:(((([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]) - [) + (((-/)@:<.)@:((4 100 400"_) (%~) (<:@:([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) + ((0"_) , ((((+/)\)@:}:)@:((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_)))))))))) (|."0 1) (((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_))))) ((]&:>:) (*"1) (>/)) ([: (i.) (42"_)))) { ((' '"_) , ([: (3&":) ((1:) + ([: (i.) (31 1"_))))))))))
NB. ---------------------------------------------------------
Note 'T calendaryr' 
NB. Treatment of ambivament verb.
NB. Default case.
NB. Treat as dyadic with monadic as a special case.
NB. ---------------------------------------------------------
NB. This sets the year as YYYY
yr =. {.
NB. yr 2014
NB. yr 14
NB. yr 1990
NB. ---------------------------------------------------------
cyr =. 0&{ @: ((6!:0)@:(''"_))
NB. cyr 2014 1
yr100 =. (<&100)@:yr
NB. yr100 2014
NB. yr100 14
NB. yr100 1990
myr =. (-100&|)
NB. myr 1990
aa =. [: ((yr100 * (myr@:cyr))+yr) ]
NB. 0 aa 2014
NB. 1 aa 2014
NB. ---------------------------------------------------------
b1 =.  (aa - [)
NB. 0 b1 2014
bb =. b1 + (-/ @:<. @: ((4 100 400"_)(%~)(<:@:aa)))
NB. 0 bb 2014
NB. 1 bb 2014
NB. ---------------------------------------------------------
r10 =. 10&$@:(5&$ @:(3 2"_))
r11 =. (3:, ((~:/) @: (0: = ((4 100 400)"_|aa)))),r10
NB. 0 r11 2014
NB. 0 r11 2012
r1 =. 28"_ + r11
NB. 0 r1 2014
NB. 1 r1 2014
NB. 0 r1 2012
NB. ---------------------------------------------------------
NB. r=: (-7|b+0,+/\}:r) |."0 1   r(]&:>:*"1>/)i.42
r20 =. (r1 (]&:>:*"1>/) ([: i. 42"_))
NB. 0 r20 2014
r21 =. |."0 1
r22 =. - @: (7&|@: (bb + (0"_,(+/\@: }:@:r1))))
NB. 0 r22 2014
r2 =. r22 r21 r20
NB. RR2 =: 0 r2 2014
NB. RR2 =: 1 r2 2014
NB. ---------------------------------------------------------
NB. H1 =: h =: ,(12 3 $ h),"1 (": a) NB. adding year
hh=. 'JanFebMarAprMayJunJulAugSepOctNovDec'"_
NB. HH0 =: hh ''
NB. ---------------------------------------------------------
h1 =. ,"1
h2 =. (":@aa)
NB. 0 h2 2014
h3 =. (12 3"_ $ hh)
h4 =. ,@:(h3 h1 h2)
NB. 0 h4 2014
NB. 1 h4 2014
NB. ---------------------------------------------------------
NB. H2 =: h=: ((x*3)|.' Su Mo Tu We Th Fr Sa'),:"1~_7(_12&{.)\h
h5 =. ,:"1~
h6 =.  (_7"_) ((_12&{.)\) h4
NB. 0 h6 2014
NB. 1 h6 2014
NB. ---------------------------------------------------------
days =. (' Su Mo Tu We Th Fr Sa')"_
h7 =. |.
h8 =. [ * 3"_
h9 =. h8 h7 days
NB. 0 h9 2014
NB. 1 h9 2014
NB. ---------------------------------------------------------
h10 =. h9 h5 h6
NB. HH2 =: 0 h10 2014 
NB. HH2 =: 1 h10 2014 
NB. ---------------------------------------------------------
NB. m =: (<:}.y) , i.12*1=#y
m0 =. i. @: (12"_ * 1: = [: # ])
m1 =. ,
m2 =. <: @: ([: }. ]) 
mm =. m2 m1 m0
NB. MM0 =: 0 mm 2014
NB. MM0 =: 1 mm 2014
NB. ---------------------------------------------------------
NB. Formatting
NB. <"2 m{h,"2[12 6 21 ($,)r{' ',3":1+i.31 1
f0=. (' '"_) ,([: 3&": (1: + ([: i. (31 1"_))))
f1 =. r2 { f0
NB. 0 f1 2014 1
f2 =. (12 6 21"_) $ ,
f3 =. f2 @: f1
NB. 0 f3 2014
f4 =. h10,"2 f3
NB. 0 f4 2014
NB. 1 f4 2014
NB. ---------------------------------------------------------
f5 =. mm { f4
NB. 0 f5 2014
NB. ---------------------------------------------------------
f6 =. <"2 @: f5
NB. 1 f6 2014 5
NB. ---------------------------------------------------------
NB. Make ambivalent
NB. Long tacit
f7 =. 0&f6 : f6 f.
NB. f7 2014
NB. f7 2014 1 12
NB. 1 f7 2014 1 12 
NB. ---------------------------------------------------------
NB. Shorter tacit than F7
f8 =. 0&$: : f6 f.  NB. shorter than f7
NB. f8 2014 1 12
NB. 1 f8 2014 1 12
NB. ---------------------------------------------------------
calendaryr =. f8 f.
)


NB. =========================================================
NB. Convert the tacit into text: 
NB. ---------------------------------------------------------
NB. F7 =: (5!:6) <'f7'    
NB. F8 =: (5!:6) <'f8'    
NB. CALENDARYR =: (5!:6) <'calendaryr'
NB. ---------------------------------------------------------
NB. Put the tacit text into the script:
NB. F7 fappends '~addons/finance/finexec/datetime/calendaryr.ijs.'
NB. F8 fappends '~addons/finance/finexec/datetime/calendaryr.ijs.'
NB. CALENDARYR fappends '~addons/finance/finexec/datetime/calendaryr.ijs.'
NB. ---------------------------------------------------------
f7 =: (0&((<"2)@:(((<:@:([: }. ])) , (i.@:((12"_) * ((1:) = ([: # ]))))) { (((([ * (3"_)) |. (' Su Mo Tu We Th Fr Sa'"_)) ((,:"1)~) ((_7"_) ((_12&{.)\) (,@:(((12 3"_) $ ('JanFebMarAprMayJunJulAugSepOctNovDec'"_)) (,"1) (":@([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ])))))) (,"2) (((12 6 21"_) $ ,)@:(((-@:((7&|)@:(((([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]) - [) + (((-/)@:<.)@:((4 100 400"_) (%~) (<:@:([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) + ((0"_) , ((((+/)\)@:}:)@:((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_)))))))))) (|."0 1) (((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_))))) ((]&:>:) (*"1) (>/)) ([: (i.) (42"_)))) { ((' '"_) , ([: (3&":) ((1:) + ([: (i.) (31 1"_))))))))))) :((<"2)@:(((<:@:([: }. ])) , (i.@:((12"_) * ((1:) = ([: # ]))))) { (((([ * (3"_)) |. (' Su Mo Tu We Th Fr Sa'"_)) ((,:"1)~) ((_7"_) ((_12&{.)\) (,@:(((12 3"_) $ ('JanFebMarAprMayJunJulAugSepOctNovDec'"_)) (,"1) (":@([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ])))))) (,"2) (((12 6 21"_) $ ,)@:(((-@:((7&|)@:(((([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]) - [) + (((-/)@:<.)@:((4 100 400"_) (%~) (<:@:([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) + ((0"_) , ((((+/)\)@:}:)@:((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_)))))))))) (|."0 1) (((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_))))) ((]&:>:) (*"1) (>/)) ([: (i.) (42"_)))) { ((' '"_) , ([: (3&":) ((1:) + ([: (i.) (31 1"_))))))))))
f8 =: (0&$:) :((<"2)@:(((<:@:([: }. ])) , (i.@:((12"_) * ((1:) = ([: # ]))))) { (((([ * (3"_)) |. (' Su Mo Tu We Th Fr Sa'"_)) ((,:"1)~) ((_7"_) ((_12&{.)\) (,@:(((12 3"_) $ ('JanFebMarAprMayJunJulAugSepOctNovDec'"_)) (,"1) (":@([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ])))))) (,"2) (((12 6 21"_) $ ,)@:(((-@:((7&|)@:(((([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]) - [) + (((-/)@:<.)@:((4 100 400"_) (%~) (<:@:([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) + ((0"_) , ((((+/)\)@:}:)@:((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_)))))))))) (|."0 1) (((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_))))) ((]&:>:) (*"1) (>/)) ([: (i.) (42"_)))) { ((' '"_) , ([: (3&":) ((1:) + ([: (i.) (31 1"_))))))))))
NB. ---------------------------------------------------------
NB. Size of tacits:
NB. > # each  F7;F8;CALENDARYR 
NB. 1986 998 998
NB. Size of calendar explicit definition
NB. # (5!:6) <'calendar' 
NB. 332


NB. =========================================================
NB. Some speed tests:
NB. timex 'calendaryr 2020'
NB. timex 'calendaryr"0  (1000#2020)'
NB. 
NB. timex 'calendar 2020'
NB. timex 'calendar"0 (1000#2020)'


NB. =========================================================
NB. Show using dissect:
NB. load '~addons/debug/dissect/dissect.ijs'
NB. dissect 'calendaryr 2016 1'
NB. ---------------------------------------------------------
NB. dissect '(0&$:) : ((<"2)@:(((<:@:([: }. ])) , (i.@:((12"_) * ((1:) = ([: # ]))))) { (((([ * (3"_)) |. (' Su Mo Tu We Th Fr Sa'"_)) ((,:"1)~) ((_7"_) ((_12&{.)\) (,@:(((12 3"_) $ ('JanFebMarAprMayJunJulAugSepOctNovDec'"_)) (,"1) (":@([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ])))))) (,"2) (((12 6 21"_) $ ,)@:(((-@:((7&|)@:(((([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]) - [) + (((-/)@:<.)@:((4 100 400"_) (%~) (<:@:([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) + ((0"_) , ((((+/)\)@:}:)@:((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_)))))))))) (|."0 1) (((28"_) + (((3:) , ((~:/)@:((0:) = ((4 100 400"_) | ([: ((((<&100)@:{.) * ((- (100&|))@:((0&{)@:((6!:0)@:(''"_))))) + {.) ]))))) , ((10&$)@:((5&$)@:(3 2"_))))) ((]&:>:) (*"1) (>/)) ([: i. (42"_)))) { ((' '"_) , ([: (3&":) ((1:) + ([: i. (31 1"_)))))))))) 2016'
NB. |value error: JanFebMarAprMayJunJulAugSepOctNovDec

