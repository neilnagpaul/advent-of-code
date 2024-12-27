def blink(tally) = tally.each_with_object(Hash.new(0)) { |(stone, n), tally|
  if stone == 0
    tally[1] += n
  elsif (digits = stone.digits.count).even?
    a, b = stone.divmod(10**(digits / 2))
    tally[a] += n
    tally[b] += n
  else
    tally[stone * 2024] += n
  end
}

stones = gets.split.map(&:to_i).tally
p 25.times.inject(stones) { blink it }.values.sum
p 75.times.inject(stones) { blink it }.values.sum
