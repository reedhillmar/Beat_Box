class BeatBox
  attr_reader :list, :string, :allowed_beats
  attr_accessor :voice, :rate

  def initialize
    @list = LinkedList.new
    @allowed_beats = ["tee", "dee", "deep", "bop", "boop", "la", "na", "doo", "ditt", "woo", "hoo", "shu"]
    @allowed_voices = ["Eddy", "Flo", "Grandma", "Grandpa", "Reed", "Rocko", "Sandy", "Shelley", "Fred", "Junior", "Kathy", "Nicky", "Albert", "Bad News", "Bahh", "Bells", "Boing", "Bubbles", "Cellos", "Good News", "Jester", "Organ", "Superstar", "Trinoids", "Whisper", "Wobble", "Zarvox", "Ralph", "Samantha", "Karen", "Rishi", "Moira", "Tessa", "Daniel"]
    @voice = "Boing"
    @rate = 500
  end

  def append(string)
    # if elements of string are not in allowed, remove them from the string
      # for each element in the given string, check that it is included in allowed
      # if flase, remove the element before appending
    elements = string.split

    elements.each do |element|
      if @allowed_beats.include?(element)
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
    # if @allowed_voices.include?(@voice)
    #   `say -r #{@rate} -v #{@voice} #{all}`
    # else
    #   p "Please choose a valid voice from the slection below"
    #   p @allowed_voices
    # end

    if @rate.to_s == @rate
      p "Please choose a valid rate. Rate must be an integer or float."
    # elsif # If @rate is an array...
    #   "Please choose a valid rate. Rate must be an integer or float."
    elsif @allowed_voices.include?(@voice)
      `say -r #{@rate} -v #{@voice} #{all}`
    else
      p "Please choose a valid voice from the slection below"
      p @allowed_voices
    end

    # beats <= this was here to confirm beats is accepting the string properly
  end

  def all
    # return all nodes in a list as a string
    list.to_string
  end

  def prepend(string)
    reverse_elements = string.split.reverse

    reverse_elements.delete_if {|element| @allowed_beats.include?(element) == false}

    reverse_elements.each do |element|
        list.prepend(element)
    end

    # I tried to remove elements as part of the each block and it didn't work. Not sure why
    # Come back and test this again later
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end
end