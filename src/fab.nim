import terminal

const reset = "\e[0m"

# colors
proc blue*(s: string): string =
  result = "\e[34m" & s & reset

proc yellow*(s: string): string =
  result = "\e[33m" & s & reset

proc green*(s: string): string =
  result = "\e[32m" & s & reset

proc red*(s: string): string =
  result = "\e[31m" & s & reset

proc white*(s: string): string =
  result = "\e[97m" & s & reset

# TODO: orange is bold yellow lol
proc orange*(s: string): string =
  result = "\e[93;1m" & s & reset

proc purple*(s: string): string =
  result = "\e[35m" & s & reset

proc black*(s: string): string =
  result = "\e[30;1m" & s & reset

proc cyan*(s: string): string =
  result = "\e[36m" & s & reset

# styles
proc bold*(s: string): string =
  result = "\e[1m" & s & reset

proc italic*(s: string): string =
  result = "\e[3m" & s & reset

proc under*(s: string): string =
  result = "\e[4m" & s & reset

proc strike*(s: string): string =
  result = "\e[9m" & s & reset


# labels
template fabLabeledEcho*(fg: ForegroundColor; label: string; args: varargs[untyped]) =
  setForeGroundColor(fg)
  stdout.write(label)
  resetAttributes()
  echo " " & args

template que*(s: string) =
  fabLabeledEcho(fgBlue, "[?]", s)

template info*(s: string) =
  fabLabeledEcho(fgYellow, "[!]", s)

template bad*(s: string) =
  fabLabeledEcho(fgRed, "[!]", s)

template good*(s: string) =
  fabLabeledEcho(fgGreen, "[+]", s)

template run*(s: string) =
  fabLabeledEcho(fgWhite, "[~]", s)

when isMainModule:
  echo "Colors:"
  echo blue("this is blue")
  echo red("this is green")
  echo yellow("this is yellow")
  echo green("this is green")
  echo white("this is white")
  echo orange("this is orange")
  echo purple("this is purple")
  echo black("this is black")
  echo cyan("this is cyan")
  echo ""
  echo "Styles:"
  echo bold("this is bold")
  echo italic("this is italic")
  echo under("this is underlined")
  echo strike("this is striked")
  echo ""

  echo "Labels:"
  que("what?")
  info("fyi")
  bad("you suck")
  good("yay!")
  run("hacking in progress...")
