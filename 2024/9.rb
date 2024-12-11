space, files, disk = [], [], []
gets.chars.map(&:to_i).each_with_index { |c, i|
  (i.even? ? files : space) << [disk.size, c] if c.nonzero?
  disk += [i.even? ? i / 2 : -1] * c
}
@disk = disk.dup
def check(d) = p d.each_with_index.sum { _1.negative? ? 0 : _1 * _2 }

a, b = 0, disk.size - 1
test = ->(*_) { raise if a == b }
begin
  loop {
    test[a += 1] while disk[a] != -1
    test[b -= 1] while disk[b] == -1
    disk[a], disk[b] = disk[b], -1
  }
rescue
  check disk
end

disk = @disk
files.reverse_each { |f|
  space.each { |s|
    break if s[0] >= f[0]
    if f[1] <= s[1]
      (0...f[1]).each { |i|
        disk[s[0] + i], disk[f[0] + i] = disk[f[0] + i], -1
      }
      s[0], s[1] = s[0] + f[1], s[1] - f[1]
      break
    end
  }
}
check disk
