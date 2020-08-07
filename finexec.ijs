NB. =========================================================
NB.%finexec.ijs - Finexec addon
NB.- Script: ~addons/finance/finexec/finexec.ijs
NB.- Updated: 31/7/2020
NB.- Depend: ~addons/ide/jhs/sp.ijs'
NB.- Definitions: loaded to locale z
NB.-<hr>
NB.- Information about the Finexec addon only.
NB.- Finexec addon scripts not load as these require 
NB.- to be loaded separately.
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
NB. Show the htm or html window for docs and eqs.
NB. finexec_html 'basicfinance/docs/simple.htm'
NB. finexec_html 'basicfinance/eqs/simple_ijs_eqs.html'
finexec_html =: 3 : 0
if. IFQT =1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/',y
else.L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec',y,'"' ,'target="_blank">',y,'</a>'
jhtml '<div contenteditable="false"></span>',L end.
)


NB. =========================================================
NB. Show the finexec_addon window.
NB. finexec_addon ''
finexec_addon =: 3 : 0
if. IFQT = 1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/finexec_addon.html'
else. L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec/finexec_addon.html" target="_blank">Addon</a>'
jhtml '<div contenteditable="false"></span>',L end.
)


NB. =========================================================
NB. Show the finexec_category window.
NB. finexec_category ''
finexec_category =: 3 : 0
if. IFQT = 1 do. browse_j_ 'file:///',jpath '~addons/finance/finexec/finexec_category.html'
else. L =. '<a href="http://127.0.0.1:65001/~addons/finance/finexec/finexec_category.html" target="_blank">Category</a>'
jhtml '<div contenteditable="false"></span>',L end.
)


NB. =========================================================
NB. Finexec addon welcome message.
ADDON_MSG =:  < > LF cut 0 : 0
Welcome to the Finexec addon. 
Run the following sentences for information about the Finexec addon.
Finexec addon scripts for a category have not been loaded.
Load these scripts as required for a task or project.
Also review the documemtation for any script loaded. 
)


NB. =========================================================
NB. Initial output on: load 'finance/finexec
smoutput  ADDON_MSG
smoutput 'finexec_addon ''''','          NB. Overview'
smoutput 'finexec_category ''''','       NB. Category and documentation'
smoutput 'finexec_tutorials ''''','      NB. List and run tutorials'


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




