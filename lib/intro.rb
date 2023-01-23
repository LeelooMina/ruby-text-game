require "./lib/text_style.rb"
require "./lib/map.rb"
require "./lib/slow_text.rb"
require "./lib/character.rb"
require "./lib/random_name_class.rb"
require "./lib/pokemon_api.rb"
require "./lib/game.rb"
require "./lib/auth.rb"

class Intro

WARRIOR_TEXT = "A warrior? Guess you expect a sword now too, huh?"
MAGE_TEXT= "A mage? Like Harry Potter? Hope your brought your own wand."
PROGRAMMER_TEXT = "You wanna be a programmer? That's.... weird."
PROGRAMMER_TEXT_2 = "What are you even going to fight with?"

NUMBER_INPUT_TEXT = "You couldn't even type out the whole word?"
WORD_INPUT_TEXT = "Why didn't you just type the number?"
MISTAKE_TEXT = "Really?"
MISTAKE_TEXT_2 = "Let's try this again.."

## Welcome text

def run 
  greeting
  skip_check
  run_game


end

def greeting
puts <<-'BIG_TEXT'
__        __   _                            _          ____        _
\ \      / /__| | ___ ___  _ __ ___   ___  | |_ ___   |  _ \ _   _| |__  _   _
 \ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \ | __/ _ \  | |_) | | | | '_ \| | | |
  \ V  V /  __/ | (_| (_) | | | | | |  __/ | || (_) | |  _ <| |_| | |_) | |_| |
   \_/\_/ \___|_|\___\___/|_| |_| |_|\___|  \__\___/  |_| \_\\__,_|_.__/ \__, |
                                                                         |___/
                   _  ___                 _                 _ 
                  | |/ (_)_ __   __ _  __| | ___  _ __ ___ | |
                  | ' /| | '_ \ / _` |/ _` |/ _ \| '_ ` _ \| |
                  | . \| | | | | (_| | (_| | (_) | | | | | |_|
                  |_|\_\_|_| |_|\__, |\__,_|\___/|_| |_| |_(_)
                                |___/  
BIG_TEXT

puts
puts
slow_text do
  "Ruby Kingdom is a simple text-based game built in ".cyan + "Ruby".red
end

slow_text do
  "Find me on Github @leeloomina".green
end
puts
puts

sleep 1

end

# login = ""
# while login != "y" && login != "n"
# puts "Have you been here before?"
# puts "Y/N"
# print "> ".green
# login = gets.chomp.downcase
# end

# if login.downcase == "y"
#   Auth.login
# else
#   Auth.character_creation
# end

def skip_check
slow_text do
   "Would you like to skip the introduction?"
end
slow_text do
 "Y/N"
end
print "> ".green
input = gets.chomp.downcase
puts
if input == "yes" || input == "y"
  Auth.intro_skip
else
  Auth.character_intro
end

puts
sleep 1
end

## Show map
# ## Create game instance & add attributes

def run_game

$current_game = Game.new($current_character)
$map = Map.new
#   map.generate_map
  $map.set_character_location(5)

end

end
# $current_map = #get map

# $current_game.set_character($current_character)
# $current_game.set_map($current_map)

# $current_game.start_game

## User input

## Inventory

## Move

## Randomly gen enemy
