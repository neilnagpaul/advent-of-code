input = ARGF.read
def mul(a, b) = a * b

def sum(input) = eval input.scan(/mul\(\d+,\d+\)/).join "+"

p sum input
p sum input.gsub(/don't\(\).*?(do\(\)|\Z)/m, "")
