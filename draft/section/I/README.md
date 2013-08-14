# I. 関係写像演算子


甲州記法では、`add` や `+` のような演算子を使って、
データの計算を表現します。
たとえば、[`B.k`][B.k] や [`C.k`][C.k] の計算式

``` text
affirm ABCD
  source ABC /a /b /c
  | add /d ( /a + /b + /c )
```

では、項目 `/a` `/b` `/c` の内容を足して、
新しい項目 `/d` として追加するという計算を行います。
`add` と `+` は、ともに **演算子** とよばれますが、
`add` は関係を出力するのに対して、
`+` は関係のなかの個々の項目の内容を出力するところが異なります。
`add` のような入力となる関係から出力となる関係を計算する演算子は
**関係写像演算子** とよばれます。

`/a + /b = /c` などの式の `=` や、
等しくない `<>`、大きい `<` などは、
一般的に、 **関係演算子** とよばれます。
これは、`/a + /b` と `/c` というふたつの式の間に
どのような関係が成り立つかどうかを表現するからです。
これに対して、関係写像演算子は、
関係から関係への写像の種類をあらわします。
しかし、あいまいさのないときは、関係写像演算子を、
単に、関係演算子ということもあります。

これまでに登場した関係写像演算子は `add` `hold` `source` だけです。
これらの演算子の機能を、手短かに説明すると、つぎのように書けるでしょう。

``` text
|-- ROP  /rop 'add         /desc '項目の内容を計算し、新しい項目を追加する
|-- ROP  /rop 'hold        /desc '条件をみたす組を選び出す
|-- ROP  /rop 'source      /desc '判断集合を関係として読み出す
```

`/rop` は関係写像演算子 (relation-mapping operator) の名前で、
`/desc` はその手短かな説明 (description) です。
これらの説明も判断の一種として定式化しています。
というのは、正しいか間違っているかを判定できるからです。
たとえば、`/rop` と `/desc` をつぎのように組み合わせれば、
間違っていることになります。

``` text
|-X ROP  /rop 'hold        /desc '判断集合を関係として読み出す
```

甲州記法の関係演算子は開かれた体系で、拡張する手段が用意されています。
しかしながら、よく使う演算子や、基礎となる演算子というものがあり、
入門書である本書では、そのような演算子に限定して説明しています。
それらの演算子は [`ROP.k`][ROP.k] に一覧されています。

``` text
|-- ROP  /rop 'add         /desc '項目の内容を計算し、新しい項目を追加する
|-- ROP  /rop 'cut         /desc '指定された項目を選び出す
|-- ROP  /rop 'hang        /desc '交わり部分関係を新しい項目として追加する
|-- ROP  /rop 'hold        /desc '条件をみたす組を選び出す
|-- ROP  /rop 'join        /desc 'ふたつの関係の結びを計算する
|-- ROP  /rop 'maybe       /desc '片側の関係が成立しなくてもよい交わり
|-- ROP  /rop 'maybe-both  /desc 'どちらかがの関係が成立すればよい交わり
|-- ROP  /rop 'meet        /desc 'ふたつの関係の交わりを計算する
|-- ROP  /rop 'pick        /desc '指定された項目を取り除く
|-- ROP  /rop 'reldee      /desc '無項万有関係
|-- ROP  /rop 'reldum      /desc '無項空関係
|-- ROP  /rop 'rename      /desc '項目名を変更する
|-- ROP  /rop 'source      /desc '判断集合を関係として読み出す
```


[B.k]:   https://github.com/seinokatsuhiro/abc-book-of-koshucode/blob/master/draft/section/B/B.k
[C.k]:   https://github.com/seinokatsuhiro/abc-book-of-koshucode/blob/master/draft/section/C/C.k
[ROP.k]: https://github.com/seinokatsuhiro/abc-book-of-koshucode/blob/master/draft/section/ROP.k
