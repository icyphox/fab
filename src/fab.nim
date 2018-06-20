import terminal

template fabEcho*(s: string; fg: ForegroundColor; styleSet: set[Style] = {}; newline = true; brightFg = false) =
  setForeGroundColor(fg, brightFg)
  s.writeStyled(styleSet)
  resetAttributes()
  if newline:
    echo ""

# colors
proc blue*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgBlue, sty, nl)

proc yellow*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgYellow, sty, nl)

proc green*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgGreen, sty, nl)

proc red*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgRed, sty, nl)

proc white*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgWhite, sty, nl)

proc purple*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgMagenta, sty, nl)

proc cyan*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgCyan, sty, nl)

proc black*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgBlack, sty, nl)

proc grey*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgBlack, sty, nl, brightFg = true)

proc orange*(s: string; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fgYellow, sty, nl, brightFg = true)

# styles
proc bold*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fg, {styleBright} + sty, nl)

# https://github.com/nim-lang/Nim/pull/8048
proc italic*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  # fabEcho(s, fg, {styleItalic} + sty, nl)
  fabEcho(s, fg, {styleUnknown} + sty, nl)

proc reverse*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fg, {styleReverse} + sty, nl)

proc under*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fg, {styleUnderscore} + sty, nl)

proc blink*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fg, {styleBlink} + sty, nl)

proc dim*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fg, {styleDim} + sty, nl)

proc hidden*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabEcho(s, fg, {styleHidden} + sty, nl)

# https://github.com/nim-lang/Nim/pull/8048
# template strike*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
#   fabEcho(s, fg, {styleStrikethrough} + sty, nl)


# labels
proc fabLabelEcho*(label: string; lFg: ForegroundColor; s: string; sFg: ForegroundColor; styleSet: set[Style] = {}; newline = true; brightFg = false) =
  fabEcho(label, lFg, styleSet, false, brightFg)
  stdout.write(" ")
  fabEcho(s, sFg, styleSet, false, brightFg)
  if newline:
    echo ""

proc que*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabLabelEcho("[?]", fgBlue, s, fg, sty, nl)

proc info*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabLabelEcho("[!]", fgYellow, s, fg, sty, nl)

proc bad*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabLabelEcho("[!]", fgRed, s, fg, sty, nl)

proc good*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabLabelEcho("[+]", fgGreen, s, fg, sty, nl)

proc run*(s: string; fg: ForegroundColor = fgWhite; sty: set[Style] = {}; nl = true) =
  fabLabelEcho("[~]", fgWhite, s, fg, sty, nl)

when isMainModule:
  echo ""
  bold "COLORS"
  blue("this is blue")
  echo "ordinary text"
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
  italic("this is italics/shows up reversed on terminals not supporting italics")
  reverse("this is reverse")
  under("this is underlined")
  blink("this is blinking!")
  italic("this is italics and bold!", sty = {styleBright})
  dim("this is dim and reverse!", sty = {styleReverse})
  bold("this is bold and reverse and red!!", fg = fgRed, sty = {styleReverse})

  white("before hidden text 'abcdefghijklm'", nl = false) # no newline
  hidden("abcdefghijklm", nl = false) # no newline
  white("after hidden text")

  # echo strike("this is striked")

  echo ""
  bold "LABELS"
  que("what?")
  info("fyi")
  bad("you suck")
  bad("everything in red bold", fg = fgRed, sty = {styleBright})
  good("yay!")
  run("hacking in progress...")
  run("everything in bold", sty = {styleBright})
