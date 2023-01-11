require './lib/slow_text.rb'
require './lib/character.rb'
require './lib/console_prompt.rb'


def class_checker(class_input = "chicken")
    if $char_classes.include?(class_input.downcase.capitalize())
        true
    else
        false
   end
end


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
## Char name, class, etc

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


# Checks the user input to see if it matches an existing character class

ch_cl = false
char_class = ''

unless ch_cl == true
   
    puts <<-'CLASS_TEXT'

Pick a class:
    1. Warrior
    2. Mage
    3. Programmer

CLASS_TEXT



char_class = gets.chomp
puts "User entered #{char_class}"
sleep 2
    


if char_class.is_a?(Integer) != true && $char_classes.include?(char_class.downcase.capitalize())
    puts "Why didn't you just type the number?"
    ch_cl = true
elsif char_class.to_i >= 4
    puts "Can you count to 3?"
    ch_cl = false

elsif char_class.to_i == 1
    puts "You couldn't even type out the whole word?"
    sleep 1
    puts "A warrior? So orginal"
    ch_cl = true

elsif char_class.to_i == 2
    puts "You couldn't even type out the whole word?"
    sleep 1
    puts "A mage? Lame"
    ch_cl = true

elsif char_class.to_i == 3
    puts "You couldn't even type out the whole word?"
    sleep 1
    puts "You're playing a game called Ruby Kingdom AND you wanna be a programmer? Weird."
    ch_cl = true
else
    puts "Really? Let's try this again"
    ch_cl = false

end

end

puts
sleep 1
puts "Oh no why is this repeating, plz help me"


## Snarky if number "You couldn't even type out the whole word?"
## Spelled out - "Why didn't you just type the number?"
## Misspelled or other entries "Uh.. Maybe you need to try this again"

## Add class to character instance

## Joke text
## "You are random_name, a class_name in Ruby Kingdom."

## Show map

## User input

## Inventory

## Move

## Randomly gen enemy 
