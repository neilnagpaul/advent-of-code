succ = ->(seed) {
  seed = (seed * 64 ^ seed) % 16777216
  seed = (seed / 32 ^ seed) % 16777216
  seed = (seed * 2048 ^ seed) % 16777216
}
seq = ARGF.map { Enumerator.produce(it.to_i, &succ).take 2001 }
p seq.sum(&:last)

sell = ->(cons) { [cons.each_cons(2).map { it.inject :- }, cons.last] }
seq.map! { it.map { |i| i % 10 }.each_cons(5).reverse_each.to_h(&sell) }
p ({}).merge(*seq) { |_, *it| it.sum }.values.max
