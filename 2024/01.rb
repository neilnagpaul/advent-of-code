require "matrix"
l, r = ARGF.map { it.split.map(&:to_i) }.transpose
p (Vector[*r.sort] - Vector[*l.sort]).sum(&:abs)
p l.sum { it * r.count(it) }
