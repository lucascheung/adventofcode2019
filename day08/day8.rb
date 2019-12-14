a = []
File.open('day8.input').each_line do |line|
    a = line
end

wide = 25
tall = 6
area = wide * tall

layers = a.scan(/.{#{area}}/)

min_zeros = 99999
min_index = 0

layers.each_with_index do |layer, idx|
    zeros = layer.count "0"
    if zeros < min_zeros
        min_zeros = zeros
        min_index = idx
    end
end

one = layers[min_index].count "1"
two = layers[min_index].count "2"

#Part 1
p one*two

final = layers.last

layers.reverse.each do |layer|
    (0...area).each do |pixel|
        final[pixel] =  layer[pixel] if layer[pixel].to_i < 2
    end
end

puts final.gsub!("1"," ").scan(/.{#{wide}}/)
