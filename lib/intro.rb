require "./lib/console_prompt.rb"
require "./lib/slow_text.rb"
require "./lib/character.rb"
require "./lib/game.rb"
require "./lib/random_name_class.rb"
require "./lib/pokemon_api.rb"

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

## character Creation

slow_text(0.03) do
  "What will your name be?"
end
print "> ".green.blink
character_name = gets.chomp
puts

sleep 2

puts "Oh.".yellow.bold
puts
sleep 1
puts "#{character_name}?".red.bold.italic
puts
sleep 1
puts "Really?".red.bold.italic
puts
sleep 1
slow_text(0.1) do
  "Well...Okay.".green.bold
end
puts
sleep 1
slow_text(0.03) do
  "Hope you're happy. You can't change it now."
end

sleep 3

## Checks the user input to see if it matches an existing character class

character_class_check = false

while character_class_check != true
  slow_text do
    <<-'CLASS_TEXT'

Pick a class:
    1. Warrior
    2. Mage
    3. Programmer

CLASS_TEXT
  end

  print "> ".green.blink
  class_input = gets.chomp
  puts

  sleep 2

  if Character::CHARACTER_CLASSES.include?(class_input.downcase.capitalize())
    slow_text do
      $word_input_text
    end
    character_class_check = true

    case class_input.downcase.capitalize()
    when Character::CHARACTER_CLASSES[0]
      slow_text(0.03) do
        $warrior_text
      end
    when Character::CHARACTER_CLASSES[1]
      slow_text do
        $mage_text
      end
    when Character::CHARACTER_CLASSES[2]
      slow_text(0.03) do
        $programmer_text
      end
      slow_text(0.03) do
        $programmer_text_2
      end
    end

    class_input = class_input.downcase.capitalize()
  elsif class_input.to_i >= 4
    slow_text(0.07) do
      "Can you count to 3?"
    end
    character_class_check = false
  elsif class_input.to_i == 1
    slow_text(0.03) do
      $number_input_text
    end
    sleep 1
    slow_text(0.03) do
      $warrior_text
    end
    class_input = Character::CHARACTER_CLASSES[0]
    character_class_check = true
  elsif class_input.to_i == 2
    slow_text(0.03) do
      $number_input_text
    end
    slow_text(0.03) do
      $mage_text
    end
    sleep 1
    class_input = Character::CHARACTER_CLASSES[1]
    character_class_check = true
  elsif class_input.to_i == 3
    slow_text(0.03) do
      $number_input_text
    end
    sleep 1
    slow_text(0.03) do
      $programmer_text
    end

    slow_text(0.03) do
      $programmer_text_2
    end
    class_input = Character::CHARACTER_CLASSES[2]
    character_class_check = true
  else
    slow_text(0.03) do
      $mistake_text.red
    end
    slow_text(0.03) do
      $mistake_text_2.yellow
    end
    character_class_check = false
  end
end

puts
sleep 2

## Create character instance & add attributes

$current_character = Character.new

$current_character.set_name(character_name)
$current_character.set_class(class_input)

## Joke text

random_name = RandomName.random_name
random_class = RandomName.random_class

puts
slow_text(0.03) do
  "You are #{random_name}, a #{random_class} in Ruby Kingdom!".green
end

sleep 1
puts

slow_text do
  "Wait..".yellow
end
puts

sleep 2

slow_text(0.1) do
  "What did you do??".red.bold.italic
end

sleep 1

slow_text(0.1) do
  "You broke it!".red.bold.italic
end

sleep 2
puts

slow_text(0.1) do
  "Now I have to go fix it.".yellow
end

sleep 3
puts
slow_text(0.1) do
  "......"
end

sleep 1
puts
puts

slow_text(0.03) do
  "You are #{$current_character.get_name}, a #{$current_character.get_class} in Ruby Kingdom!".green
end

puts

slow_text(0.1) do
  "Okay. It's working. Don't touch anything else.".cyan.bold
end

sleep 1

## Show map
# ## Create game instance & add attributes

$current_game = Game.new($current_character)

$current_game.combat_game

# $current_map = #get map

# $current_game.set_character($current_character)
# $current_game.set_map($current_map)

# $current_game.start_game

## User input

## Inventory

## Move

## Randomly gen enemy
