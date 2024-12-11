require 'matrix'
@grid = Matrix[*ARGF.map { _1.strip.chars }]
directions = [-1, 0, 1]
deltas = *directions.repeated_permutation(2)
def dig(i, j) = (@grid[i, j] if [i, j].none?(&:negative?))

p @grid.each_with_index.to_a.product(deltas).count { |(_, i, j), (di, dj)|
    (0...4).map { |n| dig(i + di * n, j + dj * n) }.join == 'XMAS'
}
p @grid.each_with_index.count { |_, i, j|
    [directions.map { |d| dig(i+d, j-d) }.join,
     directions.map { |d| dig(i+d, j+d) }.join]
      .all?(Set['MAS', 'SAM'])
}
