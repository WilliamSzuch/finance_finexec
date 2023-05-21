NB. =========================================================
LABTITLE=: 'Life Table'
LABAUTHOR=: 'William Szuch'

NB. =========================================================
Lab Chapter Introduction
NB.=========================================================

NB. =========================================================
Lab Section Tutorial Information
 Updated: 2022-06-12
 load 'finance/finexec'
 load 'labs/labs'
 lab '~addons/finance/finexec/actuariallife/tutes/life_table_tut.ijs'
)
NB.---------------------------------------------------------
NB. Show the Tutorial Chapters
lab':'

NB. =========================================================
Lab Section Defintions
 The tutorial introduces the definitions for
 life table calculations and how they can be applied.
)
NB. ---------------------------------------------------------
NB. Load some stuff
showscript '~addons/finance/finexec/actuariallife/tutes/life_table_tut.ijs'
load '~addons/finance/finexec/actuariallife/lifetable.ijs'
finexec_html 'actuariallife/docs/lifetable.htm'
names ''

NB. =========================================================
Lab Section Qx Tables 
 Qx Tables are mortality tables start at age = 0.
 Use the following to show Qx Tables
 Qx_ALL list of all mortality tables
 ALT_2018_20_M short name
 ALT_2018_20_F show table as a list
 
 See tutorial qx_tables_tut.ijs
 )

NB. =========================================================
Lab Chapter Life Table Calculations
NB. =========================================================

NB. =========================================================
Lab Section Plot
Plot the Qx table ALT_2018_20_M
)
NB. ---------------------------------------------------------
plot ALT_2018_20_M


NB. =========================================================
Lab Section Expectation of Life
 Calculate the expectation of life for males at ages 30 40 50 60 70
 using:
 ALT_1960_62_M and ALT_2018_20_M
Comment on the change
)
NB. ---------------------------------------------------------
(ALT_1960_62_M)ex(30 40 50 60 70)
(ALT_2018_20_M)ex(30 40 50 60 70)

NB. ---------------------------------------------------------
NB. Tutorial End