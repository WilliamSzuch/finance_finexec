NB.%phrb4.ijs - J Phrases Section 4B. Locating & Selecting
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb4.ijs" target="_blank">Script source: phrb4.ijs</a>
NB.-<hr>


m1=: i.>./                                 NB. Index of (IO) first occurrence of maximum of y
m2=: i:>./                                 NB. IO last occurrence of maximum of y
m3=: i.<./                                 NB. IO first occurrence of minimum of y
m4=: i:<./                                 NB. IO last occurrence of minimum of y
m5=: {.@\:                                 NB. IO first occurrence of maximum of y
m6=: {.@/:                                 NB. IO first occurrence of minimum of y
d7=: ~:i.1:                                NB. IO first item where x and y differ
d8=: e.i.1:                                NB. IO first occurrence in x of any item of y
m9=: ' '&(=i:0:)                           NB. IO last nonblank in y
d10=: [ + i.&1@}.                          NB. IO first 1 in y after first x items
m11=: ] i. 1:                              NB. IO first 1 in y
m12=: ] i: 1:                              NB. IO last 1 in y
d13=: <:@($@]) - |.@] i. [                 NB. IO last item of x in y
d14=: (<:@(#@[) - |.@[ i. ])"1             NB. IO last occurrence of y in x
d15=: |.@[ i. ]                            NB. IO last occurrence of y in x, from rear
d16=: I.@:E.                               NB. Indices of (ISO) beginnings of x in y
d17=: e.~&, # i.@#@]                       NB. ISO all occurrences of items of y in x
d18=: =#[:i.[:#[                           NB. ISO all occurrences of items of y in x
m19=: +/{.\:                               NB. ISO 1s in Boolean list y
m20=: [: m38 m39                           NB. ISO 1s in Boolean table y
m21=: ] i."1 ' '"_                         NB. ISO first blank in rows of table y
m22=: ([:(</\&.|.i.1:)' '"_ ~: ])"1        NB. ISO last nonblank in rows of table y
m23=: I.                                   NB. ISO 1s in Boolean list y
m24=: # i.@#                               NB. ISO 1s in Boolean list y
d25=: ([: $ ]) #."1 ([: > [)               NB. Indices from (boxed) indices x to table y
d26=: +/i.                                 NB. ISO infixes of length y, starting at x
m27=:  [: i. #                             NB. All indices of list y
m28=: [: { [: i.&.> $                      NB. Catalog of indices of y, in shape of y
m29=: +/\@}:@(0:,])                        NB. Indices of start positions from counts y
m30=: $ #: [: i. [: # ,                    NB. Table of all indices of array y (odometer)
d31=: {@(;/&i.)                            NB. Catalog of all pairs from i.x and i.y
d32=: [: m20 [ e. [: , ]                   NB. Indices in x of atoms of list y
m33=: a."_ i. ]                            NB. Index in a. of character y
d34=: i."_1                                NB. Itemwise index in table x of rows of y
d35=: E. i. 1:                             NB. IO first occurrence of array x in y
d36=: <:@(+/@(</))                         NB. Index in classes x of y
d37=: i.                                   NB. Index in rows of table x of list y
m38=: <"1                                  NB. (Boxed) indices from rows of open table y
m39=: $ #: (# i.@$)@,                      NB. Open ISO 1s in array y  (inverse of m85)  </tr><tr>
m40=: m20@m43                              NB. ISO free zeros in formatted y
m41=: m20@m82                              NB. IO saddle point in y
m42=: <:@(+/\) i. i.@(+/)                  NB. ISO 1s ub Boolean list y
m43=: ' 0 '"_ E."1 ' '"_ ,. ] ,. ' '"_     NB. Locate free zeros in formatted y
m44=: =&''''                               NB. Locate quotes in y
m45=: = >./                                NB. Locate all instances of maximum of y
m46=: '.'&~:                               NB. Exclude periods in y
m47=: e.&' 0123456789'                     NB. Locate digits and blanks in y
d48=: E.                                   NB. Locate beginning points of pattern x in y
m49=: 2&=@(+/@(0&=@(|/~@i.)))              NB. Locate primes less than y
d50=: i.@(#@])e.[                          NB. Locate indices x in y
d51=: ] e.~ [: i. [: # [                   NB. Locate indices y in x
m52=: ] e.~ [: i. [: >: >./                NB. Locate indices y
m53=: *./ .=&' '                           NB. Locate blank rows in table y
m54=: ] -:"1 [: {. ' '"_ , ]               NB. Locate blank rows in table y
m55=: ~:                                   NB. Locate first instance of each item
m56=: [: *./\  ' '"_ = ]                   NB. Locate leading blanks
m57=: [: *./\. ' '"_ = ]                   NB. Locate trailing blanks
m58=: 2:+./\0:,2:|+/\@(=&'''')             NB. Locate text between and including quotes
m59=: 2:*./\0:,2:|+/\@(=&'''')             NB. Locate text between quotes
m60=: 2: </\ 0: , ]                        NB. Locate first 1 in each group of 1s in y
m61=: 2: >/\ 0: , ]                        NB. Locate first 0 after each group of 1s in y
d62=: * $ -@] {. 1:                        NB. Locate ends of x fields of length y
d63=: * $   ] {. 1:                        NB. Locate starts of x fields of length y
m64=: 1: ,~ 2: ~:/\ ]                      NB. Loc ends of fields of identical atoms in y
m65=: 1: ,  2: ~:/\ ]                      NB. Loc starts of fields of identical atoms in y
m66=: 1: ,~ 2: ~:/\ ]                      NB. Loc where atom differs from nxt rgt in y
m67=: 1: ,  2: ~:/\ ]                      NB. Loc where atom differs next left in y
m68=: ] > [: }. 0: ,~ ]                    NB. Loc last 1 in each group of 1s in y
m69=: ] > [: }: 0: ,  ]                    NB. Loc first 1 in each group of 1s
d70=: 0: = [ | [: i. [: # ]                NB. Loc every xth item of y
m71=: 2: | [: >: [: i. #                   NB. Loc every 2d item of y
d72=: 0: = |                               NB. Loc atoms of y divisible by x
d73=: [: -. [ e.~ [: i. ]                  NB. Loc atoms of i. y not  in x
d74=:       [ e.~ [: i. ]                  NB. Loc atoms of i.y in x
d75=: i. = [: # [                          NB. Loc items of y not in x
m76=: 0: *. ]                              NB. Loc nothing
d77=: <:                                   NB. Loc where x implies y
d78=: >                                    NB. Loc where x but not y
d79=: ~:                                   NB. Loc exclusive or of x and y
d80=: =                                    NB. Loc Kronecker delta of x and y
d81=: #@[ > /:@(] ,~ i.@#@[)               NB. Loc fills formed by expanding y by x
m82=: (= <./"1) *. (="1 >./)               NB. Loc saddle points of table y
m83=: [: #: [: i. 2: ^ #                   NB. Loc all subsets of order #n (truth table)
m84=: [: #: [: i. 2: ^ ]                   NB. Loc all subsets of order n (truth table)
m85=: 1: [`(m38@])`(m93@])} ]              NB. Loc indices y in large enough table (connection matrix from table of indices) (inverse of m39)
m86=: 1: [`(<"1@])`((>:@(>./@])$0:)@]) } ] NB. Loc indices y in large enough table
m87=: ' '&=                                NB. Loc blanks in y
m88=: =                                    NB. Loc each item of set of y (position  or distribution matrix)
m89=: (#~ (1: ~: +/"1))@=                  NB. Table in which each row Locs an infix in y of 2 or more consecutive equal items
d90=: [: , [ {.&> ] (<@#"0) 1:             NB. Expansion mask for fields of length y to uniform field of length |x 
m91=: _8&d90                               NB. Expansion mask for fields of length y to uniform right justified fields of length 8 
m92=: [: -. [: *./\. m53                   NB. Loc rows preceding trailing blank rows
m93=: 0: $~ [: >: >./                      NB. Loc nothing in table large enough for y
d94=: [ -:"1 ([: # [) {."1 ]               NB. Loc rows of y beginning with x
m95=: ' '&(+./ .~:)                        NB. Loc nonblank columns
m96=: [: -. [: *./\. ' '"_ = ]             NB. Exclude trailing blanks
m97=: m105@m95                             NB. Exclude leading blank columns
m98=: +. 1&,@}:                            NB. Loc 1s and 1st 0 in each group of 0s
m99=: m98@m95                              NB. Exclude all but first blank columns
m100=: *./ .=&' '                          NB. Loc blank rows
m101=: 1: , 2: +./\ ]                      NB. Exclude all 0s but the first in a group
m102=: m101@m100                           NB. Exclude all but first blank rows
m103=: +./\.                               NB. Loc items left of leftmost trailing 0
m104=: m103@m95                            NB. Exclude trailing blank columns
m105=: +./\                                NB. Loc items right of rightmost leading 0
m106=: *./\                                NB. Exclude all 1s right of first 0
m107=: *./\.                               NB. Exclude all 1s left of last 0
m108=: +./ .~:&' '                         NB. Loc nonblank rows
m109=: m103@m108                           NB. Exclude trailing blank rows
m110=: m105@m108                           NB. Exclude leading blank rows
m111=: m98@m95                             NB. Include only first of  group of blank cols
m112=: m98@m108                            NB. Include only first of group of blank rows
d113=: +./ .~:"1                           NB. Loc rows of x having atoms not y
d114=: -:"1                                NB. Loc rows of x matching y
d115=: ,@,. # $&1 0@#@,                    NB. Alternate i{x 1s and i{y 0s
m116=: # $&1 0@#                           NB. Alternate i{x 1s, (1+i){x 0s, etc
m117=: +./\ *. +./\.                       NB. Loc atoms between leading & trailing 0s
m118=: *. *./\@(= +./\)"1                  NB. Loc first infix of 1s
m119=: ' '&~:                              NB. Loc nonblanks
d120=: ]*.*.(]e.#)+/\@(2:</\0:,])@]        NB. Loc groups of ones in y indicated by x
m121=: +.~:/\                              NB. Loc 1s in y and 0s between pairs of 1s
m122=: -. *. ~:/\                          NB. Loc 0s between pairs of 1s
m123=: </\                                 NB. Loc leftmost 1
m124=: <:/\                                NB. Loc 1s and all 0s following leftmost 0
m125=: ~:/\                                NB. Loc where odd number of 1s are at left
d126=: #"1                                 NB. 1s in x select from each row (list) of y
d127=: #.@[ { ]                            NB. Boolean list x as integer selecting from y
d128=: <"1@[ { ]                           NB. Scattered index table x select from y
d129=: {                                   NB. Selecting x from y 
d130=: >./ . #                             NB. Select maximum of x located by y
m131=: m41 { ]                             NB. Select saddle point(s) of y
m132=: ([:-.(1:,''"_=])#.1:)}.]            NB. Delete trailing blanks
m133=: m104 #"1 ]                          NB. Delete trailing blank columns
m134=: m97 #"1 ]                           NB. Delete leading blank columns
m135=: m110 # ]                            NB. Delete leading blank rows
m136=: m109 # ]                            NB. Delete trailing blank rows
m137=: m98@m108 # ]                        NB. Delete repeated blank rows
m138=: m98@m95 #"1 ]                       NB. Delete repeated blank columns
m139=: ] -. [: {. ' '"_ , ]                NB. Delete blank rows
m140=: m108 # ]                            NB. Delete blank rows
m141=: m95 #"1 ]                           NB. Delete blank columns
m142=: ([: m117 ] ~: ' '"_) # ]            NB. Delete leading & trailing blanks
m143=: +/@(*./\@(' '&=)) }. ]              NB. Delete leading blanks
m144=: #~ ([: +./\. ' '&~:)                NB. Delete trailing blanks
d145=: ,                                   NB. Append atom or list to table
d146=: ,.                                  NB. List or atom as new column of table
m147=: ~.                                  NB. Delete repeated items
m148=: */@}:@$                             NB. Number of rows in array y
m149=: #~(+. 1&|.@(></\))@(' '&~:)         NB. Delete extra blanks
d150=: ,.                                  NB. Join along last dimension
d151=: ,.&.>/                              NB. Join items of boxed array
