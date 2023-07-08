class Node
  attr_reader :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def new_node(new)
    @next_node = new
  end
end