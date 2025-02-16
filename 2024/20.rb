require "matrix"
map = Matrix[*ARGF.map { it.strip.chars }].map { it if it != "#" }
dirs = Matrix.I(2).vstack(-Matrix.I(2)).row_vectors
start = Vector[*map.index("S")]
queue = [start]
dist = queue.each_with_object(start => 0) { |pos, dist|
  dirs.map { pos + it }.each {
    next unless it.all?(0..) && map[*it] && !dist[it]
    dist[it] = dist[pos].succ
    queue << it
  }
}

cheats = dist.keys.combination(2).filter_map { |i, j|
  d = (i - j).sum(&:abs)
  d if dist[j] - dist[i] - d >= 100
}
puts cheats.count(2), cheats.count { it <= 20 }
