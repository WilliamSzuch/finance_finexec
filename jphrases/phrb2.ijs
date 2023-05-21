NB.%phrb2.ijs - J Phrases Section 2B. Rank
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrb1.ijs" target="_blank">Script source: phrb1.ijs</a>
NB.-<hr>

m0=: +/         NB. sum (column sums of a matrix)
m1=: +/"1       NB. sum vectors (row sums of a matrix)
d2=: *"0 _      NB. outer product; same as */
m3=: +/@(*"1 _) NB. inner product; same as +/ .*
