def run(regs)
  a, b, c = 4, 5, 6
  combo = [0, 1, 2, 3] + regs
  out = []
  ip = 0
  while ip < @program.length
    opcode, operand = @program[ip, 2]
    case opcode
    when 0 then combo[a] >>= combo[operand]
    when 1 then combo[b] ^= operand
    when 2 then combo[b] = combo[operand] % 8
    when 3 then next ip = operand if combo[a] != 0
    when 4 then combo[b] ^= combo[c]
    when 5 then out << (combo[operand] % 8)
    when 6 then combo[b] = combo[a] >> combo[operand]
    when 7 then combo[c] = combo[a] >> combo[operand]
    end
    ip += 2
  end
  out
end

nums = ARGF.read.scan(/\d+/).map(&:to_i)
regs, @program = nums[0..2], nums[3..]
puts run(regs).to_a * ","

a = 0
@program.each_index.reverse_each { |i|
  a <<= 3
  a += 1 until run([a, *regs[1..]]) == @program[i..]
}
p a
