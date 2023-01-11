require './lib/slow_text.rb'


class Character

    attr_accessor :char_name
    attr_accessor :char_class
    attr_accessor :char_HP
    attr_accessor :char_inventory
    attr_accessor :char_level
    attr_accessor :char_EXP
    attr_accessor :char_location_x
    attr_accessor :char_location_y


    
    def initialize
            
        @char_name = "Oops"
        @char_class = "Warrior"
        @char_hp = 100
        @char_inventory = []
        @char_level = 1
        @char_exp = 0
        @next_level_exp = 10
        @char_alive = true
        @char_equipped_weapon = "Sword"
        @char_location_x = 0
        @char_location_y = 0       
        
    end
        


## Name


def set_char_name(name)
    @char_name = name
end

def get_char_name
    @char_name
end

## Class
def set_char_class(char_class_input)
    @char_class = char_class_input
    fill_inventoy(@char_class)
end

def get_char_class
    @char_class
end

## HP

def change_hp(hp_amount, gain_or_loss)
    if gain_or_loss == "gain"
        @char_hp = @char_hp + hp_amount
    elsif gain_or_loss == "loss"
        @char_hp = @char_hp - hp_amount
    end

    check_status

end

def get_char_hp
     @char_hp
end

def get_char_status
    @char_alive
end

def check_status
    if @char_hp <= 0
        @char_alive = false
    elsif @char_hp < 0
        @char_alive = true
    end
end


## Inventory

def fill_inventoy(char_class)
    inventory_array = [] 
    
    inventory_array.push(class_weapon(char_class))
    inventory_array.push("Book")
    @char_inventory = inventory_array
    
end

def add_to_inventory(new_item)
    @char_inventory.push(new_item)
    puts "You got a #{new_item}! Don't lose it!".green
end

def get_char_inventory
    @char_inventory
end

def change_weapon(new_weapon)
    @char_equipped_weapon = new_weapon
end

def get_char_weapon
    @char_equipped_weapon
end

def class_weapon(char_class)
    if char_class == $char_classes[0]
        return "Sword"
    elsif char_class == $char_classes[1]
        return "Magic Wand"
    elsif char_class == $char_classes[3]
        return "Laptop"
    end
end

## EXP

def add_exp(exp_amt)
    @char_exp += exp_amt
    level_up_check
end

def level_up_check
    if @char_exp >= @next_level_exp
        level_up
    end
end

def get_char_exp
     @char_exp
end




## Level

def level_up
    @char_level += 1
    @char_exp = @char_exp - @next_level_exp
    puts "You leveled up!".green
    @next_level_exp += 5
end

def get_char_level 
    @char_level
end

def get_char_exp_to_level
    @next_level_exp
end

## Map Location

def get_char_location_x
    @char_location_x
end

def get_char_location_y
    @char_location_y
end







end



