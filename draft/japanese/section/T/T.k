** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - T 項目内容リスト
**
**  使用法
**    koshu T.k
**

**  ROP-INDEX
**    ファイル /file のなかで演算子 /rop を使っている。

|-- ROP-INDEX  /file "O.k"  /rop 'cut
|-- ROP-INDEX  /file "O.k"  /rop 'join
|-- ROP-INDEX  /file "O.k"  /rop 'pick
|-- ROP-INDEX  /file "O.k"  /rop 'source

|-- ROP-INDEX  /file "P.k"  /rop 'cut
|-- ROP-INDEX  /file "P.k"  /rop 'keep
|-- ROP-INDEX  /file "P.k"  /rop 'dee
|-- ROP-INDEX  /file "P.k"  /rop 'dum
|-- ROP-INDEX  /file "P.k"  /rop 'source

|-- ROP-INDEX  /file "Q.k"  /rop 'meet
|-- ROP-INDEX  /file "Q.k"  /rop 'rename
|-- ROP-INDEX  /file "Q.k"  /rop 'source

|-- ROP-INDEX  /file "R.k"  /rop 'meet
|-- ROP-INDEX  /file "R.k"  /rop 'maybe
|-- ROP-INDEX  /file "R.k"  /rop 'source

|-- ROP-INDEX  /file "S.k"  /rop 'group
|-- ROP-INDEX  /file "S.k"  /rop 'pick
|-- ROP-INDEX  /file "S.k"  /rop 'source

index      : source ROP-INDEX /file /rop
file       : index | pick  /file
file-group : file  | group index -to /r
file-rops  : file-group
           | add /rops ( /r/rop )
           | cut /r

|== FILE-ROPS : file-rops
  --forward /file

