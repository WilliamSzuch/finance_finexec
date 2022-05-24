NB. =========================================================
NB.%data_arrays.ijs - Definitions for creating data arrays by codes
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Actuarial Non-Life</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/actuarialnonlifes/data_arrays.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev: review
NB.- <a href="../data_arrays.ijs" target="_blank">Script source: data_arrays.ijs</a>
NB.-<hr>
NB.- Tools for creating data arrays by data codes.
NB.- For example incident by report arrays. 
NB.- Indexing - this starts at: 0 or 0 0 etc
NB.- Make sure that data codes have been calculated on this basis
NB.- or adjusted prior to using array1, array2  etc.
NB.- 
NB.- Also make sure that data codes have been determined as required,
NB.- Especially codes (indices) for periods.
NB.- See definition for dates codes outside the range of the array dimensions.
NB.-
NB.- Accident periods         - start at '0'  (Usually ROWS)
NB.- Report periods           - start at '0'  (Usually COLUMNS)
NB.- Development periods      -(Accident period - Report period)  (Usually COLUMNS)
NB.- Payment periods          - start at '0'   (Usually COLUMNS)
NB.-<hr>
NB.- Equations:
NB.- To Do
NB.-<hr>


NB. =========================================================
NB. Utilities
NB.*max m Maximum value in a list
max =: >./

NB.insert_equal m Insert = between values in a list
insert_equal =: 1: , }. -.@= }:


