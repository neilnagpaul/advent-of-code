require "matrix"
@robots = ARGF.map { it.scan(/-?\d+/).map(&:to_i).each_slice(2).to_a }
@bounds = 101, 103
@origin = @bounds.map { it / 2 }

def simd(a, op, b) = a.zip(b).map { _1.send op, _2 }

def simulate(t = 100) = @robots.map { |pos, v|
  pos = simd pos, :+, v.map { it * t }
  pos = simd pos, :%, @bounds
  simd pos, :-, @origin
}

quadrant = ->(r) { simd r, :<=>, [0, 0] }
p simulate.map(&quadrant).reject { it.any?(&:zero?) }.tally.values.inject(:*)

variance = ->(pairs) {
  n = pairs.size
  mean = pairs.transpose.map { |coords| coords.sum.to_f / n }
  pairs.transpose.zip(mean).map { |coords, m|
    coords.map { |coord| (coord - m)**2 }.sum / n
  }.sum / 2
}
p (1..).inject(0) { |acc, t|
  v = variance[simulate(t)]
  break t if v < 0.5 * ((acc += v) / t)
  acc
}
