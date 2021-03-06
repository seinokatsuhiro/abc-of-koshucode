# L. 交わり


関係写像演算子 `meet` は **交わり** とよばれ、
ふたつの関係を連結します。
ちょうど、数値の `3` に数値の `4` をかけると数値の `12` になるように、
関係 `x` に関係 `y` を交わらせると関係 `z` になります。
甲州記法では、この計算は、つぎのような式で表現されます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
z : x | meet y
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

交わりは関係 `x` と関係 `y` が同時に成り立つような
組み合わせを求める演算です。

 - 関係 `x` の項目が `/a 'A1` `/b 'B1` で
   関係 `y` の項目が `/b 'B1` `/c 'C1` ならば、
   共有項目 `/b` の内容が一致するので、同時に成り立ちます。

 - 関係 `x` の項目が `/a 'A1` `/b 'B1` で
   関係 `y` の項目が `/b 'B2` `/c 'C3` ならば、
   共有項目 `/b` の内容が一致しないので、同時には成り立ちません。

関係は項目の組の集合なので、
`x` の組と `y` の組のすべての組み合わせを調べ、
その共有項目が一致するときに、項目を合併した新しい組をつくることで、
ふたつの関係の交わりが計算できます。

項目 `/a` `/b` `/c` をもつ人工的な判断データで、
交わりの計算例をみてみましょう。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- X  /a 'A1  /b 'B1
|-- X  /a 'A1  /b 'B2
|-- X  /a 'A2  /b 'B3    ** X のみ成立

|-- Y  /b 'B1  /c 'C1
|-- Y  /b 'B2  /c 'C3
|-- Y  /b 'B2  /c 'C4
|-- Y  /b 'B4  /c 'C4    ** Y のみ成立
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

判断集合 `X` を関係 `x` として読み出し、
判断集合 `Y` を関係 `y` として読み出し、
つぎの計算式で交わりを計算します。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
x : source X /a /b
y : source Y /b /c
z : x | meet y

|== Z : z
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

これらをファイル [`L.k`][L.k] に保存して、甲州計算機を実行します。

* [koshu L.k]

計算結果として 3 つの判断が出力されます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
|-- Z  /c 'C1  /a 'A1  /b 'B1
|-- Z  /c 'C4  /a 'A1  /b 'B2
|-- Z  /c 'C3  /a 'A1  /b 'B2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

交わりは、ふたつの関係が同時に成り立つか、成り立たないかで
計算結果が決まるので、`x` と `y` の交わりは `y` と `x` の交わりと同じです。
この `x` と `y` は交換可能であるという性質は **可換性** とよばれます。
`3 * 4` と `4 * 3` がともに `12` になることと同じ性質です。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|== YX : y | meet x    ** 判断集合 Z に同じ (可換性)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

正しいことは、何度繰り返しても、その正しさは変わらないので、
自分自身との交わりは、ふたたび、自分自身になります。
この `x` を繰り返しても自分自身になるという性質は
**べき等性** とよばれます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|== XX : x | meet x    ** 判断集合 X に同じ (べき等性)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


[L.k]:   ../L/L.k
[koshu L.k]: INOUT.md

