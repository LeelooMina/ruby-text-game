require "./lib/location.rb"
require "./lib/text_style.rb"
require "./lib/save_system.rb"

module Menu
  @@location = nil
  @@input_tester = false

  def self.run(location)
        @@input_tester = false
        @@location = location
        puts "Type 'save' to save your progress at any time.".gray.italic
        while @@input_tester == false
            puts "What do you wanna do?"
            puts "1. Move"
            if location.enemy_check
                puts "2. Fight"
                puts "3. Check Inventory"
                puts "4. Save Game"
            elsif location.shop == true
                puts "2. Shop"
                puts "3. Check Inventory"
                puts "4. Save Game"
            else
                puts "2. Check Inventory"
                puts "3. Save Game"
            end
            puts
            print "> ".green
            user_selection = gets.chomp
            
            # Handle save command
            if user_selection.downcase == 'save'
              save_game
              next
            end
            
            user_selection = test_input(user_selection, location)
            if @@input_tester == false
                puts "We'll keep trying this until you get it right!".yellow.italic
            end
        end

        case user_selection
        when 1
          move
        when 2
          if location.enemy_check == true
            fight
          elsif location.shop == true
            shop
          else
            check_inventory
          end
        when 3
          if location.enemy_check == true || location.shop == true
            check_inventory
          else
            save_game
          end
        when 4
          save_game
        end
  end


    def self.test_input(input, location)
        max_options = location.enemy_check || location.shop ? 4 : 3
        
        if input.to_i > max_options || input.to_i < 1
            @@input_tester = false
            return ''
        else
            @@input_tester = true
            return input.to_i
        end
    end

        def self.move
            $map.move
        end

        def self.fight
            $current_game.combat_game
        end

        def self.check_inventory
            puts "\n=== INVENTORY ===".cyan.bold
            inventory = $current_character.get_inventory
            
            if inventory.empty?
              puts "Your inventory is empty.".yellow
            else
              puts "Items:".green
              inventory.each_with_index do |item, index|
                equipped = (item == $current_character.get_weapon) ? " (equipped)".green : ""
                puts "  #{index + 1}. #{item}#{equipped}"
              end
            end
            
            puts "\nCharacter Stats:".cyan
            puts "  Level: #{$current_character.get_level}"
            puts "  HP: #{$current_character.get_hp}"
            puts "  Attack: #{$current_character.get_atk}"
            puts "  Gold: #{$current_character.get_gold}"
            puts "  EXP: #{$current_character.instance_variable_get(:@exp_points)}/#{$current_character.instance_variable_get(:@next_level_exp)}"
            puts
            
            puts "Press Enter to continue...".gray
            gets
        end

        def self.shop
            puts "=== BLACKSMITH SHOP ===".yellow.bold
            puts "The burly blacksmith looks up from his forge."
            puts "\"Welcome, adventurer! What can I craft for ye?\""
            puts
            puts "1. Iron Sword - 50 gold (+2 Attack)"
            puts "2. Steel Blade - 100 gold (+4 Attack)"  
            puts "3. Ruby Weapon - 200 gold (+6 Attack)"
            puts "4. Health Potion - 25 gold (Restore 30 HP)"
            puts "5. Leave"
            puts
            puts "Your gold: #{$current_character.get_gold}".yellow
            print "> ".green
            
            choice = gets.chomp.to_i
            
            case choice
            when 1
              buy_item("Iron Sword", 50, 2)
            when 2
              buy_item("Steel Blade", 100, 4)
            when 3
              buy_item("Ruby Weapon", 200, 6)
            when 4
              buy_potion(25, 30)
            when 5
              puts "\"Come back anytime!\" the blacksmith calls.".yellow
            else
              puts "The blacksmith scratches his head. \"Eh?\"".yellow
            end
        end
        
        def self.buy_item(item_name, cost, attack_bonus)
          if $current_character.get_gold >= cost
            $current_character.set_gold(cost, false)
            $current_character.add_to_inventory(item_name)
            $current_character.change_weapon(item_name)
            
            # Update attack with bonus
            current_atk = $current_character.get_atk
            $current_character.instance_variable_set(:@atk, current_atk + attack_bonus)
            
            puts "\"Excellent choice! That #{item_name} will serve ye well!\"".yellow
            puts "Attack increased by #{attack_bonus}!".green
          else
            puts "\"Ye don't have enough gold for that, friend.\"".red
          end
        end
        
        def self.buy_potion(cost, heal_amount)
          if $current_character.get_gold >= cost
            $current_character.set_gold(cost, false)
            $current_character.change_hp(heal_amount, "gain")
            puts "\"Drink up! That'll fix ye right up!\"".yellow
            puts "Restored #{heal_amount} HP!".green
          else
            puts "\"Ye don't have enough gold for that, friend.\"".red
          end
        end
        
        def self.save_game
          puts "\nEnter a name for your save (or press Enter for auto-name):".cyan
          print "> ".green
          save_name = gets.chomp.strip
          
          save_name = nil if save_name.empty?
          
          saved_filename = SaveSystem.save_game($current_character, save_name)
          puts
          puts "Press Enter to continue...".gray
          gets
        end
    end

