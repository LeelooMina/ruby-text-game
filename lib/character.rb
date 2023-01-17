require "./lib/slow_text.rb"

class Character
  attr_accessor :chr_name
  attr_accessor :chr_class
  attr_accessor :chr_HP
  attr_accessor :chr_inventory
  attr_accessor :chr_level
  attr_accessor :chr_EXP
  attr_accessor :chr_location_x
  attr_accessor :chr_location_y

  def initialize
    @chr_name = "Oops"
    @chr_class = "Warrior"
    @chr_hp = 100
    @chr_hp_max = 100
    @chr_atk = 5
    @chr_inventory = []
    @chr_gold = 0
    @chr_level = 1
    @chr_exp = 0
    @next_level_exp = 10
    @chr_alive = true
    @chr_equipped_weapon = "Sword"
    @chr_location_x = 0
    @chr_location_y = 0
  end

  $chr_classes = [
    "Warrior",
    "Mage",
    "Programmer",
  ]

  ## Name

  def set_chr_name(name)
    @chr_name = name
  end

  def get_chr_name
    @chr_name
  end

  ## Class
  def set_chr_class(_class_input)
    @chr_class = _class_input
    fill_inventoy(@_class)
  end

  def get_chr_class
    @chr_class
  end

  ## HP

  def change_hp(hp_amount, gain_or_loss)
    if gain_or_loss == "gain"
      @chr_hp = @chr_hp + hp_amount
    elsif gain_or_loss == "loss"
      @chr_hp = @chr_hp - hp_amount
    end

    check_status
  end

  def get_chr_hp
    @chr_hp
  end

  def get_chr_status
    @chr_alive
  end

  def revive_chr
    @chr_gold = 0
    @chr_alive = true
    @chr_hp = @_hp_max
  end

  def check_status
    if @chr_hp <= 0
      @chr_alive = false
    elsif @chr_hp < 0
      @chr_alive = true
    end
  end

  ## Inventory

  def fill_inventoy(_class)
    inventory_array = []
    if @chr_class == $character_classes[0]
      add_to_inventory("Sword")
    elsif @chr_class == $character__classes[1]
      add_to_inventory("Magic Wand")
    elsif @chr_class == $character__classes[2]
      add_to_inventory("Laptop")
    end
    @chr_equipped_weapon = @chr_inventory[0]
  end

  def add_to_inventory(new_item)
    @chr_inventory.push(new_item)
    sleep 1
    puts "You got a #{new_item}! Don't lose it!".green
    sleep 1
  end

  def get_chr_inventory
    @chr_inventory
  end

  def change_weapon(new_weapon)
    @chr_equipped_weapon = new_weapon
  end

  def get_chr_weapon
    @chr_equipped_weapon
  end

  def set_chr_gold(gold_amt, add_gold)
    if add_gold == false && gold_amt > @_gold
      @chr_gold = 0
    elsif add_gold == true
      @chr_gold = @chr_gold + gold_amt
    elsif add_gold == false
      @chr_gold = @chr_gold - gold_amt
    end
  end

  def get_chr_gold
    @chr_gold
  end

  ## EXP

  def add_exp(exp_amt)
    @chr_exp += exp_amt
    level_up_check
  end

  def level_up_check
    if @chr_exp >= @next_level_exp
      level_up
    end
  end

  def get_chr_exp_to_level

  end

  def get_chr_exp_to_level
    @next_level_exp - @chr_exp
  end

  ## Level

  def level_up
    @chr_level += 1
    @chr_exp = @chr_exp - @next_level_exp
    puts "You leveled up!".green
    @next_level_exp += 5
    @_hp_max += 5
    @_hp = @_hp_max
    puts "Level: #{@_level}".green
    puts "Health: #{@_hp}".green
  end

  def get__level
    @_level
  end

  def get__next_exp
    @next_level_exp
  end

  def get__atk
    @_atk
  end

  ## Map Location

  def get__location_x
    @_location_x
  end

  def get__location_y
    @_location_y
  end
end
