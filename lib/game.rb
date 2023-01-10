

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
puts "Ruby Kingdon is a simple text-based game built in Ruby"
puts "Find me on Github @leeloomina"
puts
puts


## Char name, class, etc

puts "What will your name be?"
char_name = gets.chomp

sleep 2

puts "Oh.".red.bold

sleep 1
puts "Okay.".green.bold
sleep 1
puts "I hope that isn't your real name.".gray.italic

sleep 3

puts <<-'CLASS_TEXT'

Pick a class:
    1. Warrior
    2. Mage
    3. Programmer

CLASS_TEXT

## Joke text

## Show map

## User input

## Inventory

## Move

## Randomly gen enemy 
