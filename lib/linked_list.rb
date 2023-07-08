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
      # @head.next_node = (Node.new(data))
      # this needs to be an until for more than length 2 list
      current_node = @head

      until current_node.next_node == nil do
        current_node = current_node.next_node
      end

      current_node.next_node = (Node.new(data))
    end
  end

  def count
  # I want to refactor this to conform with the rest of my code
  # use current_node rather than another_node
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

      # this took me way too long
      # I got down the wrong path and was trying to edit the list directly rather than creating a new node and fitting it into place
      # I need to remember two things
      # 1 - remember to add comments into my code! before diving in head first, make a plan and be sure that I fully understand what I'm tyring to accomplish
      # this was great for me when I was building my to_string method and I didn't use it here to my detriment
      # 2 - don't be afraid to reapproach it if something isn't working. try to reframe your perspective of the problem and see if there's another way to accomplish it
    end
  end

  def find
    # takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return
    # if string = "deep woo shi shu blop"
    # list.find(2, 1) == "shi"
    # list.find(1, 3) == "woo shi shu"
    # list.find(index, nodes_past_index)
require 'pry';binding.pry
    string = to_string
    string.split

  end
end