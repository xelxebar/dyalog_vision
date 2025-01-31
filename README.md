# [Dyalog APL](https://www.dyalog.com/) Vision

This is [my](https://apl.wiki/Adám_Brudzewsky) vision for a realistic development of core Dyalog APL, including extending the domains of existing primitives/quad-names, and adding a few new ones. Requires Dyalog APL version 18.2 or higher.

### How to use

You can easily play with these almost like you use normal Dyalog APL in a session:

#### Initialisation

From within Dyalog APL 18.2 or higher, enter `]get path/dyalog_vision` or to import directly from GitHub `]get https://github.com/abrudz/dyalog_vision`

#### Running code

You have three options:

1. Use the extensions directly with the glyph names, e.g. `4 1 dyalog_vision.RightShoeUnderbar ⎕A`.
2. Use `dyalog_vision.∆FIX` as a drop in for `⎕FIX`.
3. Use `dyalog_vision.⍙REPL #` to start a (limited) session where the glyphs work. Enter `→` to exit.

### Content

* All scalar functions support [leading axis agreement](https://aplwiki.com/wiki/Leading_axis_agreement).

* All set functions support arguments of any rank.

* `⎕C` and monadic `⎕UCS` are scalar functions.

* In addition, the following is included:

| Name                                        | Symbol    | Type* | Extension                                                                                                                                                                                                                             | Examples                                                                                                       |
| ------------------------------------------- |:---------:|:-----:| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| [CircleDiaeresis](CircleDiaeresis.aplo)     | `⍥`       | 🔵✅  | Depth when right operand is array. This is similar to Rank (`⍤`) but applies at nesting level.                                                                                                                                        | `f⍥0` applies `f` like a scalar function and `f⍥1` applies to flat subarrays. `f⍤1⍥1` applies to flat vectors. |
| [DelDiaeresis](DelDiaeresis.aplo)           | `⍢`       | 🔺    | Under (a.k.a. Dual). Like `f⍥g` but conceptually inverts the right operand when done. If `g` is a selection function, it puts the data back where it came from                                                                        | `-⍢(2 3∘⊃)` negates the 2nd element's 3rd element.                                                             |
| [DelTilde](DelTilde.aplo)                   | `⍫`       | 🔺    | Obverse; `⍺⍺` but with inverse `⍵⍵`                                                                                                                                                                                                   | `×⍢(FFT⍫iFFT)`                                                                                                 |
| [DollarSign](DollarSign.aplf)               | `$`       | 🔺    | string enhancement <code>${1}</code>:`1⊃⍺`, <code>${expr}</code>:`⍎expr`, `\n`:JSON                                                                                                                                                   | `'Dyer' 'Bob'$'Hi, ${2} ${1}!`<br/>`$'Hi, ${first} ${last}!`<br/>`$'2×3=${2×3}'`                               |
| [DownArrow](DownArrow.aplf)                 | `↓`       | 🔵    | dyad allows long `⍺`                                                                                                                                                                                                                  | `0 1↓'abc'` gives `1 2⍴'bc'`                                                                                   |
| [DownTack](DownTack.aplf)                   | `⊤`       | ⚠     | `⊥⍣¯1` when left argument is scalar                                                                                                                                                                                                   | `2⊤123` gives `1 1 1 1 0 1 1`                                                                                  |
| [EpsilonUnderbar](EpsilonUnderbar.aplf)     | `⍷`       | 🔶    | monad: Type (like `∊` with `⎕ML←0`)                                                                                                                                                                                                   | `⍷1'a'#` gives `0' '#`'                                                                                        |
| [JotUnderbar](JotUnderbar.aplo)             | `⍛`       | 🔺✅  | reverse composition `X f⍛g Y` is `(f X) g Y` and default argument                                                                                                                                                                     | `⌽⍛≡` checks for palindromes.<br/>`a-⍛↑b` takes the last `a` from `b`.                                         |
| [LeftShoe](LeftShoe.aplf)                   | `⊂`       | 🔵    | dyad allows partitioning along multiple leading axes                                                                                                                                                                                  | `(⊂1 1)⊂matrix` separates out the first row and column.                                                        |
| [LeftShoeUnderbar](LeftShoeUnderbar.aplf)   | `⊆`       | 🔵    | dyad allows partitioning along multiple leading axes                                                                                                                                                                                  | `(⊂1 0 1 1)⊆4 4⍴⎕A` splits off the first row and column, and removes the second.                               |
| [QuadEqual](QuadEqual.aplo)                 | `⌸`       | 🔵    | allow array operand to be vocabulary (then uses `{⊂⍵}` as internal operand)                                                                                                                                                           | `≢¨'ACGT'⌸'ATT-ACA'` gives `3 1 0 2`                                                                           |
| [QuadDiamond](QuadDiamond.aplo)             | `⌺`       | 🔶    | auto-extended `⍵⍵`, allows small `⍵`, optional edge spec(s) ([0:Zero; 1:Repl; 2:Rev; 3:Mirror; 4:Wrap](http://web.science.mq.edu.au/~len/preprint/hamey-dicta2015-functional-border.pdf#page=3); -:Twist) with masks as operand's `⍺` | Life on a cylinder: `0 4 Life⌺3 3`                                                                             |
| [Rho](Rho.aplf)                             | `⍴`       | 🔵    | dyad: negatives reverse axis, `0.5` auto-size rounding down, `1.5` auto-size rounding up, `2.5` auto-size with padding                                                                                                                | Reshape into two columns: `0.5 2⍴data`                                                                         |
| [RightShoeUnderbar](RightShoeUnderbar.aplf) | `⊇`       | 🔺✅  | monad: last (`⊃⌽,⍵`)<br/>dyad: select (`⌷⍨∘⊃⍨⍤0 99`)                                                                                                                                                                                  | `3 1 2⊇'abc'` gives `'cab'`                                                                                    |
| [Root](Root.dyalog)                         | `√`       | 🔺    | (Square) Root                                                                                                                                                                                                                         | `√25` gives `5`<br/>`3√27 gives 3`                                                                             |
| [UpArrow](UpArrow.aplf)                     | `↑`       | 🔵    | allows long `⍺`                                                                                                                                                                                                                       | `2 3↑4 5` gives `2 3⍴4 5 0 0 0 0`                                                                              |
| [Vel](Vel.aplf)                             | `∨`       | 🔶    | monad: demote (`,[⍳2]`)                                                                                                                                                                                                               | `∨2 3 4⍴⎕A` gives `6 4⍴⎕A`                                                                                     |
| [Wedge](Wedge.aplf)                         | `∧`       | 🔶    | monad: promote (`⍵⍴⍨1,⍴⍵`)                                                                                                                                                                                                            | `'ABC'⍪⍥∧'DEF'` gives `2 3⍴⎕A`                                                                                 |
| [∆EM](∆EM.aplf)                             | `⎕EM`     | 🔵    | Self-inverse `⎕EM`                                                                                                                                                                                                                    | `⎕EM'RANK ERROR' 'WS FULL'` gives `4 1`                                                                        |
| [∆NS](∆NS.aplf)                             | `⎕NS`     | 🔵    | Accepts ref left arg. Name Set: The list of values to copy into the new/target namespace can have 2-element name-value vectors, setting the name to the given value                                                                   | `ref←⎕NS('Abe' 10)('Bea' 12)`<br/>`ref⎕NS⊂'Carl' 8`                                                            |
| [∆NG](∆NG.aplf)                             | `⎕NG`     | 🔺    | Name Get                                                                                                                                                                                                                              | `ref⎕NG'Bea' 'Abe'`                                                                                            |
| [∆SIGNAL](∆signal.aplf)                     | `⎕SIGNAL` | 🔵    | Allows `⎕DMX`-style ref argument                                                                                                                                                                                                      | `⎕SIGNAL ⎕DMX`                                                                                                 |

\* 🔺 new feature 🔶 added valence 🔵 expanded domain ⚠ breaking change ✅ scheduled for 20.0 (except monadic `⊇`)
