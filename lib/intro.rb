require "./lib/text_style.rb"
require "./lib/map.rb"
require "./lib/slow_text.rb"
require "./lib/character.rb"
require "./lib/random_name_class.rb"
require "./lib/pokemon_api.rb"
require "./lib/game.rb"
require "./lib/auth.rb"

module Intro
  WARRIOR_TEXT = "A warrior? Guess you expect a sword now too, huh?"
  MAGE_TEXT = "A mage? Like Harry Potter? Hope your brought your own wand."
  PROGRAMMER_TEXT = "You wanna be a programmer? That's.... weird."
  PROGRAMMER_TEXT_2 = "What are you even going to fight with?"

  NUMBER_INPUT_TEXT = "You couldn't even type out the whole word?"
  WORD_INPUT_TEXT = "Why didn't you just type the number?"
  MISTAKE_TEXT = "Really?"
  MISTAKE_TEXT_2 = "Let's try this again.."

  ## Welcome text

  def self.run
    greeting
    login_check
    run_game
  end

  def self.greeting
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

  def self.login_check
    slow_text do
      <<-'CLASS_TEXT'
    
    Make a choice:
        1. Create a new character
        2. Load save
    
    CLASS_TEXT
    end
    print "> ".green
    input = gets.chomp.downcase
    puts
    if input == "2"
      Auth.login
    else
      Auth.character_intro
    end

    puts
    sleep 1
  end

  ## Show map
  # ## Create game instance & add attributes

  def self.run_game
    $current_game = Game.new($current_character)
    $map = Map.new

    $map.set_character_location(5)
  end
end
