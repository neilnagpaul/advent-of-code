reports = ARGF.map { _1.split.map &:to_i }
safe = ->(report) {
  delta = report.each_cons(2).map { _2 - _1 }
  [delta.grep_v(1..3), delta.grep_v(-3..-1)].any?(&:empty?)
}
p reports.count(&safe)
p reports.map { |report|
  (0...report.size).map { |i| report[0...i] + report[i+1..] }
}.count { _1.any?(&safe) }
