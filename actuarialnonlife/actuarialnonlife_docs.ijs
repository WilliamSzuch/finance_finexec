NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>Finexec Category: Actuarial Non-Life</h1>
<hr>
<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
<a class="HREF" href="../../finexec_cat.html" target="_blank">Category </a>
<hr>
Script: ~addons/finance/finexec/actuarialnonlife/actuarialnonlife_docs.ijs<br>
Updated: 3/3/2021<br>
Tools for non life actuarial tasks. 
Tasks are generally shown as examples using tools to
solve the problem. 
Example data is usually presented as zzz.xlsx and zzz.csv files.
Scripts and definitions for actuarial non-life include:
* general insurance
* data arrays
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: actuarialnonlife_docs***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/actuarialnonlife'


NB. target directory
Target=: jpath '~addons/finance/finexec/actuarialnonlife/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
Files =: cutopen 0 : 0
chain_ladder_ibnr_claims.ijs
data_arrays.ijs
gi_tools.ijs
matrix_tools.ijs
)


Files_ANL =: 'actuarialnonlife/'&, each Files


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'*** End: actuarualnonlife_docs***'
