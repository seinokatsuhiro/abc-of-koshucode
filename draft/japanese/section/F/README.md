# F. 肯定判断と否定判断


この節では、判断集合を、一定の基準で、肯定と否定に分類します。

``` text
|-- ABC  /a 1  /b 2  /c 3
|-- ABC  /a 1  /b 4  /c 5
|-- ABC  /a 3  /b 2  /c 5
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7
```

この判断集合を、
`/a` と `/b` の和が `/c` に一致するという判断と、
一致しないという判断に分けてみましょう。
出力結果の判断の種類として `A-PLUS-B-EQ-C`
という記号を割り当てます。この記号は、

 - `/a` と `/b` の和は `/c` である。

という日本語の文に対応しています。
この文は、データの読み方、あるいは、解釈方法になっているので、
判断種 `A-PLUS-B-EQ-C` の **データ解釈** とよばれます。
データ解釈は、論理学の用語でいうところの **述語** に対応します。
述語は、`/a` のような項目に具体的な内容を埋めると、
真か偽が確定するような文です。

つぎの 3 つの判断は、`A-PLUS-B-EQ-C`
に対応する文を正しくします。

``` text
|-- A-PLUB-B-EQ-C  /a 1  /b 2  /c 3
|-- A-PLUB-B-EQ-C  /a 1  /b 4  /c 5
|-- A-PLUB-B-EQ-C  /a 3  /b 2  /c 5
```

データ解釈、つまり、日本語の文に展開すると、
つぎのように書けます。

 - `/a 1` と `/b 2` の和は `/c 3` である。
 - `/a 1` と `/b 4` の和は `/c 5` である。
 - `/a 3` と `/b 2` の和は `/c 5` である。

つぎの `|-X` が付与された 2 つの判断は、
日本語の文を間違いにします。

``` text
|-X A-PLUB-B-EQ-C  /a 4  /b 7  /c 3
|-X A-PLUB-B-EQ-C  /a 2  /b 7  /c 7
```

記号 `|--` は判断種
`A-PLUS-B-EQ-C` に対応するデータ解釈に、
項目の具体的な内容を与えると正しい判断、
つまり、 **肯定判断** となるときに使われます。
逆に、記号 `|-X` はデータ解釈に
項目の具体的な内容を与えると間違った判断、
つまり、 **否定判断** となるときに使われます。

これらの肯定判断と否定判断を計算する式を書いてみます。
`hold` の条件式として `=` (等しい) と `<>` (等しくない)
のふたつをつくり、それぞれの式の名前を `eq` と `neq` とします。

``` text
abc  : source ABC /a /b /c
eq   : abc | hold ( /a + /b =  /c )
neq  : abc | hold ( /a + /b <> /c )
```

`eq` を `affirm` (肯定する) で書き出し、
`neq` を `deny` (否定する) で書き出します。

``` text
affirm A-PLUS-B-EQ-C | eq
deny   A-PLUS-B-EQ-C | neq
```

この計算式を [`F.k`][F.k] というファイルに保存し、
`koshu F.k` で甲州計算機を実行すると、
3 つの肯定判断と 2 つの否定判断が出力されます。

``` text
** -*- koshu -*-
**  
**  INPUT
**    F.k
**    

|-- A-PLUS-B-EQ-C  /a 1  /b 2  /c 3
|-- A-PLUS-B-EQ-C  /a 1  /b 4  /c 5
|-- A-PLUS-B-EQ-C  /a 3  /b 2  /c 5
|-X A-PLUS-B-EQ-C  /a 4  /b 7  /c 3
|-X A-PLUS-B-EQ-C  /a 2  /b 7  /c 7

**  
**  SUMMARY
**       5 judges on A-PLUS-B-EQ-C
**       5 judges in total
**
```


[F.k]:  https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/japanese/section/F/F.k

<!-- ------------------------------------------------------------------
|-- TERM  /ja0 'こ  /ja '肯定判断            /en "affirmative judge"
|-- TERM  /ja0 'じ  /ja '述語                /en "predicate"
|-- TERM  /ja0 'で  /ja 'データ解釈          /en "data interpretation"
|-- TERM  /ja0 'ひ  /ja '否定判断            /en "denied judge"
------------------------------------------------------------------- -->
