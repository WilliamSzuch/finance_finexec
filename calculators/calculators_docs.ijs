NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>Finexec Category: Calculators</h1>
<hr>
<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
<hr>
Script: ~addons/finance/finexec/calculators/calculators_docs.ijs<br>
Updated: 13/4/2021<br>
Basic financial and actuarial calculators
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: calculators_docs***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/calculators'


NB. target directory
Target=: jpath '~addons/finance/finexec/calculators/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
Files =: cutopen 0 : 0
explife/explifea.ijs
explife/explifeb.ijs
lifeannuities/sla.ijs
lifeannuities/jla.ijs
lifeannuities/lsla.ijs
lifeannuities/rla.ijs
)


Files_CAL =: 'calculators/'&, each Files


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'*** End: calculators_docs***'
