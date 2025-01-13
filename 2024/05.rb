rules, pages = *ARGF.each("\n\n").map(&:split)
pages.map! { it.split(",") }
cmp = ->(a, b) { rules.include?("#{a}|#{b}") ? -1 : 1 }
puts pages.partition { it.dup == it.sort!(&cmp) }
  .map { |seq| seq.sum { it[it.size / 2].to_i } }
