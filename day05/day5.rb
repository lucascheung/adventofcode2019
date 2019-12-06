a = []
File.open('day5.input').each_line do |line|
    a = line.split(",").map(&:to_i)
end

op_pos = 0
input = 5

def mode_output(pm, a, op_pos, pos)
    return a[a[op_pos + pos]] if pm == "0"
    return a[op_pos + pos]
end

while a[op_pos].to_s[-2..-1] != "99"
    if a[op_pos].to_s[-2..-1]
        op = a[op_pos].to_s[-2..-1]
    else
        op = "0" + a[op_pos].to_s[-1]
    end
    first_pm = a[op_pos].to_s[-3] || "0"
    second_pm = a[op_pos].to_s[-4] || "0"
    third_pm = a[op_pos].to_s[-5] || "0"
    first = mode_output(first_pm, a, op_pos, 1)
    second = mode_output(second_pm, a, op_pos, 2)
    third = mode_output(third_pm, a, op_pos, 3)
    if op == "01"
        a[a[op_pos + 3]] = first + second
        op_pos += 4
    elsif op == "02"
        a[a[op_pos + 3]] = first * second
        op_pos += 4
    elsif op == "03"
        a[a[op_pos + 3]] = input
        op_pos += 2
    elsif op == "04"
        p a[a[op_pos + 1]]
        op_pos += 2
    elsif op == "05"
        op_pos = second - 3 if first != 0
        op_pos += 3
    elsif op == "06"
        op_pos = second - 3 if first == 0
        op_pos += 3
    elsif op == "07"
        if first < second
            a[a[op_pos + 3]] = 1
        else
            a[a[op_pos + 3]] = 0
        end
        op_pos += 4
    elsif op == "08"
        if first == second
            a[a[op_pos + 3]] = 1
        else
            a[a[op_pos + 3]] = 0
        end
        op_pos += 4
    end
end
