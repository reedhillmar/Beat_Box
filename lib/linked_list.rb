class LinkedList
  attr_reader :head, :nodes, :bb

  def initialize(head = nil)
    @head = head
    @nodes = 0
    @bb = ""
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
        @bb = "#{current_node.data}"
        
        current_node = current_node.next_node
      end

      @bb = "#{@bb} #{current_node.data}"
      @bb.strip
      # these two lines are not an elegant solution and should be fixed if I have time
    end
  end
end