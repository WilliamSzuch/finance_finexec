NB. =========================================================
NB.%stat_tools.ijs - Stat tools
NB.-<script src="../js/statistics_links.js"></script>
NB.- Script: ~addons/finance/finexec/statistics/intervals_freq_sums_counts.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2023 03 17
NB.- Depend: Nil
NB.- Definitions: loaded to locale base
NB.- Status: dev
NB.- <a href="../intervals_freq_sums_counts.ijs" target="_blank">Script source: intervals_freq_sums_counts.ijs</a>
NB.-<hr>
NB.- Stat tools: random numbers
NB.-             deviations,stddev
NB.-             selections
NB.-             lists
NB.-<hr>
NB.- See stats functions from: '~addons/stats/base.ijs'
NB.- base.ijs loads complete set of base statistical verbs into locale z.
NB.-<hr>
NB.- Equations:
NB.- To Do
NB.-<hr>



NB. ===============================================================
NB.*deviation_mat v Devations from mean for matrices down columns.
NB. FORM: deviation_mat y
NB.       y = <matrix>
NB. EXAMPLE: deviation_mat i. 5 5
NB. ---------------------------------------------------------
deviation_mat  =: -"_1 _ mean       


NB. =======================================
NB.*var_biased v Biased variance estimate.
NB. Total population sample - use: n (instead (n-1))
NB. FORM: var_biased y 
NB.       y = <data>
NB. EXAMPLE: var_biased ? >: i. 100
NB. ---------------------------------------------------------
var_biased   =: (ssdev % #)       


NB. ==============================================
NB.*stddev_biased v Biased standard dev estimate.
NB. Total population sample - use: n^2 (instead n*(n-1))
NB. FORM: stddev_biased y 
NB.       y = <data>
NB. EXAMPLE: stddev_biased ? >: i. 100
NB. ---------------------------------------------------------
stddev_biased =: %:@ var_biased  


NB. =========================================================
NB. Random numbers 
NB. =========================================================


NB. ==============================================
NB.*random_0to1 v Random numbers between 0 and 1.
NB. FORM: random_0to1 y
NB.       y = <Number of randon nembers>
NB. EXAMPLE: random_0to1 100
NB. ---------------------------------------------------------
random_0to1 =: (>:@? % 2147483647&[) @ $ & 2147483646 


NB. ============================================
NB.*random_seed v Randomizing random number seed.
NB. Based on computer clock time. 
NB. FORM: random_seed y
NB. EXAMPLE: random_seed ''
NB. ---------------------------------------------------------
random_seed =: 9!:1@<.@(+/ .^&2@(6!:0@]))


NB. =========================================================
NB. Selections  
NB. =========================================================

NB. ===============================================================
NB.*select_with_repl v Select x numbers from y's with replacement.
NB. REVIEWED:
NB. FORM: x select_with_repl y
NB. EXAMPLE: 5 select_with_repl 10
NB. ---------------------------------------------------------
select_with_repl =: ?@#                       


NB. ================================================================
NB.*select_no_repl v Select x numbers from y's without replacement.
NB. REVIEWED:
NB. FORM: x select_no_repl y
NB. EXAMPLE: 5 select_no_repl 10
NB. ---------------------------------------------------------
select_no_repl=: ?  


NB.=================================
NB.*shuffle v Random shuffle of y
NB. REVIEWED:
NB. FORM: shuffle y  Y. = items to be shuffled
NB. EXAMPLE: shuffle 6 34 100 12 23
shuffle=: {~ ?~@# 


NB. ******************************************
NB. Lists, Sums of groups and grouping of data
NB. ******************************************
NB. Note 'nubcount' in 'misc.ijs' & 'colsum' in 'numeric.ijs' 
NB. and both in 'z' locale

NB. ======================================================================
NB.*nubsum v  Produce totals for subgroups based on the 'nub' of the goup.
NB. Data is a 'boxed matrix' ie. y 
NB. x = columns to determine the nub.
NB. y = data to determine nub and to be grouped.
NB. REVIEWED:
NB. FORM: x nubsum y
NB. EXAMPLE: 0 1 nubsum <"0 i. 5 6 
NB. ---------------------------------------------------------
nubsum =: 4 : 0
s =. x
key =. x{"1 y
nub =. ~. key
cols =. i. 1{ $ y
colsdata =. ( -. cols e. s) # cols      NB. Columns that are left
datas =. > colsdata {"1 y               NB. data to be numeric and boxed
self_classify =. = key
res =. <"0  self_classify +/ . * datas
nub,.res
)


NB. =========================================================
NB.*nubsum_indx v Sums for nubs - numerical data.
NB. REVIEWED: 30/9/2009
NB. FORM: x nubsum_indx y
NB.       x = <n x 2  matrix of index and data>
NB.       y = <index to be summed>
NB. EXAMPLE: 2 1 nubsum_indx 2
NB. EXAMPLE: (ZZ =: 5 2 $ 2 1 3 2 0 1 3 12 2 99 )nubsum_indx 2
NB. (ZZ =: 5 2 $ 2 1 3 2 0 1 3 12 2 99 )
NB. EXAMPLE: RES =: > ZZ & nubsum_indx each (~. 0{"1 ZZ)
NB. (ZZZ =: 100000 2 $ 2 1 3 2 0 1 3 12 2 99 )
NB. EXAMPLE: RES =: > ZZZ & nubsum_indx each (~. 0{"1 ZZZ)
NB.  (ZZZ =: ? 100000 2 $ 1000)
NB. EXAMPLE: RES =: > ZZZ & nubsum_indx_statistics_ each (~. 0{"1 ZZZ)
NB. ---------------------------------------------------------
nubsum_indx =: 4 : 0
INDX   =. 0{"1 x
DDD    =. 1{"1 x
INDXX  =. I. INDX = y
RES1   =. +/ INDXX { DDD
RES2   =. y, RES1
)


NB. =========================================================
NB.*nubsum_all v Nub sum for matrix.
NB. Try to make faster.
NB. REVIEWED: 1/10/2009
NB. FORM: x nubsum_all y
NB.       x = <vector of codes>
NB.       y = <Vector of values to be summed>
NB. EXAMPLE: 0 1 2 4 5 2 0 1 nubsum_all 1 2 3 4 5 6 7 8
NB.  (ZZZ =: ? 100000 2 $ 1000)
NB. EXAMPLE:  RES =:  (0{"1 ZZZ) nubsum_all (1{"1 ZZZ)
NB. ---------------------------------------------------------
nubsum_all =: 4 : 0
NUBC =. # NUB =. ~. x
CNT =. 0
RES =. ,: (CNT{NUB),+/(I.((CNT{NUB) = x)){y
CNT =. 1
while. CNT < NUBC do. RES =. RES,(CNT{NUB),+/(I.((CNT{NUB)  = x)){y 
                      CNT =. CNT +1 end.
)


NB. ============================================================
NB.*common v Shows which items are in common between two lists.
NB. REVIEWED:
NB. FORM: common y Where: y (List1);(List2)
NB. Each list should not have any items repeated
NB. Carefull about BOXED lists
NB. RESULT: [1] List of items in common
NB.         [2} Index of items in common on first list 
NB.         [3] Index of items in common on second list
NB. ---------------------------------------------------------
common=: 3 : 0
L1 =: , >0{y
L2 =: , >1{y
NB. Check on lists
if. (#L1) = # ~. L1 do. zzOUT 'List 1 is OK' else. zzOUT 'List 1 has repeated items' return. end.
if. (#L2) = # ~. L2 do. zzOUT 'List 2 is OK' else. zzOUT 'List 2 has repeated items' return. end.
C =. (L1 e. L2) # L1   NB. Items in common
I1 =. L1 i. C
I2 =. L2 i. C
RES =. C;I1;I2
)


NB. =========================================================================
NB.*repeats v Number of times each item in the list is repeated in the list.
NB. REVIEWED:
NB. FORM: repeats y Where y = list
NB. EXAMPLE: repeats 1 2 3 4 3 2 3 4 5 6 2 2 3 4 5 23
NB. ---------------------------------------------------------
repeats =: 3 : 0
R =. y& repeat"0 y 
)


NB. ========================================================
NB.*repeat v Number of times an item is repeated in a list.
NB. REVIEWED: 
NB. FORM: x repeat y
NB.       x = list, y = item
NB. EXAMPLE: (1 2 3 4 2 3 4 5 6 3 4) repeat 3 
repeat =: 4 : 0 
+/ y = x
)


NB. === END of SCRIPT ===========================================================



