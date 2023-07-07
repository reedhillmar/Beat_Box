class LinkedList
  attr_reader :head, :nodes

  def initialize(head = nil)
    @head = head
    @nodes = 0
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    if @head == nil
      @nodes
    elsif @head.next_node == nil
      @nodes += 1
    else
      until @head.next_node == nil do
        @nodes += 1
      end
    end
  end
end