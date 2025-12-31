from sys import stdin

p1 = 0

# for word in stdin.read().strip().split():
#     digits = list(map(int, word))
#     max_index = digits.index(max(digits[:-1]))
#     max_after = max(digits[max_index + 1:])
#     p1 += digits[max_index] * 10 + max_after
# print(p1)


def joltage(n: list[int], left: int) -> int:
    if left == 0:
        return max(n)
    d = max(n[:-left])
    return d * 10**left + joltage(n[n.index(d) + 1:], left - 1)


banks = [list(map(int, line.strip())) for line in stdin]
print(sum(joltage(bank, 1) for bank in banks))
print(sum(joltage(bank, 11) for bank in banks))
