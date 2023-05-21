NB. =========================================================
NB.%finexec.ijs - Finexec addon
NB.- Script: ~addons/finance/finexec/finexec.ijs
NB.- Updated: 2023 03 29
NB.- Depend: ~addons/lads/labs/labs.ijs'
NB.- Definitions: loaded to locale z
NB.-<hr>
NB.- For Jqt session
NB.- Limitations in JHS and J Playground sessions.
NB.- Information about the Finexec addon only.
NB.- Finexec addon scripts are NOT loaded.
NB.- Use path ~addons/finance/finexec/...
NB.-<hr>


NB. =========================================================
Note 'Using J Playground'
Opening a script from GitHub in the J Playground Edit window
openscript 'https://raw.githubusercontent.com/cdburke/simple/master/structural.ijs'
openscript 'https://raw.githubusercontent.com/WilliamSzuch/finance_finexec/master/basicfinance/simple.ijs'
openscript 'https://raw.githubusercontent.com/WilliamSzuch/finance_finexec/master/basicfinance/labs/simple_interest_lab.ijs'
openscript 'https://raw.githubusercontent.com/WilliamSzuch/finance_finexec/master/sudoku/sudoku_hui.ijs'
)


coclass 'z'


IFJPLAY =: IFQT = IFJHS  NB. J Playground session


require 'labs/labs'


SESSION =: (IFJPLAY,IFQT,IFJHS) # 'J Playground';'Jqt session';'JHS session'

NB. =========================================================
smoutput <'*** Running in a ',(,>SESSION),' ***'


NB. =========================================================
NB. Popups permissions 
NB. browse_jplay 'http://www.finexec.com.au'
NB. browse_jplay 'https://www.jsoftware.com'
NB. browse_jplay 'addons/finance/finexec/basicfinance/docs/index.htm'
NB. ---------------------------------------------------------
browse_jplay =: {{2!:0 'open("',y,'")'}}


NB. =========================================================
NB. Open a script in the J Playground
NB. Modified from open in the J playground
NB. open_jplay '~addons/math/misc/bigpi.ijs'
NB. ---------------------------------------------------------
open_jplay =: 3 : 0
data =. fread  getscripts_j_ y
(2!:0) '{ ecmset(jgetstr("data")) }'
)


NB. =========================================================
NB. Show the script source for a file.
NB. In Qt, JHS and the J PLayground
NB. showscript '~addons/finance/finexec/basicfinance/simple.ijs'
NB. ---------------------------------------------------------
NB. J Playground
NB. showscript '~addons/math/misc/bigpi.ijs'
NB. ---------------------------------------------------------
showscript =: 3 : 0
if. IFQT = 1 do. open y end.
if. IFJHS = 1 do. edit y end.
if. IFJPLAY = 1 do. open_jplay y end.
)


NB. =========================================================
NB. Show the html,htm and gif files in a window.
NB. finexec_html 'finexec_lib.html'
NB. finexec_html 'basicfinance/docs/simple.htm'
NB. finexec_html 'basicfinance/eqs/simple_ijs.gif'
NB. ---------------------------------------------------------
finexec_html =: 3 : 0
if. IFQT =1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/',y end.
if. IFJHS = 1 do. L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec/',y,'"' ,'target="_blank">',y,'</a>'
    jhtml '<div contenteditable="false"></span>',L end.
if. IFJPLAY = 1 do. browse_jplay jpath '~addons/finance/finexec/',y end.
)


NB. =========================================================
NB. Show Finexec website
NB. finexec ''
NB. ---------------------------------------------------------
finexec =: 3 : 0
if. IFQT =1 do. browse_j_ 'http://www.finexec.com.au' end.
if. IFJHS = 1 do. L =. '<a href="http://www.finexec.com.au" target="_blank">Finexec</a>'
    jhtml '<div contenteditable="false"></span>',L end.
if. IFJPLAY = 1 do. browse_jplay 'http://www.finexec.com.au' end.
)


NB. =========================================================
NB. Show Jsoftware
NB. jsoftware ''
NB. ---------------------------------------------------------
jsoftware =: 3 : 0
if. IFQT =1 do. browse_j_ 'http://www.jsoftware.com' end.
if. IFJHS = 1 do. L =. '<a href="http://www.jsoftware.com" target="_blank">Finexec</a>'
    jhtml '<div contenteditable="false"></span>',L end.
if. IFJPLAY = 1 do. browse_jplay 'https://www.jsoftware.com' end.
)


NB. =========================================================
NB. Show the finexec_doc window.
NB. finexec_doc ''
NB. ---------------------------------------------------------
finexec_doc =: 3 : 0
finexec_html 'finexec_doc.html'
)


NB. =========================================================
NB. Show the finexec_lib window.
NB. finexec_lib ''
NB. ---------------------------------------------------------
finexec_lib =: 3 : 0
finexec_html 'finexec_lib.html'
)


NB. =========================================================
NB. Show the finexec_usage window.
NB. finexec_usage ''
NB. ---------------------------------------------------------
finexec_usage =: 3 : 0
finexec_html 'finexec_usage.html'
)


NB. =========================================================
NB. Show the finexec_style window.
NB. finexec_lib ''
NB. ---------------------------------------------------------
finexec_style =: 3 : 0
finexec_html 'finexec_style.html'
)


