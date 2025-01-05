@towels, @displays = ARGF.each("\n\n").map { it.scan(/\w+/).to_a }
@count = Hash.new { |h, k| h[k] = count(k) }
def count(d) = d.empty? ? 1 : @towels
  .filter_map { |t| @count[d.delete_prefix(t)] if d.start_with? t }.sum

p @displays.map(&@count).count(&:nonzero?)
p @displays.map(&@count).sum
