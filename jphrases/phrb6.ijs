NB.%phrb6.ijs - J Phrases Section 6B. Ranking & Classification
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrb6.ijs" target="_blank">Script source: phrb6.ijs</a>
NB.-<hr>


m0=: i.~/:~                                                 NB. Rank y rising, 0-origin, ties equal
m1=: >:@m0                                                  NB. Rank y rising, 1-origin, ties equal
m2=: i.~\:~                                                 NB. Rank y falling, 0-origin, ties equal
m3=: >:@m2                                                  NB. Rank y falling, 1-origin, ties equal
m4=: /:@/:                                                  NB. Rank y rising, 0-origin, distinct ranks
m5=: /:@\:                                                  NB. Rank y falling, 0-origin, distinct ranks
m6=: - <./                                                  NB. Normalize y so that minimum atom is 0
d7=: ] * [ % [: >./ ]                                       NB. Scale y by x%max y
d8=: <:@[ <.[ <.@d7 m6@]                                    NB. Classify y into x equal intervals
d9=: [:+/"1 ([:i. [:{. ]) =/ ([:<. ([ - 1: { ]) % ([:{: ])) NB. Classify x into {.y classes, minimum 1{y, width {:y
d10=: contour=: d12 d11 ]                                   NB. Classify altitudes x into contour levels y
d11=: ([: <: [: +/ ] <:/ [) { ]                             NB. 
d12=: [ >. <./@]                                            NB. 
