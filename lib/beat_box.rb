class BeatBox
  attr_reader :list, :string, :allowed_beats, :allowed_voices
  attr_accessor :voice, :rate

  def initialize(beats = "")
    @list = LinkedList.new
    @allowed_beats = ["tee", "dee", "deep", "bop", "boop", "la", "na", "doo", "ditt", "woo", "hoo", "shu"]
    @allowed_voices = ["Eddy", "Flo", "Grandma", "Grandpa", "Reed", "Rocko", "Sandy", "Shelley", "Fred", "Junior", "Kathy", "Nicky", "Albert", "Bad News", "Bahh", "Bells", "Boing", "Bubbles", "Cellos", "Good News", "Jester", "Organ", "Superstar", "Trinoids", "Whisper", "Wobble", "Zarvox", "Ralph", "Samantha", "Karen", "Rishi", "Moira", "Tessa", "Daniel"]
    @voice = "Boing"
    @rate = 500
    @beats = append(beats)
  end

  def append(string)
    elements = string.split

    # elements.each do |element|
    #   # require 'pry';binding.pry
    #   if @allowed_beats.include?(element)
    #     list.append(element)
    #   else
    #     elements.delete_at(elements.find_index(element))
    #   end
    # end

    elements.delete_if {|element| @allowed_beats.include?(element) == false}

    elements.each do |element|
        list.append(element)
    end
  end

  def count
    list.count
  end

  def play_test
    if @rate.to_s == @rate
      p "Your rate is invalid."
    # elsif # If @rate is an array...
    #   "Please choose a valid rate. Rate must be an integer or float."
    elsif @allowed_voices.include?(@voice) == false
      p "Your voice is invalid."
    else
    end
  end

  def play
    `say -r #{@rate} -v #{@voice} #{all}`
  end

  def all
    list.to_string
  end

  def prepend(string)
    reverse_elements = string.split.reverse

    reverse_elements.delete_if {|element| @allowed_beats.include?(element) == false}

    reverse_elements.each do |element|
        list.prepend(element)
    end
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end
end