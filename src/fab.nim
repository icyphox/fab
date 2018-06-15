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
proc que*(s: string): string =
  result = "\e[34m[?] " & reset & s

proc info*(s: string): string =
  result = "\e[33m[*] " & reset & s

proc bad*(s: string): string =
  result = "\e[31m[!] " & reset & s

proc good*(s: string): string =
  result = "\e[32m[+] " & reset & s

proc run*(s: string): string =
  result = "\e[97m[~] " & reset & s

