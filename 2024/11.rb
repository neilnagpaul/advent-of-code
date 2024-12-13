def blink =
  @stones = @stones.each_with_object(Hash.new(0)) { |(stone, count), stones|
    if stone == 0
      stones[1] += count
    elsif (digits = stone.digits.size).even?
      a, b = stone.divmod(10**(digits / 2))
      stones[a] += count
      stones[b] += count
    else
      stones[stone * 2024] += count
    end
  }

@stones = gets.split.map(&:to_i).tally
25.times { blink } and p @stones.values.sum
50.times { blink } and p @stones.values.sum
