a = []
File.open('day1.input').each_line do |line|
    a << line.to_i
  end
puts a.map { |num| num / 3 - 2 }.sum