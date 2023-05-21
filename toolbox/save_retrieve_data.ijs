NB. =========================================================
NB.%save_reteive_data.ijs - Save and retrieve data (ie: nouns) from the workspace to a keyfile
NB.-<script src="../js/toolbox_links.js"></script>
NB.- Script: ~addons/finexec/utilitry/save_retrieve_data.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 6 26
NB.- Depend: ~addons/data/jfiles/jfiles.ijs
NB.- Definitions: loaded to locale base 
NB.- Status: done
NB.- <a href="../save_retrieve_data.ijs" target="_blank">Script source: save_retrieve_data.ijs</a> 
NB.-<hr>
NB.- Save the data (ie: nouns) in the base or other locale in the 
NB.- workspace to a keyfile so that data can then be retrieved 
NB.- and used in a job again. A keyfile allows the data to be saved
NB.- using its noun name and the data retrieved by the same 
NB.- noun name. 
NB.-
NB.- Keyword file verbs are used to save and retrieve nouns from 
NB.- a keyfile for a job. Data is saved from the base locale 
NB.- unless otherwise specified.
NB.- Most likely data is only saved from base locale.
NB.- 
NB.- Saving data from a locale other than base'- see examples in saveData
NB.- and savedataTemp.
NB.- 
NB.- It is useful to save the data created in a job or project 
NB.- for further use.
NB.- 
NB.- The default keyfile name is KEYFILE_DEFAULT that has been defined
NB.- in the base locale that allows for simple saving and retrieving of data
NB.- without having to refer to the keyfile.
NB.- Otherwise the keyfile is as specified.
NB.- 
NB.- The keyfile KEYFILE_DEFAULT or other keyfile 
NB.- requires to be created first before any saving data.
NB.-
NB.-<b>(1) Create names for keyfiles eg:</b>
NB.- KEYFILE_DEFAULT   =: jpath '~user/temp/testkeyfile.ijf'
NB.- KEYFILE_OTHER     =: jpath '~user/temp/testkeyfileother.ijf'
NB.-
NB.-<b>(2) Erase any keyfiles with the same name (as requited)</b>  
NB.- ferase KEYFILE_DEFAULT
NB.- ferase KEYFILE_OTHER
NB.-
NB.-<b>(3) Create the keyfiles</b> 
NB.- keycreate KEYFILE_DEFAULT
NB.- keycreate KEYFILE_OTHER
NB.- 
NB.-<b>(4) Check that keyfiles have been created with extension: .ijf</b>  
NB.- dir '~user/temp'
NB.-
NB.-  keydir KEYFILE_DEFAULT  NB. shows the data saved in the keyfile
NB.-  keydir KEYFILE_OTHER    NB. shows the data saved in the keyfile
NB.- 
NB.-<b>(5) Create some data in the base locale.</b>
NB.- DATA =: 'N1 N2 N3' =: (i. 3 4);'Data';i. 12 12
NB.-
NB.-<b>(6) Create some data in the zzz locale</b>
NB.- DATAZ_zzz_ =: 'NZ1_zzz_ NZ2_zzz_ NZ3_zzz_' =: (i. 5 4);'DataZ';i. 15 15
NB.-
NB.-<b>(7) Save and retrieve data</b>
NB.- saveData('N1')
NB.- saveData('')   
NB.- saveData1('XXX') NB.- Writes an empty item if the noun is not defined.
NB.- savedDta('';'zzz')
NB.-
NB.- (KEYFILE_OTHER)savedata('') 
NB.- (KEYFILE_OTHER)savedata('';'zzz')
NB.-
NB.- retrieveData('') 
NB.- (KETFILE_OTHER)retrieveData('') 
NB.- 
NB.- See examples in the definitions: 
NB.- saveData1
NB.- retrievData1
NB.- saveDataTemp
NB.- retrieveDataTemp 
NB.-<hr>


require '~addons/data/jfiles/jfiles.ijs'


