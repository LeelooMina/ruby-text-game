require "./lib/pokemon_api.rb"
require "./lib/random_name_class.rb"

require "./lib/pokemon_api.rb"

class Enemy

  def initialize(current_character)
    @enemy_type = ""
    @name = ""
    @hp = 10
    @loot = []
    @gold = 1
    @level = 1
    @alive = true
    @atk = 2
    @worth_exp = 5

    decide_type
    set_level(current_character)
    set_init_hp
    set_atk
    set_exp
    set_gold
  end
 
  def get_name
    @name
  end

  def get_hp
    @hp
  end

  def get_loot
    @loot
  end

  def get_gold
    @gold
  end

  def get_level 
    @level
  end

  def get_alive?
    @alive
  end

  def get_atk
    @atk
  end

  def get_worth_exp
    @worth_exp
  end

  ## Type
  def decide_type
    rand_num = rand(0..20)
    if rand_num.odd?
      @enemy_type = "Fantasy"
      set_name_fantasy
    else
      @enemy_type = "Pokemon"
      set_name_pokemon
    end
  end

  def set_name_fantasy
    @name = RandomName.random_monster_type
  end

  def set_name_pokemon
    @name = get_rand_pokemon_name
  end

  ## Level
  def set_level(character)
    level_possible = character.get_level + 1
    rand_num = rand(1..level_possible)
    @level = rand_num
  end

  def set_atk
    @atk =  2 * @level
  end

  ## Hit points
  def set_init_hp
    @hp = @level * 10
  end

  def remove_hp(atk_amt)
    @hp = @hp - atk_amt
    check_status
  end

  def check_status
    if @hp <= 0
      @alive = false
    end
  end

  ## Loot
  def set_loot

  end

  def set_gold
    @gold = @level * 5
  end

  ## Exp
  def set_exp
    @worth_exp = @level * 5
  end
end
