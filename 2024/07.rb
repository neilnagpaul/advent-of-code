lines = ARGF.map { it.scan(/\d+/).map(&:to_i) }

class Integer
  define_method(:"||") { |other| (to_s + other.to_s).to_i }
end

def calibrate(((result, *vals), ops))
  ops.repeated_permutation(vals.size - 1).map { |ops|
    ops.zip(vals[1..]).inject(vals.first) { |acc, (*args)| acc.send(*args) }
  }.index(result) ? result : 0
end

p lines.zip([%i[+ *]].cycle).sum(&method(:calibrate))
p lines.zip([%i[+ * ||]].cycle).sum(&method(:calibrate))
