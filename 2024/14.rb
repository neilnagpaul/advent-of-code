require "matrix"
@robots = ARGF.map { _1.scan(/-?\d+/).map(&:to_i).each_slice(2).to_a }
@bounds = 101, 103
@origin = @bounds.map { _1 / 2 }

def simd(a, op, b) = a.zip(b).map { _1.send op, _2 }

def simulate(t = 100) = @robots.map { |pos, v|
  pos = simd pos, :+, v.map { _1 * t }
  pos = simd pos, :%, @bounds
  simd pos, :-, @origin
}

quadrant = ->(r) { simd r, :<=>, [0, 0] }
p simulate.map(&quadrant).reject { _1.any?(&:zero?) }.tally.values.inject(:*)
p (0..).find { |t|
  points = simulate(t).to_set
  symmetry = points.count { |(i, j)| points === [i, -j] }
  symmetry > @robots.length * 0.4
}
