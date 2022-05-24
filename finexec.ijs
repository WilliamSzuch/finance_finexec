NB. =========================================================
NB.%finexec.ijs - Finexec addon
NB.- Script: ~addons/finance/finexec/finexec.ijs
NB.- Updated: 2022-05-24
NB.- Depend: ~addons/ide/jhs/sp.ijs'
NB.- Definitions: loaded to locale z
NB.-<hr>
NB.- Information about the Finexec addon only.
NB.- Finexec addon scripts loaded.
NB.- Use path ~addons/finance/finexec/...
NB.-<hr>


require '~addons/ide/jhs/sp.ijs'


coclass 'z'


NB. =========================================================
NB. Show the script source for a file.
NB. showscript '~addons/finance/finexec/basicfinance/simple.ijs'
showscript =: 3 : 0
if. IFJHS = 1 do. edit y  else. open y end.
)


NB. =========================================================
NB. Show the htm or html window.
NB. finexec_html 'basicfinance/docs/simple.htm'
NB. finexec_html 'basicfinance/eqs/simple_ijs.html'
finexec_html =: 3 : 0
if. IFQT =1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/',y
else.L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec',y,'"' ,'target="_blank">',y,'</a>'
jhtml '<div contenteditable="false"></span>',L end.
)


NB. =========================================================
NB. Show the finexec_doc window.
NB. finexec_doc ''
finexec_doc =: 3 : 0
if. IFQT = 1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/finexec_doc.html'
else. L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec/finexec_doc.html" target="_blank">Documentation</a>'
jhtml '<div contenteditable="false"></span>',L end.
)


NB. =========================================================
NB. Show the finexec_lib window.
NB. finexec_lib ''
finexec_lib =: 3 : 0
if. IFQT = 1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/finexec_lib.html'
else. L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec/finexec_lib.html" target="_blank">Library</a>'
jhtml '<div contenteditable="false"></span>',L end.
)


NB. =========================================================
NB. Show the finexec_usage window.
NB. finexec_usage ''
finexec_usage =: 3 : 0
if. IFQT = 1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/finexec_usage.html'
else. L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec/finexec_lib.html" target="_blank">Usage</a>'
jhtml '<div contenteditable="false"></span>',L end.
)


NB. =========================================================
NB. Show the finexec_style window.
NB. finexec_lib ''
finexec_style =: 3 : 0
if. IFQT = 1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/finexec_style.html'
else. L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec/finexec_lib.html" target="_blank">Style</a>'
jhtml '<div contenteditable="false"></span>',L end.
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
smoutput 'finexec_usage ''''','            NB. Finexec usage'
smoutput 'finexec_lib ''''','              NB. Finexec library by category'
smoutput 'finexec_doc ''''','              NB. Documentation overview'
smoutput 'finexec_style ''''','            NB. Documentation style'
smoutput 'finexec_tutorials ''''','        NB. List and run tutorials'


NB. =========================================================
NB. Tutorials: List and run
NB. =========================================================


NB. =========================================================
NB. Show a list and run the Finenxec tutorials.
NB. finexec_tutorials ''
finexec_tutorials =: 3 : 0
smoutput <'*** Introduction ***'
smoutput 'introduction_tut ''''','' 
smoutput <'*** Basic Finance ***'
smoutput 'cash_flow_approach_tut ''''','' 
smoutput 'simple_interest_tut ''''','' 
smoutput 'compound_interest_tut ''''','' 
)


NB. =========================================================
NB. introduction_tut ''
introduction_tut =: 3 : 0
spx_jsp_  '~addons/finance/finexec/introduction_tut.ijs'
)


NB. =========================================================
NB. cash_flow_approach_tut ''
cash_flow_approach_tut =: 3 : 0 
spx_jsp_ '~addons/finance/finexec/basicfinance/tutes/cash_flow_approach_tut.ijs'
)


NB. =========================================================
NB. simple_interest_tut ''
simple_interest_tut =: 3 : 0 
spx_jsp_ '~addons/finance/finexec/basicfinance/tutes/simple_interest_tut.ijs'
)


NB. =========================================================
NB. compound_interest_tut ''
compound_interest_tut =: 3 : 0 
spx_jsp_ '~addons/finance/finexec/basicfinance/tutes/compound_interest_tut.ijs'
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
AL =. '~addons/finance/finexec/actuariallife/'
load AL,'lifeannuities.ijs'          
load AL,'lifeinsurance.ijs'          
load AL,'lifetable.ijs'              
load AL,'lifetable_multiplelives.ijs'
smoutput <'Actuarial Life loaded'
)


NB. =========================================================
load_basicfinance =: 3 : 0
BF =. '~addons/finance/finexec/basicfinance/'
load BF,'compound.ijs'
load BF,'compoundv.ijs'  
load BF,'force.ijs'
load BF,'fundprojection.ijs'   
load BF,'fundprojection_a.ijs'
load BF,'lease.ijs'           
load BF,'loan.ijs'            
load BF,'loanschedule.ijs'    
load BF,'rba.ijs'             
load BF,'ruleof78.ijs'        
load BF,'simple.ijs'          
load BF,'timeline.ijs' 
smoutput <'Basic Finance loaded'
)


NB. =========================================================
load_ipm=: 3 : 0
IP =. '~addons/finance/finexec/ipm/'
load IP,'invreturnhardy.ijs'
load IP,'mwrr.ijs'          
load IP,'twrr.ijs'   
smoutput <'Investment Performance Measurement loaded'
)


NB. =========================================================
NB. Load a calculator
NB. =========================================================


NB. =========================================================
LOAD_CALC =: < >LF cut 0 : 0
Run the following sentences to load a calculator.
*** Only in a Qt session ***
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




