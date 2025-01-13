p ARGF.each("\n\n").map { |s| (0...s.size).select { s[it] == "#" }.to_set }
  .combination(2).count { it.inject(&:disjoint?) }
