low = 178416
high = 676461

total = 0

(low..high).each do |number|
    total += 1 if number.to_s.chars.sort == number.to_s.chars && number.to_s.chars.chunk(&:itself).to_a.length != 6
end

p total
        