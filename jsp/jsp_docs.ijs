NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>Finexec Category: J Statistcal Package (Keith Smillie)</h1>
<hr>
<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a><br>
<hr>
<b>JSP Documenmtaion by Keith Smillie</b><br>
<a class="HREF" href="../jsp.pdf" target="_blank">J Statistical Package</a><br>
<a class="HREF" href="../jtsp.pdf" target="_blank">J Tutorial & Statistical Package</a><br>
<a class="HREF" href="../calc.pdf" target="_blank">J & Some Elemtary Statistical Calculations</a><br>
<a class="HREF" href="../jcomp.pdf" target="_blank">J Companion for Statistical Calculations</a><br>
<b>Definitions</b><br>
Refer to the script source files for the definitions. 
<hr>
Script: ~addons/finance/finexec/jsp/jsp_docs.ijs<br>
Updated: 20/3/2021<br>
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: jsp_docs***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/jsp'


NB. target directory
Target=: jpath '~addons/finance/finexec/jsp/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
Files =: cutopen 0 : 0
jsp.ijs
jtsp.ijs
jcalc.ijs
jcomp.ijs
)


Files_JS =: 'jsp/'&, each Files


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'*** End: jsp_docs***'
