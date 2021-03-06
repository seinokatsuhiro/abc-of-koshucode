# I/O List

- koshu [O.k](#ok)



## [O.k](O.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - O 項目の抜き出し
**
**  使用法
**    koshu O.k
**

**  ROP-INDEX
**    ファイル /file のなかで関係写像演算子 /rop を使用している。

|-- ROP-INDEX  /file "O.k"  /rop 'cut
|-- ROP-INDEX  /file "O.k"  /rop 'join
|-- ROP-INDEX  /file "O.k"  /rop 'pick
|-- ROP-INDEX  /file "O.k"  /rop 'source

index : source ROP-INDEX /file /rop

**  項目 /rop を抜き出す
|== PICK      : index | pick /rop
|== JOIN      : index | join ( source PHANTOM /rop )

**  項目 /rop を取り除く
|== CUT       : index | cut /rop

**  すべての項目を取り除く
|== PICK-NON  : index | pick
|== CUT-ALL   : index | cut /file /rop

```

Command `koshu O.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    O.k
**
**  OUTPUT
**    <stdout>
**

|-- PICK  /rop 'cut
|-- PICK  /rop 'join
|-- PICK  /rop 'pick
|-- PICK  /rop 'source

*** 4 judges

|-- JOIN  /rop 'cut
|-- JOIN  /rop 'join
|-- JOIN  /rop 'pick
|-- JOIN  /rop 'source

*** 4 judges

|-- CUT  /file "O.k"

*** 1 judge 

|-- PICK-NON

*** 1 judge 

|-- CUT-ALL

*** 1 judge 

**
**  SUMMARY
**       1 judge  on CUT
**       1 judge  on CUT-ALL
**       4 judges on JOIN
**       4 judges on PICK
**       1 judge  on PICK-NON
**      11 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
