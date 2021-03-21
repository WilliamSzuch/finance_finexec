NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>finexec: Catgory: Actuarial Life</h1>
<hr>
<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentatuin | </a>
<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
<a class="HREF" href="../actuariallife_terminology.html" target="_blank">Actuarial Life Terminology</a>
<hr>
Script: ~addons/finance/finexec/actuariallife/actuariallife_docs.ijs<br>
Updated: 27/2/2021<br>
Definitions for calculations depending on life.<br>
* life table<br>
* life annuities<br>
* life issurance<br> 
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'Start: actuariallife_docs'


NB. =========================================================
NB. This builds html docs in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/actuariallife'


NB. target directory
Target=: jpath '~addons/finance/finexec/actuariallife/docs'


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

Files_AL =: 'actuariallife/'&, each Files


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'End: actuariallife_docs'
