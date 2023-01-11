require './lib/console_prompt.rb'
require './lib/slow_text.rb'
require './lib/character.rb'
require './lib/game.rb'

$warrior_text = "A warrior? Guess you expect a sword now too, huh?"
$mage_text = "A mage? Like Harry Potter? Hope your brought your own wand."
$programmer_text = "You wanna be a programer? That's.... weird."
$programmer_text_2 = "What are you even going to fight with?"

$number_input_text = "You couldn't even type out the whole word?"
$word_input_text = "Why didn't you just type the number?"


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
BIG_TEXT

puts
puts
slow_text do
    "Ruby Kingdon is a simple text-based game built in ".cyan + "Ruby".red
end

slow_text do
    "Find me on Github @leeloomina".green
end
puts
puts

sleep 1

## Character Creation

slow_text(0.03) do
     "What will your name be?"
end
char_name = gets.chomp
puts

sleep 2

puts "Oh.".yellow.bold
puts
sleep 1
puts "#{char_name}?".red.bold.italic
puts
sleep 1
slow_text(0.1) do
    "Okay.".green.bold
end
puts
sleep 1
slow_text(0.03) do
    "Well, you can't change it now."
end

sleep 3


## Checks the user input to see if it matches an existing character class

ch_cl = false

unless ch_cl == true
   
    puts <<-'CLASS_TEXT'

Pick a class:
    1. Warrior
    2. Mage
    3. Programmer

CLASS_TEXT



char_class = gets.chomp
puts

sleep 2
    


if char_class.is_a?(Integer) != true && $char_classes.include?(char_class.downcase.capitalize())
    puts $word_input_text
    ch_cl = true

    case char_class
    when char_class.downcase.capitalize() == $char_class[0]
        puts $warrior_text
    when char_class.downcase.capitalize() == $char_class[1]
        puts $mage_text
    when char_class.downcase.capitalize() == $char_class[2]
        puts $programmer_text
        puts $programmer_text_2
    end
    
elsif char_class.to_i >= 4
    puts "Can you count to 3?"
    ch_cl = false

elsif char_class.to_i == 1
    puts $number_input_text
    sleep 1
    puts $warrior_text
    char_class = $char_classes[0]
    ch_cl = true

elsif char_class.to_i == 2
    puts $number_input_text
    sleep 1
    puts $mage_text
    char_class = $char_classes[1]
    ch_cl = true

elsif char_class.to_i == 3
    puts "You couldn't even type out the whole word?"
    sleep 1
    puts $programmer_text
    puts $programmer_text_2
    char_class = $char_classes[2]
    ch_cl = true
else
    puts "Really? Let's try this again"
    ch_cl = false

end

end

puts
sleep 1


$current_character = Character.new

$current_character.set_char_name(char_name)
$current_character.set_char_class(char_class)

puts $current_character.get_char_name

puts $current_character.get_char_inventory

$current_game = Game.new

$current_map = #get map

$current_game.set_character = $current_character
$current_game.set_map = $current_map

$current_map.start_game

## Add class to character instance

## Joke text
## "You are random_name, a class_name in Ruby Kingdom."

## Show map

## User input

## Inventory

## Move

## Randomly gen enemy 