NB. =========================================================
NB.*saveData1 v - 
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> boxopen,keywrite
NB.- Saves one noun in base locale or another locale to the keyfile.
NB.- Assumes that the keyfile has been created.
NB.- Data in a locale other than the base locale is saved with the
NB.- locale extension. This allows the data to be retrieved to the
NB.- originating locale.  
NB.-syntax:
NB.+([K]savedata1(N;[L])
NB.+[K] = Optional keyfile name 
NB.+      DEFAULT = KEYFILE_DEFAULT - as defined in the base locale
NB.+(N) = noun name of data to be saved to the keyfile 
NB.+[L] = optional locale name
NB.+      default locale = base
NB.+      locale extension is added to noun name 
NB.-example:
NB.+  D1 =: i. 3 4            NB. base locale
NB.+  DZ_zzz_ =: 4 5 $'asd'   NB. zzz locale
NB.+  keydir KEYFILE_DEFAULT  NB. shows the data saved in the keyfile
NB.+  keydir KEYFILE_OTHER    NB. shows the data saved in the keyfile
NB.+
NB.+  saveData1('D1') 
NB.+  saveData1('' )    NB. nothing written to keyfile 
NB.+  saveData1('XXX')  NB. writes an empty item if no data.
NB.+  saveData1('DZ';'zzz')
NB.+  saveData1('DZ')   NB. writes an empty item as DZ not in base locale
NB.+  saveData1('DZ_zzz_')   NB. writes an empty item as DZ not in base locale
NB.+
NB.+  KEYFILE_OTHER saveData1('D1')
NB.+  KEYFILE_OTHER saveData1('DZ';'zzz')
NB.+  KEYFILE_OTHER saveData1('DZ')   NB. DZ not defined in base locale
NB. ---------------------------------------------------------
saveData1 =: 3 : 0
'' saveData1 y
:
y =. (boxopen y),<''
N =.  >0{y 
L =.  >1{y
if. -. 0 = # L do. LOC =. '_',L,'_' else. LOC =. L end.
NLOC =. N,LOC
if. 0 = # x do. (< ". NLOC) keywrite KEYFILE_DEFAULT;NLOC else. (< ". NLOC) keywrite x;NLOC end.
)


NB. =========================================================
NB.*saveData v - 
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> each,fexist,ketfile,saveData1,smoutput
NB.- Saves the nouns in base locale or another locale to a keyfile.
NB.- Assumes that the keyfile has been created.
NB.-syntax:
NB.+([K])saveData(N;[L])
NB.+[K] = Optional file name
NB.+      DEFAULT = KEYFILE_DEFAULT as defined in the base locale
NB.+N =  noun names of data to be saved to keyfile
NB.+     ''  all nouns in locale are saved to the keyfile
NB.+     'D1'  is saved to the keyfile 
NB.+     'D1 D2' are saved to keyfile
NB.+[L] = optional locale name
NB.+      default locale = base
NB.+      locale extension is added to noun name 
NB.-example:
NB.+Create data in the base locale
NB.+   DATA =: 'N1 N2 N3' =: (i. 3 4);'Data';i. 12 12
NB.+   names 0  NB. show nouns in the base locale
NB.+Create data in the zzz locale
NB.+   DATAZ_zzz_ =: 'NZ1_zzz_ NZ2_zzz_ NZ3_zzz_' =: (i. 5 4);'DataZ';i. 15 15
NB.+   names_zzz_ 0  NB. show the nouns in the zzz locale
NB.+
NB.+  keydir KEYFILE_DEFAULT  NB. shows the data saved in the keyfile
NB.+  keydir KEYFILE_OTHER    NB. shows the data saved in the keyfile
NB.+
NB.+  saveData('') 
NB.+  saveData('NZ1')
NB.+  saveData('NZ1 NZ2';'zzz')
NB.+  saveData('';'zzz')
NB.+
NB.+  KEYFILE_OTHER saveData('')
NB.+  KEYFILE_OTHER saveData('N1 N2')
NB.+  KEYFILE_OTHER saveData('N1 N2 DATAZ';'zzz')
NB. ---------------------------------------------------------
saveData=: 3 : 0
'' saveData y
:
if. 0 = # x do. KEYFILE =. KEYFILE_DEFAULT else. KEYFILE =. x end.
if. -. fexist KEYFILE do. smoutput <'*** No keyfile located ***' return. end.
y =. (boxopen y),<''
N=: >0{y 
L =:  >1{y
if. -. 0 = # L do. LOC =: '_',L,'_' else. LOC =. L end.
NB. base locale
if. 0 = # L do. if. 0 = # N do. NOUNS =: ;: , names 0 else. NOUNS =: ;: N end. end.
NB. other locale
if. -. 0 = # L do. if. 0 = # N do. NOUNS =: ;: , ". ('names',LOC),' 0' else. NOUNS =: ;: ,N end. end.
NOUNSLOC =: ,&LOC each NOUNS
KEYFILE & saveData1 each NOUNSLOC 
smoutput <'*** Data saved to Keyfile =>';KEYFILE
)


NB. =========================================================
NB.*retrieveData1 v -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> keyread
NB.- Retrieves one noun from a keyfile to base locale or other locales.
NB.- Assumes that keyfile exits.
NB.-syntax:
NB.+ ([K])retrieveData1(N)
NB.+[K] = Optional keyfile name
NB.+      DEFAULT = KEYFILE_DEFAULT - as defined in the base locale
NB.+N   = noun name to be retrieved from keyfile 
NB.+      and written to the workspace
NB.+      can have locale extension eg: N_zzz_ 
NB.-example: 
NB.+  keydir KEYFILE_DEFAULT  NB. shows the data saved in the keyfile
NB.+  keydir KEYFILE_OTHER    NB. shows the data saved in the keyfile
NB.+ 
NB.+   retrieveData1('D1')
NB.+   retrieveData1('DZ_zzz_')
NB.+   KEYFILE_OTHER retrieveData1('D1')
NB. ---------------------------------------------------------
retrieveData1 =: 3 : 0
'' retrieveData1 y
:
if. 0 = # x do. ".  y , '=:  > keyread KEYFILE_DEFAULT;y' else. ".  y , '=:  > keyread x;y'  end.
)


NB. =========================================================
NB.*retrieveData v - 
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> retrieveData1,ketdir,smoutput
NB.- Retrieves all nouns or selected nouns from a keyfile to 
NB.- the base locale or other locale with noun names.
NB.-syntax:
NB.+([K])retrieveData(N)
NB.+[K] = optional keyfile name
NB.+      default =  KETFILE_DEFAULT
NB.+N  = '' all nouns in locale are saved to the keyfile
NB.+     noun name to be retrieved from keyfile 
NB.+     can have locale extension eg: N_zzz_ 
NB.-example:
NB.+  retrieveData('')
NB.+  retrieveData('N1')
NB.+  (KEYFILE_OTHER)retreiveData('')
NB. ---------------------------------------------------------
retrieveData =: 3 : 0
'' retrieveData y
:
if. 0 = # x do. KEYFILE =. KEYFILE_DEFAULT else. KEYFILE =. x end.
if. -. fexist KEYFILE do. <'*** No keyfile located ***' return. end.
if. 0 = # y do. NOUNS =. keydir KEYFILE else. if. 32 = 3!:0 y do. NOUNS =.y 
                                        else. NOUNS =. ;: y end. end.
KEYFILE & retrieveData1 each NOUNS 
smoutput <'*** Nouns Retrieved from keyfile =>';KEYFILE
)


NB. =========================================================
NB.*saveDataTemp v -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> ferase,saveData,keycreate
NB.- Saves the nouns in base or other locale to the 
NB.- default keyfile.
NB.- jpath '~user/temp/tempkeyfile.ijf'
NB.- This can be used to save the nouns when developing a job and 
NB.- the nouns can be retrieved later.
NB.- If required for other use the file can be renamed
NB.- and relocated to another folder.
NB.- The default file is erased if already created - so make sure 
NB.- that it is not required.
NB.-syntax:
NB.+([K])saveDataTemp(N;[L]) y
NB.+ [K] = optional path and keyfile
NB.+       default = jpath '~user/temp/tempkeyfile.ijf'
NB.+N =  noun names of data to be saved to keyfile
NB.+     ''  all nouns in locale are saved to the keyfile
NB.+     'D1'  is saved to the keyfile 
NB.+     'D1 D2' are saved to keyfile
NB.+[L] = optional locale name
NB.+      default locale = base
NB.+      locale extension is added to noun name 
NB.-example:
NB.+   saveDataTemp ''
NB. ---------------------------------------------------------
saveDataTemp =: 3 : 0
'' saveDataTemp y
:
if. 0 = # y do. TempKeyFile =. jpath '~user/temp/tempkeyfile.ijf' else. TempKeyFile =. y end.
ferase TempKeyFile
keycreate TempKeyFile
TempKeyFile saveData y
)


