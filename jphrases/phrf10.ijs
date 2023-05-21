NB.%phrf10.ijs - J Phrases Section 10F. Random Numbers
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrf10.ijs" target="_blank">Script source: phrf10.ijs</a>
NB.<hr>


d0=: {.@[ + ?@(] $ -@(-/@[))                NB. Shape y array of random numbers in x
d1=: ?@#                                    NB. x numbers from i.y with replacement
d2=: ?                                      NB. x numbers from i.y without replacement
m3=: 9!:1@<.@(+/ .^&2@(6!:0@]))             NB. Randomizing random number seed
m4=: (>:@? % 2147483647&[) @ $ & 2147483646 NB. Random numbers between 0 and 1
m5=: {~ ?~@#                                NB. Random shuffle of y
