require "matrix"
l, r = ARGF.map { _1.split.map(&:to_i) }.transpose
p (Vector[*r.sort] - Vector[*l.sort]).sum(&:abs)
p l.sum { _1 * r.count(_1) }
