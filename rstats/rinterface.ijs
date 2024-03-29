NB. =========================================================
NB.% rinterface.ijs - Interfacing J with R (using Rserve.exe)
NB.-<script src="../js/rstats_links.js"></script>
NB.- Script: ~addons/finance/finexec/rstats/rinterface.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2023 04 09
NB.- Depend: R statitical package 
NB.-         Rserve.exe package 
NB.-         ~addons/stats/r/rserve.ijs
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../rinterface.ijs" target="_blank">Script source: rinterface.ijs</a>
NB.-<hr>
NB.- The interface definition is an example only and requires to be 
NB.- modified for the R Stats package installation.
NB.- See the source code: ~addons/finance/fp/rstats/rinterface.ijs
NB.- Example definition:
NB.- 
NB.- rinterface =: 3 : 0
NB.- fork_jtask_ 'C:/Program Files/R/R-4.2.3/bin/x64/Rserve.exe' 
NB.- )
NB.- 
NB.- Tools for interfacing J with the statisical package R. 
NB.- The interface is made through the Rserve.exe package.
NB.- For details see:
NB.- <a class="HREF" href="https://code.jsoftware.com/wiki/Interfaces/R">J interface to R</a>
NB.-<hr>


require '~addons/stats/r/rserve.ijs'


NB. =========================================================
NB.*rinterface m -
NB.- <b>Form:</b> explicit
NB.- Example only - definition requires to be modified.
NB.- Creates the interface between J and R.
NB.-syntax:
NB.+rinterface ''
NB.-example:
NB.+   rinterface ''
NB.+
NB.+Testing the interface of J with R.  
NB.+  Rget 'pi'
NB.+3.14159
NB.-
NB.+   Rget 'rnorm(5)'
NB.+0.141088 _0.116309 _1.08985 _0.902064 _0.150221
NB.-
NB.+   Rget 'R.Version()'
NB. ---------------------------------------------------------
rinterface =: 3 : 0
fork_jtask_ 'C:/Program Files/R/R-4.2.3/bin/x64/Rserve.exe'
)



