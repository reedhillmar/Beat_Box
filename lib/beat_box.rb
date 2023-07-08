class BeatBox
  attr_reader :list

  def initialize(list = LinkedList.new)
    @list = list
  end

  def append(string)
    elements = string.split

    elements.each do |element|
      list.append(element)
    end
  end

  def count
    list.count
  end

  def play
    beats = list.to_string
    require 'pry';binding.pry
  end
end