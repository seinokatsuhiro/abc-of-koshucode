# M. 共通部分と直積


関係の交わりを計算する演算子 `meet` は、
たとえば、項目 `/a` `/b` からなる組と
項目 `/b` `/c` からなる組が両立するときに、
それらを合併して、項目 `/a` `/b` `/c` からなる組をつくります。
この場合、`/b` が共有項目で、
`/a` が左側の固有項目、`/c` が右側の固有項目です。

<ul class="term-placement">
 <li><span>左固有<span class="word-term">項目</span></span> <code>/a</code></li>
 <li><span>共有<span class="word-term">項目</span></span> <code>/b</code></li>
 <li><span>右固有<span class="word-term">項目</span></span> <code>/c</code></li>
</ul>

この節では、交わりの特殊形として、
共有項目のみの場合と、共有項目をもたない場合を取り上げます。


## 共有項目のみ

項目 `/a` `/b` を共有し、固有項目がない例をつくります。

<ul class="term-placement">
 <li><span>左固有<span class="word-term">項目</span></span> <code></code></li>
 <li><span>共有<span class="word-term">項目</span></span> <code>/a /b</code></li>
 <li><span>右固有<span class="word-term">項目</span></span> <code></code></li>
</ul>

判断種 `X` は項目 `/a` `/b` をもちます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- X  /a 'A1  /b 'B1
|-- X  /a 'A1  /b 'B2
|-- X  /a 'A2  /b 'B3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

判断種 `Y` も判断種 `X` と同じく項目 `/a` `/b` をもちます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- Y  /a 'A1  /b 'B2
|-- Y  /a 'A2  /b 'B3
|-- Y  /a 'A3  /b 'B3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

これを、つぎの式で計算します。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
x  : source X /a /b
y  : source Y /a /b
xy : x | meet y

|== XY : xy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

計算結果は、`/a` `/b` が完全に一致する判断集合になります。
これは、判断集合 `X` と `Y` の共通部分と同じです。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
|-- XY  /a 'A1  /b 'B2
|-- XY  /a 'A2  /b 'B3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

共有項目のみのときの交わりは、
古典的な集合の共通部分と同じになります。
逆にいえば、古典的な共通部分は同じ型の要素を要求するのに対して、
型の違う要素からなる集合に一般化した演算が交わりであるといえます。


## 共有項目なし

つぎに共有項目がない場合を計算します。
上の判断種 `X` `/a` `/b` と、
新しい判断種 `Z` `/c` を使うことにしましょう。

<ul class="term-placement">
 <li><span>左固有<span class="word-term">項目</span></span> <code>/a /b</code></li>
 <li><span>共有<span class="word-term">項目</span></span> <code></code></li>
 <li><span>右固有<span class="word-term">項目</span></span> <code>/c</code></li>
</ul>

判断種 `Z` は項目 `/c` をもちます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|-- Z  /c 'C1
|-- Z  /c 'C2
|-- Z  /c 'C3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`X` と `Z` の交わりを計算します。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
x  : source X /a /b
z  : source Z /c
xz : x | meet z

|== XZ : xz
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

結果は `X` と `Z` のすべての組み合わせからなる判断が計算されます。
見やすさのために、3 行ごとに空行を入れています。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
|-- XZ  /c 'C3  /a 'A1  /b 'B1
|-- XZ  /c 'C2  /a 'A1  /b 'B1
|-- XZ  /c 'C1  /a 'A1  /b 'B1

|-- XZ  /c 'C3  /a 'A1  /b 'B2
|-- XZ  /c 'C2  /a 'A1  /b 'B2
|-- XZ  /c 'C1  /a 'A1  /b 'B2

|-- XZ  /c 'C3  /a 'A2  /b 'B3
|-- XZ  /c 'C2  /a 'A2  /b 'B3
|-- XZ  /c 'C1  /a 'A2  /b 'B3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

これは、古典的な集合の演算における
直積 (デカルト積) に相当する計算結果が返されます。
直積は、`(/a /b, /c)` という構造をつくるので、
完全に同じではありませんが、その内容に着目すれば同じといえます。


## 交わり

共有項目のみと共有項目なしは、交わりのふたつの端に位置する特殊形です。
共有項目のみは共通部分と同じく、
共有項目なしは直積と同じくなり、
共有項目も固有項目もある交わりは、その中間であるといえます。
これらはいずれも、左の組と右の組が両立する組を計算するもので、
日常のことばでは、「... かつ ...」や「...で、...」に相当します。

交わりの計算は連立方程式に似ていると感じるかもしれません。
実際、そのとおりで、個々の関係は、個々の方程式の解空間に相当し、
交わりは、それらの方程式を連立するという演算に相当します。
方程式では `x` や `y` のような変数の名前が同じであれば、
それらを共有しているように、甲州記法、つまり、関係モデルでは、
項目の名前が同じであれば、それらを共有しています。


[M.k]:   ../M/M.k

