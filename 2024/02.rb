reports = ARGF.map { it.split.map(&:to_i) }
safe = ->(report) {
  delta = report.each_cons(2).map { it.inject :- }
  [delta.grep_v(1..3), delta.grep_v(-3..-1)].any?(&:empty?)
}
p reports.count(&safe)
p reports.map { |report|
  report.each_index.map { |i| report[0...i] + report[i + 1..] }
}.count { it.any?(&safe) }
