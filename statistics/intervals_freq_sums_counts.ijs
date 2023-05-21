NB. =========================================================
NB.%intervals_freq_sums_counts.ijs - Intervals,frequency,sums,counts
NB.-<script src="../js/statistics_links.js"></script>
NB.- Script: ~addons/finance/finexec/statistics/intervals_freq_sums_counts.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2023 03 17
NB.- Depend: Nil
NB.- Definitions: loaded to locale base
NB.- Status: dev
NB.- <a href="../intervals_freq_sums_counts.ijs" target="_blank">Script source: intervals_freq_sums_counts.ijs</a>
NB.-<hr>
NB.- Intervals,frquency,sums,counts
NB.-<hr>
NB.- See stats functions from: '~addons/stats/base.ijs'
NB.- base.ijs loads complete set of base statistical verbs into locale z.
NB.-<hr>
NB.- Equations:
NB.- To Do
NB.-<hr>


NB. ==============================================================
NB.*interval v Whether a number is contained in the z0 <= z <= z1.
NB.  Left and Right hand points are contained in the interval - closed interval.
NB. FORM: x intervalr y
NB.       x = <X1,X2> upper and lower bounds of interval
NB.       y = <number> 
NB. EXAMPLE: (1 2) interval  7 
NB. EXAMPLE: (1 2) & interval each 1 1.7 2 1.5 3 2.1 10 0.5
NB. ---------------------------------------------------------
interval =: 4 : 0
'Z0 Z1' =. x
R =. (Z0 <: y) * ( y <: Z1)
)


NB. =========================================================
NB.*intervalr v Whether number is contained in z0 < z <= z1.
NB.  Right hand point contained in the interval - closed on right side.
NB. REVIEWED: 2/8/2005
NB. FORM: x intervalr y
NB.       x = <X1,X2> upper and lower bounds of interval
NB.       y = <number> 
NB. EXAMPLE: (1 2) intervalr   7 
NB. EXAMPLE: (1 2) & intervalr each 1 1.7 2 1.5 3 2.1 10 0.5
NB. ---------------------------------------------------------
intervalr =: 4 : 0
'Z0 Z1' =. x
R =. (Z0 < y) * ( y <: Z1)
)


NB. ======================================================================
NB.*sum_intervalr v Sum of numbers that is contained in the z0 < z <= z1.
NB.  Right hand point contained in the interval.
NB. FORM: x sum_intervalr y
NB.       x = <numbers> 
NB.       y = <X1,X2> upper and lower bounds of interval
NB. EXAMPLE: (0.1 1 2 3 4 5 6 7 1.1) sum_intervalr (1 2) 
NB. EXAMPLE: (0.1 1 2 3 4 5 6 7 1.1) & sum_intervalr each (1 2);(2 4) 
NB. EXAMPLE: (0.1 1 2 3 4 5 6 7 1.1) & sum_intervalr"1 (2 2 $ 1 2 2 4) 
NB. ---------------------------------------------------------
sum_intervalr =: 4 : 0
'Z0 Z1' =. y
R =. +/ ((Z0 < x) * ( x <: Z1)) # x
)


NB. ========================================================================
NB.*interval_count v Count the numer of items in an interval z0 <= z <= z1. 
NB.  The interval contains both endpoints - closed interval.
NB. FORM: x interval_count y
NB.       x = <data>
NB.       y = <Left & Right bounds of the interval>
NB. EXAMPLE:   (0 1 2 3 4 5 6) interval_count (1 5)
NB. ---------------------------------------------------------
interval_count =: 4 : 0
'Z0 Z1' =. y
RES =. +/ (Z0 <: x) * ( x <: Z1)
)


NB. ========================================================================
NB.*interval_countr v Count the numer of items in an interval z0 < z <= z1. 
NB.  The interval contains the RIGHT endpoint but not the left - closed on the right
NB. FORM: x interval_countr y
NB.       x = <data>
NB.       y = <Left & Right bounds of the interval>
NB. EXAMPLE:  (0 1 2 3 4 5 6) interval_countr (1  5)
NB. ---------------------------------------------------------
interval_countr =: 4 : 0
'Z0 Z1' =. y
RES =. +/ (Z0 < x) * ( x <: Z1)
)


