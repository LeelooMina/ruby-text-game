require "./lib/text_style.rb"
require "./lib/map.rb"
require "./lib/slow_text.rb"
require "./lib/character.rb"
require "./lib/random_name_class.rb"
require "./lib/pokemon_api.rb"
require "./lib/game.rb"
require "./lib/main_menu.rb"

class Intro

  def run 
    MainMenu.show_main_menu
    run_game
  end

  def run_game
    # Create game instance & add attributes
    $current_game = Game.new($current_character)
    $map = Map.new
    
    # Set character location (default to center, or load from save)
    location = $current_character.get_location
    location = 5 if location.nil? || location == 0
    $map.set_character_location(location)
  end

end
