import strformat

proc blue(s: string): string =
  result = "\e[34m" & s & "\e[0m"

proc bold(s: string): string =
  result = "\e[1m" & s & "\e[0m"

proc italic(s: string): string =
  result = "\e[3m" & s & "\e[0m"

proc que(s: string): string =
  result = "\e[33;1m[?] \e[0m" & s

