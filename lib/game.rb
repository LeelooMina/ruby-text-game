require './lib/slow_text.rb'
require './lib/character.rb'

class Game

    def initialize
            
        @current_character
        @current_map 
        @combat_mode = false
        
    end

    def get_help 
        puts "You really need help? Already?".red
        puts <<-'HELP_TEXT'

            Try typing:
            'Fight' to fight an enemy
            'Move North' to move north
            'Inventory' to see your inventoy
            'Check Stats' to see your level, exp, etc


        HELP_TEXT

    end

    def user_input(input)
        case input
        when input == "help"
            get_help
        when input ==

        
        end
    end

    def start_combat(enemy)
        @combat_mode = true

        while enemy.get_hp != 0
            puts "Fight fight fight"
        end

    end

    def start_game
            puts "Type 'help' for... you'll never guess"
        while @current_character.get_char_status == true

            puts @current_map.get_location_desc
            puts "What do you want to do next?"
            input = gets.chomp
            user_input(input.downcase)


        end

    end
    
    def end_game
        
        puts "Well, looks like you died. Good job!"
        sleep 2
        puts "Wanna try again?"
        puts "You'll keep your level and items but I'm taking all #{$current_character.get_char_gold} of your gold."
        puts "Y/N"
        input = gets.chomp
        if input.downcase == "y"
            $current_character.revive_char
           start_game

        else
            puts "Don't let the door hit you on the way out!"
        end
    end


end
