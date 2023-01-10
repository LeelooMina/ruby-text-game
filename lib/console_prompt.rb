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
