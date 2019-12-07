class Object
  attr_accessor :name, :parent, :children, :level
  def initialize(name, parent="", children=[])
    @name = name
    @level = -1
    @parent = parent
    @children = children
  end

  def to_s
    puts "Name: #{@name} Level: #{@level} Parent: #{@parent} Children: #{@children}"
  end
end
