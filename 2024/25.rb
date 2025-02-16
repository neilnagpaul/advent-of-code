p ARGF.each("\n\n").map { |s| (0...s.size).select { s[it] == "#" } }
  .combination(2).count { _1 & _2 == [] }
