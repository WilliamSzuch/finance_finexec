NB. Mortality formulae - two or more lives.
NB. =======================================
NB. Need to fix up loading of mortality two lives ets- format. 
NB. 


NB. =================================================================================================
NB.* qxy v Vector of the probability of joint/multiple lives failing (at least one) within next year.
NB. Use qx as basis.
NB. REVIEWED: 1/6/2005 
NB. FORM:  [x] qxy y
NB.        x = <AGE1 AGE2 [Term]> If no term default qx's are extended  
NB.             to the length of the longest table and filled with last value.
NB.        y = <Mortality Table L1;Mortality Table L2)
NB. EXAMPLE: qxy 'ALT95-97 M';'ALT95-97 F'
NB. EXAMPLE: 10 10 20 qxy 'ALT95-97 M';'ALT95-97 F'
qxy =: 3 : 0
'' qxy y
:
M1 =. > 0{y
M2 =. > 1{y
TT =. # x  NB. if TT = 3 ,then term years is used.
AGE1 =. AGE2 =. TERM =. ''   NB. Default values
if. TT = 3 do. 'AGE1 AGE2 TERM' =. x end.
if. TT = 2 do. 'AGE1 AGE2' =. x [TERM =. '' end.
Q1 =. (AGE1,TERM) qx M1
Q2 =. (AGE2,TERM) qx M2
TM =. (#Q1)>.(#Q2)
Q1 =. TM extend Q1
Q2 =. TM extend Q2
Q1 + Q2 - Q1*Q2
)


NB. ======================================================
NB.* pxy v Probability of joint lives surviving one year.
NB. REVIEWED: 1/6/2005
NB. FORM:  [x] pxy y
NB.        x = <AGE1 AGE2 [TERM]> 
NB.        y = <Mortality Table L1;Mortality Table L2)
NB. EXAMPLE: pxy 'ALT95-97 M';'ALT95-97 F'
NB. EXAMPLE: 10 10 20 pxy 'ALT95-97 M';'ALT95-97 F'
pxy =: 3 : 0
'' pxy y
:
1 - x qxy y
)


NB. ========================================================================
NB.* nnpxy v Probability of joint lives surviving to end of year from start.
NB. REVIEWED: 1/6/2005
NB. FORM: [x] pxy y
NB.        x = <AGE1 AGE2 [TERM]> 
NB.        y = <Mortality Table L1;Mortality Table L2)
NB. EXAMPLE: nnpxy 'ALT95-97 M';'ALT95-97 F
NB. EXAMPLE: 10 10 20 nnpxy 'ALT95-97 M';'ALT95-97 F'
NB. RESULT: 1 = Start value, for annuity calculations
nnpxy =: 3 : 0
'' nnpxy y
:
1, */\ x pxy y
)

NB. ******************************
NB. Mortality more than two lives:
NB. ******************************

