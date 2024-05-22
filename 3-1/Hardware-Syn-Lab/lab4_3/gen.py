data = []

# ADD (00)
for a in range(16):
  for b in range(16):
    result = int(a+b)
    data.append(format(result // 100, '04b') + format((result // 10) % 10, '04b') + format(result % 10, '04b'))

# SUB (01)
for a in range(16):
  for b in range(16):
    if b > a:
      result = 0
    else:
      result = a-b
    data.append(format(result // 100, '04b') + format((result // 10) % 10, '04b') + format(result % 10, '04b'))

# MUL (10)
for a in range(16):
  for b in range(16):
    result = a*b
    data.append(format(result // 100, '04b') + format((result // 10) % 10, '04b') + format(result % 10, '04b'))

# DIV (11)
for a in range(16):
  for b in range(16):
    if b == 0:
      result = 0
    else:
      result = a//b
    data.append(format(result // 100, '04b') + format((result // 10) % 10, '04b') + format(result % 10, '04b'))

with open("ROM.mem", "w") as txt_file:
    for line in data:
        txt_file.write(line + "\n")