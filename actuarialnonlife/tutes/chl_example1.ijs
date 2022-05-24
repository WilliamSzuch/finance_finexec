NB. =========================================================
NB.TXT =: readcsv '~addons/finance/finexec/actuarialnonlife/exampledata/table_2.csv'
NB. [TN =: > ". each TXT   NB. Numeric






NB. =========================================================
NB. Example 1: Get and review raw claims data.


NB. =========================================================
NB.TXT =: readcsv '~addons/finance/finexec/actuarialnonlife/exampledata/table_1.csv'
NB. TN =: > ". each TXT   NB. Numeric

NB. =========================================================
NB.*Table_1 n Claim numbers:Incident/Report period
Table_1 =: data_table 0 : 0
1876  361   32   12   12   10    2   11
   0 1985  342   29   23   15    5    8
   0    0 1910  360   37   16   13    8
   0    0    0 1720  364   28   17    8
   0    0    0    0 1606  296   31   12
   0    0    0    0    0 2113  391   37
   0    0    0    0    0    0 2308  450
   0    0    0    0    0    0    0 2514
)



NB. =========================================================
NB. [Table_2 =: rotate1 cumm_sum Table_1
NB.*Table_2 n Claim number: Incident/Development period
Table_2 =: data_table 0 : 0
1876 2237 2269 2281 2293 2303 2305 2316
1985 2327 2356 2379 2394 2399 2407    0
1910 2270 2307 2323 2336 2344    0    0
1720 2084 2112 2129 2137    0    0    0
1606 1902 1933 1945    0    0    0    0
2113 2504 2541    0    0    0    0    0
2308 2758    0    0    0    0    0    0
2514    0    0    0    0    0    0    0
)


NB. =========================================================
NB. Cummulative development rations
NB. [T1 =: _1}. 1}."1 Table_2
NB. [T2 =: _1}."1 [ _1}. Table_2
NB. Table_3 =: T1% T2
NB.*Table_3 n Cummulative development ratios
Table_3 =: data_table 0 : 0
1.19243  1.0143 1.00529 1.00526 1.00436 1.00087 1.00477
1.17229 1.01246 1.00976 1.00631 1.00209 1.00333       0
1.18848  1.0163 1.00694  1.0056 1.00342       0       0
1.21163 1.01344 1.00805 1.00376       0       0       0
1.18431  1.0163 1.00621       0       0       0       0
1.18504 1.01478       0       0       0       0       0
1.19497       0       0       0       0       0       0
)

NB. =========================================================
NB. Average development ratios
NB. [Average_R =: avg_dev Table_3
Average_R =: 1.18988 1.0146 1.00725 1.00523 1.00329 1.0021 1.00477
NB. ('title Average Ratios') plot Average_R

NB. =========================================================
NB. Review results
NB. ,.(<Table_1),(<Table_2),(<Table_3),(<Average_R)

NB. =========================================================
NB. Assumed cummulative ratios
Assumed_R =: 1.1900 1.015 1.0070 1.0050 1.0030 1.0020 1.0050 
NB. ('title Assumed Ratios')plot Assumed_R
NB. ('title Ratios')plot Average_R,:Assumed_R
NB. ('title Ratios';'ylog 2') plot Average_R,:Assumed_R


NB. =========================================================
NB. Allow for development after 7 devlopment periods
[Assumed_RR =: */\"1 |. rotate1 |.(8 8 $ Assumed_R,1.003)*(lowertriR 8) 
Assumed_RR = data_table 0 : 0
1.003       0       0       0       0       0       0       0
1.005 1.00801       0       0       0       0       0       0
1.002 1.00701 1.01003       0       0       0       0       0
1.003 1.00501 1.01003 1.01306       0       0       0       0
1.005 1.00801 1.01003 1.01508 1.01813       0       0       0
1.007 1.01203 1.01507  1.0171 1.02219 1.02525       0       0
1.015  1.0221 1.02722  1.0303 1.03236 1.03752 1.04063       0
 1.19 1.20785  1.2163 1.22239 1.22605 1.22851 1.23465 1.23835
)


NB. =========================================================
NB. Projected cummulative claimns by Report period
Claims_Reported =: [7{"1 Table_1a =: cumm_sum Table_1
[Claims_Projected =: Claims_Reported * Assumed_RR

[Claims_Dev =: 9{."1 rotate1 (cumm_sum Table_1),.Claims_Projected
Claims_Dev =: data_table 0 : 0
1876    2237    2269    2281    2293    2303    2305    2316 2322.95
1985    2327    2356    2379    2394    2399    2407 2419.03 2426.29
1910    2270    2307    2323    2336    2344 2348.69 2360.43 2367.51
1720    2084    2112    2129    2137 2143.41  2147.7 2158.44 2164.91
1606    1902    1933    1945 1954.72 1960.59 1964.51 1974.33 1980.26
2113    2504    2541 2558.79 2571.58  2579.3 2584.45 2597.38 2605.17
2308    2758 2799.37 2818.97 2833.06 2841.56 2847.24 2861.48 2870.06
2514 2991.66 3036.53 3057.79 3073.08  3082.3 3088.46 3103.91 3113.22
)

