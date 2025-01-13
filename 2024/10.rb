require "matrix"
map = Matrix[*ARGF.map { it.strip.chars }]
deltas = [[0, 1], [1, 0], [0, -1], [-1, 0]].map { Vector[*it] }
search = ->(pos, trail = []) {
  return [trail] if map[*pos] == "9"
  deltas.map { Vector[*pos] + it }
    .select { it.all?(0..) && map[*it] == map[*pos].succ }
    .flat_map { search[it, trail + [it]] }
}

paths = map.each_with_index.filter_map { |i, *pos| search[pos] if i == "0" }
p paths.sum { it.uniq(&:last).size }
p paths.sum(&:size)
