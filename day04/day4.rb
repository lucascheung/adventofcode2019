low = 178416
high = 676461

total_one = 0
(low..high).each do |number|
    total_one += 1 if number.to_s.chars.sort == number.to_s.chars && number.to_s.chars.chunk(&:itself).to_a.length != 6
end

#PART 1
p total_one

total_two = 0
(low..high).each do |number|
    if number.to_s.chars.sort == number.to_s.chars && number.to_s.chars.chunk(&:itself).to_a.length != 6
        len = number.to_s.chars.chunk(&:itself).map { |stick, arr| arr.length }
        total_two += 1 if len.include? 2
    end
end

#PART 2
p total_two
