require 'json'
require 'fileutils'
require 'time'

module SaveSystem
  SAVE_DIRECTORY = File.join(Dir.pwd, 'saves')
  
  def self.ensure_save_directory
    FileUtils.mkdir_p(SAVE_DIRECTORY) unless Dir.exist?(SAVE_DIRECTORY)
  end
  
  def self.save_game(character, save_name = nil)
    ensure_save_directory
    
    # Generate save name if not provided
    if save_name.nil?
      timestamp = Time.now.strftime("%Y%m%d_%H%M%S")
      save_name = "#{character.get_name}_#{timestamp}"
    end
    
    # Clean save name for filename
    clean_name = save_name.gsub(/[^0-9A-Za-z_\-]/, '_')
    save_file = File.join(SAVE_DIRECTORY, "#{clean_name}.json")
    
    save_data = {
      name: character.get_name,
      class: character.get_class,
      hp: character.get_hp,
      level: character.get_level,
      exp_points: character.instance_variable_get(:@exp_points),
      next_level_exp: character.instance_variable_get(:@next_level_exp),
      gold: character.get_gold,
      inventory: character.get_inventory,
      equipped_weapon: character.get_weapon,
      location: character.instance_variable_get(:@location),
      hp_max: character.instance_variable_get(:@hp_max),
      atk: character.get_atk,
      alive: character.get_status,
      save_timestamp: Time.now.to_s,
      save_name: save_name
    }
    
    File.write(save_file, JSON.pretty_generate(save_data))
    puts "Game saved as: #{save_name}".green
    return clean_name
  end
  
  def self.load_game(save_filename)
    ensure_save_directory
    save_file = File.join(SAVE_DIRECTORY, "#{save_filename}.json")
    
    unless File.exist?(save_file)
      puts "Save file not found: #{save_filename}".red
      return nil
    end
    
    begin
      save_data = JSON.parse(File.read(save_file))
      character = Character.new
      
      # Restore character data
      character.set_name(save_data['name'])
      character.set_class(save_data['class'])
      character.instance_variable_set(:@hp, save_data['hp'])
      character.instance_variable_set(:@level, save_data['level'])
      character.instance_variable_set(:@exp_points, save_data['exp_points'])
      character.instance_variable_set(:@next_level_exp, save_data['next_level_exp'])
      character.instance_variable_set(:@gold, save_data['gold'])
      character.instance_variable_set(:@inventory, save_data['inventory'])
      character.instance_variable_set(:@equipped_weapon, save_data['equipped_weapon'])
      character.instance_variable_set(:@location, save_data['location'] || 5)
      character.instance_variable_set(:@hp_max, save_data['hp_max'])
      character.instance_variable_set(:@atk, save_data['atk'])
      character.instance_variable_set(:@alive, save_data['alive'])
      
      puts "Game loaded: #{save_data['save_name']}".green
      return character
    rescue JSON::ParserError, StandardError => e
      puts "Error loading save file: #{e.message}".red
      return nil
    end
  end
  
  def self.list_saves
    ensure_save_directory
    save_files = Dir.glob(File.join(SAVE_DIRECTORY, "*.json"))
    
    if save_files.empty?
      puts "No save files found.".yellow
      return []
    end
    
    saves = []
    save_files.each_with_index do |file, index|
      begin
        save_data = JSON.parse(File.read(file))
        filename = File.basename(file, '.json')
        saves << {
          index: index + 1,
          filename: filename,
          name: save_data['save_name'] || filename,
          character: save_data['name'],
          level: save_data['level'],
          location: save_data['location'],
          timestamp: save_data['save_timestamp']
        }
      rescue JSON::ParserError, StandardError
        # Skip corrupted save files
        next
      end
    end
    
    saves
  end
  
  def self.delete_save(save_filename)
    ensure_save_directory
    save_file = File.join(SAVE_DIRECTORY, "#{save_filename}.json")
    
    if File.exist?(save_file)
      File.delete(save_file)
      puts "Save file deleted: #{save_filename}".green
      return true
    else
      puts "Save file not found: #{save_filename}".red
      return false
    end
  end
  
  def self.show_save_menu
    loop do
      puts "\n=== RUBY KINGDOM - SAVE MANAGER ===".cyan.bold
      puts
      
      saves = list_saves
      
      if saves.empty?
        puts "No saved games found.".yellow
        puts
        puts "1. Start New Game"
        puts "2. Exit"
        puts
        print "> ".green
        choice = gets.chomp.to_i
        
        case choice
        when 1
          return :new_game
        when 2
          puts "Thanks for playing Ruby Kingdom!".cyan
          exit
        else
          puts "Invalid choice!".red
        end
      else
        puts "Saved Games:".green
        saves.each do |save|
          timestamp = save[:timestamp] ? Time.parse(save[:timestamp]).strftime("%Y-%m-%d %H:%M") : "Unknown"
          puts "#{save[:index]}. #{save[:name]} (#{save[:character]}, Level #{save[:level]}) - #{timestamp}"
        end
        puts
        puts "#{saves.length + 1}. Start New Game"
        puts "#{saves.length + 2}. Delete Save"
        puts "#{saves.length + 3}. Exit"
        puts
        print "> ".green
        choice = gets.chomp.to_i
        
        if choice >= 1 && choice <= saves.length
          selected_save = saves[choice - 1]
          return { type: :load_game, filename: selected_save[:filename] }
        elsif choice == saves.length + 1
          return :new_game
        elsif choice == saves.length + 2
          delete_save_menu(saves)
        elsif choice == saves.length + 3
          puts "Thanks for playing Ruby Kingdom!".cyan
          exit
        else
          puts "Invalid choice!".red
        end
      end
    end
  end
  
  private
  
  def self.delete_save_menu(saves)
    puts "\nWhich save would you like to delete?".yellow
    saves.each do |save|
      puts "#{save[:index]}. #{save[:name]} (#{save[:character]}, Level #{save[:level]})"
    end
    puts "#{saves.length + 1}. Cancel"
    puts
    print "> ".green
    choice = gets.chomp.to_i
    
    if choice >= 1 && choice <= saves.length
      selected_save = saves[choice - 1]
      puts "Are you sure you want to delete '#{selected_save[:name]}'? (y/N)".red
      confirm = gets.chomp.downcase
      
      if confirm == 'y' || confirm == 'yes'
        delete_save(selected_save[:filename])
      else
        puts "Deletion cancelled.".green
      end
    elsif choice == saves.length + 1
      # Cancel - return to main menu
    else
      puts "Invalid choice!".red
    end
  end
end