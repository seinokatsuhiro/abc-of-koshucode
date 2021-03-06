# N. 結び


[M. 共通部分と直積][M] で、関係写像演算子の交わりが、
集合演算子の共通部分の一般化であることをみました。
それでは、集合演算子の合併は、関係モデルのなかで、
どのように一般化されるのでしょうか。

まず、

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- X  /a 'A1  /b 'B1
|-- X  /a 'A1  /b 'B2
|-- X  /a 'A2  /b 'B3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

と

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- Y  /b 'B1  /c 'C1
|-- Y  /b 'B2  /c 'C3
|-- Y  /b 'B2  /c 'C4
|-- Y  /b 'B4  /c 'C4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

の交わりが

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
|-- Z  /c 'C1  /a 'A1  /b 'B1
|-- Z  /c 'C4  /a 'A1  /b 'B2
|-- Z  /c 'C3  /a 'A1  /b 'B2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

になることをよく観察してみましょう。

項目に関しては、つぎの性質が観察されます。

 - `X` の項目は `Z` の項目に含まれている。
 - `Y` の項目は `Z` の項目に含まれている。

また、組に関して、つぎの性質が観察されます。

 - `Z` の組は、`X` の項目に関して、`X` の組に含まれている。
 - `Z` の組は、`Y` の項目に関して、`Y` の組に含まれている。

つぎに、`X` と `Y` を交わりとは異なる方法で組み合わせた結果が
`V` になるとして、これらの性質が逆になる演算を考えてみましょう。

 - `V` の項目は `X` の項目に含まれている。
 - `V` の項目は `Y` の項目に含まれている。
 - `X` の組は、`V` の項目に関して、`V` の組に含まれている。
 - `Y` の組は、`V` の項目に関して、`V` の組に含まれている。

これらの性質をみたす具体的な内容を調べましょう。
まず、`X` の項目 `/a` `/b` にも、`Y` の項目 `/b` `/c` にも、
ともに含まれる (最大の) 項目集合は `/b` になるので、
`V` は項目 `/b` をもっていると考えられます。
つぎに、`X` を `/b` だけにした

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- X2  /b 'B1
|-- X2  /b 'B2
|-- X2  /b 'B3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

と、`Y` を `/b` だけにした

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- Y2  /b 'B1
|-- Y2  /b 'B2
|-- Y2  /b 'B4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

が `V` に含まれるということは、
組に関する性質を最大限にみたす `V` は、
`X2` の組と `Y2` の組を単純に合併すればよいと考えられます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
|-- V  /b 'B1
|-- V  /b 'B2
|-- V  /b 'B3
|-- V  /b 'B4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

この `V` が `X` と `Y` の合併の一般化であり、
その演算子は **結び** `join` とよばれます。
結びは、ふたつの関係の共有項目を合併する演算で、
交わり `meet` と対になる関係モデルの基礎演算です。

関係モデルは、データ構造依存性の高い
データベースの使い方を改善するために、
1969 年から 1970 年にコッドによって発見され、
交わりに相当する自然結合、結びの代わりに古典的な合併、
そのほかに、差、項目名変更、射影、制限などの
演算子をもつ代数系が定式化がされました。
その後、2005 年ころにトロパシコによって、交わりと結びを基礎演算とする、
より数学的に厳密で理解しやすい新しい代数系が発見されました。
この代数系は、[束][lattice] という抽象代数系の具体形になっているため、
**関係束** とよばれています。

交わり `meet` と結び `join` を含んだ計算式

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
x : source X /a /b
y : source Y /b /c

|== Z : x | meet y
|== V : x | join y
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

を [`koshu N.k`][koshu N.k] で実行すると、
つぎの計算結果が得られます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
** -*- koshu -*-
**  
**  INPUT
**    N.k
**    

|-- Z  /c 'C1  /a 'A1  /b 'B1
|-- Z  /c 'C4  /a 'A1  /b 'B2
|-- Z  /c 'C3  /a 'A1  /b 'B2
|-- V  /b 'B1
|-- V  /b 'B2

|-- V  /b 'B3
|-- V  /b 'B4

**  
**  SUMMARY
**       4 judges on V
**       3 judges on Z
**       7 judges in total
**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


[M]: ../M
[koshu N.k]: INOUT.md
[lattice]: http://ja.wikipedia.org/wiki/束論

