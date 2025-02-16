require "matrix"
map = Matrix[*ARGF.map(&:chars)]
dirs = Matrix.I(2).vstack(-Matrix.I(2)).row_vectors
search = ->(pos) {
  return [[pos]] if map[*pos] == "9"
  dirs.map { pos + it }.select { it.all?(0..) && map[*it] == map[*pos].succ }
    .flat_map(&search)
}

paths = map.each_with_index.filter_map { search[Vector[_2, _3]] if _1 == "0" }
p paths.sum { it.uniq(&:last).size }
p paths.sum(&:size)
