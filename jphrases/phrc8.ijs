NB.%phrc8.ijs - J Phrases Section 8C. Representations
NB.-<script src="../js/jphrases_links.js"></script>
NB.- <a href="../phrc8.ijs" target="_blank">Script source: phrc8.ijs</a>
NB.-<hr>


d0=: >:@<.@^.                                NB. Length to represent y in base x
d1=: d0 # [                                  NB. Base to represent integer y in base x
d2=: d1 #:]                                  NB. Base x rep of decimal integer y
m3=: #:@i.@>:                                NB. Binary reps of integers from 0 to y
m4=: 10"_ d2 ]                               NB. Base 10 rep of decimal integer y
m5=: 16"_ d2 ]                               NB. Base 16 rep of decimal integer y
d6=: (>:@<.@^. # [) #: ]                     NB. Base x rep of decimal integer y
d7=: ] #:~ >:@<.@^. # [                      NB. Base x rep of decimal integer y
m8=: 100"_ d2 ]                              NB. Base 100 rep of decimal integer y
m9=: 0 1&#:                                  NB. Whole and fractional parts of y
m10=: 10 100 1000"_ #: ]                     NB. Mixed base 10 ^ 1 2 3 rep of y
m11=: #.                                     NB. Integer from Boolean list y
m12=: <.@(10&^.)@(('.'&~: # ])     &.": % ]) NB. Number of decimal places in y
m14=: ]&__                                   NB. Negative infinity
m15=: _:                                     NB. Positive infinity
a16=: (&#.) (^:_1)                           NB. Base x rep of decimal integer y
m17=: [: (%"1 [: ,:~ +./) ,:&1               NB. Fraction equivalent to y
