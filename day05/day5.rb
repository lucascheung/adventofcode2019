a = []
File.open('day5.input').each_line do |line|
    a = line.split(",").map(&:to_i)
end

op_pos = 0
# a[1] = 1
input = 1
# a[18] += 70
# def output_value(pm, pos)
#     if pm == '0'
#         return arr[arr[pos + 1]]

while a[op_pos].to_s[-2..-1] != "99"
    if a[op_pos].to_s[-2..-1]
        op = a[op_pos].to_s[-2..-1]
    else
        op = "0" + a[op_pos].to_s[-1]
    end
    first_pm = a[op_pos].to_s[-3] || "0"
    second_pm = a[op_pos].to_s[-4] || "0"
    third_pm = a[op_pos].to_s[-5] || "0"
    if first_pm == "0"
        first = a[a[op_pos + 1]]
    else
        first = a[op_pos + 1]
    end
    if second_pm == "0"
        second = a[a[op_pos + 2]]
    else
        second = a[op_pos + 2]
    end
    if third_pm == "0"
        third = a[a[op_pos + 3]]
    else
        third = a[op_pos + 3]
    end
    if op == "01"
        a[a[op_pos + 3]] = first + second
        # p [op, a[a[op_pos + 3]], op_pos]
        op_pos += 4
    elsif op == "02"
        a[a[op_pos + 3]] = first * second
        # p [op, a[a[op_pos + 3]], op_pos]
        op_pos += 4
    elsif op == "03"
        a[a[op_pos + 3]] = input
        # p [op, a[a[op_pos + 3]], op_pos]
        op_pos += 2
    elsif op == "04"
        # a[a[op_pos + 3]] = first
        p [op, a[a[op_pos + 1]], op_pos]
        op_pos += 2
    else
        p 'error'
    end
end
