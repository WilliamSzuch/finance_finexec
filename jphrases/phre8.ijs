NB.%phre8.ijs - J Phrases Section 8E. Complex Numbers
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Phrases</a>
NB.-<hr>
NB.- <a href="../phre8.ijs" target="_blank">Script source: phrde8.ijs</a>
NB.<hr>


m0=: cnj=: +                                NB. Conjugate
m1=: mag=: |                                NB. Magnitude
m2=: %:@(cnj*])                             NB. "
m3=: rai=: +.                               NB. Real and imaginary parts
m4=: maa=: *.                               NB. Magnitude and angle
m5=: irai=: rai^:_1                         NB. Inverse rai
m6=: imaa=: maa^:_1                         NB. Inverse maa
m7=: rou=: [:^ 0j2p1&% * i.                 NB. Roots of unity
m8=: rpg=: rai@rou                          NB. Regular polygon
d9=: zero=: ] * 10&^@-@[ < |                NB. Zero any real y less than 10^-x in mag
m10=: z=:({.,{:*1e_6"_<%~/@:|)&.rai         NB. Zero imaginary if relatively small
m11=: (1e_10&$:) : (j./"1@((] * (<:|)) +.)) NB. Clean y
