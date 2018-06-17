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
![screenshot](/screenshot.png)

## Colors
![colors](https://xix.ph0x.me/colorss.png)

## Styles
![styles](https://xix.ph0x.me/styles.png)

## Labels
![labels](https://xix.ph0x.me/labels.png)

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

## Inspiration
This project was heavily inspired by [@s0md3v](https://github.com/s0me3v)'s [Hue](https://github.com/s0md3v/hue).

## Credits
Thanks a bunch to [@kaushalmodi](https://github.com/kaushalmodi) for the complete rewrite. It's all pretty much his now.