NB. =========================================================
NB.*retrieveDataTemp v 
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> retrieveData
NB.- Retrieves all nouns from the keyfile:
NB.- jpath '~user/temp/tempkeyfile.ijf' 
NB.- or other keyfile.
NB.-syntax:
NB.+([K])retrieveDataTemp(N;[L]) y
NB.+ [K] = optional path and keyfile
NB.+       default = jpath '~user/temp/tempkeyfile.ijf'
NB.-example:
NB.+  retrieveDataTemp('')
NB. ---------------------------------------------------------
retrieveDataTemp =: 3 : 0
''retrieveDataTemp ''
:
if. 0 = # x do.  TempKeyFile =. jpath '~user/temp/tempkeyfile.ijf' else. TempKeyFile =. y end. 
TempKeyFile retrieveData ''
smoutput <' **** End of retrieve *****'
)


NB. =========================================================
NB.*nounsloc v -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> cut,each
NB.- Show all the nouns in a locale with the locale extension
NB.- as a boxed list.
NB.-syntax:
NB.+nounsloc(L)
NB.+L = locale name  
NB.-example:
NB.+   nounsloc 'z'
NB.+   nounsloc 'j'
NB. ---------------------------------------------------------
nounsloc =: 3 : 0
LOCALE =. '_',y,'_'
RES  =. cut ,". 'names',LOCALE,' 0'
RES1 =.  (,&LOCALE) each RES
)


