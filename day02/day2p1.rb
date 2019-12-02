a = []
File.open('day2.input').each_line do |line|
    a = line.split(",").map(&:to_i)
end

a[1] = 12
a[2] = 2

op_pos = 0

while a[op_pos] != 99
    if a[op_pos] == 1
        a[a[op_pos + 3]] = a[a[op_pos + 1]] + a[a[op_pos + 2]]
    elsif a[op_pos] == 2
        a[a[op_pos + 3]] = a[a[op_pos + 1]] * a[a[op_pos + 2]]
    else
        p 'error'
    end
    op_pos += 4
end

p a[0]

