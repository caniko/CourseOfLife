# Course of life (CV)

I compile `cv.tex` using `LuaLaTeX`:

```shell
lualatext cv.tex
```

Followed by compression using a GhostScript command from an answer on [tex-stack-exchange](https://tex.stackexchange.com/a/19047):

```shell
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile=cv-compressed.pdf cv.pdf
```

## Considerations
I used the AltaCV package that I linked to using gitsubmodule. Many thanks to [liantze](https://github.com/liantze)!
