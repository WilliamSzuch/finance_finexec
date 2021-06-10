NB.%phra7.ijs - J Phrases Section 7A. Permutations
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.-<a href="../phra7.ijs" target="_blank">Script source: phra7.ijs</a>
NB.-<hr>


m0  =: /:                                                NB. Inverse permutation vector
m1  =: /:&.C.                                            NB. Inverse cycle
m2  =: (-: >) :: 0:                                      NB. Not-a-box test
m3  =: m1`m0 @. m2                                       NB. Inverse permutation
m4  =: C.^:2                                             NB. Put permutation into standard form
m5  =: (<0 _1)&C.                                        NB. Interchange first and last items
m6  =: _1&A.                                             NB. Reverse
m7  =: 3&A.                                              NB. Rotate last three to the left
m8  =: 4&A.                                              NB. Rotate last three right
d9  =: ([: +/[:![:}.[:i.[) A. ]                          NB. Rotate last x to the left
d10=: (!@[ - !@<:@[) A. ]                                NB. Rotate last x to the right
m11 =: /:~                                               NB. Sort up
m12 =: \:~                                               NB. Sort down
m13 =: ?~                                                NB. Random permutation of order y
m14=: /:@:?@$~                                           NB. Random permutation of order y
m15=: ?@! A. i.                                          NB. Random permutation of order y
d16=: A. i.                                              NB. x-th permutation of order y
m17=: all=: i.@! A. i.                                   NB. All permutations of order y
m18=: ,:@i.`([: ,/ 0&,.@ ($:&.<:){"2 1 \:"1@=@i.)@.(1&<) NB. All permutations of order y (recursive definition)  
m19=: pow=: {^:(]`(i.@#@[))                              NB. Permutation x to the power y
m20=: [: {/ ] $ ,:@[                                     NB. Permutation x to the power y
m21=: i.@#@[C.~(#&>@C.@[| ])#C.@[                        NB. Permutation x to the power y
m22=:  pow 2&^                                           NB. Permutation x to the power 2^y
m23=: 3 : (':'; '{~^:y. x.')                             NB. Permutation x to the power 2^y
m24=: {~@]^:(]`[)                                        NB. Permutation x to the power 2^y
m25=: ord=: *./@(#&>"_)@C.                               NB. The order of a permutation
m26=: sg=: pow i.@ord                                    NB. Subgroup generated by permutation y
m27=: [: {/\ ord $ ,:                                    NB. " 
m28=: ~.@(,/)@({"1/~)^:_@(i.@{:@$ ,: ])                  NB. " &sect; 4.4 <a href="references.htm#4">Hui [4]</a>
d29=: \:@[{]                                             NB. Move items located by x to front of y
m30=: 1: |. ]                                            NB. Rotate y by 1 to the left (or up)
d31=: !@[ * !                                            NB. Number of perms of y objects x at a time
m32=: (] {~ [: /: ] = ' '"_)"1                           NB. Move all blanks to end of row
d33=: /:@[ { ]                                           NB. Move items located by x to end of y
m34=: _1: |. ]                                           NB. Rotate y by 1 to the right (or down)
m35=: ~.@(,/)@({"1/~)^:_@(i.@{:@$,])                     NB. Subgroup generated by a matrix of permutations
m36=: {"1/~                                              NB. The group table of a matrix of permutations
m37=: ugt=: ~.@(,/)@({"1/~)                              NB. The unique elements of the permutation group
m38=: pbi=: i.@{:@$ , ]                                  NB. Preface a matrix of permutations by the identity
m39=: ugt^:_ @ pbi                                       NB. The subgroup generated by a matrix of permutations (same as m35)
