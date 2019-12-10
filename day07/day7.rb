a = []
File.open('day7.input').each_line do |line|
    a = line.split(",").map(&:to_i)
end

input = 0

def mode_output(pm, a, op_pos, pos)
    return a[a[op_pos + pos]] if pm == "0"
    return a[op_pos + pos]
end

def intcode_comp(input_one, input_two, sw)
  op_pos = 0
  output = 0
  while sw[op_pos].to_s[-2..-1] != "99"
      if sw[op_pos].to_s[-2..-1]
          op = sw[op_pos].to_s[-2..-1]
      else
          op = "0" + sw[op_pos].to_s[-1]
      end
      first_pm = sw[op_pos].to_s[-3] || "0"
      second_pm = sw[op_pos].to_s[-4] || "0"
      third_pm = sw[op_pos].to_s[-5] || "0"
      first = mode_output(first_pm, sw, op_pos, 1)
      second = mode_output(second_pm, sw, op_pos, 2)
      third = mode_output(third_pm, sw, op_pos, 3)
      if op == "01"
          sw[sw[op_pos + 3]] = first + second
          op_pos += 4
      elsif op == "02"
          sw[sw[op_pos + 3]] = first * second
          op_pos += 4
      elsif op == "03"
          if op_pos == 0
            sw[sw[op_pos + 1]] = input_one
          else
            sw[sw[op_pos + 1]] = input_two
          end
          op_pos += 2
      elsif op == "04"
          output =  sw[sw[op_pos + 1]]
          op_pos += 2
      elsif op == "05"
          op_pos = second - 3 if first != 0
          op_pos += 3
      elsif op == "06"
          op_pos = second - 3 if first == 0
          op_pos += 3
      elsif op == "07"
          if first < second
              sw[sw[op_pos + 3]] = 1
          else
              sw[sw[op_pos + 3]] = 0
          end
          op_pos += 4
      elsif op == "08"
          if first == second
              sw[sw[op_pos + 3]] = 1
          else
              sw[sw[op_pos + 3]] = 0
          end
          op_pos += 4
      end
  end
  # p output
  return output
end

max = 0
signal = ""



# all_combo = [0,1,2,3,4].permutation(5).to_a
all_combo = [5,6,7,8,9].permutation(5).to_a


COMP_A = a.dup
COMP_B = a.dup
COMP_C = a.dup
COMP_D = a.dup
COMP_E = a.dup

all_combo.each do |phase|
  loop_number = 0
  until all_halts
    if loop_number == 0
      output_a = intcode_comp(phase[0], 0, COMP_A)
    else
      output_a = intcode_comp(phase[0],output_e, COMP_A)
    end
    output_b = intcode_comp(phase[1], output_a, COMP_B)
    output_c = intcode_comp(phase[2], output_b, COMP_C)
    output_d = intcode_comp(phase[3], output_c, COMP_D)
    output_e = intcode_comp(phase[4], output_d, COMP_E)
    loop_number += 1
  end
  if output_e > max
    max = output_e
    signal = phase.join("")
  end
end

#PART 1
p max


