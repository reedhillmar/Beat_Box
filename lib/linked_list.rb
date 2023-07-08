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
      @head.next_node = (Node.new(data))
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
      # this needs to be here because the final node is not taken into account in the until loop
      # this is not an elegant solution and should be fixed if I have time
    end
  end

  def to_string
    if @head == nil
      nil
    # elsif @head.next_node == nil
    #   @head.data
    else
      # list.append("doop")
      # list.append("deep")
      # list.append("dip")
      # @head.data == "doop"
      # @head.next_node.data == "deep"
      # @head.next_node.next_node.data == "dip"
      # if current_node == @head && current_node.next_node.data == nil
      # then another node.data should be the end of the string
      # for each new node next_node.data needs to be added to a running string until next_node.data is nil
      current_node = @head

      until current_node.next_node == nil do
        # require 'pry';binding.pry
        string = "#{string} #{current_node.data}"
        
        current_node = current_node.next_node
      end

      string = "#{string} #{current_node.data}"
      string.strip
      # these two lines are not an elegant solution and should be fixed if I have time
    end
  end

  def prepend(data)
    @head = Node.new(data, @head)
  end

  def insert(index, data)
    if index == 0
      prepend(data)
    else
      current_node = @head
      @nodes = 1

      until @nodes == index || current_node.next_node == nil do
        @nodes += 1
        current_node = current_node.next_node
      end

      new_node = Node.new(data, current_node.next_node)
      current_node.next_node = new_node

      
    end
  end
end