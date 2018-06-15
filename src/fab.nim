import terminal

# Style = enum
#   styleBright = 1,            ## bright text
#   styleDim,                   ## dim text
#   styleUnknown,               ## unknown
#   styleUnderscore = 4,        ## underscored text
#   styleBlink,                 ## blinking/bold text
#   styleReverse = 7,           ## unknown
#   styleHidden                 ## hidden text

# ForegroundColor = enum
#   fgBlack = 30,               ## black
#   fgRed,                      ## red
#   fgGreen,                    ## green
#   fgYellow,                   ## yellow
#   fgBlue,                     ## blue
#   fgMagenta,                  ## magenta
#   fgCyan,                     ## cyan
#   fgWhite                     ## white

template fabEcho*(fg: ForegroundColor; styleSet: set[Style] = {}; styled, unstyled: string = ""; newline: bool = true; brightFg = false) =
  setForeGroundColor(fg, brightFg)
  setStyle(styleSet)
  stdout.write(styled)
  resetAttributes()
  if unstyled != "":
    stdout.write(" " & unstyled)
  if newline:
    echo ""

const reset = "\e[0m"

# colors
template blue*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgBlue, styleSet = sty, styled = s, newline = nl)

template yellow*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgYellow, styleSet = sty, styled = s, newline = nl)

template green*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgGreen, styleSet = sty, styled = s, newline = nl)

template red*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgRed, styleSet = sty, styled = s, newline = nl)

template white*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgWhite, styleSet = sty, styled = s, newline = nl)

template purple*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgMagenta, styleSet = sty, styled = s, newline = nl)

template cyan*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgCyan, styleSet = sty, styled = s, newline = nl)

template black*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgBlack, styleSet = sty, styled = s, newline = nl)

template grey*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgBlack, brightFg = true, styleSet = sty, styled = s, newline = nl)

template orange*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(fgYellow, brightFg = true, styleSet = sty, styled = s, newline = nl)

# styles
template bold*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(fg, styleSet = {styleBright} + sty, styled = s, newline = nl)

template italic*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(fg, styleSet = {styleReverse} + sty, styled = s, newline = nl)

template under*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(fg, styleSet = {styleUnderscore} + sty, styled = s, newline = nl)

template blink*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(fg, styleSet = {styleBlink} + sty, styled = s, newline = nl)

template dim*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(fg, styleSet = {styleDim} + sty, styled = s, newline = nl)

template hidden*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(fg, styleSet = {styleHidden} + sty, styled = s, newline = nl)

# proc strike*(s: string): string =
#   result = "\e[9m" & s & reset


# labels
template que*(s: string; nl = true) =
  fabEcho(fgBlue, styled = "[?]", unstyled = s, newline = nl)

template info*(s: string; nl = true) =
  fabEcho(fgYellow, styled = "[!]", unstyled = s, newline = nl)

template bad*(s: string; nl = true) =
  fabEcho(fgRed, styled = "[!]", unstyled = s, newline = nl)

template good*(s: string; nl = true) =
  fabEcho(fgGreen, styled = "[+]", unstyled = s, newline = nl)

template run*(s: string; nl = true) =
  fabEcho(fgWhite, styled = "[~]", unstyled = s, newline = nl)

when isMainModule:
  echo ""
  bold "COLORS"
  blue("this is blue")
  blue("this is bold blue", sty = {styleBright})

  blue("this is blue", nl = false) # no newline
  yellow(" this is bold yellow ", sty = {styleBright}, nl = false) # no newline
  blue("this is bold and underlined blue", sty = {styleBright, styleUnderscore}, nl = false) # no newline
  blue(" this is blue")

  red("this is red")
  yellow("this is yellow")
  green("this is green")
  white("this is white")
  white("this is white in reverse", sty = {styleReverse})
  purple("this is purple")
  cyan("this is cyan")
  black("this is black", nl = false); echo "<-- text in black foreground to the left"
  grey("this is grey")
  orange("""this is orange?/"bright yellow"""")

  echo ""
  bold "STYLES"
  dim("this is dim")
  yellow("this is yellow")
  dim("this is yellow and dim", fg = fgYellow)
  echo "this is regular"
  bold("this is bold")
  italic("this is italics?/reverse")
  under("this is underlined")
  blink("this is blinking!")
  italic("this is italics and bold!", sty = {styleBright})
  dim("this is dim and reverse!", sty = {styleReverse})
  bold("this is bold and reverse and red!!", sty = {styleReverse}, fg = fgRed)

  white("before hidden text 'abcdefghijklm'", nl = false) # no newline
  hidden("abcdefghijklm", nl = false) # no newline
  white("after hidden text")

  # echo strike("this is striked")

  echo ""
  bold "LABELS"
  que("what?")
  info("fyi")
  bad("you suck")
  good("yay!")
  run("hacking in progress...")
