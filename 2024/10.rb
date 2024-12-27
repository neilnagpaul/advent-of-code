require "matrix"
map = Matrix[*ARGF.map { it.strip.chars }]
deltas = [[0, 1], [1, 0], [0, -1], [-1, 0]].map { Vector[*it] }
search = ->(vec, trail = []) {
  return [trail] if map[*vec] == "9"
  deltas.map { Vector[*vec] + it }.filter_map { |succ|
    next unless succ.all?(0..) && map[*succ] == map[*vec].succ
    search[succ, trail + [succ]]
  }.flatten(1)
}

paths = map.each_with_index.filter_map { |i, *vec| search[vec] if i == "0" }
p paths.sum { it.uniq(&:last).size }
p paths.sum(&:size)
