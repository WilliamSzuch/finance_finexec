NB. =========================================================
NB.TXT =: readcsv '~addons/finance/finexec/actuarialnonlife/exampledata/table_2.csv'
NB. [TN =: > ". each TXT   NB. Numeric


NB. =========================================================
NB.*Table_1 n Claim numbers:Incident/Report period
Table_B1 =: data_table 0 : 0
42  7   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0 58   9   0   1   1   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0 113  11   1   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0 174  10   0   1   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0 144   8   0   1   0   0   1   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0 142   5   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  1  0  0  1  0  0  0
 0  0   0   0   0   0 157   3   1   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0 141   8   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0 195   6   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0 177   2   2   0   0   0   0   2  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0 189  11   1   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0 203   5   3   0   0   1  0  1  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0 183   2   1   0   1  0  0  0  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0 168   3   0   0  0  2  0  0  1  0  0  0  0  0  0  1
 0  0   0   0   0   0   0   0   0   0   0   0   0   0 119   4   0  0  0  0  0  0  0  0  0  0  0  1  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0 115   6  0  1  0  1  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 103  0  0  0  0  0  1  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 67  5  1  1  0  0  0  0  1  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0 58  7  0  0  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0 58  1  1  0  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0 45  7  1  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0 49  2  0  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0 28  1  0  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0 37  4  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0 46  0  0  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0 46  1  0  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0 25  4  0
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0 26  1
 0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0  0  0  0  0  0  0  0  0  0  0  0 18
)


[Table_B2 =: rotate1 cumm_sum Table_B1


NB. =========================================================
NB. Cummulative development rations
NB. [T1 =: _1}. 1}."1 Table_B2
NB. [T2 =: _1}."1 [ _1}. Table_B2
NB. [Table_B3 =: T1% T2


[Average_R =: avg_dev Table_B3
('title Average Ratios') plot Average_R

[Assumed_R =:Average_R


[Assumed_RR =: */\"1 |. rotate1 |.(29 29 $ Assumed_R,1.00)*(lowertriR 29) 


[Claims_Reported =: [28{"1 Table_B1a =: cumm_sum Table_B1



[Claims_Projected =: Claims_Reported * Assumed_RR


$ Table_B1 29 29 


[Claims_Dev =: 29{."1 rotate1 (cumm_sum Table_B1),.Claims_Projected