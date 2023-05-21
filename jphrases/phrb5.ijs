NB.%phrb5.ijs - J Phrases Section 5B. Partition
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrb5.ijs" target="_blank">Script source: phrb5.ijs</a>
NB.-<hr>


c0=: cut=: 2 : ';@(<@x.;.y.)' NB. 
a1=: c1=: cut 1               NB. Case 1 of cut
a2=: c2=: cut 2               NB. Case 2 of cut
d3=: pmax=: >./ c1            NB. Partitioned max over (case 1)
d4=: pmax2=: >./c2            NB. Partitioned max over (case 2)
d5=: pmaxs=: >./\ c1          NB. Partitioned max scan
d6=: pnub=: ~. c1             NB. Partitioned nub
d7=: psort=: /:~ c1           NB. Partitioned sort
d8=: prev=: |. c1             NB. Partitioned reverse
m9=: <;._2@(,&':');._2        NB. UNIX /etc/passwd relation
