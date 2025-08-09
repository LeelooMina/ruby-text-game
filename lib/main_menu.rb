require './lib/text_style.rb'
require './lib/slow_text.rb'
require './lib/character.rb'
require './lib/save_system.rb'
require './lib/random_name_class.rb'

module MainMenu

  def self.show_main_menu
    clear_screen
    show_title
    
    menu_choice = SaveSystem.show_save_menu
    
    if menu_choice == :new_game
      create_new_character
    elsif menu_choice.is_a?(Hash) && menu_choice[:type] == :load_game
      load_existing_character(menu_choice[:filename])
    else
      puts "Something went wrong!".red
      exit
    end
  end

  def self.clear_screen
    system("clear") || system("cls")
  end

  def self.show_title
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
      "Welcome to Ruby Kingdom - A mystical realm where code and magic intertwine!".cyan
    end

    slow_text do
      "Find the legendary Ruby Castle and claim your destiny...".green
    end
    puts
    puts
    sleep 1
  end

  def self.create_new_character
    puts "\n=== CHARACTER CREATION ===".cyan.bold
    puts
    
    # Get character name
    slow_text(0.03) do
      "What will your name be, brave adventurer?"
    end
    print "> ".green
    character_name = gets.chomp.strip
    
    while character_name.empty?
      puts "You must enter a name!".red
      print "> ".green
      character_name = gets.chomp.strip
    end

    puts
    sleep 1
    puts "#{character_name}... an interesting choice.".yellow.bold
    puts
    sleep 1
    slow_text(0.03) do
      "Very well, #{character_name}. Choose your path wisely."
    end

    sleep 2

    # Character class selection
    character_class_check = false
    class_input = nil

    while character_class_check != true
      puts
      slow_text do
        <<-'CLASS_TEXT'

Pick your class:
    1. Warrior - Master of blade and battle
    2. Mage - Wielder of arcane mysteries  
    3. Programmer - Hacker of reality's code

CLASS_TEXT
      end

      print "> ".green
      class_input = gets.chomp
      puts

      sleep 1

      if Character::CHARACTER_CLASSES.include?(class_input.downcase.capitalize())
        character_class_check = true
        class_input = class_input.downcase.capitalize()
      elsif class_input.to_i == 1
        slow_text(0.03) do
          "A warrior's path... steel and courage shall be your tools."
        end
        class_input = Character::CHARACTER_CLASSES[0]
        character_class_check = true
      elsif class_input.to_i == 2
        slow_text(0.03) do
          "The way of magic... reality bends to your will."
        end
        class_input = Character::CHARACTER_CLASSES[1]
        character_class_check = true
      elsif class_input.to_i == 3
        slow_text(0.03) do
          "A programmer... you see the world as others cannot."
        end
        slow_text(0.03) do
          "The very fabric of Ruby Kingdom is code - and you can rewrite it."
        end
        class_input = Character::CHARACTER_CLASSES[2]
        character_class_check = true
      else
        slow_text(0.03) do
          "That path does not exist in Ruby Kingdom. Choose again.".red
        end
        character_class_check = false
      end
    end

    puts
    sleep 2

    # Create character instance
    $current_character = Character.new
    $current_character.set_name(character_name)
    $current_character.set_class(class_input)

    puts
    slow_text(0.03) do
      "Welcome to Ruby Kingdom, #{$current_character.get_name} the #{$current_character.get_class}!".green.bold
    end

    puts
    sleep 1

    show_character_intro
  end

  def self.load_existing_character(save_filename)
    character = SaveSystem.load_game(save_filename)
    
    if character
      $current_character = character
      puts
      slow_text(0.03) do
        "Welcome back, #{character.get_name} the #{character.get_class}!".green.bold
      end
      puts "Level #{character.get_level} | HP: #{character.get_hp} | Gold: #{character.get_gold}".yellow
      puts
      sleep 2
    else
      puts "Failed to load character. Starting new game instead.".red
      sleep 2
      create_new_character
    end
  end

  def self.show_character_intro
    puts
    slow_text(0.03) do
      "You stand at the edge of Ruby Kingdom, a land where ancient magic"
    end
    slow_text(0.03) do
      "flows through crystalline formations and mystical creatures roam freely."
    end
    puts
    slow_text(0.03) do
      "Legends speak of the Ruby Castle, hidden somewhere in these lands,"
    end
    slow_text(0.03) do
      "where the Heart of Ruby - source of all magic - awaits a worthy champion."
    end
    puts
    sleep 2
    slow_text(0.03) do
      "Your journey begins now...".green.bold
    end
    puts
    sleep 3
  end

end