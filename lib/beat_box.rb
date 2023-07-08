class BeatBox
  attr_reader :list

  def initialize(list = LinkedList.new)
    @list = list
  end
end