NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>Finexec: Category: Investment Performamce Measurement</h1>
<hr>
<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
<a class="HREF" href="../ipm_terminology.html" target="_blank">Investment Performamce Terminology</a><br>
<hr>
Script: ~addons/finance/finexec/ipm/ipm_docs.ijs<br>
Updated: 28/7/2020<br>
Definitions for calculating investment performance measurement.<br>

<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: ipm_docs ***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/ipm'


NB. target directory
Target=: jpath '~addons/finance/finexec/ipm/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
Files =: cutopen 0 : 0
invreturnhardy.ijs
mwrr.ijs
twrr.ijs
)


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'*** End: ipm_docs ***'
