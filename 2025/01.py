from sys import stdin

pointer = 50
p1 = 0
p2 = 0

for line in stdin:
    delta = int(line[1:]) * (1 if line[0] == 'R' else -1)
    dist = (100 - pointer) if delta > 0 else pointer or 100
    if abs(delta) >= dist:
        p2 += 1 + (abs(delta) - dist) // 100
    pointer = (pointer + delta) % 100
    if pointer == 0:
        p1 += 1

print(p1)
print(p2)
