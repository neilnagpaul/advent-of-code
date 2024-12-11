require "matrix"
@map = Matrix[*ARGF.map { _1.strip.chars }]
@coords = @map.each_with_index.to_set { Vector[_2, _3] }
def permute(range) = @coords & @coords.to_a.combination(2).flat_map { |a, b|
  next if @map[*a] != @map[*b] || @map[*a] == "."
  range.flat_map { |n| [a - n * (b - a), b + n * (b - a)] }
}

p permute(1..1).size
p permute(0..[@map.row_count, @map.column_count].max).size