NB. =========================================================================
pxyz =: 3 : 0
NB.* pxyz v
NB. FORM:
NB. EXAMPLE:
NB. Vector of probability of multiple lives (all) surviving one year.
NB. x pxyz y  eg, [age1 age2 age3 etc [term]] qxyz m1;m2;m3; etc 
NB. MORE THAN TWO LIVES
NB. Use qx as basis.
NB. y = list of mortality tables and or qx eg (1;2;3) , (1;0.1 0.1;2)
NB. x = ages and term. eg  10 15 20 40 . If no term default qx's are extended  
NB.      to the length of the longest table and filled with last value.
NB. eg. (pxyz 11;12;12), (pxyz 11;12;0.1 0.1) , (pxyz 0.1 0.1 ;12 )
NB. eg. (10 10 20 30 pxyz 11;12;12)
'' pxyz y
:
lives =. # y 
TT =. # x
m =. y
term =. ''
if. TT = (lives + 1) do. term =. {: x end.
q =. >(240&extend @ qx) each y
ages =. ''
TTT =. # ages
if. TT > 0 do. TTT =. #  ages =. lives {. x end.
if. (TT = 0) do. q1 =. q  else.  q1 =. ,: ((0{ages),term) qx (0{q) end. 
c =. 1 
while. ((TTT > 0) * (c < lives))  do.  
        ttt =.  ((c{ages),term) qx (c{q) 
        q1 =. q1,ttt               NB. ((c{ages),term) qx (c{q) 
        c =. c + 1
end.
res1 =.   q1
res2 =. */ 1 - res1
)


NB. ===========================================================================
qxyz =: 3 : 0
NB.* qxyz v
NB. FORM:
NB. EXAMPLE:
NB. x qxyz y  eg, [age1 age2 age3 etc [term]] qxyz m1;m2;m3; etc 
NB. MORE THAN TWO LIVES
NB. Vector of the probability of joint/multiple lives failing (at least one) within next year.
NB. Use qx as basis.
NB. y = list of mortality tables and or qx eg (1;2;3) , (1;0.1 0.1;2)
NB. x = ages and term. eg  10 15 20 40 . If no term default qx's are extended  
NB.      to the length of the longest table and filled with last value.
NB. eg. (qxyz 11;12;12), (qxyz 11;12;0.1 0.1) , (qxyz 0.1 0.1 ;12 )
NB. eg. (10 10 20 30 qxyz 11;12;12)
'' qxyz y
:
1 - x pxyz y
)


NB. ===========================================================================
nnpxyz =: 3 : 0
NB. nnpxyz v
NB. FORM:
NB. EXAMPLE:
NB. x pxy y
NB. Probability of joint lives surviving to end of year from start.
NB. 1 = start value, for annuity calculations
NB. [age1 age2 age3 [term]] nnPxyz m1;m2;m3
NB. TWO OR MORE LIVES
'' nnpxyz y
:
1, */\  x pxyz y
)

NB. ********************
NB. Annuity - two lives:
NB. ********************

NB. ================================================================================
NB.* axy v Joint life annuity paid in advance or arrears while both lives are alive. 
NB. REVIEWED: 1/6/2005 - to be cleaned up ???
NB. FORM: axy y 
NB.           y <ADVANCE = 1 or ARREARS =0;
NB.              (Mortality Table L1;Mortality Table L2);Discount Rate %;AGE1 AGE2 [TERM];[FREQUENCY]>  
NB. EXAMPLE: axy 1;('ALT95-97 M';'ALT95-97 F');0.01;15 15
NB. EXAMPLE: axy 1;('ALT95-97 M';'ALT95-97 F');0.01;15 15 50 
NB. EXAMPLE: axy 1;('ALT95-97 M';'ALT95-97 F');0.01;15 15 ;_  
axy =: 3 : 0
y0 =. >0{y  NB. 1 = in advance, 0 = in arrears
y1 =. >1{y  NB. Mortality tables
y2 =. >2{y  NB. Interest rates
y3 =. >3{y  NB. Ages and or term
TT =. # y
NB.    y4 - frequency of payment, default is annual
NB.         n = number of payments per year
NB.         eg. 12=monthly,52.18 = weekly, 2 = half yearly etc.  
if. TT = 5 do. y4 =. >4{y else. y4 =. 1 end.  NB. For payments other than yearly
c1 =.  y3 nnpxy y1
llf =. {: c1
disc =. */\  % (#c1) extend 1,1+y2
df =. {: disc                                   NB. For payments other than yearly
c2 =. disc * c1
if. y0=1 do. c3 =. +/  }: c2  else. c3 =. +/  }. c2 end.
adj =. (0.5 - 1 % 2*y4) *  (1 - df * llf  )
if. y0 = 1 do. c3 =. c3 - adj else. c3 =. c3 + adj end.
)


NB. ===========================================================================
a_xy =: 3 : 0
NB.* a_xy v
NB. FORM:
NB. EXAMPLE:
NB. x a_xy y
NB. Last survivor life annuity paid in advance or arrears while one or both lives are alive. 
NB. eg. a_xy 1;(12;12);0.01;15 15
NB. eg. a_xy 1;(12;12);0.01;15 20 50 
NB. eg. a_xy 1;(12;12);0.01;15 15 ;_  
'' a_xy y
:
y0 =. >0{y  NB. 1 = in advance, 0 = in arrears
y1 =. >1{y  NB. Mortality tables
'm1 m2' =. y1
y2 =. >2{y  NB. Interest rates
y3 =. >3{y  NB. Ages and or term
TT =. # y3   NB. if TT = 3 ,then term years is used.
age1 =. age2 =. term =. ''                                              NB. Default values
if. TT = 3 do. 'age1 age2 term' =. y3 end.
if. TT = 2 do. 'age1 age2' =. y3 [term =. '' end.
TT =. # y
NB.    y4 - frequency of payment, default is annual
NB.         n = number of payments per year
NB.         eg. 12=monthly,52.18 = weekly, 2 = half yearly etc.  
if. TT = 5 do. y4 =. >4{y else. y4 =. 1 end.  NB. For payments other than yearly

c1a =.   ((age1,term) nnpx m1)
c1b =.   ((age2,term) nnpx m2) 
c1c =.    y3 nnPxy m1;m2
c1 =. +/ c1a, c1b,: -c1c

llf =. {: c1
disc =. */\  % (#c1) extend 1,1+y2
df =. {: disc                                   NB. For payments other than yearly
c2 =. disc * c1
if. y0=1 do. c3 =. +/  }: c2  else. c3 =. +/  }. c2 end.
adj =. (0.5 - 1 % 2*y4) *  (1 - df * llf  )
if. y0 = 1 do. c3 =. c3 - adj else. c3 =. c3 + adj end.
)

NB. ****************************
NB. Annuity more than two lives:
NB. ****************************

NB. ===========================================================================
axyz =: 3 : 0
NB.* axyz v
NB. FORM:
NB. EXAMPLE:
NB. x axyz y
NB. Joint life annuity paid in advance or arrears while both lives are alive. 
NB. eg. axyz 0;(11;11;11);0.03;20
NB. eg. axy 1;(26;26);0.01;15 15 50 
NB. eg. axy 1;(26;26);0.01;15 15 ;_  
y0 =. >0{y  NB. 1 = in advance, 0 = in arrears
y1 =. >1{y  NB. Mortality tables
y2 =. >2{y  NB. Interest rates
y3 =. >3{y  NB. Ages and or term
TT =. # y
NB.    y4 - frequency of payment, default is annual
NB.         n = number of payments per year
NB.         eg. 12=monthly,52.18 = weekly, 2 = half yearly etc.  
if. TT = 5 do. y4 =. >4{y else. y4 =. 1 end.  NB. For payments other than yearly
c1 =.  y3 nnpxyz y1
llf =. {: c1
disc =. */\  % (#c1) extend 1,1+y2
df =. {: disc                                   NB. For payments other than yearly
c2 =. disc * c1
if. y0=1 do. c3 =. +/  }: c2  else. c3 =. +/  }. c2 end.
adj =. (0.5 - 1 % 2*y4) *  (1 - df * llf  )
if. y0 = 1 do. c3 =. c3 - adj else. c3 =. c3 + adj end.
)

NB. **********************
NB. Assurance - two lives:
NB. **********************

NB. ===========================================================================
assxy_1 =: 4 : 0
NB.* assxy v
NB. FORM:
NB. EXAMPLE:
NB. x assxy_1 y
NB. Value of $1 paid at end of the year on the death of the first life
NB. if second life survives.
NB. x = interest rate, can be changing
NB. y = age1 mortality1;age2 mortality2 
NB. eg. 0.03 assxy_1 10 9;7 10
int =. x
age1 =. 0{>0{y
mort1 =. 1{>0{y
age2 =. 0{>1{y
mort2 =. 1{>1{y
q1 =. age1 }. qx mort1
q2 =. age2 }. qx mort2
P =. 1 - q1,:q2
Ps =. */\ */ P
Pss =.  _1}. 1,Ps
yrs =. # Pss
q11 =. yrs extend q1
P22 =. yrs extend (1 - 0.5 * q2) NB. 
Psss =. q11* P22 * Pss 
disc =. % */\ 1 + yrs extend x
+/ Psss * disc
)


NB. ==========================================================================
assxy_1m =: 4 : 0
NB.* assxy_1m v
NB. FORM:
NB. EXAMPLE:
NB. x assxy_1m y
NB. Value of $1 paid at middle of the year on the death of the first life
NB. if second life survives.
NB. x = interest rate, can be changing
NB. y = age1; mortality1;age2; mortality2 
NB. EXAMPLE: 0.03 assxy_1m (10;'ALT85-87 M';7;'ALT85-87 F')
INT =. x
'AGE1 MORT1 AGE2 MORT2' =. y
Q1 =. AGE1 }. qx MORT1
Q2 =. AGE2 }. qx MORT2
P =. 1 - Q1,:Q2
PS =. */\ */ P
PSS =.  _1}. 1,PS
YRS =. # PSS
Q11 =. YRS extend Q1
P22 =. YRS extend (1 - 0.5 * Q2) 
PSSS =. Q11* P22 * PSS 
D1 =.  %: 1 + YRS extend x
D2 =.  */\ YRS extend 1,1 + x
DISC =. % D1 * D2
+/ PSSS * DISC
)


NB. ===========================================================================
assxy =: 4 : 0
NB.* assxy v
NB. FORM:
NB. EXAMPLE:
NB. x assxy y
NB. Value of $1 paid at end of the year on the first death of the either life
NB. x = interest rate, can be changing
NB. y = age1 mortality1;age2 mortality2 
NB. eg. 0.01 assxy 10 13;10 13
int =. x
age1 =. 0{>0{y
mort1 =. 1{>0{y
age2 =. 0{>1{y
mort2 =. 1{>1{y
q1 =. age1 }. qx mort1
q2 =. age2 }. qx mort2
P =. 1 - q1,:q2
Ps =. */\ */ P
Pss =.  _1}. 1,Ps
yrs =. # Pss
q11 =. yrs extend q1
q22 =. yrs extend q2
qz  =. 1 - (1-q11) * (1-q22)
Psss =. qz * Pss 
disc =. % */\ 1 + yrs extend x
+/ Psss * disc
)

NB. ****************************************
NB. Assurance - two lives and last survivor:
NB. ****************************************

NB. ===========================================================================
assxy_last =: 4 : 0
NB.* assxy_last v
NB. FORM:
NB. EXAMPLE:
NB. x assxy_last y
NB. Value of $1 paid at end of the year on the last death of the lives
NB. x = interest rate, can be changing
NB. y = age1 mortality1;age2 mortality2 
NB. eg. 0.01 assxy_last 10 13;10 13 
int =. x
age1 =. 0{>0{y
mort1 =. 1{>0{y
age2 =. 0{>1{y
mort2 =. 1{>1{y
NB. Ax paid at end of year of death
(assx mort1;int;age1) + (assxx mort2;int;age2) - int assxy y
'check calc'
)


NB. *********************
NB. Reversionary annuity:
NB. *********************

NB. ===========================================================================
NB.* ax_y v Reversionary annuity - payable on the life of x then a percentage to y if y survives x
NB. FORM: x ax_y y
NB.       x = <Reversionary proportion>
NB.       y = <Mortality Table L1;Mortaolity Table L2;Discount Rate %;Age 1;Age 2;   
NB. EXAMPLE: 0.6 ax_y 1;('ALT95-97 M';'ALT95-97 F');0.05;45 48
NB. EXAMPLE: 0.76 ax_y 0;('ALT95-97 M';'ALT95-97 F');0.05;66 61;2
NB. x = % that reverts to life y if survives life x
NB. y = as for axy
ax_y =: 4 : 0
R =. x     NB. Reversionary percentage
L =. y
LL =. > 2# < L
life1 =. 0{LL
life2 =. 1{LL
ages =.  >3{L
TT =. # ages                                                            NB. if TT = 3 ,then term years is used.
age1 =. age2 =. term =. ''                                              NB. Default values
if. TT = 3 do. 'age1 age2 term' =. ages end.
if. TT = 2 do. 'age1 age2' =. ages [term =. '' end.
life1 =.   (0{>1{L)   1}life1
life1 =.    (<age1,term) 3}life1   
life2 =.   (1{>1{L)   1}life2
life2 =.    (<age2,term) 3}life2   
RES =. (ax life1) + R * ((ax life2) - axy L)  
)


NB. ======================================================================================
NB.* super_pension_factors v Calculate pension factors for Complying Superannuation Funds.
NB. REVIEWED: 18/4/2005
NB. FORM: x super_pension_factors y
NB.       x = <DOB1;DOB2;Mortalilty Table L1;Mortality Table L2;Reversion %;Indexation Rate %;Discount Rate %;Frequency Payment;Advance or Arrears> 
NB.       y = <Calculation Date>
NB. EXAMPLE: (1934 5 13;1939 4 26;('ALT95-97 M';'ALT95-97 F');0.76;0.03;0.07;2;0) super_pension_factors 2000 6 30
NB. EXAMPLE: (1934 5 13;1939 4 26;('ALT95-97 M';'ALT95-97 F');0.76;0.03;0.07;2;0) & super_pension_factors each 2000 6 30;2001 6 30;2002 6 30;2003 6 30
NB. EXAMPLE: (1925 10 12;1925 12 12;('ALT95-97 M';'ALT95-97 F');1.0;0.05;0.055;2;0) super_pension_factors 2004 7 1
NB. EXAMPLE: (1942 7 28;1942 12 6;('ALT95-97 M';'ALT95-97 F');0.76;0.03;0.055;12;0) & super_pension_factors each 2003 7 1;2004 7 1;2005 7 1
super_pension_factors =: 4 : 0
'DOB1 DOB2 MORT REVS IND EARNS FREQ ADV' =. x
VD =. y
AGE1_0 =. VD age_lastbd_date_ DOB1
AGE1_F =. VD age_yrs_date_ DOB1
AGE2_0 =. VD age_lastbd_date_ DOB2
AGE2_F =. VD age_yrs_date_ DOB2
AGE1_1 =. AGE1_0 + 1
AGE2_1 =. AGE2_0 + 1
MORTR  =. qx each MORT 
DISC =. _1 + (1+EARNS)%(1+IND)
PF_00 =. REVS ax_y ADV;MORTR;DISC;(AGE1_0,AGE2_0);FREQ
PF_10 =. REVS ax_y ADV;MORTR;DISC;(AGE1_1,AGE2_0);FREQ
PF_01 =. REVS ax_y ADV;MORTR;DISC;(AGE1_0,AGE2_1);FREQ
PF_11 =. REVS ax_y ADV;MORTR;DISC;(AGE1_1,AGE2_1);FREQ
R_00_10 =. (AGE1_0,PF_00,AGE1_1,PF_10) linear_interpolate_maths_ AGE1_F
R_01_11 =. (AGE1_0,PF_01,AGE1_1,PF_11) linear_interpolate_maths_ AGE1_F
RES =.  (AGE2_0,R_00_10,AGE2_1,R_01_11) linear_interpolate_maths_ AGE2_F
)



NB. ===== END of SCRIPT ============================================
