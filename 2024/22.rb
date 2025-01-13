succ = ->(seed) {
  seed = (seed * 64 ^ seed) % 16777216
  seed = (seed / 32 ^ seed) % 16777216
  seed = (seed * 2048 ^ seed) % 16777216
}
seq = ARGF.map { Enumerator.produce(it.to_i, &succ).take(2001) }
p seq.sum(&:last)

seq.map! { |steps| steps.map { it % 10 }.each_cons(5).reverse_each }
sell = ->(cons) { [cons.each_cons(2).map { it.inject :- }, cons.last] }
p ({}).merge(*seq.map { it.to_h(&sell) }) { _2 + _3 }.values.max
