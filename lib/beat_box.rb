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

    `say -r 500 -v Boing #{beats}`

    # beats <= this was here to confirm beats is accepting the string properly
  end
end