require "./lib/location.rb"
require "./lib/text_style.rb"
require "./lib/save_system.rb"
require "./lib/quest_system.rb"

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
                puts "4. Quest Log"
                puts "5. Save Game"
            elsif location.shop == true
                puts "2. Shop"
                puts "3. Check Inventory"
                puts "4. Quest Log"
                puts "5. Save Game"
            else
                puts "2. Check Inventory"
                puts "3. Quest Log"
                puts "4. Save Game"
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
            quest_log
          end
        when 4
          if location.enemy_check == true || location.shop == true
            quest_log
          else
            save_game
          end
        when 5
          save_game
        end
  end


    def self.test_input(input, location)
        max_options = location.enemy_check || location.shop ? 5 : 4
        
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
            puts "=== THE RUBY KINGDOM BLACKSMITH ===".yellow.bold
            puts
            puts "\"Welcome, brave #{$current_character.get_class.downcase}!\" booms the blacksmith,"
            puts "his hammer paused mid-strike over a glowing ruby-infused blade."
            puts "\"I craft the finest weapons in all the realm!\""
            puts
            puts "\"The magic of the Ruby Kingdom flows through my forge.\""
            puts "\"Each weapon I create is imbued with the land's power!\""
            puts
            puts "Available Items:".green.bold
            puts "1. Ruby-Touched Blade - 75 gold (+3 Attack) ⚔️"
            puts "2. Mystic Steel Sword - 150 gold (+5 Attack) ⚔️" 
            puts "3. Legendary Ruby Weapon - 300 gold (+8 Attack) ⚔️"
            puts "4. Greater Health Potion - 40 gold (Restore 50 HP) 🧪"
            puts "5. Magic Shield Charm - 100 gold (+20 Max HP) 🛡️"
            puts "6. Ruby Dust - 200 gold (+1 All Stats) ✨"
            puts "7. Leave"
            puts
            puts "Your gold: #{$current_character.get_gold} 💰".yellow
            print "> ".green
            
            choice = gets.chomp.to_i
            
            case choice
            when 1
              buy_weapon("Ruby-Touched Blade", 75, 3)
            when 2
              buy_weapon("Mystic Steel Sword", 150, 5)
            when 3
              buy_weapon("Legendary Ruby Weapon", 300, 8)
            when 4
              buy_potion(40, 50)
            when 5
              buy_shield_charm(100, 20)
            when 6
              buy_ruby_dust(200)
            when 7
              puts "\"May your blade stay sharp and your armor strong!\" the blacksmith calls.".yellow
              puts "\"Return when you need the finest equipment Ruby Kingdom has to offer!\""
            else
              puts "The blacksmith raises an eyebrow. \"I don't understand, friend.\"".yellow
            end
        end
        
        def self.buy_weapon(item_name, cost, attack_bonus)
          if $current_character.get_gold >= cost
            $current_character.set_gold(cost, false)
            old_weapon = $current_character.get_weapon
            $current_character.add_to_inventory(item_name)
            $current_character.change_weapon(item_name)
            
            # Update attack with bonus
            current_atk = $current_character.get_atk
            $current_character.instance_variable_set(:@atk, current_atk + attack_bonus)
            
            puts "\"An excellent choice! Your #{old_weapon} pales in comparison!\"".yellow
            puts "\"That #{item_name} will serve you well in your quest for the Ruby Castle!\"".yellow
            puts "Attack increased by #{attack_bonus}! ⚔️".green
          else
            puts "\"I'm afraid you need more gold for that masterpiece.\"".red
            puts "\"Come back when your purse is heavier, #{$current_character.get_name}!\""
          end
        end
        
        def self.buy_potion(cost, heal_amount)
          if $current_character.get_gold >= cost
            $current_character.set_gold(cost, false)
            current_hp = $current_character.get_hp
            max_hp = $current_character.instance_variable_get(:@hp_max)
            
            if current_hp >= max_hp
              puts "\"You're already at full health, but I'll give you this for emergencies!\"".yellow
            else
              $current_character.change_hp(heal_amount, "gain")
              actual_heal = [$current_character.get_hp - current_hp, heal_amount].min
              puts "\"Drink up! The ruby-infused herbs will restore your strength!\"".yellow
              puts "Restored #{actual_heal} HP! 💚".green
            end
          else
            puts "\"That potion costs more than you have, friend.\"".red
          end
        end
        
        def self.buy_shield_charm(cost, hp_bonus)
          if $current_character.get_gold >= cost
            $current_character.set_gold(cost, false)
            current_max_hp = $current_character.instance_variable_get(:@hp_max)
            new_max_hp = current_max_hp + hp_bonus
            $current_character.instance_variable_set(:@hp_max, new_max_hp)
            $current_character.change_hp(hp_bonus, "gain")  # Also heal current HP
            
            puts "\"The protective magic flows through you!\"".yellow
            puts "\"This ruby-blessed charm will keep you safer in battle!\"".yellow
            puts "Maximum HP increased by #{hp_bonus}! 🛡️".green
          else
            puts "\"Magic charms aren't cheap, adventurer.\"".red
          end
        end
        
        def self.buy_ruby_dust(cost)
          if $current_character.get_gold >= cost
            $current_character.set_gold(cost, false)
            
            # Increase all stats
            $current_character.instance_variable_set(:@atk, $current_character.get_atk + 1)
            current_max_hp = $current_character.instance_variable_get(:@hp_max)
            $current_character.instance_variable_set(:@hp_max, current_max_hp + 10)
            $current_character.change_hp(10, "gain")
            
            puts "\"Ah, the Ruby Dust! Made from the very essence of our kingdom!\"".yellow
            puts "\"Feel the power of the Ruby Heart flowing through you!\"".yellow
            puts "All stats increased! Attack +1, Max HP +10! ✨".green
          else
            puts "\"Ruby Dust is precious and expensive. You need more gold.\"".red
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
        
        def self.quest_log
          QuestSystem.show_quest_log
        end
    end

