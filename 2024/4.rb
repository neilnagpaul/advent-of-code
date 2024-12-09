$lines = ARGF.read.split
directions = [-1, 0, 1]
test = [%w[M A S], %w[S A M]]

def dig(y, x)
    $lines[y][x] if (0...$lines.size) === y && (0...$lines[0].size) === x
end

p (0...$lines.size).sum { |y|
    (0...$lines[0].size).sum { |x|
        directions.product(directions).count { |dy, dx|
            (0...4).map { |i| dig(y + dy * i, x + dx * i) } == %w[X M A S]
        }
    }
}
p (0...$lines.size).sum { |y|
    (0...$lines[0].size).count { |x|
        test.include?(directions.map { |d| dig(y+d, x-d) }) &&
        test.include?(directions.map { |d| dig(y+d, x+d) })
    }
}
