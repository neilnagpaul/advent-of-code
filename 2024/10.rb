require 'matrix'
map = Matrix[*ARGF.map { _1.strip.chars.map &:to_i }]
deltas = [[0, 1], [1, 0], [0, -1], [-1, 0]].map { Vector[*_1] }
search=->(vec, trail=[]) {
  return [trail] if map[*vec] == 9
  deltas.map(&vec.method(:+)).filter_map { |succ|
    next unless succ.none?(&:negative?) && map[*succ] == map[*vec].succ
    search[succ, trail + [succ]]
  }.flatten(1)
}

heads = map.each_with_index.filter_map { |i, *vec| Vector[*vec] if i == 0 }
paths = heads.map(&search)
p paths.sum { |trail| trail.to_set { _1[-1] }.size }
p paths.sum { |trail| trail.size }
