NB. =========================================================
NB.%ann.ijs - Annuity Life Tables (ANN) 
NB.- Script: ~addons/finance/finexec/qxtables/ann.ijs
NB.- Contributor: William Szuch
NB.- Updated: 31/1/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Qx Tables</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Annuity Life Tables
NB.- Names commence with ANN_.
NB.- All mortality tables start at age = 0.
NB.- <a href="../ann.ijs" target="_blank">Script source: ann.ijs</a>
NB.-<hr>


NB. =========================================================
NB. Utility
data =. [: ". rplc&(LF;' ')  


cocurrent 'base'


NB. =========================================================
NB.*Qx_ANN n List of ANN tables
Qx_ANN =: 0 : 0
ANN_1920_F_ULT   Annuitants 1900-20 Ultimate - Females
ANN_1920_M_ULT   Annuitants 1900-20 Ultimate - Males
ANN_55_F_ULT     a(55) Ultimate - Females
ANN_55_M_ULT     a(55) Ultimate - Males 
ANN_90_F_ULT     a(90) Ultimate - Females                            
ANN_90_M_ULT     a(90) Ultimate - Males                              
ANN_IM80_F_ULT   Annuitants IF80 Base Ultimate Females  
ANN_IM80_M_ULT   Annuitants IM80 Base Ultimate Males 
)


NB. =========================================================
NB.*ANN_1920_M_ULT n Annuitants 1900-20 Ultimate - Males
NB. English annuity table
NB. Table starts at age 40
ANN_1920_M_ULT =: data 0 : 0
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.008030 0.008100 0.008180 0.008270 0.008370
0.008490 0.008640 0.008830 0.009050 0.009300 0.009700 0.010400 0.011220 0.012130
0.013110 0.014150 0.015200 0.016510 0.017810 0.019250 0.020780 0.022450 0.024220
0.026150 0.028240 0.030470 0.032900 0.035500 0.038320 0.041350 0.044610 0.048150
0.052170 0.056850 0.062270 0.068610 0.075940 0.083780 0.091970 0.100420 0.109020
0.117710 0.126970 0.136900 0.147530 0.158910 0.171080 0.184090 0.197950 0.212720
0.228420 0.245080 0.262760 0.281440 0.301170 0.321940 0.343760 0.366640 0.390550
0.415440 0.441290 0.468030 0.495560 0.523820 0.552670 
)


NB. =========================================================
NB.*ANN_1920_F_ULT n Annuitants 1900-20 Ultimate - Females
NB. Table starts at age 40
ANN_1920_F_ULT =: data 0 : 0
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.007160 0.007230 0.007310 0.007400 0.007500
0.007620 0.007750 0.007900 0.008070 0.008250 0.008460 0.008710 0.008990 0.009280
0.009650 0.010030 0.010470 0.010970 0.011540 0.012170 0.012880 0.013700 0.014610
0.015650 0.016830 0.018140 0.019610 0.021300 0.023170 0.025300 0.027700 0.030410
0.033460 0.036880 0.040730 0.045070 0.049960 0.055440 0.061600 0.068510 0.076240
0.085070 0.095460 0.106860 0.118950 0.131500 0.144660 0.158510 0.173110 0.188460
0.204610 0.221550 0.239290 0.257850 0.277250 0.297460 0.318490 0.340320 0.362960
0.386320 0.410420 0.435190 0.460560 0.486500 0.513000 
)


