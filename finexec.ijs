NB. =========================================================
NB.%finexec.ijs - Finexec addon
NB.- Script: ~addons/finance/finexec/finexec.ijs
NB.- Depend: ~addons/ide/jhs/sp.ijs'
NB.- Definitions: loaded to locale z
NB.-<hr>
NB.- This script provides information about the Finexec addon.
NB.- The addon definitions are loaded to the base locale 
NB.- unless otherwise indicated in the script to
NB.- avoid potential naming conflicts in the z or other locales.
NB.- Change locale in the script as required. 
NB.- Qt IDE
NB.- JHS IDE
NB.-<hr>


require '~addons/ide/jhs/sp.ijs'


coclass 'z'


NB. =========================================================
Note 'Update a current script'
Scripts are only updated - ie: modifications etc.
After changes to scripts: 
(1) Run:  finexec_docs ''
    Check the build process for errors etc 
(2) Update VERSION number
(3) Upload to GitHub 
)


NB. =========================================================
Note 'Add new script to a current category'
Add a new script to an existing category.
1) Add new script to: 
     category_docs.ijs
2) Run:
    finexec_docs ''
Check the build process for errors etc 
3) Update FILES in: manifest.ijs
    open '~addons/finance/finexec/manifest.ijs'
    manifest_files ''
4) Update VERSION number
5) Upload GitHub
)


NB. =========================================================
Note 'Add a new category'
Add a new category.
1) Create new folders for the new category:
     finexec/newcategory
     finexec/newcategory/docs
     finexec/newcategory/eqs
     finexec/newcategory/tutes
2) Create docs script:
     finexec/newcategory/newcategory_docs.ijs
3) Add new script to: 
     newcategory_docs.ijs
4) Check new category build: Run:
     load '~addons/finance/finexec/newcategory/newcategory_docs.ijs'
5) Add new category to:
     finexec_docs ''
6) Run:
    finexec_docs ''
    Check for errors
7) Update FILES in: manifest.ijs
     open '~addons/finance/finexec/manifest.ijs'
     manifest_files ''
8) Update VERSION number
9) Upload to GitHub
)


NB. =========================================================
NB. Build the finexec docs files for each category.
NB. finexec_docs ''
finexec_docs =: 3 : 0
load '~addons/finance/finexec/basicfinance/basicfinance_docs.ijs'
load '~addons/finance/finexec/datetime/datetime_docs.ijs'
load '~addons/finance/finexec/ipm/ipm_docs.ijs'
load '~addons/finance/finexec/lifecontingencies/lifecontingencies_docs.ijs'
load '~addons/finance/finexec/options/options_docs.ijs'
load '~addons/finance/finexec/qxtables/qxtables_docs.ijs'
load '~addons/finance/finexec/rstats/rstats_docs.ijs'
load '~addons/finance/finexec/utility/utility_docs.ijs'
)


NB. =========================================================
NB. Build the files for manifest.ijs.
NB. manifest_files ''
manifest_files =: 3 : 0
26}."1 >0{"1 dirtree '~addons/finance/finexec'
)


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
NB. finexec_html 'basicfinance/eqs/r_eq.html'
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
NB. fp welcome message.
ADDON_MSG =:  < > LF cut 0 : 0
Welcome to the Finexec addon 
Run the following sentences for information 
)


NB. =========================================================
NB. Initial output on: load 'finance/fp'
smoutput  ADDON_MSG
smoutput 'finexec_addon ''''','          NB. Overview'
smoutput 'finexec_category ''''','       NB. Category and documentation'
smoutput 'finexec_tutorials ''''','      NB. List and run tutorials'


NB. =========================================================
NB. Tutorials: List and run
NB. =========================================================


NB. =========================================================
NB. Show a list and run the fp tutorials.
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




