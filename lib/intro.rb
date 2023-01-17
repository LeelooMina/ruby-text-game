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
chr__name = gets.chomp
puts

sleep 2

puts "Oh.".yellow.bold
puts
sleep 1
puts "#{chr__name}?".red.bold.italic
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

ch_cl = false

while ch_cl != true
  slow_text do
    <<-'CLASS_TEXT'

Pick a class:
    1. Warrior
    2. Mage
    3. Programmer

CLASS_TEXT
  end

  chr__class = gets.chomp
  puts

  sleep 2

  if $chr__classes.include?(chr__class.downcase.capitalize())
    slow_text do
         $word_input_text
    end
    ch_cl = true

    case chr__class.downcase.capitalize()
    when $chr__classes[0]
      slow_text(0.03) do
        $warrior_text
      end
    when $chr__classes[1]
      slow_text do
        $mage_text
      end
    when $chr__classes[2]
      slow_text(0.03) do
        $programmer_text
      end
      slow_text(0.03) do
        $programmer_text_2
      end
    end

    chr__class = chr__class.downcase.capitalize()
  elsif chr__class.to_i >= 4
    slow_text(0.07) do
      "Can you count to 3?"
    end
    ch_cl = false
  elsif chr__class.to_i == 1
    slow_text(0.03) do
      $number_input_text
    end
    sleep 1
    slow_text(0.03) do
      $warrior_text
    end
    chr__class = $chr__classes[0]
    ch_cl = true
  elsif chr__class.to_i == 2
    slow_text(0.03) do
      $number_input_text
    end
    slow_text(0.03) do
        $mage_text
    end
    sleep 1
    chr__class = $chr__classes[1]
    ch_cl = true
  elsif chr__class.to_i == 3
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
    chr__class = $chr__classes[2]
    ch_cl = true
  else
    slow_text(0.03) do
        $mistake_text.red
    end
    slow_text(0.03) do
        $mistake_text_2.yellow
    end
    ch_cl = false
  end
end

puts
sleep 2

## Create character instance & add attributes

$current_character = Character.new

$current_character.set_chr_name(chr__name)
$current_character.set_chr_class(chr__class)

## Joke text

random_name = random_name()
random_class = random_class()

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
    "You are #{$current_character.get_chr__name}, a #{$current_character.get_chr__class} in Ruby Kingdom!".green
end

puts

slow_text(0.1) do
  "Okay. It's working. Don't touch anything else.".cyan.bold
end

sleep 1


# slow_text do
#   "This game doesn't even work yet."
# end

# slow_text do
#   "Here, have a random Pokemon name from the Pokemon API:"
# end

# slow_text do
#   get_rand_pokemon_name
# end

# puts

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
