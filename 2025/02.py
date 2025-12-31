from sys import stdin

ranges = []
p1 = 0
invalid = set()

for bounds in stdin.read().strip().split(","):
    start, end = map(int, bounds.split("-"))
    ranges.append(range(start, end + 1))

for i in range(100_100):
    for repeat in range(2, 11):
        candidate = int(str(i) * repeat)
        if candidate >= 10_000_000_000:
            break
        if any(candidate in r for r in ranges):
            if repeat == 2:
                p1 += candidate
            invalid.add(candidate)

print(p1)
print(sum(invalid))