NB. =========================================================
NB.*ANN_55_M_ULT n a(55) Ultimate - Males 
NB. The a(55) Tables for Annuitants - 1953
NB. Table starts at age 20
ANN_55_M_ULT =: data 0 : 0
0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000
0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000
0.00118 0.00120 0.00123 0.00124 0.00126 0.00128 0.00129 0.00131 0.00133 0.00136
0.00139 0.00143 0.00148 0.00153 0.00160 0.00168 0.00177 0.00187 0.00200 0.00214
0.00230 0.00249 0.00269 0.00292 0.00319 0.00349 0.00381 0.00417 0.00455 0.00500
0.00547 0.00600 0.00659 0.00724 0.00793 0.00870 0.00955 0.01050 0.01155 0.01272
0.01402 0.01546 0.01706 0.01883 0.02080 0.02297 0.02538 0.02803 0.03096 0.03420
0.03776 0.04170 0.04602 0.05075 0.05595 0.06164 0.06786 0.07463 0.08199 0.08998
0.09861 0.10795 0.11798 0.12874 0.14023 0.15246 0.16541 0.17910 0.19346 0.20849
0.22413 0.24032 0.25699 0.27405 0.29143 0.30903 0.32673 0.34445 0.36209 0.37952
0.39668 0.41400 0.43200 0.45000 0.46900 0.49000 0.51400 0.54200 0.57600 0.61800
0.67000 0.73300 0.80800 0.89600
)


NB. =========================================================
NB.*ANN_55_F_ULT n a(55) Ultimate - Females
NB. The a(55) Tables for Annuitants - 1953
NB. Table starts at age 20
ANN_55_F_ULT =: data 0 : 0
0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000
0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000 0.00000
0.00117 0.00118 0.00119 0.00120 0.00121 0.00123 0.00124 0.00126 0.00128 0.00130
0.00132 0.00135 0.00138 0.00142 0.00147 0.00153 0.00158 0.00165 0.00173 0.00182
0.00191 0.00203 0.00216 0.00229 0.00245 0.00261 0.00280 0.00302 0.00324 0.00348
0.00376 0.00405 0.00437 0.00472 0.00510 0.00553 0.00600 0.00653 0.00713 0.00779
0.00855 0.00939 0.01032 0.01137 0.01254 0.01385 0.01531 0.01695 0.01877 0.02080
0.02307 0.02559 0.02839 0.03151 0.03498 0.03881 0.04306 0.04776 0.05295 0.05866
0.06495 0.07184 0.07938 0.08760 0.09656 0.10628 0.11678 0.12808 0.14021 0.15316
0.16694 0.18151 0.19684 0.21289 0.22960 0.24688 0.26465 0.28280 0.30124 0.31983
0.33846 0.35700 0.37600 0.39600 0.41700 0.44000 0.46500 0.49300 0.52400 0.55900
0.59900 0.64500 0.69800 0.75900 0.82900 0.90900 
)



NB. =========================================================
NB.*ANN_90_M_ULT n a(90) Ultimate - Males                              
NB. Table starts at age 20
ANN_90_M_ULT  =: data 0 : 0
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000947 0.000895 0.000846 0.000802 0.000762 0.000727 0.000697
0.000674 0.000657 0.000647 0.000646 0.000652 0.000669 0.000696 0.000734 0.000784
0.000849 0.000928 0.001024 0.001137 0.001271 0.001426 0.001605 0.001809 0.002043
0.002307 0.002605 0.002941 0.003318 0.003739 0.004209 0.004733 0.005319 0.005988
0.006761 0.007647 0.008648 0.009759 0.010971 0.012274 0.013657 0.015116 0.016652
0.018274 0.019999 0.021853 0.023862 0.026049 0.028432 0.031025 0.033846 0.036914
0.040249 0.043871 0.047803 0.052068 0.056691 0.061697 0.067115 0.072971 0.079295
0.086115 0.093463 0.101369 0.109861 0.118972 0.128728 0.139159 0.150288 0.162140
0.174735 0.188008 0.202211 0.217112 0.232790 0.249240 0.266449 0.284395 0.303051
0.322380 0.342336 0.362865 0.383907 0.405393 0.427248 0.449390 0.471734 0.494193
0.516675 
)


