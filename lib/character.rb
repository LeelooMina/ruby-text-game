

    def initalize(char_name, char_class)
        @char_name = char_name
        @char_class = char_class
        @char_HP = 100
        @char_inventory = []
        
        @char_inventory = fill_inventoy(char_class)

    end

## Name

## Class
$char_classes = [
    "Warrior",
    "Mage",
    "Programmer"
]
# Checks the user input to see if it matches an existing character class
def class_checker(class_input = "chicken")
    if $char_classes.include?(class_input.downcase.capitalize())

    end
end

class_checker("Warrior")

## HP

## Inventory

def fill_inventoy(char_class)
    inventory_array = [] 
    
    inventory_array.push(class_weapon(char_class))
    inventory_array.push("Book")
    return inventory_array
    
end

# def add_to_inventory(new_item)
#     @char_inventory.push(new_item)
# end

# add_to_inventory("chicken")
@char_inventory = fill_inventoy("Mage")
puts @char_inventory

def class_weapon(char_class)
    if char_class == $char_classes[0]
        return "Sword"
    elsif char_class == $char_classes[1]
        return "Magic Wand"
    elsif char_class == $char_classes[3]
        return "Laptop"
    end
end

fill_inventoy("Warrior")

## EXP

## Level




