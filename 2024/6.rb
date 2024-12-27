require "matrix"
grid = Matrix[*ARGF.map { it.strip.chars }]
guard = Vector[*grid.index("^")]
obstacles = grid.each_with_index.filter_map { |c, *i| i if c == "#" }.to_set

go = ->(guard, obstacles) {
  directions = [[-1, 0], [0, 1], [1, 0], [0, -1]].map { |d| Vector[*d] }
  positions = Set[]
  seen = Hash.new { |h, k| h[k] = Set[] }
  directions.cycle { |direction|
    if obstacles.include?([*(guard + direction)])
      break if seen[guard].include?(direction)
      seen[guard] << direction
      next
    end
    guard += direction
    break positions unless guard.all?(0..) && grid[*guard]
    positions << guard
    redo
  }
}

path = go[guard, obstacles]
p path.size
p path.count { !go[guard, obstacles.dup.add([*it])] }
