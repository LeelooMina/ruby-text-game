class Character

    attr_accessor :char_name
    attr_accessor :char_class
    attr_accessor :char_HP
    attr_accessor :char_inventory
    attr_accessor :char_level
    attr_accessor :char_EXP
    attr_accessor :char_location_x
    attr_accessor :char_location_y


    @char_name = "Oops"
    @char_class = "Warrior"
    @char_HP = 100
    @char_inventory = []
    @char_level = 0
    @char_EXP = 0
    @char_alive = true
    @char_equipped_weapon = "Sword"
    @char_location_x = 0
    @char_location_y = 0       


## Name


def set_char_name(name)
    $char_name = name
end

## Class
def set_char_class(char_class_input)
    $char_class = char_class_input
    fill_inventoy($char_class)
end

## HP

def change_hp(hp_amount, gain_or_loss)
    if gain_or_loss == "gain"
        $char_HP = $char_HP + hp_amount
    elsif gain_or_loss == "loss"
        $char_HP = $char_HP - hp_amount
    end

    check_status

end

def check_status
    if char_HP <= 0
        $char_alive = false
    elsif char_HP < 0
        $char_alive = true
    end
end


## Inventory

def fill_inventoy(char_class)
    inventory_array = [] 
    
    inventory_array.push(class_weapon(char_class))
    inventory_array.push("Book")
    $char_inventory = inventory_array
    
end

def add_to_inventory(new_item)
    @char_inventory.push(new_item)
end

def change_weapon(new_weapon)
    @char_equipped_weapon = new_weapon
end

# add_to_inventory("chicken")
# @char_inventory = fill_inventoy("Mage")
# puts @char_inventory

def class_weapon(char_class)
    if char_class == $char_classes[0]
        return "Sword"
    elsif char_class == $char_classes[1]
        return "Magic Wand"
    elsif char_class == $char_classes[3]
        return "Laptop"
    end
end

# fill_inventoy("Warrior")

## EXP

## Level




