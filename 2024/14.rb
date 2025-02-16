require "matrix"
p, v = ARGF.map { it.split.map(&method(:eval)) }.transpose.map { Matrix[*it] }
puts (p + v * 100).to_a.map { |a, b| [a % 101 <=> 50, b % 103 <=> 51] }
  .reject { it.any? 0 }.tally.values.inject :*
puts (1..).find { |t|
  points = (p + v * t).to_a.to_set { |a, b| [a % 101, b % 103] }
  points.any? { |i, j| (1..30).all? { points === [i + it, j] } }
}
