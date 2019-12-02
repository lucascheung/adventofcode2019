File.open('day2.input').each_line do |line|
    A = line.split(",").map(&:to_i)
end


def calculate(noun, verb)
    a = A.dup
    a[1] = noun
    a[2] = verb

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
    a[0]
end

(0..99).each do |noun|
    (0..99).each do |verb|
        p 100 * noun + verb if calculate(noun, verb) == 19690720
    end
end

