instructions = []
File.open('day3.input').each_line do |line|
    instructions << line.split(",")
end


matrix = {}

x = 0
y = 0
min = 99999999999
step_one = 1
step_two = 1
min_step = 99999999999999


instructions[0].each do |code|
    direction = code[0]
    (1..code[1..-1].to_i).each do |len|
        if direction == "U"
            if matrix[y + len]
                matrix[y + len][x] = step_one
            else
                matrix[y + len] = {}
                matrix[y + len][x] = step_one
            end
        elsif direction == "D"
            if matrix[y - len]
                matrix[y - len][x] = step_one
            else
                matrix[y - len] = {}
                matrix[y - len][x] = step_one
            end
        elsif direction == "R"
            if matrix[y]
                matrix[y][x + len] = step_one
            else
                matrix[y] = {}
                matrix[y][x + len] = step_one
            end
        elsif direction == "L"
            if matrix[y]
                matrix[y][x - len] = step_one
            else
                matrix[y] = {}
                matrix[y][x - len] = step_one
            end
        end
        step_one += 1
    end
    y += code[1..-1].to_i if direction == "U"
    y -= code[1..-1].to_i if direction == "D"
    x += code[1..-1].to_i if direction == "R"
    x -= code[1..-1].to_i if direction == "L"
end

x = 0
y = 0

instructions[1].each do |code|
    direction = code[0]
    (1..code[1..-1].to_i).each do |len|
        if direction == "U"
            if matrix[y + len]
                if matrix[y + len][x]
                    distance = (y+len).abs + x.abs
                    min = distance if distance < min
                    steps = matrix[y + len][x] + step_two
                    min_step = steps if steps < min_step
                end
            end
        elsif direction == "D"
            if matrix[y - len]
                if matrix[y - len][x]
                    distance = (y-len).abs + x.abs
                    min = distance if distance < min
                    steps = matrix[y- len][x] + step_two
                    min_step = steps if steps < min_step
                end
            end
        elsif direction == "R"
            if matrix[y]
                if matrix[y][x + len]
                    distance = y.abs + (x + len).abs
                    min = distance if distance < min
                    steps = matrix[y][x + len] + step_two
                    min_step = steps if steps < min_step
                end
            end
        elsif direction == "L"
            if matrix[y]
                if matrix[y][x - len]
                    distance = y.abs + (x - len).abs
                    min = distance if distance < min
                    steps = matrix[y][x - len] + step_two
                    min_step = steps if steps < min_step
                end
            end
        end
        step_two += 1
    end
    y += code[1..-1].to_i if direction == "U"
    y -= code[1..-1].to_i if direction == "D"
    x += code[1..-1].to_i if direction == "R"
    x -= code[1..-1].to_i if direction == "L"
end

#PART ONE
p min

#PART TWO
p min_step