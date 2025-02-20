require "matrix"
map = Matrix[*ARGF.map { it.strip.chars }]
start = Vector[*map.index("^")]
walk = ->(map) {
  dirs = [[-1, 0], [0, 1], [1, 0], [0, -1]].map { Vector[*it] }.cycle
  pos, dir, seen = start, dirs.next, Set[]
  while map[*pos] && pos.all?(0..) && seen.add?([pos, dir])
    next dir = dirs.next if map[*pos + dir] == "#"
    pos += dir
  end
  seen.to_set(&:first) unless seen.include?([pos, dir])
}

path = walk[map]
p path.size
p path.count { |pos| !walk[map.dup.tap { it[*pos] = "#" }] }
