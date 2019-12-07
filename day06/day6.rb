require_relative 'object'

a = []
File.open('day6.input').each_line do |line|
    a << line.rstrip.split(")")
end

objects = a.flatten.uniq.map {|obj| Object.new(obj)}

a.each do |ins|
  parent = objects.find {|obj| obj.name == ins[0]}
  children = objects.find {|obj| obj.name == ins[1]}
  parent.children << ins[1]
  children.parent = ins[0]
end

level = 0
current_level = ['COM']
next_level = []

until current_level == []
  current_level.each do |obj|
    parent = objects.find{|ob| ob.name == obj}
    parent.level = level
    next_level << parent.children
    parent.children.each do |child|
      child = objects.find{|ob| ob.name == child}
    end
  end
  # p next_level
  current_level = next_level.flatten.dup
  next_level = []
  level += 1
end

#PART 1
p objects.map(&:level).sum

you = objects.find{|obj| obj.name == "YOU"}
san = objects.find{|obj| obj.name == "SAN"}

you_level = you.level
san_level = san.level

you_path = []
san_path = []

until you.parent == "COM"
  you_path << you.parent
  you = objects.find{|obj| obj.name == you.parent}
end

until san.parent == "COM"
  san_path << san.parent
  san = objects.find{|obj| obj.name == san.parent}
end

diff = you_path.reverse.zip(san_path.reverse).map {|objects| [objects[0], objects[0] == objects[1]]}.select {|obj| obj[1] == true}.last[0]
diff_level = objects.find{|obj| obj.name == diff}.level

#PART 2
p you_level + san_level - (diff_level * 2) - 2
