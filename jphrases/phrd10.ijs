NB.%phrd10.ijs - J Phrases Section 10D. Plotting
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrd10.ijs" target="_blank">Script source: phrd10.ijs</a>
NB.<hr>


m0=: #"0&1                          NB. Stacks of 1s of length y followed by 0s
m1=: #.&.|:                         NB. Decimal value of 2-item Boolean list y
m2=: ] { ' +ox'"_                   NB. One of four characters chosen by y
m3=: m2@m1@m0"1                     NB. Horizontal barchart of two intgr series y
m4=: #"0&'x'                        NB. Stack of 'x's of length y followed by ' 's
m5=: [: i. [: >: >./                NB. Dense indices from 0 thru max y
m6=: [: >: [: i. >./                NB. Dense indices from 1 thru max y
d7=: [ + [: i. [: -. -              NB. Dense indices from x thru y
m8=: <./ , >./                      NB. Min and max of y
m9=: #/.~                           NB. Frequency count of items of y
m10=: <./ d7 >./                    NB. Integers from min y to max y, inclusive
m11=: [: >: [: i. ]                 NB. Integers from 1 thru y,  inclusive
m12=: [: i. [: >: ]                 NB. Integers from 0 through y, inclusive
m13=: m25 d18 'x'"_                 NB. Barchart of y on vertical axis using ' x'
m14=: m25 d18 1:                    NB. Barchart of y on vertical axis using 0 1
m15=: |.@|:@m13                     NB. Barchart of y on horizontl axis using ' x'
m16=: |.@|:@m14                     NB. Barchart of y on horizontl axis using 0 1
m17=: [: -. m20                     NB. Table with i{y trailing 0s on row i
d18=: #"0                           NB. x replications of y
m19=: |.@|:@m23                     NB. Barchart of y (up the page)
m20=: [: |."1 m22                   NB. Table with i{y trailing 1s on row i
m21=: [: -. m22                     NB. Table with i{y leading 0s on row i
m22=: d18&1                         NB. y replications of 1, trailing 0s
m23=: d18&'x'                       NB. Barchart of y (across the page)
d24=: [ {. ] # 1:                   NB. List of y 1s followed by x-y 0s
m25=: [: <: [: m9 m11@(>./) ,]      NB. Count of y among 1 through max y
m26=: [: <: [: m9 m12@(>./) ,]      NB. Count of y among 0 through max y
m27=: [: <: [: m9 m10 , ]           NB. Count of y among min through max y
d28=: [:+/\{.@],>:@[#(}.-}:)@]%>:@[ NB. Interpolate x values between items of y
d29=: $@]$((* <.@:% #@]) /:@/:@,)   NB. Classify y into x groups
