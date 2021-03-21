NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>Finexec Scripts</h1>
<hr>
<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
<hr>
Script: ~addons/finance/finexec/scripts/scripts_docs.ijs<br>
Updated: 27/2/2021<br>
Build the documentation for all Finexec scripts.<br>
Run after all the category documentation.<br>
USE finexec_mgt.ijs<br>
LIMITATIONS - links in the scripts not available
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: script_docs***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec'


NB. target directory
Target=: jpath '~addons/finance/finexec/scripts/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
NB. Not required
Files =: cutopen 0 : 0
)


NB. =========================================================
NB. sortFiles Files
NB. Sort Files into alpha order
sortFiles =: 3 : 0
F =:1{"1  >'/'&cut each y
SF =: sort F
INDX =: F i. SF
INDX { y
)

Files =: sortFiles Files_ANL,Files_BF,Files_DT,Files_DV,Files_IPM,Files_AL,Files_QX,Files_RS,Files_TB,Files_JS,Files_JP


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'*** End: script_docs***'
