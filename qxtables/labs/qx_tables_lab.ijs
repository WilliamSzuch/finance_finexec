NB. =========================================================
LABTITLE=:'Qx Tables'
LABAUTHOR=: 'William Szuch'

NB. =========================================================
Lab Chapter Introduction
NB.=========================================================

NB. =========================================================
Lab Section Tutorial Information
 Updated: 2022-06-11
 load 'finance/finexec'
 load 'labs/labs'
 lab '~addons/finance/finexec/qxtables/tutes/qx_tables_tut.ijs'
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
showscript '~addons/finance/finexec/qxtables/tutes/qx_tables_tut.ijs'
load '~addons/finance/finexec/qxtables/qxtools.ijs'
finexec_html 'qxtables/docs/index.htm'
names ''

NB. =========================================================
Lab Chapter Qx Tables 
NB. =========================================================

NB. =========================================================
Lab Section Mortality Tables
 Qx tables are mortality tables that start at age = 0.
 List of all Qx tables: Qx_ALL
 Use the short name eg: ALT_2018_20_M 
 Show the table as a list: ALT_2018_20_F
 Show the ALT_2018_20_F for ages 10 to 30
)

NB. =========================================================
Lab Section List all Qx Tables
)
NB. ---------------------------------------------------------
Qx_ALL

NB. =========================================================
Lab Section Show ALT_2018_20_F as a List
)
NB. ---------------------------------------------------------
ALT_2018_20_F 

NB. =========================================================
Lab Section Show the ALT_2018_20_F for ages 10 to 30
)
NB. ---------------------------------------------------------
(20 +i. 11){ ALT_2018_20_F

NB. =========================================================
Lab Chapter Example Plots 
NB. =========================================================

NB. =========================================================
Lab Section Plot 1
)
NB. ---------------------------------------------------------
NB. plot ALT_2018_20_F
plot ALT_2018_20_F

NB. =========================================================
Lab Section Plot 2
)
NB. ---------------------------------------------------------
NB. ('ALT_2018_20_F')plotQx(0 90)
('ALT_2018_20_F')plotQx(0 90)

NB. =========================================================
Lab Section Plot 3
)
NB. ---------------------------------------------------------
NB. ('ALT_2018_20_F')plotQx(15 25)
('ALT_2018_20_F')plotQx(15 25)

NB. =========================================================
Lab Section Example 1
 Compare the mortality rates for males for ages 15 to 25 
 for tables ALT_1960_62_M and ALT_2018_20_M
 Comment on the change.
)
NB. ---------------------------------------------------------
('ALT_1960_62_M';'ALT_2018_20_M')plotzQx(15,25)

NB. =========================================================
Lab Section Example 2
 Compare the mortality rates for males and females 
 ages 15 to 25 for tables:
 ALT_1960_62_M and ALT_2018_20_M and 
 ALT_1960_62_F and ALT_2018_20_F 
 Comment on the changes.
)
NB. ---------------------------------------------------------
('ALT_1960_62_M';'ALT_2018_20_M';'ALT_1960_62_F';'ALT_2018_20_F')plotzQx(15,25)

NB. ---------------------------------------------------------
NB. Tutorial End