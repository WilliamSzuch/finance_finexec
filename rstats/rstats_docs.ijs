NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<hr>
<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
<hr>
Script: ~addons/finance/finexec/rstats/rstats_docs.ijs<br>
Updated: 28/7/2020<br>
Defintions to be used to interface J with the R Statsical Package.<br>
<hr>
J provides an interfaces to the R statistical package.<br>
R is the most widely used program in the statistical research community 
and has a vast range of statistical tools available.<br>
It is freely available on all common platforms.<br>
For more information, see wiki page: 
<a class="HREF" href="http://code.jsoftware.com/wiki/Interfaces/R">J Interface to R Stats</a> 
<hr>
)



NB. edit_cat_doc 'toolbox/toolbox_docs.ijs'

NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'Start: rstats_docs'


NB. =========================================================
NB. This builds html docs in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/rstats'


NB. target directory
Target=: jpath '~addons/finance/finexec/rstats/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
Files=: cutopen 0 : 0
rinterface.ijs
)


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'End: rstats_docs.'
