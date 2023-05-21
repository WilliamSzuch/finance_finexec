NB.%phrc2.ijs - J Phrases Section 2C. Ambivalent Functions
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrc2.ijs" target="_blank">Script source: phrc2.ijs</a>
NB.-<hr>


v0=: 10&^. : ^.                        NB. Base 10 log for monadic case
v1=: 10&$: : ^.                        NB. Same using self-reference to dyad
v2=: 10&^. : ($:@] * ^.@(10"0) % ^.@[) NB. Same using self-reference to monad
d3=: res=: [: : |                      NB. Domain of monad is empty (dyadic only)
m4=: abs=: | : [:                      NB. Domain of dyad is empty (monadic only)
