rules, updates = ARGF.read.split("\n\n").map {
  _1.split.map { |line| line.split(/\W/).map(&:to_i) }
}
incorrect = ->(u) {
  rules.any? { |(a, b)|
    next unless u.include?(a) && u.include?(b)
    u.index(a) > u.index(b)
  }
}
midpoints = ->(u) { u[u.size / 2] }

p updates.reject(&incorrect).sum(&midpoints)
p updates.select(&incorrect).map { |u|
  u.sort_by { |x| u.count { |e| rules.include?([e, x]) } }
}.sum(&midpoints)
