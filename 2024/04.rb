require "matrix"
grid = Matrix[*ARGF.map { it.strip.chars }]
deltas = [-1, 0, 1]
dirs = *deltas.repeated_permutation(2)
dig = ->(i, j) { grid[i, j] if [i, j].all?(0..) }

p grid.each_with_index.to_a.product(dirs).count { |(_, i, j), (di, dj)|
  (0...4).map { |n| dig[i + di * n, j + dj * n] }.join == "XMAS"
}
p grid.each_with_index.count { |_, i, j|
  [
    deltas.map { |d| dig[i + d, j - d] }.join,
    deltas.map { |d| dig[i + d, j + d] }.join
  ].all?(Set["MAS", "SAM"])
}