NB. =========================================================
NB.*nounsTable m -
NB.- <b>Type:</b> tacit
NB.- Table of nouns in a boxed table with name and value.
NB.-syntax:
NB.+nounsTable(L)
NB.+L = boxed list of noun names
NB.-example:  
NB.+  nounsTable 'g' names ''
NB.+  A =: i. 2 3
NB.+  B =: 2 3 $ 'a'
NB.+  nounsTable 'A';'B'
NB.+┌─┬─────┐
NB.+│A│0 1 2│
NB.+│ │3 4 5│
NB.+├─┼─────┤
NB.+│B│aaa  │
NB.+│ │aaa  │
NB.+└─┴─────┘
NB.-
NB.+   nounsTable ;: ,names_z_ 0
NB.+   nounsTable ,&'_j_' each ;: ,names_j_ 0
NB.+   nounsTable ;: names 0
NB. ---------------------------------------------------------
nounsTable =: ] ,. ".&.>
NB. ---------------------------------------------------------
Note 'T nounsTable'
nounsTable =. 13 : 'y,. ". each y'
)


NB. =========================================================
NB.*nounsTableRetrieve m -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> each
NB.- Retrieve nouns from table created by nounsTable.
NB.-syntax:
NB.+nounsTableRetrieve(T) 
NB.+T = boxed tabled created nounsTable
NB.-example:
NB.+  'A B C' =: 'AAA';123;i. 3 4
NB.+  T =: nounsTable('A';'B';'C')
NB.+  D =: 0{ T
NB.+   erase('A B C')
NB.+   nounsTableRetrieve(T)
NB. ---------------------------------------------------------
nounsTableRetrieve =: 3 : 0
ret =.  3 : '(> 0{ y) =: (> 1{ y)'
ret each <"1 y
)


