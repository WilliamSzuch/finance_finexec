NB.%phrb3.ijs - J Phrases Section 3B. Merge & Amend
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrb3.ijs" target="_blank">Script source: phrb3.ijs</a>
NB.-<hr>


a0=: mrg=: 1 : '/:@/:@(x."_) { ,' NB. x b mrg y merges x and y
m1=: MRG=: /:@/:@[ { ]            NB. b MRG x,y is equivalent to above
d2=: alt=: ,@,.                   NB. Merge items from x and y alternately
a3=: IR=: @(i.@$@])               NB. f IR selects indices of ravelled rgt arg
m4=: d=: (<0 1)&|:                NB. Function to select diagonal of table
m5=: ur=: 2 _3&{.                 NB. Function to select upper right corner
