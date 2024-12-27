require "matrix"
@data = ARGF.map { Vector[*it.split(",").map(&:to_i)] }
@deltas = [[1, 0], [0, 1], [-1, 0], [0, -1]].map { Vector[*it] }

def path(i)
  seen = @data[...i].to_set
  queue = [[0, Vector[0, 0]]]
  queue.each { |dist, pos|
    return dist if pos == Vector[70, 70]
    @deltas.map { pos + it }.select { it.all?(0..70) }.each {
      next if seen === it
      queue << [dist + 1, it]
      seen << it
    }
  } and nil
end

p path 1024
puts @data[@data.each_index.to_a.bsearch { !path(it) } - 1].to_a * ","
