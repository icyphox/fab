import terminal

template fabEcho*(fg: ForegroundColor; sty: set[Style] = {}; styled, unstyled: string = ""; newline: bool = true) =
  setForeGroundColor(fg)
  stdout.write(styled)
  resetAttributes()
  if unstyled != "":
    stdout.write(" " & unstyled)
  if newline:
    echo ""

const reset = "\e[0m"

# colors
template blue*(s: string; nl: bool = true) =
  fabEcho(fgBlue, styled = s, newline = nl)

template yellow*(s: string; nl: bool = true) =
  fabEcho(fgYellow, styled = s, newline = nl)

template green*(s: string; nl: bool = true) =
  fabEcho(fgGreen, styled = s, newline = nl)

template red*(s: string; nl: bool = true) =
  fabEcho(fgRed, styled = s, newline = nl)

template white*(s: string; nl: bool = true) =
  fabEcho(fgWhite, styled = s, newline = nl)

# # TODO: orange is bold yellow lol
# proc orange*(s: string): string =
#   result = "\e[93;1m" & s & reset

# proc purple*(s: string): string =
#   result = "\e[35m" & s & reset

# proc black*(s: string): string =
#   result = "\e[30;1m" & s & reset

# proc cyan*(s: string): string =
#   result = "\e[36m" & s & reset

# # styles
# proc bold*(s: string): string =
#   result = "\e[1m" & s & reset

# proc italic*(s: string): string =
#   result = "\e[3m" & s & reset

# proc under*(s: string): string =
#   result = "\e[4m" & s & reset

# proc strike*(s: string): string =
#   result = "\e[9m" & s & reset


# labels
template que*(s: string) =
  fabEcho(fgBlue, styled = "[?]", unstyled = s, newline = true)

template info*(s: string) =
  fabEcho(fgYellow, styled = "[!]", unstyled = s, newline = true)

template bad*(s: string) =
  fabEcho(fgRed, styled = "[!]", unstyled = s, newline = true)

template good*(s: string) =
  fabEcho(fgGreen, styled = "[+]", unstyled = s, newline = true)

template run*(s: string) =
  fabEcho(fgWhite, styled = "[~]", unstyled = s, newline = true)

when isMainModule:
  echo "Colors:"
  blue("this is blue")
  blue("this is blue", false); blue(" this is blue")
  red("this is green")
  yellow("this is yellow")
  green("this is green")
  white("this is white")
  # echo orange("this is orange")
  # echo purple("this is purple")
  # echo black("this is black")
  # echo cyan("this is cyan")
  # echo ""
  # echo "Styles:"
  # echo bold("this is bold")
  # echo italic("this is italic")
  # echo under("this is underlined")
  # echo strike("this is striked")
  # echo ""

  echo "Labels:"
  que("what?")
  info("fyi")
  bad("you suck")
  good("yay!")
  run("hacking in progress...")