NB. =========================================================
NB.*ANN_90_F_ULT n a(90) Ultimate - Females                            
NB. Table starts at age 20
ANN_90_F_ULT =: data 0 : 0
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000340 0.000329 0.000323 0.000328 0.000342 0.000361 0.000376
0.000389 0.000397 0.000401 0.000409 0.000424 0.000446 0.000475 0.000513 0.000561
0.000619 0.000689 0.000771 0.000865 0.000972 0.001092 0.001224 0.001367 0.001521
0.001686 0.001859 0.002042 0.002233 0.002434 0.002645 0.002868 0.003105 0.003358
0.003629 0.003929 0.004270 0.004667 0.005132 0.005674 0.006301 0.007014 0.007813
0.008697 0.009669 0.010737 0.011915 0.013220 0.014665 0.016265 0.018037 0.019998
0.022167 0.024566 0.027217 0.030145 0.033377 0.036943 0.040874 0.045203 0.049967
0.055204 0.060955 0.067262 0.074170 0.081726 0.089976 0.098970 0.108755 0.119379
0.130889 0.143328 0.156736 0.171147 0.186591 0.203086 0.220644 0.239265 0.258935
0.279627 0.301301 0.323899 0.347350 0.371565 0.396443 0.421869 0.447715 0.473848
0.500124
)


NB. =========================================================
NB.*ANN_IM80_M_ULT n Annuitants IM80 Base Ultimate Males 
NB. Table startat age  17
ANN_IM80_M_ULT =: data 0 : 0
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000530
0.001096 0.001035 0.000978 0.000924 0.000874 0.000827 0.000784 0.000747 0.000714
0.000687 0.000666 0.000652 0.000646 0.000647 0.000658 0.000678 0.000710 0.000753
0.000809 0.000879 0.000965 0.001068 0.001191 0.001333 0.001499 0.001689 0.001907
0.002155 0.002436 0.002752 0.003109 0.003509 0.003956 0.004456 0.005013 0.005632
0.006321 0.007085 0.007931 0.008868 0.009904 0.011049 0.012313 0.013706 0.015243
0.016935 0.018797 0.020846 0.022903 0.024947 0.027172 0.029591 0.032223 0.035084
0.038195 0.041575 0.045247 0.049235 0.053565 0.058264 0.063361 0.068887 0.074876
0.081362 0.088383 0.095977 0.104186 0.113052 0.122620 0.132935 0.144044 0.155995
0.168837 0.182617 0.197383 0.213180 0.230050 0.248034 0.267166 0.287472 0.308974
0.331680 0.355590 0.380688 0.406942 0.434302 0.462700 0.492042 0.522214 0.553075
0.584458 0.616173 0.648002 0.679708 0.711035 0.741713 0.771464 0.800013 0.827094
0.852462 0.875900 0.897235 0.916341 
)




NB. =========================================================
NB.*ANN_IM80_F_ULT n Annuitants IF80 Base Ultimate Females 
NB. Table starts at age 17
ANN_IM80_F_ULT =: data 0 : 0
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000300
0.000306 0.000299 0.000292 0.000287 0.000283 0.000281 0.000280 0.000282 0.000285
0.000290 0.000298 0.000313 0.000336 0.000361 0.000390 0.000423 0.000459 0.000500
0.000546 0.000597 0.000654 0.000717 0.000788 0.000867 0.000955 0.001053 0.001162
0.001282 0.001416 0.001565 0.001730 0.001913 0.002116 0.002341 0.002591 0.002875
0.003199 0.003559 0.003960 0.004406 0.004902 0.005454 0.006067 0.006750 0.007509
0.008353 0.009291 0.010334 0.011494 0.012783 0.014215 0.015807 0.017575 0.019539
0.021720 0.024141 0.026829 0.029811 0.033120 0.036788 0.040854 0.045358 0.050347
0.055867 0.061973 0.068721 0.076174 0.084399 0.093465 0.103449 0.114430 0.126493
0.139724 0.153049 0.166119 0.179846 0.194233 0.209286 0.225103 0.242066 0.260321
0.279930 0.300947 0.323415 0.347368 0.372824 0.399778 0.428205 0.458051 0.489228
0.521614 0.555042 0.589307 0.624154 0.659285 0.694359 0.729001 0.762805 0.795353
0.826228 0.855034 0.881419 0.905097 
)

