 Tilde←{ ⍝ ~ generalised to major cells
     0::∆SIGNAL ⎕DMX
     0=⎕NC'⍺':~⍵ ⍝ monadic case
     ⍺⌿⍨~(⍳≢⍺)∊⍺⍳⍵
 }