NB. =========================================================
NB.*filesList m -
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> dir,cut,each
NB.- List of files in a folder as a text with LF
NB.- Useful for producing a list for windows.
NB.- Only the files from the folder are listed. Files in sub-folders
NB.- are not listed.
NB.-syntax:
NB.+filesList(F)
NB.+F = path to folder
NB.-
NB.+   filesList(jpath '~addons/finance/fp')
NB. ---------------------------------------------------------
filesList =: 3 : 0
vfm =. 3 : '}:(,|."1 [ 1,.-. *./\"1 |."1 y='' '')#,y,.LF'
L1 =. 1 dir y
L2 =. vfm  > _1{"1 > '\' cut_z_ each L1
)


NB. =========================================================
NB.*filesListn m - 
NB.- <b>Type:</b> explicit
NB.- <b>Depend:</b> dir,cut,each,joinstring,each
NB.- List of files in a folder as a text with LF - no extension
NB.- Useful for producing a list for windows.
NB.- Only files from the folder are listed. Files in sub-folders
NB.- are not listed.
NB.-syntax:
NB.+filesListn(F)
NB.+F = path to folder
NB.-example:
NB. + filesListn(jpath'~addons/finance/finexec')
NB. ---------------------------------------------------------
filesListn =: 3 : 0
vfm =. 3 : '}:(,|."1 [ 1,.-. *./\"1 |."1 y='' '')#,y,.LF'
dltLastBox =. ] {.~ 1 >. _1 + #
dtDots =. #~ [: +./\. '.'&~:
L1 =. 1 dir y
L2 =. _1{"1 > '\' cut_z_ each L1
NB. need to delete last 
L3 =. > each >  dltLastBox each '.' cut_z_ each L2
L4 =. <"1 dltb each > <"1 each  L3 
L5 =. '.'&joinstring each L4
L6 =. vfm > dtDots each L5
)


NB. =========================================================
NB.*dtDots m -
NB.- <b>Type:</b> tacit
NB.- Delete trailing dots.
NB.- Taken from 'strings.ijs'
NB.-syntax:
NB.+dtDots(T)
NB.+T = text
NB.-example:
NB.+  dtDots 'asdf...'
NB.+  dtDots 'as .. df'
NB.+as .. df
NB._
NB.+   dtDots '..as .. df....' 
NB.+..as .. df
NB.-
NB.+  dtDots '..as ..df. ...' 
NB.+..as ..df. 
NB. ---------------------------------------------------------
dtDots =: #~ [: +./\. '.'&~:


NB. =========================================================
NB.*dltLastBox m - 
NB.- <b>Type:</b> tacit
NB.- Delete the last box if two or more boxes. 
NB.-syntax:
NB.+dltLastBox(L)
NB.+L = boxed list
NB.-example:
NB.+  dltLastBox 'asdf';'sadf asdf';'exe'
NB.+┌────┬─────────┐
NB.+│asdf│sadf asdf│
NB.+└────┴─────────┘
NB.-
NB.+  dltLastBox <'asdf zxc'
NB.+┌────────┐
NB.+│asdf zxc│
NB.+└────────┘
NB. ---------------------------------------------------------
dltLastBox =: ] {.~ 1 >. _1 + #
NB. ---------------------------------------------------------
Note 'T dltLastBox'
dlLastBox =. 13 : '(1>. _1+(#y)){. y'
)


