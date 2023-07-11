require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

bb = BeatBox.new

p "Welcome to the Demonic Beat Boxer!"
p "With this tool you can have your computer say given beats!"
p "It sounds utterly demonic because computers really shouldn't be talking to you!"
p "For proper use, turn your volume up. For the best user experience, turn your volume off."
p bb.allowed_beats
p "Please input a phrase using the beats listed above."

input = gets.chomp.downcase

bb.append(input)

loop do
  p "The default voice is Boing. Would you like to change it? Y/N"

  input = gets.chomp.upcase

  if input == "N"
    break
  elsif input == "Y"
    p bb.allowed_voices
    p "Please select a voice from the list above."
    bb.voice = gets.chomp.capitalize
    break
  else p "Your input is invalid. Please reply with Y or N."
  end
end

loop do
  p "The default rate is 500. I don't know what the unit's are, so please don't ask. Would you like to change it? Y/N"

  input = gets.chomp.upcase

  if input == "N"
    break
  elsif input == "Y"
    p "Please select a rate in the form of a numeric."
    bb.rate = gets.chomp.to_f
    break
  elsif input.include? "UNIT"
    p "I told you I don't know anything about the units, and I asked kindly that you don't ask. This is your punishment"
    `say -r 1 -v #{bb.voice} "We're no strangers to love
    You know the rules and so do I (do I)
    A full commitment's what I'm thinking of
    You wouldn't get this from any other guy
    I just wanna tell you how I'm feeling
    Gotta make you understand
    Never gonna give you up
    Never gonna let you down
    Never gonna run around and desert you
    Never gonna make you cry
    Never gonna say goodbye
    Never gonna tell a lie and hurt you
    We've known each other for so long
    Your heart's been aching, but you're too shy to say it (say it)
    Inside, we both know what's been going on (going on)
    We know the game and we're gonna play it
    And if you ask me how I'm feeling
    Don't tell me you're too blind to see
    Never gonna give you up
    Never gonna let you down
    Never gonna run around and desert you
    Never gonna make you cry
    Never gonna say goodbye
    Never gonna tell a lie and hurt you
    Never gonna give you up
    Never gonna let you down
    Never gonna run around and desert you
    Never gonna make you cry
    Never gonna say goodbye
    Never gonna tell a lie and hurt you
    We've known each other for so long
    Your heart's been aching, but you're too shy to say it (to say it)
    Inside, we both know what's been going on (going on)
    We know the game and we're gonna play it
    I just wanna tell you how I'm feeling
    Gotta make you understand
    Never gonna give you up
    Never gonna let you down
    Never gonna run around and desert you
    Never gonna make you cry
    Never gonna say goodbye
    Never gonna tell a lie and hurt you
    Never gonna give you up
    Never gonna let you down
    Never gonna run around and desert you
    Never gonna make you cry
    Never gonna say goodbye
    Never gonna tell a lie and hurt you
    Never gonna give you up
    Never gonna let you down
    Never gonna run around and desert you
    Never gonna make you cry
    Never gonna say goodbye
    Never gonna tell a lie and hurt you"`
    break
  else p "Your input is invalid. Please reply with Y or N."
  end
end

loop do
  p "You would like the computer to say #{bb.all} using #{bb.voice}'s demonic voice at a rate of #{bb.rate}. Are you sure? Y/N"

  input = gets.chomp.upcase

  if input == "N"
    p "You have chosen wisely. Please be on your way."
    break
  elsif input == "Y"
    
    if bb.play_test == "Your rate is invalid."
      p "Please restart the program."
      break
    elsif bb.play_test == "Your voice is invalid."
      p "Please restart the program."
      break
    else
      p "You have chosen poorly. You can't blame me for what you're about to hear."
    end

    bb.play
    break
  else p "Your input is invalid. Plase reply with Y or N."
  end
end