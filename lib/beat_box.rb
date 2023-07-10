class BeatBox
  attr_reader :list, :string, :allowed

  def initialize(string = "")
    @list = LinkedList.new
    @string = string
    @allowed = ["tee", "dee", "deep", "bop", "boop", "la", "na", "doo", "ditt", "woo", "hoo", "shu"]
  end

  def append(string)
    # if elements of string are not in allowed, remove them from the string
      # for each element in the given string, check that it is included in allowed
      # if flase, remove the element before appending
    elements = string.split

    elements.each do |element|
      if @allowed.include?(element)
        list.append(element)
      else
        elements.delete(element)
      end
    end
  end

  def count
    list.count
  end

  def play
    #beats = list.to_string <= this line is no longer needed since adding #all

    `say -r 500 -v Boing #{all}`

    # beats <= this was here to confirm beats is accepting the string properly
  end

  def all
    # return all nodes in a list as a string
    list.to_string
  end

  def prepend(string)
    reverse_elements = string.split.reverse

    reverse_elements.delete_if {|element| @allowed.include?(element) == false}

    reverse_elements.each do |element|
        list.prepend(element)
    end

    # I tried to remove elements as part of the each block and it didn't work. Not sure why
    # Come back and test this again later
  end
end