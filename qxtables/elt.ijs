NB. =========================================================
NB.%elt.ijs - English Life Tables (ELT)
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Qx Tables</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/qxtables/elt.ijs
NB.- Contributor: William Szuch
NB.- Updated: 28/2/2021
NB.- Ddepend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../elt.ijs" target="_blank">Script source: elt.ijs</a>
NB.-<hr>
NB.- English Life Tables (ELT)
NB.- Names commence with ELT.
NB.- All mortality tables start at age = 0.
NB.- Note:
NB.- No Female tables provided in Actuarial Tables
NB.- for ELT 10 and ELT 12.
NB.-<hr>


NB. =========================================================
NB. Utility
data =. [: ". rplc&(LF;' ')  


NB. =========================================================
NB.*Qx_ELT n List of ELT tables
Qx_ELT =: 0 : 0
ELT_10_M        English Life Table No. 10 Males
ELT_12_M        English Life Table No. 12 Males
ELT_15_F        English Life Table No. 15 Females
ELT_15_M        English Life Table No. 15 Females
)


NB. =========================================================
NB.*ELT_10_M n English Life Table 10 Males   
NB. Actuarial Tables for Examination Purposes (Institute of Actuaries) - 1952
ELT_10_M =: data 0 : 0
0.07186 0.01530 0.00657 0.00441 0.00359 0.00343 0.00260 0.00218 0.00185 0.00161
0.00146 0.00139 0.00141 0.00151 0.00170 0.00197 0.00227 0.00259 0.00284 0.00302
0.00316 0.00325 0.00330 0.00334 0.00333 0.00330 0.00327 0.00328 0.00331 0.00335
0.00340 0.00349 0.00361 0.00378 0.00398 0.00421 0.00447 0.00474 0.00502 0.00531
0.00562 0.00598 0.00639 0.00687 0.00741 0.00799 0.00861 0.00925 0.00990 0.01057
0.01128 0.01206 0.01295 0.01393 0.01499 0.01614 0.01744 0.01890 0.02050 0.02224
0.02415 0.02630 0.02875 0.03150 0.03455 0.03791 0.04162 0.04568 0.05014 0.05502
0.06035 0.06615 0.07246 0.07938 0.08697 0.09519 0.10397 0.11325 0.12313 0.13373
0.14500 0.15687 0.16927 0.18229 0.19607 0.21048 0.22544 0.24078 0.25520 0.27031
0.28614 0.30270 0.31998 0.33800 0.35673 0.37619 0.39634 0.41720 0.43869 0.46081
0.48350 0.50671 0.53040 0.55447 0.57885 
)



NB. =========================================================
NB.*ELT_12_M n English Life Table 12 Males   
NB. Actuarial Tables for Examination Purposes (Institute of Actuaries) - 1980
ELT_12_M =: data 0 : 0
0.02449 0.00157 0.00099 0.00069 0.00062 0.00057 0.00052 0.00048 0.00044 0.00041
0.00039 0.00038 0.00038 0.00041 0.00047 0.00059 0.00078 0.00099 0.00112 0.00117
0.00119 0.00118 0.00114 0.00108 0.00102 0.00099 0.00098 0.00100 0.00104 0.00109
0.00115 0.00121 0.00128 0.00136 0.00145 0.00155 0.00167 0.00181 0.00196 0.00214
0.00235 0.00259 0.00287 0.00319 0.00356 0.00399 0.00448 0.00505 0.00570 0.00644
0.00728 0.00823 0.00930 0.01051 0.01184 0.01331 0.01492 0.01668 0.01859 0.02065
0.02287 0.02525 0.02778 0.03049 0.03339 0.03648 0.03978 0.04332 0.04712 0.05122
0.05566 0.06047 0.06570 0.07139 0.07759 0.08434 0.09167 0.09963 0.10824 0.11752
0.12747 0.13808 0.14934 0.16122 0.17366 0.18659 0.19997 0.21369 0.22765 0.24177
0.25593 0.27003 0.28396 0.29764 0.31096 0.32385 0.33623 0.34806 0.35929 0.36989
0.37983 0.38912 0.39776 0.40575 0.41312 
)


NB. =========================================================
NB.*ELT_15_F n English Life Table 15 Females   
NB. Actuarial Tables for Examination Purposes (Institute of Actuaries) - 2002
ELT_15_F =: data 0 : 0
0.00632  0.00055  0.00030  0.00022  0.00018  0.00016  0.00015  0.00014  0.00014
0.00013  0.00013  0.00014  0.00014  0.00015  0.00018  0.00022  0.00026  0.00031
0.00031  0.00032  0.00031  0.00032  0.00033  0.00033  0.00033  0.00034  0.00035
0.00036  0.00038  0.00040  0.00043  0.00047  0.00052  0.00057  0.00063  0.00069
0.00075  0.00082  0.00090  0.00098  0.00107  0.00117  0.00129  0.00142  0.00158
0.00177  0.00198  0.00219  0.00241  0.00266  0.00294  0.00326  0.00357  0.00390
0.00428  0.00475  0.00531  0.00592  0.00660  0.00739  0.00830  0.00922  0.01015
0.01129  0.01266  0.01399  0.01523  0.01676  0.01844  0.02017  0.02190  0.02399
0.02693  0.03014  0.03284  0.03569  0.03919  0.04356  0.04833  0.05373  0.05961
0.06568  0.07216  0.07933  0.08757  0.09731  0.10833  0.11859  0.12860  0.14146
0.15550  0.17006  0.18573  0.20126  0.21790  0.23619  0.25344  0.26820  0.28352
0.30331  0.32489  0.34562  0.36186  0.37992  0.40045  0.43618  0.45994  0.48389
0.50791  0.53190  0.55574  0.57932  0.60255  
)


NB. =========================================================
NB.*ELT_15_M n English Life Table 15 Males   
NB. Actuarial Tables for Examination Purposes (Institute of Actuaries) - 2002
ELT_15_M =: data 0 : 0
0.00814  0.00062  0.00038  0.00030  0.00024  0.00022  0.00020  0.00019  0.00018
0.00018  0.00018  0.00018  0.00019  0.00023  0.00029  0.00040  0.00052  0.00075
0.00087  0.00083  0.00084  0.00086  0.00089  0.00089  0.00088  0.00086  0.00085
0.00085  0.00087  0.00090  0.00091  0.00094  0.00097  0.00099  0.00106  0.00116
0.00127  0.00138  0.00149  0.00160  0.00172  0.00186  0.00201  0.00219  0.00240
0.00266  0.00297  0.00332  0.00371  0.00415  0.00464  0.00519  0.00577  0.00642
0.00714  0.00797  0.00890  0.00995  0.01112  0.01243  0.01392  0.01560  0.01749
0.01965  0.02199  0.02447  0.02711  0.02997  0.03292  0.03602  0.03930  0.04311
0.04745  0.05217  0.05697  0.06197  0.06777  0.07418  0.08101  0.08838  0.09616
0.10411  0.11279  0.12235  0.13270  0.14372  0.15585  0.16848  0.18061  0.19246
0.20465  0.21911  0.23655  0.25575  0.27483  0.29311  0.31104  0.32919  0.34783
0.36712  0.38705  0.40760  0.42870  0.45030  0.47428  0.49634  0.51841  0.54041
0.56225  0.58385
)
