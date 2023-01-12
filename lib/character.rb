require "./lib/slow_text.rb"

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
    @char_hp_max = 100
    @char_atk = 5
    @char_inventory = []
    @char_gold = 0
    @char_level = 1
    @char_exp = 0
    @next_level_exp = 10
    @char_alive = true
    @char_equipped_weapon = "Sword"
    @char_location_x = 0
    @char_location_y = 0
  end

  $char_classes = [
    "Warrior",
    "Mage",
    "Programmer",
  ]

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

  def revive_char
    @char_gold = 0
    @char_alive = true
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
    if @char_class == $char_classes[0]
      add_to_inventory("Sword")
    elsif @char_class == $char_classes[1]
      add_to_inventory("Magic Wand")
    elsif @char_class == $char_classes[2]
      add_to_inventory("Laptop")
    end
    @char_equipped_weapon = @char_inventory[0]
  end

  def add_to_inventory(new_item)
    @char_inventory.push(new_item)
    sleep 1
    puts "You got a #{new_item}! Don't lose it!".green
    sleep 1
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

  def set_char_gold(gold_amt, add_gold)
    if add_gold == false && gold_amt > @char_gold
      @char_gold = 0
    elsif add_gold == true
      @char_gold = @char_gold + gold_amt
    elsif add_gold == false
      @char_gold = @char_gold - gold_amt
    end
  end

  def get_char_gold
    @char_gold
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

  def get_char_exp_to_level

  end

  def get_char_exp_to_level
    @next_level_exp - @char_exp
  end

  ## Level

  def level_up
    @char_level += 1
    @char_exp = @char_exp - @next_level_exp
    puts "You leveled up!".green
    @next_level_exp += 5
    @char_hp_max += 5
    @char_hp = @char_hp_max
    puts "Level: #{char_level}".green
    puts "Health: #{char_hp}".green
  end

  def get_char_level
    @char_level
  end

  def get_char_next_exp
    @next_level_exp
  end

  def get_char_atk
    @char_atk
  end

  ## Map Location

  def get_char_location_x
    @char_location_x
  end

  def get_char_location_y
    @char_location_y
  end
end