NB. ==================================================
NB.*freq_dist_count v Frequency distribution of data.
NB. Intervals are closed on the right ie. (a < x <= b)
NB. FORM: x freq_dist_count y
NB.       x = <X1, X2, X3> describes the range and intervals
NB.             X1 = lowest value
NB.             X2 = highest value
NB.             X3 = number of intervals to be in the X1 to X2
NB.                  Values outside X1, X2 are grouped separately
NB.                  Thus there are (X2 + 2) groups 
NB.             y = data vector   
NB. EXAMPLE:  (1 5 4) freq_dist_count (0.3 * i. 12)
NB. ---------------------------------------------------------
freq_dist_count =: 4 : 0
'X0 X1 X2' =. x
R =. (X1 - X0) % X2 
RR =. ((X2+2),2) $ ( __,(, 2 # (X0 + R * i. 1 + X2)),_)
RMID =. X0, ( X0 + (R%2) + R * i. X2), X1  
RES1 =. y & interval_countr"1 RR 
RES =. RR ,. RES1
)


NB. =========================================================================
NB.*freq_dist_countv v Frequency distribution of data with varying intervals.
NB. Intervals are closed on the right ie. (a < x <= b)
NB. FORM: x freq_dist_count y
NB.       x = <vector of intervals> 
NB.       x = X0, X1, X2, X3, ..... XN
NB.           Values outside x0, xn are grouped separately
NB.           Thus there are (n + 2) groups 
NB.       y = <data vector>   
NB. EXAMPLE:  (1 3 5 7) freq_dist_countv (0.3 * i. 12)
NB. ---------------------------------------------------------
freq_dist_countv =: 4 : 0
N =. _1 + # x 
X0 =. 0{x 
XN =. _1{x
RR =. ((N+2),2) $  __, (2 # x),_
RMID =. X0, (0.5 * (1}. x) + (_1}. x)), XN
RES1 =. y & interval_countr"1 RR 
RES =. RR ,. RES1
)


NB. ========================================================================
NB.*freq_count_sum v Frequency dustribution and sum with varying intervals.
NB.  Intervals are closed on the right ie. (a < x <= b)
NB. FORM: x freq_count_sum y
NB.       x = <vector of intervals> 
NB.       x = X0, X1, X2, X3, ..... XN
NB.           Values outside x0, xn are grouped separately
NB.           Thus there are (n + 2) groups 
NB.       y = <data vector>   
NB. EXAMPLE:  (1 3 5 7) freq_count_sum (0.3 * i. 12)
NB. ---------------------------------------------------------
freq_count_sum =: 4 : 0
N =. _1 + # x 
X0 =. 0{x
XN =. _1{x
RR =. ((N+2),2) $  __, (2 # x),_
RMID =. X0, (0.5 * (1}. x) + (_1}. x)), XN
RES1 =. y & interval_countr"1 RR 
RES2 =. y & sum_intervalr"1 RR
RES  =. RR ,. RES1,.RES2
)


NB. =========================================================
NB.*histogram v Generates histogram from data.
NB. Taken from definition of I. in the J Dictionary 
NB. FORM:  x histogram y
NB.        x = <interval end-points>
NB.        y = <data>
NB. EXAMPLE:
NB.        E =: 5 * i. 40
NB.        D =: +/ 10 1e6 ?.@$ 21 
NB. H =: E histogram D  
NB. plot H 
NB. 0 I. _0.01 0 0.01
NB. EXAMPLE: plot 1 2 3 histogram 0 0 2 3 4 5 6 29 _1 0 5.5 6.7 2.2 3.2 1.1 
NB. EXAMPLE: 'bar' plot (i. 10) histogram ? 100 # 10 
NB. ---------------------------------------------------------
histogram=: <: @ (#/.~) @ (i.@#@[ , I.)



