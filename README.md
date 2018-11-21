# fab
> Print fabulously in your terminal (in Nim).

Fab is a really cool text formatting package for Nim. Using Fab is super easy, it's as simple as:
```Nim
import fab

blue("hey i'm blue!")
bold("this is bold text")
que("what?")
```

## Installation
```console
$ nimble install fab
```

## Screenshot
![screenshot](https://0x0.st/swP6.png)

## Colors
![colors](https://0x0.st/swPI.png)

## Styles
![styles](https://0x0.st/swPl.png)

## Labels
![labels](https://0x0.st/swP0.png)

### Color procs
```
blue(), yellow(), red(), green(), white(), purple(), black(), cyan()
```

### Style procs
```
bold(), italics(), strike(), under()
```

### Label procs
```
que(), info(), run(), bad(), good()
```

```nim
Style
  styleBright,     # bright text
  styleDim,        # dim text
  styleUnknown,    # unknown
  styleUnderscore, # underscored text
  styleBlink,      # blinking/bold text
  styleHidden      # hidden text
```

#### Example
```nim
blue("this is bold and blue", sty = {styleBright})
```

```nim
ForegroundColor
  fgBlack,    # black
  fgRed,      # red
  fgGreen,    # green
  fgYellow,   # yellow
  fgBlue,     # blue
  fgMagenta,  # magenta
  fgCyan,     # cyan
  fgWhite     # white
```

#### Example
```nim
bold("this is bold and red", fg = fgRed)
```

#### More examples
```nim
blue("this is bold and underlined blue", sty = {styleBright, styleUnderscore}, nl = false) # no newline

dim("this is yellow and dim", fg = fgYellow)
```

## Inspiration
This project was heavily inspired by [@s0md3v](https://github.com/s0me3v)'s [Hue](https://github.com/s0md3v/hue).

## Contributing
Bad code? New feature in mind? Open an issue. Better still, learn [Nim](https://nim-lang.org/documentation.html) and shoot a PR :sparkles:

## Credits
Thanks a bunch to [@kaushalmodi](https://github.com/kaushalmodi) for the complete rewrite. It's all pretty much his now.

## License
MIT © Anirudh Oppiliappan
