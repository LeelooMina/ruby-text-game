require "./lib/pokemon_api.rb"
require "./lib/random_name_class.rb"

require "./lib/pokemon_api.rb"

class Enemy
  def initialize(current_character)
    @enemy_type
    @enemy_name
    @enemy_hp = 10
    @enemy_loot = []
    @enemy_gold = 1
    @enemy_level = 1
    @enemy_alive = true
    @enemy_atk = 2
    @enemy_worth_exp = 5

    decide_type
    set_enemy_level(current_character)
    set_init_hp
    set_enemy_atk
    set_init_hp
    set_enemy_exp
    set_enemy_gold
  end
 
  def get_enemy_name
    @enemy_name
  end

  def get_enemy_hp
    @enemy_hp
  end

  def get_enemy_loot
    @enemy_loot
  end

  def get_enemy_gold
    @enemy_gold
  end

  def get_enemy_level 
    @enemy_level
  end

  def get_enemy_alive
    @enemy_alive
  end

  def get_enemy_atk
    @enemy_atk
  end

  def get_enemy_worth_exp
    @enemy_worth_exp
  end

  ## Type
  def decide_type
    rand_num = rand(0..20)
    if rand_num.odd?
      @enemy_type = "Fantasy"
      set_enemy_name_fantasy
    else
      @enemy_type = "Pokemon"
      set_enemy_name_pokemon
    end
  end

  def set_enemy_name_fantasy
    @enemy_name = random_monster_type
  end

  def set_enemy_name_pokemon
    @enemy_name = get_rand_pokemon_name
  end

  ## Level
  def set_enemy_level(character)
    level_possible = character.get_char_level + 1
    rand_num = rand(1..level_possible)
    @enemy_level = rand_num
  end

  def set_enemy_atk
    @enemy_atk = 2 * @enemy_level
  end

  ## Hit points
  def set_init_hp
    @enemy_hp = @enemy_level * 10
  end

  def remove_hp(atk_amt)
    @enemy_hp = @enemy_hp - atk_amt
    check_enemy_status
  end

  def check_enemy_status
    if @enemy_hp <= 0
      @enemy_alive = false
    end
  end

  ## Loot
  def set_enemy_loot

  end

  def set_enemy_gold
    @enemy_gold = @enemy_level * 5
  end

  ## Exp
  def set_enemy_exp
    @enemy_worth_exp = @enemy_level * 5
  end
end
