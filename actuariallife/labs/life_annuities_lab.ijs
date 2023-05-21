NB. =========================================================
LABTITLE=: 'Life Annuities'
LABAUTHOR=: 'William Szuch'

NB. =========================================================
Lab Chapter Introduction
NB.=========================================================

NB. =========================================================
Lab Section Tutorial Information
 Updated: 2022-06-12
 load 'finance/finexec'
 load 'labs/labs'
 lab '~addons/finance/finexec/actuariallife/tutes/life_annuities_tut.ijs'
)
NB.---------------------------------------------------------
NB. Show the Tutorial Chapters
lab':'

NB. =========================================================
Lab Section Defintions
 The tutorial introduces the definitions for
 life annuity calculations and how they can be applied.
)
NB. ---------------------------------------------------------
NB. Load some stuff
showscript '~addons/finance/finexec/actuariallife/tutes/life_annuities_tut.ijs'
load '~addons/finance/finexec/actuariallife/lifeannuities.ijs'
finexec_html 'actuariallife/docs/lifeannuities.htm'
names ''

NB. =========================================================
Lab Chapter Single Life Annuities 
NB. =========================================================

NB. =========================================================
Lab Section Example 1
 Calculate the value of life annuities for male and female 
 ages 65,70 and 75.

 Assuming:
 Payments in arrears
 Male: ALT_2018_20_M
 Female: ALT_2018_20_F
 Yearly effective interest rate: 5.0%
)
NB. ---------------------------------------------------------
(ALT_2018_20_M;0.05)ax(65 70 75)
(ALT_2018_20_F;0.05)ax(65 70 75)

NB. =========================================================
Lab Chapter Annuities for Two Lives

NB. =========================================================
Lab Section Example 1 - Joint Life Annuity
Calculate thevalue of a joint life annuity 
(ie: payable while both lives are a live) for male and 
female aged 65.

 Assuming:
 Payments in arrears
 Male: ALT_2018_20_M
 Female: ALT_2018_20_F
 Yearly effective interest rate: 5.0%
)
NB. ---------------------------------------------------------
(ALT_2018_20_F;ALT_2018_20_M;0.05)axy(65;65)

NB. =========================================================
Lab Section Example 2 - Last Survivor of Joint Life Annuity
 Calculate thevalue of a last survivor life annuity (ie: payable while
 at least one live is a live) for male and female aged 65.
 
 Assuming:
 Payments in arrears
 Male: ALT_2018_20_M
 Female: ALT_2018_20_F
 Yearly effective interest rate: 5.0%
)
NB. ---------------------------------------------------------
(ALT_2018_20_F;ALT_2018_20_M;0.05)axyLS(65;65)

NB. ---------------------------------------------------------
NB. Tutorial End