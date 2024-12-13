require "matrix"
@data = ARGF.read.scan(/\d+/).map(&:to_i).each_slice(6)
def solve(offset = 0) = @data.sum { |(a, b, c, d, e, f)|
  lup = Matrix[[a, c], [b, d]].lup
  a, b = *lup.solve([e + offset, f + offset])
  next 0 unless a % 1 == 0 && b % 1 == 0
  3 * a + b
}.to_i

p solve
p solve 10000000000000
