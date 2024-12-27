succ = ->(seed) {
  seed = (seed * 64 ^ seed) % 16777216
  seed = (seed / 32 ^ seed) % 16777216
  seed = (seed * 2048 ^ seed) % 16777216
  seed
}
seq = ARGF.map { |n| 2000.times.inject([n.to_i]) { it << succ[it.last] } }
p seq.sum(&:last)

seq.map! { |steps| steps.map { it % 10 } }
sell = ->(cons) { [cons.each_cons(2).map { _2 - _1 }, cons.last] }
bananas = ->(steps) { steps.each_cons(5).map(&sell).uniq(&:first) }
p seq.flat_map(&bananas).group_by(&:first).map { _2.sum(&:last) }.max
