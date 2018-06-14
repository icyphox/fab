# colors
proc blue*(s: string): string =
  result = "\e[34m" & s & "\e[0m"

proc yellow*(s: string): string =
  result = "\e[33m" & s & "\e[0m"

proc green*(s: string): string =
  result = "\e[32m" & s & "\e[0m"

# styles
proc bold*(s: string): string =
  result = "\e[1m" & s & "\e[0m"

proc italic*(s: string): string =
  result = "\e[3m" & s & "\e[0m"

# labels
proc que*(s: string): string =
  result = "\e[34m[?] \e[0m" & s