NB. =========================================================
NB. Finexec addon welcome message.
ADDON_MSG =:  < > LF cut 0 : 0
*** Welcome to Finexec ***
Finexec scripts are NOT loaded.
Load individual scripts as required for a task or project.
Always review the documemtation for a category,script and definition
from the library. 
)


NB. =========================================================
NB. Initial output on: load 'finance/finexec
smoutput  ADDON_MSG
smoutput <'Run the following sentences for information'
smoutput 'finexec ''''','                  NB. Finexec home'
smoutput 'finexec_lib ''''','              NB. Library'
smoutput 'finexec_doc ''''','              NB. Documentation'
smoutput 'finexec_usage ''''','            NB. usage'
smoutput 'finexec_style ''''','            NB. Syle'
smoutput 'finexec_labs ''''','             NB. List and run labs'


NB. =========================================================
NB. Labs: List and run
NB. =========================================================


NB. =========================================================
NB. Show a list and run the labs.
NB. finexec_labs ''
finexec_labs =: 3 : 0
smoutput <'*** Introduction ***'
smoutput 'introduction_lab ''''','' 
smoutput <'*** Basic Finance ***'
smoutput 'simple_interest_lab ''''','' 
smoutput 'compound_interest_lab ''''','' 
smoutput 'cash_flow_approach_lab ''''','' 
smoutput <'*** Qx Tables ***'
smoutput 'qx_tables_lab ''''','' 
smoutput <'*** Actuarial Life ***'
smoutput 'life_table_lab ''''','' 
smoutput 'life_annuities_lab ''''','' 
)


NB. =========================================================
NB. introduction_lab ''
introduction_lab =: 3 : 0
lab '~addons/finance/finexec/introduction_lab.ijs'
)

NB. =========================================================
NB. Basic Finance Labs
NB. =========================================================

NB. =========================================================
NB. cash_flow_approach_lab ''
cash_flow_approach_lab =: 3 : 0 
lab '~addons/finance/finexec/basicfinance/labs/cash_flow_approach_lab.ijs'
)

NB. =========================================================
NB. simple_interest_lab ''
simple_interest_lab =: 3 : 0 
lab '~addons/finance/finexec/basicfinance/labs/simple_interest_lab.ijs'
)

NB. =========================================================
NB. compound_interest_lab ''
compound_interest_lab =: 3 : 0 
lab '~addons/finance/finexec/basicfinance/labs/compound_interest_lab.ijs'
)


NB. =========================================================
NB. Qx Tables Labs
NB. =========================================================

NB. =========================================================
NB. qx_tables_table_lab ''
qx_tables_lab =: 3 : 0 
lab '~addons/finance/finexec/qxtables/labs/qx_tables_lab.ijs'
)


NB. =========================================================
NB. Actuarial Life Labs
NB. =========================================================

NB. =========================================================
NB. life_table_lab ''
life_table_lab =: 3 : 0 
lab '~addons/finance/finexec/actuariallife/labs/life_table_lab.ijs'
)

NB. =========================================================
NB. life_annuities_lab ''
life_annuities_lab =: 3 : 0 
lab '~addons/finance/finexec/actuariallife/labs/life_annuities_lab.ijs'
)


NB. =========================================================
NB. Loading category scripts
NB. =========================================================


NB. =========================================================
LOAD_MSG =: < >LF cut 0 : 0
Run the following sentences to load the scripts for a category
and experiment with the definitions.
Definitions loaded to the base locale.
)


smoutput LOAD_MSG
smoutput 'load_actuariallife ''''','      NB. Actuarial Life'
smoutput 'load_basicfinance ''''','       NB. Basic Finance'
smoutput 'load_ipm ''''','                NB. Investment Performance Measurement'


NB. =========================================================
load_actuariallife =: 3 : 0
load '~addons/finance/finexec/actuariallife/actuariallife.ijs'
)


NB. =========================================================
load_basicfinance =: 3 : 0
load '~addons/finance/finexec/basicfinance/basicfinance.ijs'
)


NB. =========================================================
load_ipm=: 3 : 0
load '~addons/finance/finexec/ipm/ipm.ijs'
)


NB. =========================================================
NB. Load some calculators
NB. =========================================================


NB. =========================================================
LOAD_CALC =: < >LF cut 0 : 0
Run the following sentences to load a calculator.
*** Only in a Jqt session ***
)
smoutput LOAD_CALC
smoutput 'load_explifeb ''''','          NB. Expectation of Life Single Life'
smoutput 'load_explifea ''''','          NB. Expectation of Life Joint Lives'
smoutput 'load_sla ''''','               NB. Single Life Annuity'
smoutput 'load_jla ''''','               NB. Joint Life Annuity'


NB. =========================================================
load_explifea =: 3 : 0
load '~addons/finance/finexec/calculators/explife/explifea.ijs'
)
NB. =========================================================
load_explifeb =: 3 : 0
load '~addons/finance/finexec/calculators/explife/explifeb.ijs'
)
NB. =========================================================
load_sla =: 3 : 0
load '~addons/finance/finexec/calculators/lifeannuities/sla.ijs'
)
NB. =========================================================
load_jla =: 3 : 0
load '~addons/finance/finexec/calculators/lifeannuities/jla.ijs'
)




