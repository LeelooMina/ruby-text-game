require "./lib/text_style.rb"
require "./lib/map.rb"
require "./lib/slow_text.rb"
require "./lib/character.rb"
require "./lib/random_name_class.rb"
require "./lib/pokemon_api.rb"
require "./lib/game.rb"
require "./lib/auth.rb"

$warrior_text = "A warrior? Guess you expect a sword now too, huh?"
$mage_text = "A mage? Like Harry Potter? Hope your brought your own wand."
$programmer_text = "You wanna be a programmer? That's.... weird."
$programmer_text_2 = "What are you even going to fight with?"

$number_input_text = "You couldn't even type out the whole word?"
$word_input_text = "Why didn't you just type the number?"
$mistake_text = "Really?"
$mistake_text_2 = "Let's try this again.."

## Welcome text

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

login = ""
while login != "y" && login != "n"
puts "Have you been here before?"
puts "Y/N"
print "> ".green
login = gets.chomp.downcase
end

if login.downcase == "y"
  Auth.login
else
  Auth.character_creation
end

sleep 1

## Show map
# ## Create game instance & add attributes

$current_game = Game.new($current_character)
$map = Map.new
#   map.generate_map
  $map.set_character_location(5)

# $current_map = #get map

# $current_game.set_character($current_character)
# $current_game.set_map($current_map)

# $current_game.start_game

## User input

## Inventory

## Move

## Randomly gen enemy
