def blink(tally) = tally.each_with_object(Hash.new(0)) { |(stone, n), succ|
  if stone == 0
    succ[1] += n
  elsif (digits = stone.digits.count).even?
    a, b = stone.divmod(10**(digits / 2))
    succ[a] += n
    succ[b] += n
  else
    succ[stone * 2024] += n
  end
}

stones = gets.split.map(&:to_i).tally
p 25.times.inject(stones) { blink it }.values.sum
p 75.times.inject(stones) { blink it }.values.sum
