NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>Finexec Category: J Phrases</h1>
<hr>
<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
<hr>
Script: ~addons/finance/finexec/jphrases/jphrases_docs.ijs<br>
Updated: 20/3/2021<br>
J Phrases takem from: 
<a href="https://code.jsoftware.com/wiki/JPhrases/Contents"> J Phrases</a>
Also look at: 
<a href="https://code.jsoftware.com/wiki/Phrases"> Phrases</a>
<hr>
<b>Text</b>
<pre>
The phrases are copied from the text:
J Phrases 1996-1998 
Chris Burke
Roger K. W. Hui
Kenneth E.Iversion
Eugene E. McDonnell
Donald B. McIntyre
</pre>
<b>Phrase Conventions</b>
<pre>
The phrases are executable and are assigned a unique literal numeric 
name within each section. The literal part of the name indicates the 
class of the phrases as follows:
a =  adverb
c = conjuction
d = dyad
m = monad
n = noun
v ambivalent verb
Some phrases include assignment of mnemonic name that may not be unique.
Each phrase has a brief description of its purpose.
</pre>
<b>Scrpit Names</b>
<pre>
Jphrase scripts are as copied from the J504 listing and may not
be fully supported by the latest version of J.
The naming style of the scripts can be read as, for example read:
phra1,ijs as phrases from Section 1A of the text.
</pre> 
<b>Definitions</b>
<pre>
Definition names are not unique and only apply to a section and paragraph.
Refer to the script souce for the definitions.
Definitions are loaded to the locale z.
</pre>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: jphrases_docs***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/jphrases'


NB. target directory
Target=: jpath '~addons/finance/finexec/jphrases/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
Files =: cutopen 0 : 0
phra1.ijs
phrb1.ijs
phrc1.ijs
phrd1.ijs
phra2.ijs
)


Files_JP =: 'jphrases/'&, each Files


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'*** End: jphrases_docs***'