NB. ======================================================================
NB.*nubsum d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Produce totals for subgroups based on the nub of the group.
NB.- Data is a boxed matrix.
NB.-syntax:
NB.+(C)nubsum(D)
NB.+C = columns to determine the nub from data.
NB.+    numeric and text
NB.+D = data to be boxed
NB.+    columns remaining to be summed ie: numeric 
NB.-example:
NB.+  D =: <"0 (0,0,i.6),.(0 0 1 1 2 2 0 0 ),. 8 5 $1
NB.+  0 nubsum  D
NB.+  0 1 nubsum D 
NB.+  0 1 2 nubsum D
NB.-
NB.+  D1 =: (<"0 'aabbcdef'),.D
NB.+  0  nubsum D1
NB.+  0 1 nubsum D1
NB.-
NB.+  D2 =: (<"0 'aghnmcde'),.D1
NB.+  0 1 nubsum D2
NB.+  0 1 2 nubsum D2
NB. ---------------------------------------------------------
nubsum =: 4 : 0
KEY =. x{"1 y
NUB =. ~. KEY
COLS =. i. 1{ $ y
COLSDATA =. ( -. COLS e. x) # COLS      NB. Columns that are left
DATAS =. > COLSDATA {"1 y               NB. data to be numeric and boxed
SELF_CLASSIFY =. = KEY
RES =. <"0  SELF_CLASSIFY +/ . * DATAS
NUB,.RES
)


NB. =========================================================
NB.*nubsum_code d - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Sums for code - numerical data.
NB.-syntax:
NB.+(D)nubsum_code(C)
NB.+D = N x 2  matrix of index and data
NB.+C = code to be summed
NB.-example: 
NB.+ 2 1 nubsum_code 2
NB.+1 0
NB.-
NB.+ ZZ =: 5 2 $ 2 1 3 2 0 1 3 12 2 99
NB.+ ZZ nubsum_code 2
NB.+2 100
NB.-
NB.+  >ZZ & nubsum_code each (~. 0{"1 ZZ)
NB.+2 100
NB.+3  14
NB.+0   1
NB.-
NB.+  ZZZ =: 100000 2 $ 2 1 3 2 0 1 3 12 2 99 
NB.+   > ZZZ & nubsum_code each (~. 0{"1 ZZZ)
NB.+2 2000000
NB.+3  280000
NB.+0   20000
NB.-
NB.+  ZZZZ =: ? 100000 2 $ 1000
NB.+  > ZZZZ & nubsum_code each (~. 0{"1 ZZZZ)
NB. ---------------------------------------------------------
nubsum_code =: 4 : 0
CODES   =. 0{"1 x
DDD     =. 1{"1 x
CODESX  =. I. CODES = y
RES1   =. +/ CODESX { DDD
y, RES1
)


NB. =========================================================
NB.*nubsum_all d - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Nub sum by code for data.
NB.- Try to make faster.
NB.-syntax:
NB.+(C)nubsum_all(D)
NB.+C = vector of codes
NB.+D = Vector of values to be summed
NB.-example:
NB.+  0 1 2 4 5 2 0 1 nubsum_all 1 2 3 4 5 6 7 8
NB.+0  8
NB.+1 10
NB.+2  9
NB.+4  4
NB.+5  5
NB.-
NB.+  ZZZZZ =: ? 100000 2 $ 10
NB.+  sort (0{"1 ZZZZZ) nubsum_all (1{"1 ZZZZZ)
NB. ---------------------------------------------------------
nubsum_all =: 4 : 0
NUBC =. # NUB =. ~. x
CNT =. 0
RES =. ,: (CNT{NUB),+/(I.((CNT{NUB) = x)){y
CNT =. 1
while. CNT < NUBC do. RES =. RES,(CNT{NUB),+/(I.((CNT{NUB)  = x)){y 
                      CNT =. CNT +1 end.
RES
)


NB. =========================================================
NB.*index_sum_count d - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nubsum_code,max
NB.- Create sum and count from tables of codes and data.
NB. CHECKED against dev_general
NB. NOT AS FAST AS array_general ?
NB. Index starts at 0.
NB.-syntax:
NB.+(C)index_sum_count(D)
NB.+C = matrix of codes used for sum and count
NB.+D = matrix of data to be summed and counted
NB.-example:
NB.+  R =: (0 1 2 3 4 2 3 0 12)index_sum_count(10 12 23 20 11 13 14 99 1212)
NB.+109 12 36 34 11 0 0 0 0 0 0 0 1212     NB. Sum by codes 
NB.+  2  1  2  2  1 0 0 0 0 0 0 0 1        NB. Count by codes
NB.-
NB.+  (i. 13), (0 1 2 3 4 2 3 0 12)index_sum_count(10 12 23 20 11 13 14 99 1212)
NB.+  0  1  2  3  4 5 6 7 8 9 10 11   12   NB. Codes
NB.+109 12 36 34 11 0 0 0 0 0  0  0 1212   NB. Sum by codes
NB.+  2  1  2  2  1 0 0 0 0 0  0  0    1   NB, Count by codes
NB.-
NB.+  $R =:  (C =: (i. 10),.i. 10)index_sum_count(D =: 10 3 $ 1000)
NB.+4 10 10
NB.-
NB.+  $R =: (C1=: (i.5),.(i.5),.(i.5))index_sum_count(D1 =: 5 3 $ 1000)
NB.+4 5 5 5
NB.-
NB.+  C2 =:  10000 3 $ 0 1 2 3 4   NB. 3 columns of index
NB.+  D2 =: ? 10000 8 $ 100        NB. 8 columns data
NB.+  $ R =: (C2)index_sum_count(D2)
NB.+9 5 5 5
NB. ---------------------------------------------------------
index_sum_count =: 4 : 0
ROWS =. 0{ $ x
INDX =. 1 + max ,.x
INDY =. 1 + 1{ $ ,.y  NB. Allow for data count.
DIM_OUT =. (INDY,INDX)
NB. Insert 1 in data for count
DD   =. ,y,.1
MAT_0 =. , DIM_OUT $ 0
NB.
IN1  =.  > INDY # <"1 ,.x
IN2  =. ,> ,ROWS # <(i. INDY)
IN3  =. IN2,.IN1
INDC =. DIM_OUT #. IN3 NB. Index
NB. THis is the slow part !!!
INDCC =. ~. INDC
RES =. > (INDC,.DD)& nubsum_code each INDCC
NB.
RES1 =. (1{"1 RES) (INDCC) } MAT_0
RES2 =. DIM_OUT $ RES1
)


NB. =========================================================
NB. Creating data arrays
NB. =========================================================


NB. ================================================================
NB.*darray1 d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first column.
NB.- Sums are in other columns
NB.-syntax:
NB.+(N)darray1(D)
NB.+N = set array dimension eg: 5
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first column and data in 
NB.+    the remaining columns.
NB.-example:
NB.+ $ (5)darray1( Z =: 0 + ? (10 2 $ 5))
NB.+5 2
NB.- $ (10)darray1( Z =: 0 + ? (30 3 $ 5))
NB.-10 3
NB. ---------------------------------------------------------
darray1 =: 4 : 0
TT =: (|: (0{"1 y)&="0 i.x)
RES1 =: ,. +/ TT
C  =: _1 + 1{ $ y        NB. Number of data columns
C1 =: 1                  NB. Counter
while. C1 <: C do.
   RES1 =. RES1 ,. +/ (C1{"1 y) * TT
   C1 =. C1 + 1
end.   
RES1
)


NB. ============================================================
NB.*darray2 d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> array1
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first table.
NB.+(N)darray2(D)
NB.+N = set array dimensions eg: 5 5 eg: 4 6 etc
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first two columns and data in
NB.+    the remaining columns.
NB.-example:
NB.+  $ (5 5)darray2(Z =: 0 + ? (10 4 $ 5))
NB.+3 5 5  
NB. ---------------------------------------------------------
darray2 =: 4 : 0
Z1 =. x #. 0 1{"1 y                    NB. gives position in matrix
D =. Z1,.( 2 }."1 y)                   NB. restructure y to be used with 'array1'
RES1 =. (*/x)  darray1 D                NB. create result as a table.
((1{$D),x) $ (, |: RES1)               NB. reshape for final result
)


NB. =============================================================
NB.*darray3 d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> dev1
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first table.
NB.-syntax:
NB.+(N)darray3(D)
NB.+N = set matrix dimemsions eg: 5 5 5 eg: 4 6 8 etc
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first three columns and data in
NB.+    the remaing columns.
NB.-example:
NB.+  $ (5 5 5)darray3(Z =: 0 + ?(10 5 $ 5))
NB.+3 5 5 5
NB. ---------------------------------------------------------
darray3 =: 4 : 0
Z1 =. x #. 0 1 2{"1 y             NB. gives position in matrix
D=. Z1,.( 3 }."1 y)               NB. restructure y to be used with 'dev1'
RES1 =. (*/x)  darray1 D           NB. creates result as a table.
((1{$D),x) $ (, |: RES1)          NB. reshape for final result
)


NB. =============================================================
NB.*darray4 d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> dev1
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first table.
NB.-syntax:
NB.+(N)darray3(D)
NB.+N = set matrix dimensions eg: 5 5 5 5 eg: 4 4 6 8 etc
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first four columns and data in
NB.+    in the remaining columns
NB.-example:
NB.+   ($ 5 5 5 5)darray4(Z =: 0 + ? 10 6 $ 5)
NB.+3 5 5 5 5
NB. ---------------------------------------------------------
darray4 =: 4 : 0
Z1 =: x #. 0 1 2 3{"1 y        NB. gives position in matrix
D=. Z1,.( 4 }."1 y)            NB. restructure y to be used with 'dev1'
RES1 =: (*/x)  darray1 D          NB. creates result as a table.
((1{$D),x) $ (, |: RES1)       NB. reshape for final result
)


NB. =============================================================
NB.*darray5 d - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> dev1
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first table.
NB.-syntax:
NB.+(N)darray5(D)
NB.+N = set matrix dimensions eg: 5 5 5 5 5 eg. 4 4 4 6 8 etc
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first five columns and data in
NB.+    in the remaining columns
NB.-example:
NB.+   $ (5 5 5 5 5)darray5(Z =: 0 + ? 10 7 $ 5)
NB.+3 5 5 5 5 5
NB. ---------------------------------------------------------
darray5 =: 4 : 0
Z1 =: x #. 0 1 2 3 4{"1 y       NB. gives position in matrix
D=.Z1,.( 5 }."1 y)              NB. restructure y to be used with 'dev1'
RES1 =: (*/x)  darray1 D        NB. creates result as a table.
((1{$D),x) $ (, |: RES1)        NB. reshape for final result
)


NB. =============================================================
NB.*darray6 d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> dev1
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first table.
NB.-syntax:
NB.+(N)darray6(D)
NB.+N = set matrix dimensions eg: 5 5 5 5 5 5 eg. 4 4 4 4 6 8 etc
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first six columns and data in
NB.+    in the remaining columns
NB.-example:
NB.+   $ (5 5 5 5 5 5)darray6(Z =: 0 + ? 10 7 $ 5)
NB.+2 5 5 5 5 5 5 
NB. ---------------------------------------------------------
darray6 =: 4 : 0
Z1 =: x #. 0 1 2 3 4 5{"1 y       NB. gives position in matrix
D=. Z1,.( 6 }."1 y)               NB. restructure y to be used with 'dev1'
RES1 =: (*/x)  darray1 D          NB. creates result as a table.
((1{$D),x) $ (, |: RES1)          NB. reshape for final result
)


NB. =============================================================
NB.*darray7 d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> dev1
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first table.
NB.-syntax:
NB.+(N)darray7(D)
NB.+N = set matrix dimensions eg: 5 5 5 5 5 5 5 eg. 4 4 4 4 4 6 8 etc
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first seven columns and data in
NB.+    in the remaining columns
NB.-example:
NB.+  $ (5 5 5 5 5 5 5)darray7( Z =: ? 10 9 $ 5)
NB.+3 5 5 5 5 5 5 5
NB. ---------------------------------------------------------
darray7 =: 4 : 0
Z1 =: x #. 0 1 2 3 4 5 6{"1 y      NB. gives position in matrix
D=. Z1,.( 7 }."1 y)                NB. restructure y to be used with 'dev1'
RES1 =: (*/x)  darray1 D           NB. creates result as a table.
((1{$D),x) $ (, |: RES1)           NB. reshape for final result
)


NB. ===========================
NB.*darray8 d - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> dev1
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- the data is not included.
NB.- No error is generated to show that the data code is not in the range.
NB.- Data count is in the first table.
NB.-syntax:
NB.+(N)darray8(D)
NB.+N = set matrix dimensions eg: 5 5 5 5 5 5 5 5 eg. 4 4 4 4 4 4 6 8 etc
NB.+D = matrix of data to be summarised of
NB.+    which data codes are in the first eight columns and data in
NB.+    in the remaining columns
NB.-example:
NB.+ $ (5 5 5 5 5 5 5 5)darray8(Z =: ?10 10 $ 5)
NB.+3 5 5 5 5 5 5 5 5 
NB. ---------------------------------------------------------
darray8 =: 4 : 0
Z1 =. x #. 0 1 2 3 4 5 6 7{"1 y       NB. gives position in matrix
D=. Z1,.( 8 }."1 y)                   NB. restructure y to be used with 'dev1'
RES1 =. (*/x)  darray1 D              NB. creates result as a table.
((1{$D),x) $ (, |: RES1)              NB. reshape for final result
)


NB. =========================================================
NB.*darray d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- General development verb - useful for large data cases.
NB.- Data codes have been determined as required.
NB.- If the data code is not range of the array dimension then 
NB.- an index error is generated.
NB.- This should be fixed and then development can be completed.
NB.- Data count is in the last dimemsion.
NB.-syntax:
NB.+(N)darray(D)
NB.+N = set array dimensions eg: 5 5 5 5 5 5 5 5 eg. 4 6 8 8 3 4 5 6 etc
NB.+D = matrix of data to be summarised of which data codes 
NB.+    are in the first #N columns and data. in the remaing columns.
NB.-example:
NB.+  $ (5)darray(Z =: ? 10 1 $ 5)
NB.+1 5
NB.-
NB.+  $ (5)darray(Z =: ? 10 2 $ 5)
NB.+2 5
NB.-
NB.+  $ (5 5)darray(Z =: ? 100000 8 $ 5)
NB.+7 5 5
NB.-
NB.+  $ (5 5 10 10)darray(Z =: ? 100000 8 $ 5)
NB.+5 5 5 10 10
NB.-
NB.+  $ (5 5 10 10)darray(Z =: ? 10000000 10 $ 5)  NB. Large data
NB.+7 5 5 10 10
NB.
NB.+   (5 2 10 10)darray(Z =: ? 100000 8 $ 5)  NB. Indexes not in range
NB.+|index error: darray
NB.+|   RESS=.(,0{"1 GROUP_S)    (INDX_S)}MAT_0
NB.+|[-0]  
NB. ---------------------------------------------------------
darray =: 4 : 0
NB.DATA =. ,. y
NB. DIM =. x
R    =. # x      
MAT_0 =. ,  x $ 0
INDX =. x #. R{."1 y
INDX_S =. sort ~. INDX
DD =. sort INDX,. R}."1  y,.1
GROUP =. insert_equal 0{"1 DD
GROUP_S =.(> GROUP +/;.1 (}."1 DD))
COLS =. 1{ $ GROUP_S
CC =. 1
RESS =. (,0{"1 GROUP_S)(INDX_S)} MAT_0
RESS =. (1,x) $ RESS
while. CC < COLS do. RESS =. RESS, (x $ (,CC{"1 GROUP_S)(INDX_S)} MAT_0)
                     CC =. CC+1
                 end.
RESS
)


NB. =========================================================
NB.*data_codes m - 
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> sort
NB.- Get the data codes from raw data. 
NB.- Result is a boxed table of an index and data codes. 
NB.- Data codes are sorted.
NB.-syntax:
NB.+data_codes(D)
NB.+D = data codes: required to be a boxed list.
NB.+    text or numeric 
NB.-example:
NB.+  data_codes <"0 'sadfhyerZZ'
NB.+  data_codes <"0 [? 10 # 10 
NB. ---------------------------------------------------------
data_codes =: 3 : 0
C =. sort ~. y 
(<"0 i.#C),. C
)

