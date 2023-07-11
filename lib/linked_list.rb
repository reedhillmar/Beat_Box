class LinkedList
  attr_accessor :head, :append

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current_node = @head

      current_node = current_node.next_node until current_node.next_node == nil

      current_node.next_node = (Node.new(data))
    end
  end

  def count
    @nodes = 0
    current_node = @head

    until current_node == nil do
      current_node = current_node.next_node
      @nodes += 1
    end

    @nodes

  end

  def to_string
    if @head == nil
    else
      current_node = @head
      @string = ""
      
      loop do
        @string = "#{@string} #{current_node.data}" 

        break if current_node.next_node == nil
        
        current_node = current_node.next_node
      end
    end

    @string.strip unless @string == nil
  end

  def prepend(data)
    @head = Node.new(data, @head)
  end

  def insert(index, data)
    @nodes = 0

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

  def find(index, length)
    if length == 0 || length == nil
      nil
    elsif length == 1
      to_string[0..to_string.index(" ") - 1]
    else
      spaces = 1
      words = 0
      helper_string = to_string
        
      until spaces == index
        spaces += 1
        helper_string = helper_string.sub(" ", "")
      end

      index_string = helper_string

      until words == length
        words += 1
        helper_string = helper_string.sub(" ", "")
      end

      length_string = helper_string

      index_string[(index_string.index(" ") + 1)..(length_string.index(" ") - 1 + words)]
    end
  end

  def includes?(element)
    current_node = @head

    current_node = current_node.next_node until current_node.data == element || current_node.next_node == nil

    current_node.data == element
  end

  def pop
    current_node = @head

    current_node = current_node.next_node until current_node.next_node == nil

    last_node = current_node

    current_node = @head

    current_node = current_node.next_node until current_node.next_node == last_node

    current_node.next_node = nil

    last_node.data
  end
end