# colors
proc blue*(s: string): string =
  result = "\e[34m" & s & "\e[0m"

proc yellow*(s: string): string =
  result = "\e[33m" & s & "\e[0m"

proc green*(s: string): string =
  result = "\e[32m" & s & "\e[0m"

proc red*(s: string): string =
  result = "\e[31m" & s & "\e[0m"

proc white*(s: string): string =
  result = "\e[37m" & s & "\e[0m"

# TODO: orange is bold yellow lol
proc orange*(s: string): string =
  result = "\e[93;1m" & s & "\e[0m"

# styles
proc bold*(s: string): string =
  result = "\e[1m" & s & "\e[0m"

proc italic*(s: string): string =
  result = "\e[3m" & s & "\e[0m"

proc under*(s: string): string =
  result = "\e[4m" & s & "\e[0m"

proc strike*(s: string): string =
  result = "\e[9m" & s & "\e[0m"


# labels
proc que*(s: string): string =
  result = "\e[34m[?] \e[0m" & s

proc info*(s: string): string =
  result = "\e[33m[*] \e[0m" & s

proc bad*(s: string): string =
  result = "\e[31m[!] \e[0m" & s

proc good*(s: string): string =
  result = "\e[32m[+] \e[0m" & s

proc run*(s: string): string =
  result = "\e[37m[~] \e[0m" & s
