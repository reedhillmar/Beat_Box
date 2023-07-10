class LinkedList
  attr_accessor :head, :append

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      # @head.next_node = (Node.new(data))
      # this needs to be an until for more than length 2 list
      current_node = @head

      # until current_node.next_node == nil do
      #   current_node = current_node.next_node
      # end
      current_node = current_node.next_node until current_node.next_node == nil

      current_node.next_node = (Node.new(data))
    end
  end

  def count
  ##### DONE
  # I want to refactor this to conform with the rest of my code
  # use current_node rather than another_node
  ##### DONE

  ### ORIGINAL
    # @nodes = 0  

    # if @head == nil
    #   @nodes
    # elsif @head.next_node == nil
    #   @nodes += 1
    # else
    #   another_node = @head.next_node
      
    #   until another_node == nil do
    #     @nodes += 1 
    #     another_node = another_node.next_node
    #   end

    #   @nodes += 1
      # this needs to be here because the final node is not taken into account in the until loop
      # this is not an elegant solution and should be fixed if I have time

  ### REFACTOR
    @nodes = 0
    current_node = @head

    until current_node == nil do
      current_node = current_node.next_node
      @nodes += 1
    end

    @nodes

  end

  def to_string
  
  ### ORIGINAL
    # if @head == nil
    #   nil
    # # elsif @head.next_node == nil
    # #   @head.data
    # else
      # list.append("doop")
      # list.append("deep")
      # list.append("dip")
      # @head.data == "doop"
      # @head.next_node.data == "deep"
      # @head.next_node.next_node.data == "dip"
      # if current_node == @head && current_node.next_node.data == nil
      # then another node.data should be the end of the string
      # for each new node next_node.data needs to be added to a running string until next_node.data is nil
    #   current_node = @head

    #   until current_node.next_node == nil do
    #     # require 'pry';binding.pry
    #     string = "#{string} #{current_node.data}"
        
    #     current_node = current_node.next_node
    #   end

    #   string = "#{string} #{current_node.data}"
    #   string.strip
    #   # these two lines are not an elegant solution and should be fixed if I have time
    # end

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

    # if @string == nil
    # else @string.strip
    # end
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

      # this took me way too long
      # I got down the wrong path and was trying to edit the list directly rather than creating a new node and fitting it into place
      # I need to remember two things
      # 1 - remember to add comments into my code! before diving in head first, make a plan and be sure that I fully understand what I'm tyring to accomplish
      # this was great for me when I was building my to_string method and I didn't use it here to my detriment
      # 2 - don't be afraid to reapproach it if something isn't working. try to reframe your perspective of the problem and see if there's another way to accomplish it
    end
  end

  def find(index, length)
  ### ORIGINAL
    # takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return
    # if string = "deep woo shi shu blop"
    # list.find(2, 1) == "shi"
    # list.find(1, 3) == "woo shi shu"
    # list.find(index, length)
    # string = to_string

    ##CODE
    @string_array = to_string.split
    beats = 0

    @string_array[index]

    if length == 0 || length == nil
      nil
    elsif length == 1
      @string_array[index]
    else
      until beats >= length
        index_to_add = index + beats
        string = "#{string} #{@string_array[index_to_add]}"
        beats += 1
      end

      string.strip
    end

    # this went much better! I gave myself the time to think about what I was trying to do before just trying things
    # I like the code here better than my other similar methods. If I have time I'd like to go back and refactor to account for all occurances within the loop rather than having to add another occurance after the loop closes

    # this could also be done with .slice
    # don't know if that's kosher  with array restictsion on the project

  ### REFACTOR WITHOUT ARRAY
  ## takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return
  ## find the position
    ## find the first space
      ## space = to_string.index(" ")
    ## node = to_string[0..space]
  ## return number of words
    ## length = 1, return 1 word
    ## length = 2, return 2 words

    ## CODE
    # if length == 0 || length == nil
    #   nil
    # elsif length == 1
    #   to_string[0..to_string.index(" ") - 1]
    # end
  end

  def includes?(element)
    # gives back true or false whether the supplied value is in the list

    ### Original Solution
    # @string_array = to_string.split

    # @string_array.include?(element)

    ### Original Refactor
    # to_string.split.include?(element)

    ### refactoring above to break down what's happening under the hood
    current_node = @head

    # GOAL
      # cycle through current_node.next_node until == element || nil
      # if current_node.next_node == element => true
      # if current_node.next_node == nil => false

    # until current_node.data == element || current_node.next_node == nil
    #   current_node = current_node.next_node
    # end
    current_node = current_node.next_node until current_node.data == element || current_node.next_node == nil

    current_node.data == element
  end

  def pop
    # removes elements the last element from the list

    # last call of the method is .pop
    # before last call
      # find the last node in the list
        # current_head.next_node == nil
      # store the element name of the last node for future use
        # last_node = current_node
      # find the previous node
        # current_node = @head
        # current_node.next_node == last node
      # remove the link to the last node
        # current_node.next_node = nil

    current_node = @head

    # until current_node.next_node == nil
    #   current_node = current_node.next_node
    # end
    current_node = current_node.next_node until current_node.next_node == nil

    last_node = current_node

    current_node = @head

    # until current_node.next_node == last_node
    #   current_node = current_node.next_node
    # end
    current_node = current_node.next_node until current_node.next_node == last_node

    current_node.next_node = nil

    last_node.data
    # I feel really good about how I approched this!
    # I initially only defined string array and popped it, but pretty quickly realized that that only pops the string, not the list. A LIST IS NOT AN ARRAY!!!
    # From there I took another look and pseudo-coded how to pop the string_array and the list
    # When I actually went in to write the code it was a one-and-done thanks to pre-planning
    
    ## Refactoring
    ## In refactoring I realized I don't need to use an array at all
    ## I previously used @string_array = list.to_string => @string_array.pop
    ## That just called the same data I already had stored in last_node
  end
end