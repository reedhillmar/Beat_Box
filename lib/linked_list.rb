class LinkedList
  attr_reader :head, :nodes

  def initialize(head = nil)
    @head = head
    @nodes = 0
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      @head.new_node(Node.new(data))
    end
  end

  def count
    if @head == nil
      @nodes
    elsif @head.next_node == nil
      @nodes += 1
    else
      another_node = @head.next_node
      
      until another_node == nil do
        @nodes += 1
        another_node = another_node.next_node
      end

      @nodes += 1
    end
  end

  def to_string
    if @head == nil
      nil
    else @head.next_node == nil
      @head.data
    end
  end
end