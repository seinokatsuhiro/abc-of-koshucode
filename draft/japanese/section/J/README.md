# J. 入力の分割と合併


甲州計算機のこれまでの計算例では、
[`F.k`][F.k] のように、ひとつのファイルのなかに
判断データと計算式をいっしょに書いていました。
この節では、ファイルを分割して、
計算を実行するときに合併する方法を取り上げます。

関係写像演算子の手短かな説明 [`ROP.k`][ROP.k] は、
判断データのみで、計算式を含んでいません。
このデータから特定の名前の演算子のみを選び出す計算を、
つぎの計算式で行います。

``` text
affirm ROP
  | source ROP /rop /desc
  | hold /rop = 'source
      or /rop = 'hold
```

この計算式を [`J.k`][J.k] というファイルに保存し、
[`ROP.k`][ROP.k] と組み合わせて計算を実行するには、
甲州計算機にふたつのファイルを与えます。

``` sh
$ koshu J.k ../ROP.k
```

ふたつのファイルの内容は合併されて、
あたかも、ひとつのファイルに書いてあったかのように実行されます。
計算結果として、2 つの判断が出力されます。

``` text
** -*- koshu -*-
**  
**  INPUT
**    J.k
**    ../ROP.k
**    

|-- ROP  /rop 'hold  /desc '条件をみたす組を選び出す
|-- ROP  /rop 'source  /desc '判断集合を関係として読み出す

**  
**  SUMMARY
**       2 judges on ROP
**       2 judges in total
**
```

つぎのようにファイルを与える順番を逆にしても、
同じ結果が出力されます。

``` sh
$ koshu ../ROP.k J.k
```

甲州記法では、多くの場面で順番は重要ではなく、
計算式を書く順番を変えても、判断を書く順番を変えても、
判断のなかの項目を書く順番を変えても、ファイルをどのように分割しても、
ファイルを与える順番を変えても、すべて同じ結果になります。


[F.k]:   https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/japanese/section/F/F.k
[J.k]:   https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/japanese/section/J/J.k
[ROP.k]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/japanese/section/ROP.k
