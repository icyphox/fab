# fab
> Print fabulously in your terminal (in Nim).

Fab is a really cool text formatting package for Nim. Using Fab is super easy, it's as simple as:
```Nim
import fab

echo blue("hey i'm blue!")
echo bold("this is bold text")
echo que("what?")
```

## Colors
![colors](https://xix.ph0x.me/colors.png)

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
