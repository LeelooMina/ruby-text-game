require "./lib/slow_text.rb"
require "./lib/character.rb"
require "./lib/enemy.rb"

class Game

  def initialize(cur_character)
    @current_character = cur_character
    @current_map
    @combat_mode = false
  end

  def combat_game

    while @current_character.get_status == true
      enemy = Enemy.new(@current_character)


      puts
      puts
      puts "Oh no! You spot a level #{enemy.get_level} #{enemy.get_name}!".red
      sleep 2
      puts "Fight! Fight! Fight!".green


      while enemy.get_alive? == true
      
      

      puts

      sleep 1

      #Enemy Atk

      puts "#{enemy.get_name} attacks you for #{enemy.get_atk}!".red.bold
      @current_character.change_hp(enemy.get_atk, "loss")
      break if @current_character.get_status == false
      puts  
      sleep 1
      puts "Are you going to let them get away with that??"
      puts "Enter some mean words to attack back!"
      print "> ".green
      player_words = gets.chomp

      #player Atk

      puts "You shout \"#{player_words}!\" as you attack #{enemy.get_name} with your #{@current_character.get_weapon} for #{@current_character.get_atk}!".red.italic
      enemy.remove_hp(@current_character.get_atk)
      break if enemy.get_alive? == false
      sleep 1

      #Enemy Status
      puts  "#{enemy.get_name} has #{enemy.get_hp} HP left."

      #player status
      puts "You have #{@current_character.get_hp} HP left."
      end
      sleep 1
      if @current_character.get_status == true
        puts
        puts "You have beaten #{enemy.get_name}!"
        @current_character.add_exp(enemy.get_worth_exp)
        @current_character.set_gold(enemy.get_gold, true)
        puts
        puts "You got #{enemy.get_worth_exp} EXP!".green
        puts "You are level #{@current_character.get_level}"
        puts "#{@current_character.get_exp_to_level} to the next level!"
        puts
        puts "You got #{enemy.get_gold} gold!".yellow
        puts "You have #{@current_character.get_gold} gold!".yellow
        sleep 2
      end


    end
    puts

    puts <<-'BIG_TEXT'

    ____                         ___                 
    / ___| __ _ _ __ ___   ___   / _ \__   _____ _ __ 
   | |  _ / _` | '_ ` _ \ / _ \ | | | \ \ / / _ \ '__|
   | |_| | (_| | | | | | |  __/ | |_| |\ V /  __/ |   
    \____|\__,_|_| |_| |_|\___|  \___/  \_/ \___|_|   
                                                   
    
    BIG_TEXT

    puts
    puts "Well, looks like you died. Good job!".red
    puts
    sleep 2
    puts "Wanna try again?".green
    puts "You'll keep your level and items but I'm taking all #{$current_character.get_gold} of your gold.".green
    puts "Y/N?".yellow
    print "> ".green
    input = gets.chomp
    if input.downcase == "y" || input.downcase == "yes"
      $current_character.revive
      start_game
    else
      puts
      sleep 1
      puts <<-'BIG_TEXT'

      _____ _                 _           __            
      |_   _| |__   __ _ _ __ | | _____   / _| ___  _ __ 
        | | | '_ \ / _` | '_ \| |/ / __| | |_ / _ \| '__|
        | | | | | | (_| | | | |   <\__ \ |  _| (_) | |   
        |_| |_| |_|\__,_|_| |_|_|\_\___/ |_|  \___/|_|   
                                                         
             _             _             _ 
       _ __ | | __ _ _   _(_)_ __   __ _| |
      | '_ \| |/ _` | | | | | '_ \ / _` | |
      | |_) | | (_| | |_| | | | | | (_| |_|
      | .__/|_|\__,_|\__, |_|_| |_|\__, (_)
      |_|            |___/         |___/   


      BIG_TEXT


      puts
      puts "Don't let the door hit you on the way out!".red
      puts
    end
  end

 def start_game
  combat_game
end

def set_character(character)
    @current_character = character
end

# def set_map(map)
#      @current_map = map
# end

# def set_combat_mode(true_or_false)
#     @combat_mode = true_or_false
# end


#   def get_help
#     puts "You really need help? Already?".red
#     puts <<-'HELP_TEXT'

#             Try typing:
#             'Fight' to fight an enemy
#             'Move North' to move north
#             'Inventory' to see your inventoy
#             'Check Stats' to see your level, exp, etc


#         HELP_TEXT
#   end

#   def user_input(input)
#     case input
#     when input == "help"
#       get_help
#     when input == "go"
#     end
#   end

#   def start_combat(enemy)
#     @combat_mode = true

#     while enemy.get_hp != 0
#       puts "Fight fight fight"
#     end
#   end

#   def start_game
#     puts "Type 'help' for... you'll never guess"
#     while @current_character.get_status == true
#       puts @current_map.get_location_desc
#       puts "What do you want to do next?"
#       input = gets.chomp
#       user_input(input.downcase)
#     end
#   end

#   def end_game
#     puts "Well, looks like you died. Good job!"
#     sleep 2
#     puts "Wanna try again?"
#     puts "You'll keep your level and items but I'm taking all #{$current_character.get_gold} of your gold."
#     puts "Y/N"
#     input = gets.chomp
#     if input.downcase == "y"
#       $current_character.revive
#       start_game
#     else
#       puts "Don't let the door hit you on the way out!"
#     end
#   end
end
