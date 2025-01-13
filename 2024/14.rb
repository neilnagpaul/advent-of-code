require "matrix"
p, v = ARGF.map { it.split.map(&method(:eval)) }.transpose.map { Matrix[*it] }
wrap = ->((a, b)) { [a % 101 - 50, b % 103 - 51] }

puts (p + v * 100).to_a.map(&wrap).map { it.map(&0.method(:<=>)) }
  .reject { it.any? 0 }.tally.values.inject :*
puts (1..).find {
  points = (p + v * it).to_a.to_set(&wrap)
  points.any? { |(i, j)| (1..30).all? { points === [i + it, j] } }
}
