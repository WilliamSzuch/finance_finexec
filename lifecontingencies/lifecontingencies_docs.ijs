NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>finexec: Catgory: Life Contingencies</h1>
Script: ~addons/finance/finexec/lifecontingencies/lifecontingencies_docs.ijs<br>
Definitions for life contingencies calculations.<br>
* life table<br>
* life annuities<br>
* life issurance<br> 
<a class="HREF" href="../lifecontingencies_terminology.html" target="_blank">Life Contingencies Terminology</a><br>
<a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'Start: Life Contingencies'


NB. =========================================================
NB. This builds html docs in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/lifecontingencies'


NB. target directory
Target=: jpath '~addons/finance/finexec/lifecontingencies/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
Files=: cutopen 0 : 0
lifetable.ijs
lifeannuities.ijs
lifeinsurance.ijs
)


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'End: Life Contingencies'
