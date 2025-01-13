def run(program, regs)
  a, b, c = 4, 5, 6
  combo = [0, 1, 2, 3] + regs
  out = []
  ip = 0
  while ip < program.length
    opcode, operand = program[ip, 2]
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

def expect(program, out, prev = 0)
  return prev if out.empty?
  (1 << 10).times { |a|
    next unless (a >> 3 == prev & 127) &&
      (run(program, [a, 0, 0])[0] == out[-1])
    ret = expect(program, out[...-1], (prev << 3) | (a % 8))
    return ret if ret
  } and nil
end

nums = ARGF.read.scan(/\d+/).map(&:to_i)
regs, program = nums[0..2], nums[3..]
puts run(program, regs).to_a * ","
puts expect(program, program)
