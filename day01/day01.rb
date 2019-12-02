a = []
File.open('day1.input').each_line do |line|
    a << line.to_i
end

# Part 1
puts a.map { |num| num / 3 - 2 }.sum

def fuel_required(num)
    return num / 3 - 2
end

sum = 0
a.each do |num|
    b = num
    while fuel_required(b) > 0
        sum += fuel_required(b)
        b = fuel_required(b)
    end
end
# Part 2
puts sum


