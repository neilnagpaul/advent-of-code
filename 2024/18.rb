require "matrix"
data = ARGF.map { Vector[*it.split(",").map(&:to_i)] }
dirs = Matrix.I(2).vstack(-Matrix.I(2)).row_vectors
path = ->(i) {
  seen = data[...i].to_set
  queue = [[0, Vector[0, 0]]]
  queue.each { |dist, pos|
    return dist if pos == Vector[70, 70]
    dirs.map { pos + it }.select { it.all?(0..70) }.each {
      next if seen === it
      queue << [dist + 1, it]
      seen << it
    }
  } and nil
}

p path[1024]
puts data[data.each_index.to_a.bsearch { !path[it] } - 1].to_a * ","
