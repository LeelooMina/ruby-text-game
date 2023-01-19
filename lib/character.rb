require "./lib/text_style.rb"
require "./lib/slow_text.rb"

class Character
  attr_accessor :name
  attr_accessor :class
  attr_accessor :hp
  attr_accessor :inventory, :gold
  attr_accessor :level
  attr_accessor :exp_points
  attr_accessor :location

  def initialize
    @name = "Oops"
    @class = "Warrior"
    @hp = 100
    @hp_max = 100
    @atk = 5
    @inventory = []
    @gold = 0
    @level = 1
    @exp_points = 0
    @next_level_exp = 10
    @alive = true
    @equipped_weapon = "Sword"
    @location = 0
   
  end

  CHARACTER_CLASSES = [
    "Warrior",
    "Mage",
    "Programmer",
  ]

  ## Name

  def set_name(name)
    @name = name
  end

  def get_name
    @name
  end

  ## Class
  def set_class(class_input)
    @class = class_input
    fill_inventory
  end

  def get_class
    @class
  end

  ## HP

  def change_hp(hp_amount, gain_or_loss)
    if gain_or_loss == "gain"
      @hp = @hp + hp_amount
    elsif gain_or_loss == "loss"
      @hp = @hp - hp_amount
    end

    check_status
  end

  def get_hp
    @hp
  end

  def get_status
    @alive
  end

  def revive
    @gold = 0
    @alive = true
    @hp = @_hp_max
  end

  def check_status
    if @hp <= 0
      @alive = false
    elsif @hp < 0
      @alive = true
    end
  end

  ## Inventory

  def fill_inventory
    
    if @class == Character::CHARACTER_CLASSES[0]
      add_to_inventory("Sword")
    elsif @class == Character::CHARACTER_CLASSES[1]
      add_to_inventory("Magic Wand")
    elsif @class == Character::CHARACTER_CLASSES[2]
      add_to_inventory("Laptop")
    end
    @equipped_weapon = @inventory[0]
  end

  def add_to_inventory(new_item)
    @inventory.push(new_item)
    sleep 1
    puts "You got a #{new_item}! Don't lose it!".green
    sleep 1
  end

  def get_inventory
    @inventory
  end

  def change_weapon(new_weapon)
    @equipped_weapon = new_weapon
  end

  def get_weapon
    @equipped_weapon
  end

  def set_gold(gold_amt, add_gold)
    if add_gold == false && gold_amt > @_gold
      @gold = 0
    elsif add_gold == true
      @gold = @gold + gold_amt
    elsif add_gold == false
      @gold = @gold - gold_amt
    end
  end

  def get_gold
    @gold
  end

  ## EXP

  def add_exp(exp_amt)
    @exp_points += exp_amt
    level_up_check
  end

  def level_up_check
    if @exp_points >= @next_level_exp
      level_up
    end
  end

  def get_exp_to_level
    @next_level_exp - @exp_points
  end

  ## Level

  def level_up
    @level += 1
    @exp_points = @exp_points - @next_level_exp
    puts "You leveled up!".green
    @next_level_exp += @next_level_exp * 0.5
    @next_level_exp = @next_level_exp.truncate
    @hp_max += @hp_max * 0.1
    @hp_max = @hp_max.truncate
    @hp = @hp_max
    @atk += @atk + 5
    @atk = @atk.truncate
    puts "Level: #{@level}".green
    puts "Health: #{@hp}".green
    puts "Attack: #{@atk}".green
  end

  def get_level
    @level
  end

  def get_next_exp
    @next_level_exp
  end

  def get_atk
    @atk
  end

  ## Map Location

end
